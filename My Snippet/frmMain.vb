Imports System.Xml
Imports System.Xml.Linq
Public Class frmMain
    'เก็บชื่อไฟล์ xml ที่เก็บ snippet ไว้
    Private Shared XML_FILE_NAME As String = "snippet.xml"
    'เก็บ id ของ code ที่ดูอยู่
    Private Shared _id As String = ""
    Dim xmlDoc As XElement

#Region "PROPERTY ... "
    Public Shared ReadOnly Property xmlFileName() As String
        Get
            Return XML_FILE_NAME
        End Get
    End Property
    Public Shared ReadOnly Property id() As String
        Get
            Return _id
        End Get
    End Property
#End Region

#Region "EVENT ... "
    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'xmlFileName อยู่ใน class frmMain
        xmlDoc = XElement.Load(xmlFileName)
        'btnEdit ยังใช้ไม่ได้จนกว่าจะมีการเลือกชื่อ 
        btnEdit.Enabled = False
        'ทำ blinding comAddLange ให้แสดงชื่อภาษาที่มีอยู่
        bindingLang()
        'ทำ blinding ให้ comName แสดงรายชื่อของ snippet 
        bindingName()
    End Sub

    'กด add จะเรียก frmAddSnippet
    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        frmAddSnippet.Show()
    End Sub

    'กด edit จะเรียก frmEditSnippet
    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        frmEditSnippet.Show()
    End Sub
    'กด copy จะ copy สู่ clippboard
    Private Sub btnCopy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCopy.Click
        Try
            Clipboard.SetText(txtCode.Text)
        Catch ex As Exception

        End Try
    End Sub
    'clear ค่าทั้งหมดและ load form ใหม่
    Public Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        comLang.Text = ""
        comLang.Items.Clear()
        comName.Text = ""
        comName.Items.Clear()
        txtCode.Text = ""
        btnEdit.Enabled = False 'btnEdit ใช้งานไม่ได้เพราะโหลดใหม่
        'bind ใหม่ (เหมือนการ load from ใหม่)
        frmMain_Load(sender, e)
        'bindingLang()
        'bindingName()
    End Sub

    'มีการเลือกชื่อหรือเปลี่ยนชื่อจะแสดง code ใน txtCode
    Private Sub comName_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles comName.SelectedIndexChanged
        Dim arrId() As String = comName.Text.ToString.Split("-")
        Dim id As String = arrId(1).Trim
        'กำหนดค่าให้ _id เพื่อใช้ส่งไป edit ที่ frmEditSnippet
        _id = id
        'ถ้ามีการเลือกชื่อแล้ว comName จะไม่เป็นค่าว่างจึงสามารถใช้ btnEdit ได้
        If comName.Text <> "" Then
            btnEdit.Enabled = True
        End If
        Dim result = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value = id Select element 'เลือก <snippet> ที่มี id ของ name ที่ถูกเลือก
        txtCode.Text = result.Descendants("code").Value 'แสดง code ที่ txtCode
    End Sub

    'เมื่อมีการเลือกภาษา comName จะแสดงรายชื่อแค่ภายในภาษาเท่านั้น
    Private Sub comLang_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles comLang.SelectedIndexChanged
        'เมื่อเปลี่ยน text ใน comLang จะ clear ค่า text ใน comName และ txtCode ด้วย
        comName.Text = ""
        txtCode.Text = ""
        'comLang ไม่เป็นค่าว่างแสดงว่ามีการเลือกภาษา จะแสดงรายชื่อแค่ภายในภาษาเท่านั้น
        If comLang.Text <> "" Then
            Dim result = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value > 0 And element.Descendants("language").Value = comLang.Text Select element.Descendants("name").Value 'ใน <snippet> เลือก <snippet> ที่มี id > 0 และมี value ของ <language> เหมือนค่าใน comLanguage
            Dim result2 = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value > 0 And element.Descendants("language").Value = comLang.Text Select element.Attribute("id").Value 'ส่ง id ไปโดยแปลงให้เป็น array ก่อน
            binding(result, result2.ToArray, comName)
        End If
    End Sub

    'กด show
    Private Sub ShowToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ShowToolStripMenuItem.Click
        Me.Show()
        Me.WindowState = FormWindowState.Normal
    End Sub

    'กด exit
    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        NotifyIconMain.Visible = False
        End
    End Sub

    'double click ที่ notify จะแสดง form ที่ซ่อน
    Private Sub NotifyIconMain_MouseDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIconMain.MouseDoubleClick
        Me.Show()
        Me.WindowState = FormWindowState.Normal
    End Sub

    'เมื่อจะปิดโปรแกรมให้ clear notify icon
    Private Sub frmMain_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        NotifyIconMain.Visible = False
    End Sub

    'ถ้า minimize จะซ่อนโปรแกรมไว้ที่ taskbar
    Private Sub frmMain_SizeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SizeChanged
        If Me.WindowState = FormWindowState.Minimized Then
            Me.Hide()
        End If
    End Sub

    'About Me
    Private Sub btnInfo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnInfo.Click
        MessageBox.Show("AUTHOR : MAC , ronaldomac9@gmail.com", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
#End Region

#Region "BINDING ... "
    'ทำ blinding comLange ให้แสดงชื่อภาษาที่มีอยู่
    Public Sub bindingLang()
        'select value ของ <language> โดยไม่ซ้ำกัน 
        Dim result = From element In xmlDoc.Descendants("language") Select element.Value Distinct 'ใน <language> เลือก value ของ <language> ที่ไม่ซ้ำกัน
        Dim arrLang As New ArrayList()
        'เก็บรายชื่อภาษาใส่ arraylist
        For Each res In result
            If res <> "Language" Then
                arrLang.Add(res)
            End If
        Next
        'แปลง arraylist เป็น array แล้ว add ลง comAddLange
        comLang.Items.AddRange(arrLang.ToArray)
        'sort combobox
        comLang.Sorted = True
        'auto complete
        comLang.AutoCompleteSource = AutoCompleteSource.ListItems
        comLang.AutoCompleteMode = AutoCompleteMode.Append
    End Sub

    'ทำ blinding ให้ comName แสดงรายชื่อของ snippet 
    Public Sub bindingName()
        'select รายชื่อ ตั้งแต่ id >=1 
        Dim result = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value > 0 Select element 'ใน <snippet> เลือก <snippet> ที่มี id > 0
        Dim result2 = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value > 0 Select element.Attribute("id").Value 'เก็บ id
        Dim arrId() As String = result2.ToArray
        Dim i As Integer = 0
        Dim arrName As New ArrayList()
        For Each res In result
            arrName.Add(res.Descendants("name").Value & " - " & arrId(i)) 'ใน <snippet> เลือก name มาใส่ arraylist
            i += 1
        Next
        'แปลง arrName ไปเป็น array
        comName.Items.AddRange(arrName.ToArray)
        'sort combobox
        comName.Sorted = True
        'auto complete
        comName.AutoCompleteSource = AutoCompleteSource.ListItems
        comName.AutoCompleteMode = AutoCompleteMode.Append
    End Sub

    'ใช้ทำ databinding ให้ combobox
    Public Sub binding(ByVal result As Object, ByVal result2 As String(), ByVal com As ComboBox)
        Dim arrName As New ArrayList()
        Dim i As Integer = 0
        For Each res In result
            arrName.Add(res & " - " & result2(i)) 'ใช้ - คั่นระหว่างชื่อและ id
            i += 1
        Next
        'clear item ที่มีอยู่ใน combobox ออกก่อนแล้วค่อย add เข้าไปใหม่เพื่อไม่ให้มีการซ้ำของเดิม
        com.Items.Clear()
        'add ใส่ combobox
        com.Items.AddRange(arrName.ToArray)
        com.Sorted = True
        com.AutoCompleteSource = AutoCompleteSource.ListItems
        com.AutoCompleteMode = AutoCompleteMode.Append
    End Sub
#End Region

End Class
