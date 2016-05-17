<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmEditSnippet
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmEditSnippet))
        Me.gbxEditSnippet = New System.Windows.Forms.GroupBox
        Me.btnDelete = New System.Windows.Forms.Button
        Me.btnSave = New System.Windows.Forms.Button
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel
        Me.txtEditName = New System.Windows.Forms.TextBox
        Me.lblEditName = New System.Windows.Forms.Label
        Me.txtEditCode = New System.Windows.Forms.RichTextBox
        Me.lblEditCode = New System.Windows.Forms.Label
        Me.lblEditLang = New System.Windows.Forms.Label
        Me.lblEditComment = New System.Windows.Forms.Label
        Me.txtEditComment = New System.Windows.Forms.TextBox
        Me.comEditLang = New System.Windows.Forms.ComboBox
        Me.ToolTipEditSnippet = New System.Windows.Forms.ToolTip(Me.components)
        Me.gbxEditSnippet.SuspendLayout()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'gbxEditSnippet
        '
        Me.gbxEditSnippet.Controls.Add(Me.btnDelete)
        Me.gbxEditSnippet.Controls.Add(Me.btnSave)
        Me.gbxEditSnippet.Controls.Add(Me.TableLayoutPanel1)
        Me.gbxEditSnippet.Location = New System.Drawing.Point(12, 12)
        Me.gbxEditSnippet.Name = "gbxEditSnippet"
        Me.gbxEditSnippet.Size = New System.Drawing.Size(495, 340)
        Me.gbxEditSnippet.TabIndex = 0
        Me.gbxEditSnippet.TabStop = False
        Me.gbxEditSnippet.Text = "Edit Snippet"
        '
        'btnDelete
        '
        Me.btnDelete.Image = Global.My_Snippet.My.Resources.Resources.delete
        Me.btnDelete.Location = New System.Drawing.Point(360, 280)
        Me.btnDelete.Name = "btnDelete"
        Me.btnDelete.Size = New System.Drawing.Size(50, 50)
        Me.btnDelete.TabIndex = 2
        Me.ToolTipEditSnippet.SetToolTip(Me.btnDelete, "Delete")
        Me.btnDelete.UseVisualStyleBackColor = True
        '
        'btnSave
        '
        Me.btnSave.Image = Global.My_Snippet.My.Resources.Resources.save
        Me.btnSave.Location = New System.Drawing.Point(426, 280)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Size = New System.Drawing.Size(50, 50)
        Me.btnSave.TabIndex = 1
        Me.ToolTipEditSnippet.SetToolTip(Me.btnSave, "Save")
        Me.btnSave.UseVisualStyleBackColor = True
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 2
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20.0!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.txtEditName, 1, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.lblEditName, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.txtEditCode, 1, 3)
        Me.TableLayoutPanel1.Controls.Add(Me.lblEditCode, 0, 3)
        Me.TableLayoutPanel1.Controls.Add(Me.lblEditLang, 0, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.lblEditComment, 0, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.txtEditComment, 1, 2)
        Me.TableLayoutPanel1.Controls.Add(Me.comEditLang, 1, 1)
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
        'txtEditName
        '
        Me.txtEditName.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.txtEditName.Location = New System.Drawing.Point(97, 3)
        Me.txtEditName.Name = "txtEditName"
        Me.txtEditName.Size = New System.Drawing.Size(300, 23)
        Me.txtEditName.TabIndex = 1
        '
        'lblEditName
        '
        Me.lblEditName.Location = New System.Drawing.Point(3, 5)
        Me.lblEditName.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblEditName.Name = "lblEditName"
        Me.lblEditName.Size = New System.Drawing.Size(80, 20)
        Me.lblEditName.TabIndex = 4
        Me.lblEditName.Text = "Name :"
        Me.lblEditName.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'txtEditCode
        '
        Me.txtEditCode.AcceptsTab = True
        Me.txtEditCode.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.txtEditCode.Location = New System.Drawing.Point(97, 93)
        Me.txtEditCode.Name = "txtEditCode"
        Me.txtEditCode.Size = New System.Drawing.Size(373, 154)
        Me.txtEditCode.TabIndex = 3
        Me.txtEditCode.Text = ""
        Me.txtEditCode.WordWrap = False
        '
        'lblEditCode
        '
        Me.lblEditCode.Location = New System.Drawing.Point(3, 95)
        Me.lblEditCode.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblEditCode.Name = "lblEditCode"
        Me.lblEditCode.Size = New System.Drawing.Size(80, 20)
        Me.lblEditCode.TabIndex = 6
        Me.lblEditCode.Text = "Code :"
        Me.lblEditCode.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblEditLang
        '
        Me.lblEditLang.Location = New System.Drawing.Point(3, 35)
        Me.lblEditLang.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblEditLang.Name = "lblEditLang"
        Me.lblEditLang.Size = New System.Drawing.Size(80, 20)
        Me.lblEditLang.TabIndex = 7
        Me.lblEditLang.Text = "Language :"
        Me.lblEditLang.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'lblEditComment
        '
        Me.lblEditComment.Location = New System.Drawing.Point(3, 65)
        Me.lblEditComment.Margin = New System.Windows.Forms.Padding(3, 5, 3, 0)
        Me.lblEditComment.Name = "lblEditComment"
        Me.lblEditComment.Size = New System.Drawing.Size(80, 20)
        Me.lblEditComment.TabIndex = 5
        Me.lblEditComment.Text = "Comment :"
        Me.lblEditComment.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'txtEditComment
        '
        Me.txtEditComment.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.txtEditComment.Location = New System.Drawing.Point(97, 63)
        Me.txtEditComment.Name = "txtEditComment"
        Me.txtEditComment.Size = New System.Drawing.Size(300, 23)
        Me.txtEditComment.TabIndex = 2
        '
        'comEditLang
        '
        Me.comEditLang.FormattingEnabled = True
        Me.comEditLang.Location = New System.Drawing.Point(97, 33)
        Me.comEditLang.Name = "comEditLang"
        Me.comEditLang.Size = New System.Drawing.Size(300, 24)
        Me.comEditLang.TabIndex = 8
        Me.comEditLang.Text = "Edit Snippet"
        '
        'frmEditSnippet
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(520, 366)
        Me.Controls.Add(Me.gbxEditSnippet)
        Me.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(3, 4, 3, 4)
        Me.MaximizeBox = False
        Me.MaximumSize = New System.Drawing.Size(528, 400)
        Me.MinimumSize = New System.Drawing.Size(528, 400)
        Me.Name = "frmEditSnippet"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Edit Snippet"
        Me.gbxEditSnippet.ResumeLayout(False)
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.TableLayoutPanel1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents gbxEditSnippet As System.Windows.Forms.GroupBox
    Friend WithEvents btnSave As System.Windows.Forms.Button
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents txtEditName As System.Windows.Forms.TextBox
    Friend WithEvents lblEditName As System.Windows.Forms.Label
    Friend WithEvents txtEditCode As System.Windows.Forms.RichTextBox
    Friend WithEvents lblEditCode As System.Windows.Forms.Label
    Friend WithEvents lblEditLang As System.Windows.Forms.Label
    Friend WithEvents lblEditComment As System.Windows.Forms.Label
    Friend WithEvents txtEditComment As System.Windows.Forms.TextBox
    Friend WithEvents comEditLang As System.Windows.Forms.ComboBox
    Friend WithEvents ToolTipEditSnippet As System.Windows.Forms.ToolTip
    Friend WithEvents btnDelete As System.Windows.Forms.Button
End Class
