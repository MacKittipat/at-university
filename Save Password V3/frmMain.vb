Imports System.IO
Public Class frmMain
    Dim SearchText As String 'เก็บคำที่ค้นหา
    Dim CountWeb As Integer = 0 'ใช้นับจำนวนเว็บที่มี เริ่มจาก 0
    Dim Info(10000) As Information 'ใช้เก็บช้อมูลที่อ่ามมาจากไฟล์
    Structure Information
        Dim Web As String
        Dim Log As String
        Dim Pass As String
        Dim Des As String
    End Structure

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'clear item ใน lstWeb และ array Info และ CountWeb เพื่อไม่ให้ชื่อเวบซ้ำซ้อนกันเมื่อเพิ่มเวบใหม่ 
        lstWeb.Items.Clear()
        ReDim Info(10000)
        CountWeb = 0
        'โหลดรายชื่อเว็บจาก info.dat มาไว้ที่ lstWeb
        Dim fileRead As New FileStream("info.dat", FileMode.Open)
        Dim streamRead As New StreamReader(fileRead)
        Dim strRead As String = ""
        'ใช้เก็บค่าที่ split
        Dim arrayInfo(3) As String
        'วนลูปอ่านข้อมูลทีละบรรทัดจนกว่าจะเจอ Nothing
        Do
            strRead = streamRead.ReadLine()
            Try
                'แยกเก็บข้อมูลของแต่ละเว็บ ทีละบรรทัด
                arrayInfo = strRead.Split(",")
                Info(CountWeb).Web = arrayInfo(0)
                Info(CountWeb).Log = arrayInfo(1)
                Info(CountWeb).Pass = decrypt(arrayInfo(2)) 'decrypt ก่อน
                Info(CountWeb).Des = arrayInfo(3)
            Catch ex As Exception
            End Try
            CountWeb += 1
        Loop While strRead <> Nothing
        streamRead.Close()
        fileRead.Close()
        'หาจำนวน web ทั้งหมดต้องลบ 1
        CountWeb = CountWeb - 1
        'เพิ่มรายชื่อเวบทั้งหมดที่อ่านได้ลง lstWeb
        For i = 0 To CountWeb - 1 'ลบอีก 1 เพราะเริ่มจาก 0
            lstWeb.Items.Add(Info(i).Web)
        Next
        'ยังไม่เลือกเวบห้าม edit
        btnEdit.Enabled = False
        'textbox ที่ถูก ReadOnly=true ยังไม่เปลี่ยนเป็น false จึงไม่สามารถแก้ได้ (ไม่ได้กด btnEdit)
        btnSaveEditWeb.Enabled = False
        'ยังไม่เลือกเวบจะลบไม่ได้
        btnDelete.Enabled = False
    End Sub
    'บันทึก web ต่อท้ายไฟล์แบบ comma separated values (csv)
    Private Sub btnSaveAddWeb_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSaveAddWeb.Click
        'ถ้า txtAddWeb, txtAddLogin, txtAddPass ไม่เป็นค่าว่างจะ save เวบได้
        If txtAddWeb.Text <> "" And txtAddLogin.Text <> "" And txtAddPass.Text <> "" Then
            Dim fileSave As New FileStream("info.dat", FileMode.Append)
            Dim streamSave As New StreamWriter(fileSave)
            Dim strWrite As String = ""
            strWrite = txtAddWeb.Text + "," + txtAddLogin.Text + "," + encrypt(txtAddPass.Text) + "," + txtAddDes.Text
            streamSave.WriteLine(strWrite)
            streamSave.Close()
            fileSave.Close()
            'clear ค่าใน textbox 
            txtAddWeb.Text = ""
            txtAddLogin.Text = ""
            txtAddPass.Text = ""
            txtAddDes.Text = ""
        Else
            MessageBox.Show("Please Input Website, Login and Password", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            'clear ค่าของ web ที่ถูกเลือกออก
            txtInfoWeb.Text = ""
            txtInfoLogin.Text = ""
            txtInfoPass.Text = ""
            txtInfoDes.Text = ""
        End If
        'clear ค่าของ web ที่ถูกเลือกออก
        txtInfoWeb.Text = ""
        txtInfoLogin.Text = ""
        txtInfoPass.Text = ""
        txtInfoDes.Text = ""
        'โหลด form ใหม่ เพื่อให้เวบที่ถูก save ไปแสดงออกมาที่ lstWeb ทันที
        frmMain_Load(sender, e)
    End Sub
    'clear ค่าใน textbox
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        'clear ค่าใน textbox 
        txtAddWeb.Text = ""
        txtAddLogin.Text = ""
        txtAddPass.Text = ""
        txtAddDes.Text = ""
    End Sub
    'ค้นหาชื่อเวบจากคำที่พิมพ์ลงไป
    Private Sub txtSearch_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtSearch.TextChanged
        SearchText = txtSearch.Text
        'Clear item ทั้งหมดออกเพื่อไม่ให้ item ที่หาไปซ้อนท้าย
        lstWeb.Items.Clear()
        For i = 0 To CountWeb - 1
            If InStr(Info(i).Web, SearchText) >= 1 Then
                lstWeb.Items.Add(Info(i).Web)
            End If
        Next
    End Sub
    'คลิกชื่อ web เพื่อดูข้อมูลของ web
    Private Sub lstWeb_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstWeb.SelectedIndexChanged
        'Try กันไว้ตอน delete ไม่ให้ error
        Try
            'วนลูปไปเรื่อยจนกว่าจะเจอเว็บที่ถูกเลือก แล้วค่อยโชว์ข้อมูลของเวบที่ textbox
            For i = 0 To CountWeb - 1
                If Info(i).Web = lstWeb.Items(lstWeb.SelectedIndex).ToString Then
                    txtInfoWeb.Text = Info(i).Web
                    txtInfoLogin.Text = Info(i).Log
                    txtInfoPass.Text = Info(i).Pass
                    txtInfoDes.Text = Info(i).Des
                    'เลือกเวบแล้วจะ edit และ delete ได้
                    btnEdit.Enabled = True
                    btnDelete.Enabled = True
                End If
            Next
        Catch ex As Exception
        End Try

    End Sub
    'save ข้อมูล web หลังจากที่แก้ไขแล้ว
    Private Sub btnSaveEditWeb_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSaveEditWeb.Click
        'วนลูปเพื่อหาว่าเวบใดที่ถูกแก้ไข ก็ให้แก้ไขเวบนั้นเลย
        For i = 0 To CountWeb - 1
            'lstWeb.Items(lstWeb.SelectedIndex) คือ web ที่ถูกเลือกมาแก้ไข
            If Info(i).Web = lstWeb.Items(lstWeb.SelectedIndex).ToString Then
                Info(i).Web = txtInfoWeb.Text
                Info(i).Log = txtInfoLogin.Text
                Info(i).Pass = txtInfoPass.Text
                Info(i).Des = txtInfoDes.Text
            End If
        Next
        'เปิดไฟล์เพื่อเขียนทับใหม่ทุกๆ web 
        Dim fileSave As New FileStream("info.dat", FileMode.Create)
        Dim streamSave As New StreamWriter(fileSave)
        Dim strWrite As String = ""
        For i = 0 To CountWeb - 1
            strWrite = Info(i).Web + "," + Info(i).Log + "," + encrypt(Info(i).Pass) + "," + Info(i).Des
            streamSave.WriteLine(strWrite)
        Next
        streamSave.Close()
        fileSave.Close()
        'ยกเลิกการแก้ไขข้อมูลใน textbox
        txtInfoWeb.ReadOnly = True
        txtInfoLogin.ReadOnly = True
        txtInfoPass.ReadOnly = True
        txtInfoDes.ReadOnly = True
        'โหลด form ใหม่
        frmMain_Load(sender, e)
    End Sub
    'แก้ไขข้อมูล web
    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        'ให้แก้ไขข้อมูลใน textbox ได้
        txtInfoWeb.ReadOnly = False
        txtInfoLogin.ReadOnly = False
        txtInfoPass.ReadOnly = False
        txtInfoDes.ReadOnly = False
        'ใช้ปุ่มเวฤแก้ไขได้แล้วเพราะกด btnEdit แล้ว
        btnSaveEditWeb.Enabled = True
    End Sub
    'กดปุ่มลบเว็บ
    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        'เก็บชื่อเว็บที่ถูกลบ (ตัวที่ถูกเลือกคือตัวที่โดนลบ)
        Dim deleteWeb As String = lstWeb.Items(lstWeb.SelectedIndex)
        'ลบชื่อเวบออกจาก lstWeb
        lstWeb.Items.RemoveAt(lstWeb.SelectedIndex)
        Dim fileSave As New FileStream("info.dat", FileMode.Create)
        Dim streamSave As New StreamWriter(fileSave)
        Dim strWrite As String = ""
        Dim i As Integer = 0
        'เช้คว่า Info(i).Web ใดถูกลบก็ไม่ต้องเซฟเวบนั้นลงไฟล์
        While i <= CountWeb - 1
            'เวบใดไม่ถูกลบให้บันทึกลงไฟล์
            If Info(i).Web <> deleteWeb Then
                strWrite = Info(i).Web + "," + Info(i).Log + "," + encrypt(Info(i).Pass) + "," + Info(i).Des
                streamSave.WriteLine(strWrite)
            End If
            i += 1
        End While
        streamSave.Close()
        fileSave.Close()
        'clear ค่าใน textbox ที่
        txtInfoWeb.Text = ""
        txtInfoLogin.Text = ""
        txtInfoPass.Text = ""
        txtInfoWeb.Text = ""
        txtInfoDes.Text = ""
        'โหลด form ใหม่ เพื่อ refresh ค่าใน lstWeb และ array Info
        frmMain_Load(sender, e)
    End Sub
    'เอา login เข้า clipboard
    Private Sub btnGetLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGetLogin.Click
        My.Computer.Clipboard.SetText(txtInfoLogin.Text)
    End Sub
    'เอา pass เข้า clipboard
    Private Sub btnGetPass_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGetPass.Click
        My.Computer.Clipboard.SetText(txtInfoPass.Text)
    End Sub
    'ข้อมุลผู้จัดทำ
    Private Sub btnInfo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnInfo.Click
        MessageBox.Show("AUTHOR : MAC , ronaldomac9@gmail.com", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub
    'เมื่อปิดโปรแรกมให้ clear clipboard
    Private Sub frmMain_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        My.Computer.Clipboard.Clear()
    End Sub
    '##### MOUSE HOVER #####
    Private Sub btnGetLogin_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetLogin.MouseEnter
        btnGetLogin.Image = My.Resources.Login40_hover
    End Sub
    Private Sub btnGetLogin_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetLogin.MouseHover
        btnGetLogin.Image = My.Resources.Login40_hover
    End Sub
    Private Sub btnGetLogin_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetLogin.MouseLeave
        btnGetLogin.Image = My.Resources.Login40
    End Sub
    Private Sub btnGetPass_MouseEnter(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetPass.MouseEnter
        btnGetPass.Image = My.Resources.Pass40_hover
    End Sub
    Private Sub btnGetPass_MouseHover(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetPass.MouseHover
        btnGetPass.Image = My.Resources.Pass40_hover
    End Sub
    Private Sub btnGetPass_MouseLeave(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetPass.MouseLeave
        btnGetPass.Image = My.Resources.Pass40
    End Sub
    '##### ENCRYPT-DECRYPT PASS #####
    'เข้ารหัสก่อนบันทึกลงไฟล์
    Public Function encrypt(ByVal pass As String)
        'เก็บ pass ที่ถูก encrypt แล้ว
        Dim encryptPass As String = ""
        For i = 0 To pass.Length - 1
            'encrypt โดยการเอา asc ของแต่ละอักษร + 1,2,3,...
            encryptPass = encryptPass + Chr(Asc(pass(i)) + (i + 1))
        Next
        encryptPass = encryptPass.Trim
        Return encryptPass
    End Function
    'ถอดรหัสก่อนอ่านข้อมูล
    Public Function decrypt(ByVal pass As String)
        'เก็บ pass ที่ถูกถอดรหัสแล้ว
        Dim decryptPass As String = ""
        For i = 0 To pass.Length - 1
            'encrypt โดยการเอา asc ของแต่ละอักษร + 1,2,3,...
            decryptPass = decryptPass + Chr(Asc(pass(i)) - (i + 1))
        Next
        Return decryptPass
    End Function
    'sort รายชื่อ web ใน lstWeb
    Private Sub SortToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SortToolStripMenuItem.Click
        lstWeb.Sorted = True
    End Sub
End Class

'    '##### WATERMARK TextBox #####
'    Private Sub txtAddWeb_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAddWeb.GotFocus
'        'เมื่อ focus และ txtAddWeb มีค่าเป็น default จะสามารภพิมพ์ข้อความปกติได้
'        If txtAddWeb.Text = "Add New Website" Then
'            txtAddWeb.ForeColor = Color.Black
'            txtAddWeb.Text = ""
'        End If
'    End Sub

'    Private Sub txtAddWeb_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAddWeb.LostFocus
'        'เมื่อไม่ได้ focus และ txtAddWeb เป็นค่าว่าง จะโชว์ watermark
'        If txtAddWeb.Text = "" Then
'            txtAddWeb.ForeColor = Color.Gray
'            txtAddWeb.Text = "Add New Website" 'default ของ txtAddWeb
'        End If
'    End Sub

'    Private Sub txtAddLogin_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAddLogin.GotFocus
'        If txtAddWeb.Text = "Add Login" Then
'            txtAddLogin.ForeColor = Color.Black
'            txtAddLogin.Text = ""
'        End If
'    End Sub

'    Private Sub txtAddLogin_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAddLogin.LostFocus
'        If txtAddLogin.Text = "" Then
'            txtAddLogin.ForeColor = Color.Gray
'            txtAddLogin.Text = "Add Login"
'        End If
'    End Sub