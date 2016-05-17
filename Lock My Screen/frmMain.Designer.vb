<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.btnSave = New System.Windows.Forms.Button
        Me.btnClear = New System.Windows.Forms.Button
        Me.btnLock = New System.Windows.Forms.Button
        Me.myTime = New System.Windows.Forms.Timer(Me.components)
        Me.txtTimeStart = New System.Windows.Forms.TextBox
        Me.txtTimeEnd = New System.Windows.Forms.TextBox
        Me.myErrorProvider = New System.Windows.Forms.ErrorProvider(Me.components)
        Me.btnCurrentTime = New System.Windows.Forms.Button
        Me.lblWarn = New System.Windows.Forms.Label
        CType(Me.myErrorProvider, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'btnSave
        '
        Me.btnSave.Location = New System.Drawing.Point(12, 85)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Size = New System.Drawing.Size(100, 25)
        Me.btnSave.TabIndex = 2
        Me.btnSave.Text = "Save"
        Me.btnSave.UseVisualStyleBackColor = True
        '
        'btnClear
        '
        Me.btnClear.Location = New System.Drawing.Point(127, 85)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(100, 25)
        Me.btnClear.TabIndex = 3
        Me.btnClear.Text = "Clear"
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'btnLock
        '
        Me.btnLock.Location = New System.Drawing.Point(12, 116)
        Me.btnLock.Name = "btnLock"
        Me.btnLock.Size = New System.Drawing.Size(215, 25)
        Me.btnLock.TabIndex = 4
        Me.btnLock.Text = "Lock"
        Me.btnLock.UseVisualStyleBackColor = True
        '
        'myTime
        '
        '
        'txtTimeStart
        '
        Me.txtTimeStart.Font = New System.Drawing.Font("Tahoma", 18.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.txtTimeStart.Location = New System.Drawing.Point(12, 12)
        Me.txtTimeStart.Name = "txtTimeStart"
        Me.txtTimeStart.Size = New System.Drawing.Size(100, 36)
        Me.txtTimeStart.TabIndex = 5
        Me.txtTimeStart.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtTimeEnd
        '
        Me.txtTimeEnd.Font = New System.Drawing.Font("Tahoma", 18.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.txtTimeEnd.Location = New System.Drawing.Point(127, 12)
        Me.txtTimeEnd.Name = "txtTimeEnd"
        Me.txtTimeEnd.Size = New System.Drawing.Size(100, 36)
        Me.txtTimeEnd.TabIndex = 6
        Me.txtTimeEnd.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'myErrorProvider
        '
        Me.myErrorProvider.BlinkStyle = System.Windows.Forms.ErrorBlinkStyle.NeverBlink
        Me.myErrorProvider.ContainerControl = Me
        '
        'btnCurrentTime
        '
        Me.btnCurrentTime.Location = New System.Drawing.Point(12, 54)
        Me.btnCurrentTime.Name = "btnCurrentTime"
        Me.btnCurrentTime.Size = New System.Drawing.Size(100, 25)
        Me.btnCurrentTime.TabIndex = 7
        Me.btnCurrentTime.Text = "Current Time"
        Me.btnCurrentTime.UseVisualStyleBackColor = True
        '
        'lblWarn
        '
        Me.lblWarn.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.lblWarn.ForeColor = System.Drawing.Color.Red
        Me.lblWarn.Location = New System.Drawing.Point(127, 54)
        Me.lblWarn.Name = "lblWarn"
        Me.lblWarn.Size = New System.Drawing.Size(100, 23)
        Me.lblWarn.TabIndex = 8
        Me.lblWarn.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(242, 152)
        Me.Controls.Add(Me.lblWarn)
        Me.Controls.Add(Me.btnCurrentTime)
        Me.Controls.Add(Me.txtTimeEnd)
        Me.Controls.Add(Me.txtTimeStart)
        Me.Controls.Add(Me.btnLock)
        Me.Controls.Add(Me.btnClear)
        Me.Controls.Add(Me.btnSave)
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(250, 186)
        Me.MinimumSize = New System.Drawing.Size(250, 186)
        Me.Name = "frmMain"
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "MAC : Lock My Screen"
        CType(Me.myErrorProvider, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnSave As System.Windows.Forms.Button
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents btnLock As System.Windows.Forms.Button
    Friend WithEvents myTime As System.Windows.Forms.Timer
    Friend WithEvents txtTimeStart As System.Windows.Forms.TextBox
    Friend WithEvents txtTimeEnd As System.Windows.Forms.TextBox
    Friend WithEvents myErrorProvider As System.Windows.Forms.ErrorProvider
    Friend WithEvents btnCurrentTime As System.Windows.Forms.Button
    Friend WithEvents lblWarn As System.Windows.Forms.Label

End Class
