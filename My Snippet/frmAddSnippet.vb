Imports System.Xml
Imports System.Xml.Linq
Public Class frmAddSnippet
    Dim xmlDoc As XElement

#Region "EVENT ... "
    'ตอนเปิด form ให้ load ไฟล์ xml
    Private Sub frmAddSnippet_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'xmlFileName อยู่ใน class frmMain
        xmlDoc = XElement.Load(frmMain.xmlFileName)
        bindingLang()
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        'select เพื่อหา id สุดท้ายของ <snippet>
        Dim result = From element In xmlDoc.Descendants("snippet") Select element
        Dim lastId As Integer = result.Last.Attribute("id").Value
        'จะ insert ได้เมื่อ input ครบ
        If checkInput() = True Then
            'insert เข้าไปต้อท้าย <snippet> อันสุดท้าย คือที่ id = lastId + 1
            Dim lastElement As XElement = xmlDoc.Descendants("snippet").Last
            lastElement.AddAfterSelf(New XElement("snippet", _
                New XAttribute("id", lastId + 1), _
                New XElement("name", txtAddName.Text), _
                New XElement("language", comAddLang.Text), _
                New XElement("comment", txtAddComment.Text), _
                New XElement("code", txtAddCode.Text)))
            xmlDoc.Save(frmMain.xmlFileName)
            'clear input
            clearInput()
        End If
    End Sub

    'กดปุ่ม clear input
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        clearInput()
    End Sub

    'เมื่อจะปิดโปรแกรมให้ refresh ที่ frmMain
    Private Sub frmAddSnippet_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        'refresh frmMain ใหม่
        frmMain.btnClear_Click(sender, e)
    End Sub
#End Region

#Region "INPUT ... "
    'clear input
    Public Sub clearInput()
        txtAddName.Text = ""
        comAddLang.Text = ""
        txtAddComment.Text = ""
        txtAddCode.Text = ""
    End Sub

    'เช็คว่า input name / language / code หรือไม่
    Public Function checkInput() As Boolean
        Dim result As Boolean = False
        If txtAddCode.Text.Trim <> "" And comAddLang.Text.Trim <> "" And txtAddCode.Text <> "" Then
            result = True
        End If
        Return result
    End Function
#End Region

#Region "BINDING ... "
    'ทำ blinding comAddLange ให้แสดงชื่อภาษาที่มีอยู่
    Public Sub bindingLang()
        'select value ของ <language> โดยไม่ซ้ำกัน 
        Dim result = From element In xmlDoc.Descendants("language") Select element.Value Distinct
        Dim arrLang As New ArrayList()
        'เก็บรายชื่อภาษาใส่ arraylist
        For Each res In result
            If res <> "Language" Then
                arrLang.Add(res)
            End If
        Next
        'แปลง arraylist เป็น array แล้ว add ลง comAddLange
        comAddLang.Items.AddRange(arrLang.ToArray)
        'sort combobox
        comAddLang.Sorted = True
        'auto complete
        comAddLang.AutoCompleteSource = AutoCompleteSource.ListItems
        comAddLang.AutoCompleteMode = AutoCompleteMode.Append
    End Sub
#End Region
End Class