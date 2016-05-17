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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmMain))
        Me.comLang = New System.Windows.Forms.ComboBox
        Me.comName = New System.Windows.Forms.ComboBox
        Me.txtCode = New System.Windows.Forms.RichTextBox
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel
        Me.lblCode = New System.Windows.Forms.Label
        Me.lblName = New System.Windows.Forms.Label
        Me.lblLange = New System.Windows.Forms.Label
        Me.ToolTipMain = New System.Windows.Forms.ToolTip(Me.components)
        Me.btnInfo = New System.Windows.Forms.Button
        Me.btnClear = New System.Windows.Forms.Button
        Me.btnEdit = New System.Windows.Forms.Button
        Me.btnCopy = New System.Windows.Forms.Button
        Me.btnAdd = New System.Windows.Forms.Button
        Me.NotifyIconMain = New System.Windows.Forms.NotifyIcon(Me.components)
        Me.ContextMenuStriptMain = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ShowToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.ExitToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.TableLayoutPanel1.SuspendLayout()
        Me.ContextMenuStriptMain.SuspendLayout()
        Me.SuspendLayout()
        '
        'comLang
        '
        Me.comLang.FormattingEnabled = True
        Me.comLang.Location = New System.Drawing.Point(97, 3)
        Me.comLang.Name = "comLang"
        Me.comLang.Size = New System.Drawing.Size(300, 24)
        Me.comLang.TabIndex = 0
        '
        'comName
        '
        Me.comName.FormattingEnabled = True
        Me.comName.Location = New System.Drawing.Point(97, 33)
        Me.comName.Name = "comName"
        Me.comName.Size = New System.Drawing.Size(300, 24)
        Me.comName.TabIndex = 1
        '
        'txtCode
        '
        Me.txtCode.Location = New System.Drawing.Point(97, 63)
        Me.txtCode.Name = "txtCode"
        Me.txtCode.Size = New System.Drawing.Size(373, 154)
        Me.txtCode.TabIndex = 2
        Me.txtCode.Text = ""
        Me.txtCode.WordWrap = False
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 2
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.0!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.lblCode, 0, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.lblName, 0, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.txtCode, 1, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.lblLange, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.comName, 1, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.comLang, 1, 0)
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(12, 12)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 5
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 160.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 19.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 9.0!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(473, 222)
        Me.TableLayoutPanel1.TabIndex = 0
        '
        'lblCode
        '
        Me.lblCode.Location = New System.Drawing.Point(3, 65)
        Me.lblCode.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblCode.Name = "lblCode"
        Me.lblCode.Size = New System.Drawing.Size(80, 20)
        Me.lblCode.TabIndex = 8
        Me.lblCode.Text = "Code :"
        Me.lblCode.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblName
        '
        Me.lblName.Location = New System.Drawing.Point(3, 35)
        Me.lblName.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblName.Name = "lblName"
        Me.lblName.Size = New System.Drawing.Size(80, 20)
        Me.lblName.TabIndex = 7
        Me.lblName.Text = "Name :"
        Me.lblName.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblLange
        '
        Me.lblLange.Location = New System.Drawing.Point(3, 5)
        Me.lblLange.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblLange.Name = "lblLange"
        Me.lblLange.Size = New System.Drawing.Size(80, 20)
        Me.lblLange.TabIndex = 6
        Me.lblLange.Text = "Language :"
        Me.lblLange.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'btnInfo
        '
        Me.btnInfo.Image = Global.My_Snippet.My.Resources.Resources.info
        Me.btnInfo.Location = New System.Drawing.Point(12, 240)
        Me.btnInfo.Name = "btnInfo"
        Me.btnInfo.Size = New System.Drawing.Size(50, 50)
        Me.btnInfo.TabIndex = 5
        Me.ToolTipMain.SetToolTip(Me.btnInfo, "Info")
        Me.btnInfo.UseVisualStyleBackColor = True
        '
        'btnClear
        '
        Me.btnClear.Image = Global.My_Snippet.My.Resources.Resources.refresh
        Me.btnClear.Location = New System.Drawing.Point(237, 240)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(50, 50)
        Me.btnClear.TabIndex = 4
        Me.ToolTipMain.SetToolTip(Me.btnClear, "Clear")
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'btnEdit
        '
        Me.btnEdit.Image = Global.My_Snippet.My.Resources.Resources.edit
        Me.btnEdit.Location = New System.Drawing.Point(303, 240)
        Me.btnEdit.Name = "btnEdit"
        Me.btnEdit.Size = New System.Drawing.Size(50, 50)
        Me.btnEdit.TabIndex = 3
        Me.ToolTipMain.SetToolTip(Me.btnEdit, "Edit Snippet")
        Me.btnEdit.UseVisualStyleBackColor = True
        '
        'btnCopy
        '
        Me.btnCopy.Image = Global.My_Snippet.My.Resources.Resources.properties
        Me.btnCopy.Location = New System.Drawing.Point(435, 240)
        Me.btnCopy.Name = "btnCopy"
        Me.btnCopy.Size = New System.Drawing.Size(50, 50)
        Me.btnCopy.TabIndex = 1
        Me.ToolTipMain.SetToolTip(Me.btnCopy, "Copy Code To Clippboard")
        Me.btnCopy.UseVisualStyleBackColor = True
        '
        'btnAdd
        '
        Me.btnAdd.Image = Global.My_Snippet.My.Resources.Resources._new
        Me.btnAdd.Location = New System.Drawing.Point(369, 240)
        Me.btnAdd.Name = "btnAdd"
        Me.btnAdd.Size = New System.Drawing.Size(50, 50)
        Me.btnAdd.TabIndex = 2
        Me.ToolTipMain.SetToolTip(Me.btnAdd, "Add New Snippet")
        Me.btnAdd.UseVisualStyleBackColor = True
        '
        'NotifyIconMain
        '
        Me.NotifyIconMain.ContextMenuStrip = Me.ContextMenuStriptMain
        Me.NotifyIconMain.Icon = CType(resources.GetObject("NotifyIconMain.Icon"), System.Drawing.Icon)
        Me.NotifyIconMain.Text = "My Snippet"
        Me.NotifyIconMain.Visible = True
        '
        'ContextMenuStriptMain
        '
        Me.ContextMenuStriptMain.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ShowToolStripMenuItem, Me.ExitToolStripMenuItem})
        Me.ContextMenuStriptMain.Name = "ContextMenuStriptMain"
        Me.ContextMenuStriptMain.Size = New System.Drawing.Size(101, 48)
        '
        'ShowToolStripMenuItem
        '
        Me.ShowToolStripMenuItem.Name = "ShowToolStripMenuItem"
        Me.ShowToolStripMenuItem.Size = New System.Drawing.Size(100, 22)
        Me.ShowToolStripMenuItem.Text = "Show"
        '
        'ExitToolStripMenuItem
        '
        Me.ExitToolStripMenuItem.Name = "ExitToolStripMenuItem"
        Me.ExitToolStripMenuItem.Size = New System.Drawing.Size(100, 22)
        Me.ExitToolStripMenuItem.Text = "Exit"
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(497, 304)
        Me.Controls.Add(Me.btnInfo)
        Me.Controls.Add(Me.btnClear)
        Me.Controls.Add(Me.btnEdit)
        Me.Controls.Add(Me.btnCopy)
        Me.Controls.Add(Me.btnAdd)
        Me.Controls.Add(Me.TableLayoutPanel1)
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(505, 338)
        Me.MinimumSize = New System.Drawing.Size(505, 338)
        Me.Name = "frmMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "MAC : My Snippet"
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.ContextMenuStriptMain.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents comLang As System.Windows.Forms.ComboBox
    Friend WithEvents comName As System.Windows.Forms.ComboBox
    Friend WithEvents txtCode As System.Windows.Forms.RichTextBox
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents lblName As System.Windows.Forms.Label
    Friend WithEvents lblLange As System.Windows.Forms.Label
    Friend WithEvents lblCode As System.Windows.Forms.Label
    Friend WithEvents btnAdd As System.Windows.Forms.Button
    Friend WithEvents btnCopy As System.Windows.Forms.Button
    Friend WithEvents ToolTipMain As System.Windows.Forms.ToolTip
    Friend WithEvents btnEdit As System.Windows.Forms.Button
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents NotifyIconMain As System.Windows.Forms.NotifyIcon
    Friend WithEvents ContextMenuStriptMain As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ShowToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExitToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents btnInfo As System.Windows.Forms.Button

End Class
