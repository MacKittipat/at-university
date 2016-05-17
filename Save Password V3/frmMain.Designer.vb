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
        Me.gbxWeb = New System.Windows.Forms.GroupBox
        Me.btnInfo = New System.Windows.Forms.Button
        Me.txtSearch = New System.Windows.Forms.TextBox
        Me.btnDelete = New System.Windows.Forms.Button
        Me.btnEdit = New System.Windows.Forms.Button
        Me.btnSaveEditWeb = New System.Windows.Forms.Button
        Me.lstWeb = New System.Windows.Forms.ListBox
        Me.myContextMenuStrip = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.SortToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem
        Me.gbxAddWeb = New System.Windows.Forms.GroupBox
        Me.btnClear = New System.Windows.Forms.Button
        Me.btnSaveAddWeb = New System.Windows.Forms.Button
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel
        Me.txtAddDes = New System.Windows.Forms.TextBox
        Me.lblAddDes = New System.Windows.Forms.Label
        Me.txtAddPass = New System.Windows.Forms.TextBox
        Me.lblAddLogin = New System.Windows.Forms.Label
        Me.txtAddWeb = New System.Windows.Forms.TextBox
        Me.txtAddLogin = New System.Windows.Forms.TextBox
        Me.lblAddWeb = New System.Windows.Forms.Label
        Me.lblAddPass = New System.Windows.Forms.Label
        Me.gbxInfoWeb = New System.Windows.Forms.GroupBox
        Me.btnGetPass = New System.Windows.Forms.Button
        Me.btnGetLogin = New System.Windows.Forms.Button
        Me.TableLayoutPanel2 = New System.Windows.Forms.TableLayoutPanel
        Me.txtInfoDes = New System.Windows.Forms.TextBox
        Me.txtInfoPass = New System.Windows.Forms.TextBox
        Me.txtInfoLogin = New System.Windows.Forms.TextBox
        Me.txtInfoWeb = New System.Windows.Forms.TextBox
        Me.lblInfoWeb = New System.Windows.Forms.Label
        Me.lblInfoLogin = New System.Windows.Forms.Label
        Me.lblInfoPass = New System.Windows.Forms.Label
        Me.lblInfoDes = New System.Windows.Forms.Label
        Me.myToolTip = New System.Windows.Forms.ToolTip(Me.components)
        Me.myErrorProvider = New System.Windows.Forms.ErrorProvider(Me.components)
        Me.gbxWeb.SuspendLayout()
        Me.myContextMenuStrip.SuspendLayout()
        Me.gbxAddWeb.SuspendLayout()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.gbxInfoWeb.SuspendLayout()
        Me.TableLayoutPanel2.SuspendLayout()
        CType(Me.myErrorProvider, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'gbxWeb
        '
        Me.gbxWeb.Controls.Add(Me.btnInfo)
        Me.gbxWeb.Controls.Add(Me.txtSearch)
        Me.gbxWeb.Controls.Add(Me.btnDelete)
        Me.gbxWeb.Controls.Add(Me.btnEdit)
        Me.gbxWeb.Controls.Add(Me.btnSaveEditWeb)
        Me.gbxWeb.Controls.Add(Me.lstWeb)
        Me.gbxWeb.Location = New System.Drawing.Point(14, 209)
        Me.gbxWeb.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.gbxWeb.Name = "gbxWeb"
        Me.gbxWeb.Padding = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.gbxWeb.Size = New System.Drawing.Size(530, 199)
        Me.gbxWeb.TabIndex = 0
        Me.gbxWeb.TabStop = False
        Me.gbxWeb.Text = "Website"
        '
        'btnInfo
        '
        Me.btnInfo.Image = Global.Save_Password_V3.My.Resources.Resources.Info40
        Me.btnInfo.Location = New System.Drawing.Point(471, 137)
        Me.btnInfo.Name = "btnInfo"
        Me.btnInfo.Size = New System.Drawing.Size(50, 50)
        Me.btnInfo.TabIndex = 7
        Me.myToolTip.SetToolTip(Me.btnInfo, "Information")
        Me.btnInfo.UseVisualStyleBackColor = True
        '
        'txtSearch
        '
        Me.txtSearch.Location = New System.Drawing.Point(361, 23)
        Me.txtSearch.Name = "txtSearch"
        Me.txtSearch.Size = New System.Drawing.Size(160, 23)
        Me.txtSearch.TabIndex = 0
        Me.myToolTip.SetToolTip(Me.txtSearch, "Search")
        '
        'btnDelete
        '
        Me.btnDelete.Image = Global.Save_Password_V3.My.Resources.Resources.Delete40
        Me.btnDelete.Location = New System.Drawing.Point(471, 52)
        Me.btnDelete.Name = "btnDelete"
        Me.btnDelete.Size = New System.Drawing.Size(50, 50)
        Me.btnDelete.TabIndex = 5
        Me.myToolTip.SetToolTip(Me.btnDelete, "Delete")
        Me.btnDelete.UseVisualStyleBackColor = True
        '
        'btnEdit
        '
        Me.btnEdit.Image = Global.Save_Password_V3.My.Resources.Resources.Edit40
        Me.btnEdit.Location = New System.Drawing.Point(416, 52)
        Me.btnEdit.Name = "btnEdit"
        Me.btnEdit.Size = New System.Drawing.Size(50, 50)
        Me.btnEdit.TabIndex = 4
        Me.myToolTip.SetToolTip(Me.btnEdit, "Edit")
        Me.btnEdit.UseVisualStyleBackColor = True
        '
        'btnSaveEditWeb
        '
        Me.btnSaveEditWeb.Image = Global.Save_Password_V3.My.Resources.Resources.Save40
        Me.btnSaveEditWeb.ImageAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btnSaveEditWeb.Location = New System.Drawing.Point(361, 52)
        Me.btnSaveEditWeb.Name = "btnSaveEditWeb"
        Me.btnSaveEditWeb.Size = New System.Drawing.Size(50, 50)
        Me.btnSaveEditWeb.TabIndex = 3
        Me.myToolTip.SetToolTip(Me.btnSaveEditWeb, "Save")
        Me.btnSaveEditWeb.UseVisualStyleBackColor = True
        '
        'lstWeb
        '
        Me.lstWeb.ContextMenuStrip = Me.myContextMenuStrip
        Me.lstWeb.FormattingEnabled = True
        Me.lstWeb.HorizontalScrollbar = True
        Me.lstWeb.ItemHeight = 16
        Me.lstWeb.Location = New System.Drawing.Point(10, 23)
        Me.lstWeb.Name = "lstWeb"
        Me.lstWeb.ScrollAlwaysVisible = True
        Me.lstWeb.Size = New System.Drawing.Size(345, 164)
        Me.lstWeb.TabIndex = 1
        '
        'myContextMenuStrip
        '
        Me.myContextMenuStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.SortToolStripMenuItem})
        Me.myContextMenuStrip.Name = "myContextMenuStrip"
        Me.myContextMenuStrip.Size = New System.Drawing.Size(95, 26)
        '
        'SortToolStripMenuItem
        '
        Me.SortToolStripMenuItem.Name = "SortToolStripMenuItem"
        Me.SortToolStripMenuItem.Size = New System.Drawing.Size(94, 22)
        Me.SortToolStripMenuItem.Text = "Sort"
        '
        'gbxAddWeb
        '
        Me.gbxAddWeb.Controls.Add(Me.btnClear)
        Me.gbxAddWeb.Controls.Add(Me.btnSaveAddWeb)
        Me.gbxAddWeb.Controls.Add(Me.TableLayoutPanel1)
        Me.gbxAddWeb.Location = New System.Drawing.Point(14, 15)
        Me.gbxAddWeb.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.gbxAddWeb.Name = "gbxAddWeb"
        Me.gbxAddWeb.Padding = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.gbxAddWeb.Size = New System.Drawing.Size(262, 186)
        Me.gbxAddWeb.TabIndex = 1
        Me.gbxAddWeb.TabStop = False
        Me.gbxAddWeb.Text = "Add New Website"
        '
        'btnClear
        '
        Me.btnClear.Image = Global.Save_Password_V3.My.Resources.Resources.Clear40
        Me.btnClear.Location = New System.Drawing.Point(203, 128)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(50, 50)
        Me.btnClear.TabIndex = 2
        Me.myToolTip.SetToolTip(Me.btnClear, "Clear")
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'btnSaveAddWeb
        '
        Me.btnSaveAddWeb.Image = Global.Save_Password_V3.My.Resources.Resources.Save40_2
        Me.btnSaveAddWeb.Location = New System.Drawing.Point(147, 128)
        Me.btnSaveAddWeb.Name = "btnSaveAddWeb"
        Me.btnSaveAddWeb.Size = New System.Drawing.Size(50, 50)
        Me.btnSaveAddWeb.TabIndex = 1
        Me.myToolTip.SetToolTip(Me.btnSaveAddWeb, "Save New Website")
        Me.btnSaveAddWeb.UseVisualStyleBackColor = True
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 2
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100.0!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 150.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddDes, 1, 3)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddDes, 0, 3)
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddPass, 1, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddLogin, 0, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddWeb, 1, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddLogin, 1, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddWeb, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddPass, 0, 2)
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(6, 23)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 5
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(250, 102)
        Me.TableLayoutPanel1.TabIndex = 0
        '
        'txtAddDes
        '
        Me.txtAddDes.Location = New System.Drawing.Point(103, 78)
        Me.txtAddDes.Name = "txtAddDes"
        Me.txtAddDes.Size = New System.Drawing.Size(144, 23)
        Me.txtAddDes.TabIndex = 17
        '
        'lblAddDes
        '
        Me.lblAddDes.Location = New System.Drawing.Point(3, 75)
        Me.lblAddDes.Name = "lblAddDes"
        Me.lblAddDes.Size = New System.Drawing.Size(85, 23)
        Me.lblAddDes.TabIndex = 16
        Me.lblAddDes.Text = "Description :"
        Me.lblAddDes.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'txtAddPass
        '
        Me.txtAddPass.Location = New System.Drawing.Point(103, 53)
        Me.txtAddPass.Name = "txtAddPass"
        Me.txtAddPass.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.txtAddPass.Size = New System.Drawing.Size(144, 23)
        Me.txtAddPass.TabIndex = 15
        '
        'lblAddLogin
        '
        Me.lblAddLogin.Location = New System.Drawing.Point(3, 25)
        Me.lblAddLogin.Name = "lblAddLogin"
        Me.lblAddLogin.Size = New System.Drawing.Size(85, 23)
        Me.lblAddLogin.TabIndex = 12
        Me.lblAddLogin.Text = "Login  :"
        Me.lblAddLogin.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'txtAddWeb
        '
        Me.txtAddWeb.Location = New System.Drawing.Point(103, 3)
        Me.txtAddWeb.Name = "txtAddWeb"
        Me.txtAddWeb.Size = New System.Drawing.Size(144, 23)
        Me.txtAddWeb.TabIndex = 11
        '
        'txtAddLogin
        '
        Me.txtAddLogin.Location = New System.Drawing.Point(103, 28)
        Me.txtAddLogin.Name = "txtAddLogin"
        Me.txtAddLogin.Size = New System.Drawing.Size(144, 23)
        Me.txtAddLogin.TabIndex = 13
        '
        'lblAddWeb
        '
        Me.lblAddWeb.Location = New System.Drawing.Point(3, 0)
        Me.lblAddWeb.Name = "lblAddWeb"
        Me.lblAddWeb.Size = New System.Drawing.Size(85, 23)
        Me.lblAddWeb.TabIndex = 11
        Me.lblAddWeb.Text = "Website :"
        Me.lblAddWeb.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'lblAddPass
        '
        Me.lblAddPass.Location = New System.Drawing.Point(3, 50)
        Me.lblAddPass.Name = "lblAddPass"
        Me.lblAddPass.Size = New System.Drawing.Size(85, 23)
        Me.lblAddPass.TabIndex = 14
        Me.lblAddPass.Text = "Pass  :"
        Me.lblAddPass.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'gbxInfoWeb
        '
        Me.gbxInfoWeb.Controls.Add(Me.btnGetPass)
        Me.gbxInfoWeb.Controls.Add(Me.btnGetLogin)
        Me.gbxInfoWeb.Controls.Add(Me.TableLayoutPanel2)
        Me.gbxInfoWeb.Location = New System.Drawing.Point(282, 15)
        Me.gbxInfoWeb.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.gbxInfoWeb.Name = "gbxInfoWeb"
        Me.gbxInfoWeb.Padding = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.gbxInfoWeb.Size = New System.Drawing.Size(262, 186)
        Me.gbxInfoWeb.TabIndex = 2
        Me.gbxInfoWeb.TabStop = False
        Me.gbxInfoWeb.Text = "Website Information"
        '
        'btnGetPass
        '
        Me.btnGetPass.Image = Global.Save_Password_V3.My.Resources.Resources.Pass40
        Me.btnGetPass.Location = New System.Drawing.Point(203, 129)
        Me.btnGetPass.Name = "btnGetPass"
        Me.btnGetPass.Size = New System.Drawing.Size(50, 50)
        Me.btnGetPass.TabIndex = 2
        Me.myToolTip.SetToolTip(Me.btnGetPass, "Password")
        Me.btnGetPass.UseVisualStyleBackColor = True
        '
        'btnGetLogin
        '
        Me.btnGetLogin.Image = Global.Save_Password_V3.My.Resources.Resources.Login40
        Me.btnGetLogin.Location = New System.Drawing.Point(147, 129)
        Me.btnGetLogin.Name = "btnGetLogin"
        Me.btnGetLogin.Size = New System.Drawing.Size(50, 50)
        Me.btnGetLogin.TabIndex = 1
        Me.myToolTip.SetToolTip(Me.btnGetLogin, "Login")
        Me.btnGetLogin.UseVisualStyleBackColor = True
        '
        'TableLayoutPanel2
        '
        Me.TableLayoutPanel2.ColumnCount = 2
        Me.TableLayoutPanel2.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 100.0!))
        Me.TableLayoutPanel2.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 150.0!))
        Me.TableLayoutPanel2.Controls.Add(Me.txtInfoDes, 1, 3)
        Me.TableLayoutPanel2.Controls.Add(Me.txtInfoPass, 1, 2)
        Me.TableLayoutPanel2.Controls.Add(Me.txtInfoLogin, 1, 1)
        Me.TableLayoutPanel2.Controls.Add(Me.txtInfoWeb, 1, 0)
        Me.TableLayoutPanel2.Controls.Add(Me.lblInfoWeb, 0, 0)
        Me.TableLayoutPanel2.Controls.Add(Me.lblInfoLogin, 0, 1)
        Me.TableLayoutPanel2.Controls.Add(Me.lblInfoPass, 0, 2)
        Me.TableLayoutPanel2.Controls.Add(Me.lblInfoDes, 0, 3)
        Me.TableLayoutPanel2.Location = New System.Drawing.Point(6, 23)
        Me.TableLayoutPanel2.Name = "TableLayoutPanel2"
        Me.TableLayoutPanel2.RowCount = 5
        Me.TableLayoutPanel2.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel2.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel2.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel2.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel2.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 25.0!))
        Me.TableLayoutPanel2.Size = New System.Drawing.Size(250, 102)
        Me.TableLayoutPanel2.TabIndex = 0
        '
        'txtInfoDes
        '
        Me.txtInfoDes.Location = New System.Drawing.Point(103, 78)
        Me.txtInfoDes.Name = "txtInfoDes"
        Me.txtInfoDes.ReadOnly = True
        Me.txtInfoDes.Size = New System.Drawing.Size(144, 23)
        Me.txtInfoDes.TabIndex = 10
        '
        'txtInfoPass
        '
        Me.txtInfoPass.Location = New System.Drawing.Point(103, 53)
        Me.txtInfoPass.Name = "txtInfoPass"
        Me.txtInfoPass.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.txtInfoPass.ReadOnly = True
        Me.txtInfoPass.Size = New System.Drawing.Size(144, 23)
        Me.txtInfoPass.TabIndex = 9
        '
        'txtInfoLogin
        '
        Me.txtInfoLogin.Location = New System.Drawing.Point(103, 28)
        Me.txtInfoLogin.Name = "txtInfoLogin"
        Me.txtInfoLogin.ReadOnly = True
        Me.txtInfoLogin.Size = New System.Drawing.Size(144, 23)
        Me.txtInfoLogin.TabIndex = 8
        '
        'txtInfoWeb
        '
        Me.txtInfoWeb.Location = New System.Drawing.Point(103, 3)
        Me.txtInfoWeb.Name = "txtInfoWeb"
        Me.txtInfoWeb.ReadOnly = True
        Me.txtInfoWeb.Size = New System.Drawing.Size(144, 23)
        Me.txtInfoWeb.TabIndex = 7
        '
        'lblInfoWeb
        '
        Me.lblInfoWeb.Location = New System.Drawing.Point(3, 0)
        Me.lblInfoWeb.Name = "lblInfoWeb"
        Me.lblInfoWeb.Size = New System.Drawing.Size(85, 23)
        Me.lblInfoWeb.TabIndex = 0
        Me.lblInfoWeb.Text = "Website :"
        Me.lblInfoWeb.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'lblInfoLogin
        '
        Me.lblInfoLogin.Location = New System.Drawing.Point(3, 25)
        Me.lblInfoLogin.Name = "lblInfoLogin"
        Me.lblInfoLogin.Size = New System.Drawing.Size(85, 23)
        Me.lblInfoLogin.TabIndex = 1
        Me.lblInfoLogin.Text = "Login :"
        Me.lblInfoLogin.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'lblInfoPass
        '
        Me.lblInfoPass.Location = New System.Drawing.Point(3, 50)
        Me.lblInfoPass.Name = "lblInfoPass"
        Me.lblInfoPass.Size = New System.Drawing.Size(85, 23)
        Me.lblInfoPass.TabIndex = 2
        Me.lblInfoPass.Text = "Pass :"
        Me.lblInfoPass.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'lblInfoDes
        '
        Me.lblInfoDes.Location = New System.Drawing.Point(3, 75)
        Me.lblInfoDes.Name = "lblInfoDes"
        Me.lblInfoDes.Size = New System.Drawing.Size(85, 23)
        Me.lblInfoDes.TabIndex = 3
        Me.lblInfoDes.Text = "Description :"
        Me.lblInfoDes.TextAlign = System.Drawing.ContentAlignment.BottomRight
        '
        'myErrorProvider
        '
        Me.myErrorProvider.ContainerControl = Me
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(562, 426)
        Me.Controls.Add(Me.gbxInfoWeb)
        Me.Controls.Add(Me.gbxWeb)
        Me.Controls.Add(Me.gbxAddWeb)
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(570, 460)
        Me.MinimumSize = New System.Drawing.Size(570, 460)
        Me.Name = "frmMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "MAC : Save Password"
        Me.gbxWeb.ResumeLayout(False)
        Me.gbxWeb.PerformLayout()
        Me.myContextMenuStrip.ResumeLayout(False)
        Me.gbxAddWeb.ResumeLayout(False)
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.TableLayoutPanel1.PerformLayout()
        Me.gbxInfoWeb.ResumeLayout(False)
        Me.TableLayoutPanel2.ResumeLayout(False)
        Me.TableLayoutPanel2.PerformLayout()
        CType(Me.myErrorProvider, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents gbxWeb As System.Windows.Forms.GroupBox
    Friend WithEvents gbxAddWeb As System.Windows.Forms.GroupBox
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents btnSaveAddWeb As System.Windows.Forms.Button
    Friend WithEvents gbxInfoWeb As System.Windows.Forms.GroupBox
    Friend WithEvents btnGetPass As System.Windows.Forms.Button
    Friend WithEvents btnGetLogin As System.Windows.Forms.Button
    Friend WithEvents TableLayoutPanel2 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents txtSearch As System.Windows.Forms.TextBox
    Friend WithEvents btnDelete As System.Windows.Forms.Button
    Friend WithEvents btnEdit As System.Windows.Forms.Button
    Friend WithEvents btnSaveEditWeb As System.Windows.Forms.Button
    Friend WithEvents lstWeb As System.Windows.Forms.ListBox
    Friend WithEvents lblInfoWeb As System.Windows.Forms.Label
    Friend WithEvents lblInfoLogin As System.Windows.Forms.Label
    Friend WithEvents lblInfoPass As System.Windows.Forms.Label
    Friend WithEvents lblAddDes As System.Windows.Forms.Label
    Friend WithEvents txtAddPass As System.Windows.Forms.TextBox
    Friend WithEvents lblAddLogin As System.Windows.Forms.Label
    Friend WithEvents txtAddWeb As System.Windows.Forms.TextBox
    Friend WithEvents txtAddLogin As System.Windows.Forms.TextBox
    Friend WithEvents lblAddWeb As System.Windows.Forms.Label
    Friend WithEvents lblAddPass As System.Windows.Forms.Label
    Friend WithEvents txtInfoDes As System.Windows.Forms.TextBox
    Friend WithEvents txtInfoPass As System.Windows.Forms.TextBox
    Friend WithEvents txtInfoLogin As System.Windows.Forms.TextBox
    Friend WithEvents txtInfoWeb As System.Windows.Forms.TextBox
    Friend WithEvents lblInfoDes As System.Windows.Forms.Label
    Friend WithEvents txtAddDes As System.Windows.Forms.TextBox
    Friend WithEvents btnInfo As System.Windows.Forms.Button
    Friend WithEvents myToolTip As System.Windows.Forms.ToolTip
    Friend WithEvents myContextMenuStrip As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents SortToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents myErrorProvider As System.Windows.Forms.ErrorProvider

End Class
