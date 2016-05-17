<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmAddSnippet
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmAddSnippet))
        Me.txtAddName = New System.Windows.Forms.TextBox
        Me.txtAddComment = New System.Windows.Forms.TextBox
        Me.txtAddCode = New System.Windows.Forms.RichTextBox
        Me.gbxAddSnippet = New System.Windows.Forms.GroupBox
        Me.btnClear = New System.Windows.Forms.Button
        Me.btnAdd = New System.Windows.Forms.Button
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel
        Me.lblAddName = New System.Windows.Forms.Label
        Me.lblAddCode = New System.Windows.Forms.Label
        Me.lblAddLang = New System.Windows.Forms.Label
        Me.lblAddComment = New System.Windows.Forms.Label
        Me.comAddLang = New System.Windows.Forms.ComboBox
        Me.ToolTipAddSnippet = New System.Windows.Forms.ToolTip(Me.components)
        Me.gbxAddSnippet.SuspendLayout()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'txtAddName
        '
        Me.txtAddName.Location = New System.Drawing.Point(97, 3)
        Me.txtAddName.Name = "txtAddName"
        Me.txtAddName.Size = New System.Drawing.Size(300, 23)
        Me.txtAddName.TabIndex = 0
        '
        'txtAddComment
        '
        Me.txtAddComment.Location = New System.Drawing.Point(97, 63)
        Me.txtAddComment.Name = "txtAddComment"
        Me.txtAddComment.Size = New System.Drawing.Size(300, 23)
        Me.txtAddComment.TabIndex = 2
        '
        'txtAddCode
        '
        Me.txtAddCode.AcceptsTab = True
        Me.txtAddCode.Location = New System.Drawing.Point(97, 93)
        Me.txtAddCode.Name = "txtAddCode"
        Me.txtAddCode.Size = New System.Drawing.Size(373, 154)
        Me.txtAddCode.TabIndex = 3
        Me.txtAddCode.Text = ""
        Me.txtAddCode.WordWrap = False
        '
        'gbxAddSnippet
        '
        Me.gbxAddSnippet.Controls.Add(Me.btnClear)
        Me.gbxAddSnippet.Controls.Add(Me.btnAdd)
        Me.gbxAddSnippet.Controls.Add(Me.TableLayoutPanel1)
        Me.gbxAddSnippet.Location = New System.Drawing.Point(12, 12)
        Me.gbxAddSnippet.Name = "gbxAddSnippet"
        Me.gbxAddSnippet.Size = New System.Drawing.Size(495, 340)
        Me.gbxAddSnippet.TabIndex = 0
        Me.gbxAddSnippet.TabStop = False
        Me.gbxAddSnippet.Text = "Add Snippet"
        '
        'btnClear
        '
        Me.btnClear.Image = Global.My_Snippet.My.Resources.Resources.refresh
        Me.btnClear.Location = New System.Drawing.Point(360, 280)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(50, 50)
        Me.btnClear.TabIndex = 2
        Me.ToolTipAddSnippet.SetToolTip(Me.btnClear, "Clear")
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'btnAdd
        '
        Me.btnAdd.Image = Global.My_Snippet.My.Resources.Resources.add
        Me.btnAdd.Location = New System.Drawing.Point(426, 280)
        Me.btnAdd.Name = "btnAdd"
        Me.btnAdd.Size = New System.Drawing.Size(50, 50)
        Me.btnAdd.TabIndex = 1
        Me.ToolTipAddSnippet.SetToolTip(Me.btnAdd, "Add")
        Me.btnAdd.UseVisualStyleBackColor = True
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 2
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.0!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddName, 1, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddName, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddCode, 1, 3)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddCode, 0, 3)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddLang, 0, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.lblAddComment, 0, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.txtAddComment, 1, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.comAddLang, 1, 1)
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(6, 22)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 5
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 30.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 160.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20.0!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(473, 252)
        Me.TableLayoutPanel1.TabIndex = 0
        '
        'lblAddName
        '
        Me.lblAddName.Location = New System.Drawing.Point(3, 5)
        Me.lblAddName.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblAddName.Name = "lblAddName"
        Me.lblAddName.Size = New System.Drawing.Size(80, 20)
        Me.lblAddName.TabIndex = 4
        Me.lblAddName.Text = "Name :"
        Me.lblAddName.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblAddCode
        '
        Me.lblAddCode.Location = New System.Drawing.Point(3, 95)
        Me.lblAddCode.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblAddCode.Name = "lblAddCode"
        Me.lblAddCode.Size = New System.Drawing.Size(80, 20)
        Me.lblAddCode.TabIndex = 6
        Me.lblAddCode.Text = "Code :"
        Me.lblAddCode.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblAddLang
        '
        Me.lblAddLang.Location = New System.Drawing.Point(3, 35)
        Me.lblAddLang.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblAddLang.Name = "lblAddLang"
        Me.lblAddLang.Size = New System.Drawing.Size(80, 20)
        Me.lblAddLang.TabIndex = 7
        Me.lblAddLang.Text = "Language :"
        Me.lblAddLang.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblAddComment
        '
        Me.lblAddComment.Location = New System.Drawing.Point(3, 65)
        Me.lblAddComment.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblAddComment.Name = "lblAddComment"
        Me.lblAddComment.Size = New System.Drawing.Size(80, 20)
        Me.lblAddComment.TabIndex = 5
        Me.lblAddComment.Text = "Comment :"
        Me.lblAddComment.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'comAddLang
        '
        Me.comAddLang.FormattingEnabled = True
        Me.comAddLang.Location = New System.Drawing.Point(97, 33)
        Me.comAddLang.Name = "comAddLang"
        Me.comAddLang.Size = New System.Drawing.Size(300, 24)
        Me.comAddLang.TabIndex = 1
        '
        'frmAddSnippet
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(520, 366)
        Me.Controls.Add(Me.gbxAddSnippet)
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(528, 400)
        Me.MinimumSize = New System.Drawing.Size(528, 400)
        Me.Name = "frmAddSnippet"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Add Snippet"
        Me.gbxAddSnippet.ResumeLayout(False)
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.TableLayoutPanel1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents txtAddName As System.Windows.Forms.TextBox
    Friend WithEvents txtAddComment As System.Windows.Forms.TextBox
    Friend WithEvents txtAddCode As System.Windows.Forms.RichTextBox
    Friend WithEvents gbxAddSnippet As System.Windows.Forms.GroupBox
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents lblAddName As System.Windows.Forms.Label
    Friend WithEvents lblAddComment As System.Windows.Forms.Label
    Friend WithEvents lblAddCode As System.Windows.Forms.Label
    Friend WithEvents btnClear As System.Windows.Forms.Button
    Friend WithEvents btnAdd As System.Windows.Forms.Button
    Friend WithEvents ToolTipAddSnippet As System.Windows.Forms.ToolTip
    Friend WithEvents lblAddLang As System.Windows.Forms.Label
    Friend WithEvents comAddLang As System.Windows.Forms.ComboBox
End Class
