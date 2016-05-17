Imports System.IO
Imports System.Text.RegularExpressions
'การใช้ต้องเสียบ handy เพื่อเปิดโปรแกรม แล้วต้องดึงออกเพื่อให้ lock ได้
'และ เมื่อครบเวลาที่ lock หรือ เสียบ handy จะปลด lock ไฟล์ time.dat จะถูก clear
Public Class frmMain
    'This function used in order to lock the keyboard and mouse
    Declare Function BlockInput Lib "User32" (ByVal fBlockIt As Boolean) As Boolean
    Dim TimeStart, TimeEnd, TimeNow As Date
    Dim IsTimeStart, IsTimeEnd As Boolean 'ใช้เก็บค่าว่า ค่าเวลาที่ผู้ใช้ป้อนเข้ามาเป็นเวลาจริงๆหรือไม่
    Dim IsSetTime As Boolean
    Dim Key As Integer 'ใช้เป็นตัวปลด Lock
    Dim strRead As String = "" 'เก็บค่า key ที่อ่านเข้ามา

    Private Sub frmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'btnSave จะใช้ได้เมื่อใส่ เวลาถูกรูปแบบ , btnLock จะใช้ได้เมื่อกด btnSave แล้ว
        btnSave.Enabled = False
        btnLock.Enabled = False

        'อ่านไฟล์ key โดยเช้คทีละ Drive
        Try
            'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
            Dim FileOpen As New FileStream("F:\key.txt", FileMode.Open)
            Dim StreamRead As New StreamReader(FileOpen)
            strRead = StreamRead.ReadLine
            Key = strRead
            StreamRead.Close()
            FileOpen.Close()
        Catch ex As Exception
            Try
                'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                Dim FileOpen As New FileStream("G:\key.txt", FileMode.Open)
                Dim StreamRead As New StreamReader(FileOpen)
                strRead = StreamRead.ReadLine
                Key = strRead
                StreamRead.Close()
                FileOpen.Close()
            Catch ex2 As Exception
                Try
                    'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                    Dim FileOpen As New FileStream("H:\key.txt", FileMode.Open)
                    Dim StreamRead As New StreamReader(FileOpen)
                    strRead = StreamRead.ReadLine
                    Key = strRead
                    StreamRead.Close()
                    FileOpen.Close()
                Catch ex3 As Exception
                    Try
                        'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                        Dim FileOpen As New FileStream("I:\key.txt", FileMode.Open)
                        Dim StreamRead As New StreamReader(FileOpen)
                        strRead = StreamRead.ReadLine
                        Key = strRead
                        StreamRead.Close()
                        FileOpen.Close()
                    Catch ex4 As Exception
                        Try
                            'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                            Dim FileOpen As New FileStream("J:\key.txt", FileMode.Open)
                            Dim StreamRead As New StreamReader(FileOpen)
                            strRead = StreamRead.ReadLine
                            Key = strRead
                            StreamRead.Close()
                            FileOpen.Close()
                        Catch ex5 As Exception
                        End Try
                    End Try
                End Try
            End Try
        End Try

        'อ่านค่าเวลาที่ save ไว้เข้ามา
        Try
            Dim FileOpenTime As New FileStream("time.dat", FileMode.Open)
            Dim StreamReadTime As New StreamReader(FileOpenTime)
            Dim Read As String = ""
            Dim strReadTime() As String
            Read = StreamReadTime.ReadLine
            If Read <> "" Then
                strReadTime = Read.Split(",")
                TimeStart = strReadTime(0)
                TimeEnd = strReadTime(1)
                IsSetTime = True
            Else
                'ถ้าไม่ได้มีการ save เวลาไว้  StreamReadTime.ReadLine() จะ = ""
                IsSetTime = False
            End If
            StreamReadTime.Close()
            FileOpenTime.Close()
        Catch ex As Exception
        End Try

        'ถ้าเวลาที่ input เข้ามาถูกรูปแบบแล้วจะใช้ btnSave ได้
        If (IsTimeStart = True And IsTimeEnd = True) Then
            btnSave.Enabled = True
        End If

        'ถ้ายังไม่ได้ใส่ Flash Drive และไม่มีการ set เวลาไว้จะทำการ lock จะทำการปิดโปรแกรม (ไม่ให้ใช้โปรแกรม)
        If Key <> 1 And IsSetTime = False Then
            'Me.Opacity = 0.0
            Me.Close()
        End If

        'ถ้ามีการ set เวลาไว้จะทำการ lock (ยังไม่ครบระยะเวลา lock)ต่อและ ซ่อนโปรแกรมไว้
        If IsSetTime = True Then
            Me.Hide()
            Me.Opacity = 0.0
            myTime.Enabled = True
            myTime.Interval = 10
        End If

    End Sub

    'กดปุ่มเพื่อ Save ช่วงเวลาที่ต้องการ Lock
    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click
        'ถ้าเวลาที่ input เข้ามาถูกรูปแบบแล้วจะบันทึกเวลาลงไฟล์ได้
        Dim FileSave As New FileStream("time.dat", FileMode.Create)
        Dim StreamWrite As New StreamWriter(FileSave)
        Try
            TimeStart = txtTimeStart.Text
            TimeEnd = txtTimeEnd.Text
        Catch ex As Exception
        End Try
        StreamWrite.WriteLine(TimeStart + "," + TimeEnd)
        StreamWrite.Close()
        FileSave.Close()
        'ถ้า save แล้วจะ lock ได้
        btnLock.Enabled = True
        'แสดงข้อความเตือนให้ remove handy 
        lblWarn.Text = "Remove Handy!"
    End Sub

    'กดปุ่ม Clear ค่าของเวลาที่ถูกบันทึกไป
    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Dim FileSave As New FileStream("time.dat", FileMode.Create)
        Dim StreamWrite As New StreamWriter(FileSave)
        Try
            TimeStart = txtTimeStart.Text
            TimeEnd = txtTimeEnd.Text
        Catch ex As Exception
        End Try
        StreamWrite.WriteLine("")
        StreamWrite.Close()
        FileSave.Close()

    End Sub

    'กดปุ่ม Lock
    Private Sub btnLock_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLock.Click
        'ซ่อนโปรแกรม
        Me.Hide()
        'เริ่มการทำงานของ timer
        myTime.Enabled = True
        myTime.Interval = 10
        'กำหนดค่าเริ่มต้นให้ Key
        Key = 0
    End Sub

    'กำหนดเวลาปัจจุบันให้ txtTimeStart
    Private Sub btnCurrentTime_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCurrentTime.Click
        txtTimeStart.Text = Now.ToShortTimeString
    End Sub

    'ทำการ Lock
    Private Sub myTime_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles myTime.Tick
        'กดหนดเวลาปัจจุบัน
        TimeNow = Now.ToShortTimeString
        'เมื่อถึงเวลาที่กำหนดจึงจะเริ่ม lock
        If TimeNow >= TimeStart Then
            'ทำการ lock
            BlockInput(True)
        End If
        'อ่านไฟล์ key โดยเช้คทีละ Drive (Flash Drive) 
        Try
            'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
            Dim FileOpen As New FileStream("F:\key.txt", FileMode.Open)
            Dim StreamRead As New StreamReader(FileOpen)
            strRead = StreamRead.ReadLine
            Key = strRead
            StreamRead.Close()
            FileOpen.Close()
        Catch ex As Exception
            Try
                'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                Dim FileOpen As New FileStream("G:\key.txt", FileMode.Open)
                Dim StreamRead As New StreamReader(FileOpen)
                strRead = StreamRead.ReadLine
                Key = strRead
                StreamRead.Close()
                FileOpen.Close()
            Catch ex2 As Exception
                Try
                    'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                    Dim FileOpen As New FileStream("H:\key.txt", FileMode.Open)
                    Dim StreamRead As New StreamReader(FileOpen)
                    strRead = StreamRead.ReadLine
                    Key = strRead
                    StreamRead.Close()
                    FileOpen.Close()
                Catch ex3 As Exception
                    Try
                        'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                        Dim FileOpen As New FileStream("I:\key.txt", FileMode.Open)
                        Dim StreamRead As New StreamReader(FileOpen)
                        strRead = StreamRead.ReadLine
                        Key = strRead
                        StreamRead.Close()
                        FileOpen.Close()
                    Catch ex4 As Exception
                        Try
                            'อ่านไฟล์แล้วเก็บค่าในไฟล์ เพื่อนำมาปลด lock
                            Dim FileOpen As New FileStream("J:\key.txt", FileMode.Open)
                            Dim StreamRead As New StreamReader(FileOpen)
                            strRead = StreamRead.ReadLine
                            Key = strRead
                            StreamRead.Close()
                            FileOpen.Close()
                        Catch ex5 As Exception
                        End Try
                    End Try
                End Try
            End Try
        End Try

        'ถ้าครบเวลาที่กำหนด หรือ ใส่ Flash Drive ที่มี key.txt แล้วจะปลด lock แลัว Clear ค่าของเวลาที่ถูกบันทึกไป แล้วปิดโปรแกรม
        If (TimeNow >= TimeEnd) Or (Key = 1) Then
            'ปลด lock
            BlockInput(False)
            'Clear ค่าของเวลาที่ถูกบันทึกไป
            btnClear_Click(sender, e)
            'ปิดโปรแกรม
            Me.Close()
        End If
    End Sub

    Private Sub txtTimeStart_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtTimeStart.TextChanged
        'ตรวจสอบว่ารูปแบบของเวลาที่ผู้ใช้ป้อนเข้ามาถูกต้องหรือไม่
        IsTimeStart = checkTime(txtTimeStart.Text)
        If IsTimeStart <> True Then
            myErrorProvider.SetError(txtTimeStart, "Time xx:xx")
        Else
            myErrorProvider.SetError(txtTimeStart, "")
        End If
        'โหลด Form ใหม่เพื่อให้ใช้ btnSave ได้
        frmMain_Load(sender, e)
    End Sub

    Private Sub txtTimeEnd_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtTimeEnd.TextChanged
        'ตรวจสอบว่ารูปแบบของเวลาที่ผู้ใช้ป้อนเข้ามาถูกต้องหรือไม่
        IsTimeEnd = checkTime(txtTimeEnd.Text)
        If IsTimeEnd <> True Then
            myErrorProvider.SetError(txtTimeEnd, "Time xx:xx")
        Else
            myErrorProvider.SetError(txtTimeEnd, "")
        End If
        'โหลด Form ใหม่เพื่อให้ใช้ btnSave ได้
        frmMain_Load(sender, e)
    End Sub
    'เมื่อปิดโปรแกรมให้ clear time.dat
    Private Sub frmMain_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        btnClear_Click(sender, e)
    End Sub

    'ใช้ตรวจสอบว่ารูปแบบของเวลาที่ผู้ใช้ป้อนเข้ามาถูกต้องหรือไม่
    Private Function checkTime(ByVal time As String) As Boolean
        Dim result As Boolean = False
        Dim reg As New Regex("^([0-1][0-9]|[2][0-3]):([0-5][0-9])$")
        If reg.IsMatch(time) Then
            result = True
        End If
        Return result
    End Function

End Class
