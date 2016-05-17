Imports System.Xml
Imports System.Xml.Linq
Public Class frmEditSnippet
    Dim id As String = ""
    Dim xmlDoc As XElement

#Region "EVENT ... "
    Private Sub frmEditSnippet_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'อ่านค่า id ของ code ที่ต้องการ edit
        id = frmMain.id
        'xmlFileName อยู่ใน class frmMain
        xmlDoc = XElement.Load(frmMain.xmlFileName)
        'ทำ blinding comEditLang ให้แสดงชื่อภาษาที่มีอยู่
        bindingLang()
        'select ค่าต่างๆมาแสดง
        Dim result = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value = id Select element
        txtEditName.Text = result.Descendants("name").Value
        comEditLang.Text = result.Descendants("language").Value
        txtEditComment.Text = result.Descendants("comment").Value
        txtEditCode.Text = result.Descendants("code").Value
    End Sub

    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim result = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value = id Select element
        result.Descendants("name").Value = txtEditName.Text
        result.Descendants("language").Value() = comEditLang.Text
        result.Descendants("comment").Value() = txtEditComment.Text
        result.Descendants("code").Value() = txtEditCode.Text
        'save ไฟล์ 
        xmlDoc.Save(frmMain.xmlFileName)
    End Sub

    'delete <snippet> ที่เลือก
    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If MessageBox.Show("Are you Sure?", "Delete", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.Yes Then
            Dim result = From element In xmlDoc.Descendants("snippet") Where element.Attribute("id").Value = id Select element
            result.Remove()
            'save ไฟล์ 
            xmlDoc.Save(frmMain.xmlFileName)
            'ปิด form นี้
            Me.Close()
            'refresh frmMain ใหม่
            frmMain.btnClear_Click(sender, e)
        End If
    End Sub

    'เมื่อจะปิดโปรแกรมให้ refresh ที่ frmMain
    Private Sub frmEditSnippet_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        'refresh frmMain ใหม่
        frmMain.btnClear_Click(sender, e)
    End Sub
#End Region

#Region "BINDING ... "
    'ทำ blinding comEditLang ให้แสดงชื่อภาษาที่มีอยู่
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
        comEditLang.Items.AddRange(arrLang.ToArray)
        'sort combobox
        comEditLang.Sorted = True
        'auto complete
        comEditLang.AutoCompleteSource = AutoCompleteSource.ListItems
        comEditLang.AutoCompleteMode = AutoCompleteMode.Append
    End Sub
#End Region

#Region "INPUT ... "
    'clear ค่าที่ Input
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        txtEditName.Text = ""
        comEditLang.Text = ""
    End Sub
#End Region

End Class