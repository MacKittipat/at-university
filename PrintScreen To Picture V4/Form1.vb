'VB.NET / .NET 2.0 / VS 2008 / 14-3-2009
Public Class frmPrintToPic
    'ครวจจับการกด keyboard (printscreen ascii = 44)
    Declare Function GetAsyncKeyState Lib "user32" Alias "GetAsyncKeyState" (ByVal vKey As Long) As Integer
    Dim Path As String
    Dim fiNum As Integer
    Dim Pic As System.Drawing.Image

    Private Sub frmPrintToPic_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.KeyPreview = True
        Me.ShowInTaskbar = False
        Timer1.Enabled = True
        Timer1.Interval = 1
        Try
            'อ่าน Path
            fiNum = FreeFile()
            FileOpen(fiNum, "SavePath.dat", OpenMode.Input)
            Path = LineInput(fiNum)
        Catch ex As Exception
        End Try
        txtPath.Text = Path
        FileClose(fiNum)
    End Sub

    Private Sub frmPrintToPic_SizeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.SizeChanged
        Me.Visible = False
    End Sub

    Private Sub frmPrintToPic_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles Me.KeyDown
        If e.Control Then
            If e.KeyCode = Keys.M Then
                MessageBox.Show("AUTHOR : MAC , ronaldomac9@gmail.com", "ABOUT", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If
        End If
    End Sub

    Private Sub btnSetPath_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSetPath.Click
        'เลือก Folder เพื่อ Save
        If FolderBrowserDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            Path = FolderBrowserDialog1.SelectedPath
            txtPath.Text = Path
        End If
        'บันทีก Path
        fiNum = FreeFile()
        FileOpen(fiNum, "SavePath.dat", OpenMode.Output)
        PrintLine(fiNum, Path)
        FileClose(fiNum)
    End Sub

    Private Sub btnAbout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAbout.Click
        MessageBox.Show("AUTHOR : MAC , ronaldomac9@gmail.com", "ABOUT", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim img As Bitmap
        Dim Result As Integer
        Static I As Integer
        'ตรวจจับการกด Print Screen
        Result = GetAsyncKeyState(44)
        If Result = -32767 Then
            Pic = My.Computer.Clipboard.GetImage()
            'resize ขนาด
            img = New Bitmap(Pic, New Size(Pic.Size.Width * 0.9, Pic.Size.Height * 0.9))
            Try
                img.Save(Path & "\Pic" & I & ".png")
            Catch ex As Exception
                MessageBox.Show("Can not find this Location", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
            I += 1
        End If
    End Sub

    Private Sub ShowToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ShowToolStripMenuItem.Click
        Me.Visible = True
        Me.WindowState = FormWindowState.Normal
        Me.Visible = True
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        Me.Close()
    End Sub
    Private Sub NotifyIcon1_MouseDoubleClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIcon1.MouseDoubleClick
        Me.Visible = True
        Me.WindowState = FormWindowState.Normal
        Me.Visible = True
    End Sub
End Class
