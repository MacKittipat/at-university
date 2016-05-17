Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Public Class frmDatabaseProjectApplication
    Dim con As New SqlConnection(My.Settings.DatabaseProjectDBConnectionString.ToString)
    Dim sql As String
    'Insert
    Dim daInsertAddStudent As New SqlDataAdapter
    Dim daInsertAddSchool As New SqlDataAdapter
    Dim daInsertAddStaff As New SqlDataAdapter
    Dim daInsertAddTeacher As New SqlDataAdapter
    Dim daInsertAddSubLearn As New SqlDataAdapter
    'Select
    Dim daSelectSearchStudent As New SqlDataAdapter
    Dim daSelectSearchStudentToLstbox As New SqlDataAdapter
    Dim daSelectSearchStaff As New SqlDataAdapter
    Dim daSelectSearchStaffToLstbox As New SqlDataAdapter
    Dim daSelectSearchTeacher As New SqlDataAdapter
    Dim daSelectSearchTeacherToLstbox As New SqlDataAdapter
    Dim daSelectSearchSchool As New SqlDataAdapter
    Dim daSelectSearchSchoolToLstbox As New SqlDataAdapter
    'Update
    Dim daUpdateEditStudent As New SqlDataAdapter
    Dim daUpdateEditStaff As New SqlDataAdapter
    Dim daUpdateEditTeacher As New SqlDataAdapter
    Dim daUpdateEditSubLearn As New SqlDataAdapter
    Dim daUpdateEditSchool As New SqlDataAdapter
    'Delete
    Dim daDeleteEditSubLearn As New SqlDataAdapter
    Dim daDeleteEditStudent As New SqlDataAdapter
    Dim daDeleteEditStaff As New SqlDataAdapter
    Dim daDeleteEditTeacher As New SqlDataAdapter
    Dim daDeleteEditSchool As New SqlDataAdapter

    Dim DataImage As Byte()

    Dim clickBtnAddImageStudent As Boolean = False
    Dim clickCancleBtnAddImageStudent As Integer
    Dim clickBtnAddImageStaff As Boolean = False
    Dim clickCancleBtnAddImageStaff As Integer
    Dim clickBtnAddImageTeacher As Boolean = False
    Dim clickCancleBtnAddImageTeacher As Integer

    Dim clickBtnEditImageStudent As Boolean = False
    Dim clickCancleBtnEditImageStudent As Integer
    Dim clickBtnEditImageStaff As Boolean = False
    Dim clickCancleBtnEditImageStaff As Integer
    Dim clickBtnEditImageTeacher As Boolean = False
    Dim clickCancleBtnEditImageTeacher As Integer

    Private Sub frmDatabaseProjectApplication_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim ds As New DataSet
        con.Open()
        'โชว์รายชื่อโรงเรียนใน comAddStudentSchool / comEditStudentSchool
        sql = "SELECT * FROM School"
        Dim daComAddStudentSchool As New SqlDataAdapter
        daComAddStudentSchool.SelectCommand = New SqlCommand(sql, con)
        daComAddStudentSchool.Fill(ds, "School")
        comAddStudentSchool.DataSource = ds.Tables("School")
        comAddStudentSchool.DisplayMember = "School_Name"
        comAddStudentSchool.ValueMember = "School_ID"
        comEditStudentSchool.DataSource = ds.Tables("School")
        comEditStudentSchool.DisplayMember = "School_Name"
        comEditStudentSchool.ValueMember = "School_ID"
        'โชว์รายชื่อวิชาใน comAddTeacherSubject / comEditTeacherSubject
        sql = "SELECT * FROM Subject"
        Dim daComAddTeacherSubject As New SqlDataAdapter
        daComAddTeacherSubject.SelectCommand = New SqlCommand(sql, con)
        daComAddTeacherSubject.Fill(ds, "Subject")
        comAddTeacherSubject.DataSource = ds.Tables("Subject")
        comAddTeacherSubject.DisplayMember = "Subject_Name"
        comAddTeacherSubject.ValueMember = "Subject_ID"
        comEditTeacherSubject.DataSource = ds.Tables("Subject")
        comEditTeacherSubject.DisplayMember = "Subject_Name"
        comEditTeacherSubject.ValueMember = "Subject_ID"
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียนที่มีทั้งหมด
        countStudent()
        countStaff()
        countTeacher()
        countSchool()

        'สร้าง ID อัตโนมัติ
        'createStudentID()

        'สร้าง studentID staffID teacherID schoolID
        txtAddStudentID.Text = createID("Student")
        txtAddStaffID.Text = createID("Staff")
        txtAddTeacherID.Text = createID("Teacher")
        txtAddSchoolID.Text = createID("School")

    End Sub
    'เลือกรูปนักเรียน
    Private Sub btnAddStudentChooseImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddStudentChooseImage.Click
        Dim click As Integer = OpenFileDialogImage.ShowDialog()
        If click <> 2 Then
            picAddStudent.ImageLocation = OpenFileDialogImage.FileName
        Else
        End If
        clickBtnAddImageStudent = True
        clickCancleBtnAddImageStudent = click
    End Sub
    'เลือกรูปพนักงาน
    Private Sub btnAddStaffChooseImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddStaffChooseImage.Click
        Dim click As Integer = OpenFileDialogImage.ShowDialog()
        If click <> 2 Then
            picAddStaff.ImageLocation = OpenFileDialogImage.FileName
        Else
        End If
        clickBtnAddImageStaff = True
        clickCancleBtnAddImageStaff = click
    End Sub
    'เลือกรูปครู
    Private Sub btnAddTeacherChooseImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddTeacherChooseImage.Click
        Dim click As Integer = OpenFileDialogImage.ShowDialog()
        If click <> 2 Then
            picAddTeacher.ImageLocation = OpenFileDialogImage.FileName
        Else
        End If
        clickBtnAddImageTeacher = True
        clickCancleBtnAddImageTeacher = click
    End Sub
    'แก้ไขรูปนักเรียน
    Private Sub btnEditStudentChooseImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditStudentChooseImage.Click
        Dim click As Integer = OpenFileDialogImage.ShowDialog()
        If click <> 2 Then
            picEditStudent.ImageLocation = OpenFileDialogImage.FileName
        Else
        End If
        clickBtnEditImageStudent = True
        clickCancleBtnEditImageStudent = click
    End Sub
    'แก้ไขรูปพนักงาน
    Private Sub btnEditStaffChooseImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditStaffChooseImage.Click
        Dim click As Integer = OpenFileDialogImage.ShowDialog()
        If click <> 2 Then
            picEditStaff.ImageLocation = OpenFileDialogImage.FileName
        Else
        End If
        clickBtnEditImageStaff = True
        clickCancleBtnEditImageStaff = click
    End Sub
    'แก้ไขรูปครู
    Private Sub btnEditTeacherChooseImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditTeacherChooseImage.Click
        Dim click As Integer = OpenFileDialogImage.ShowDialog()
        If click <> 2 Then
            picEditTeacher.ImageLocation = OpenFileDialogImage.FileName
        Else
        End If
        clickBtnEditImageTeacher = True
        clickCancleBtnEditImageTeacher = click
    End Sub
    'บันทึกข้อมูลนักเรียน
    Private Sub btnAddStudent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddStudent.Click
        con.Open()
        If (clickBtnAddImageStudent = True) Then
            'เลือกรูปแล้วจะมี @Student_Image
            If (clickCancleBtnAddImageStudent <> 2) Then
                'บันทึกลงตาราง Student
                sql = "INSERT INTO Student VALUES(@Student_ID, @Student_ReceiptID, @Student_DayRegister, @Student_Image, @Student_Name, @Student_LastName, @Student_Address, @Student_Zipcode, @Student_TelNum, @Student_MobNum, @Student_Class, @Student_Grade, @Student_SchoolID)"
                daInsertAddStudent.InsertCommand = New SqlCommand(sql, con)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_ID", txtAddStudentID.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_ReceiptID", txtAddStudentReceiptID.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_DayRegister", datAddStudentDayRegister.Value.ToString("s")) 'ได้ค่าในรุป yyy-mm-ddThh:mm:ss / yyyy = ค.ศ. เมื่อถูกเก็บใน DB จะถูกแปลงอัตโนมัติเป็น พ.ศ. 
                picTobinary(picAddStudent.ImageLocation.ToString)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Image", DataImage)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Name", txtAddStudentName.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_LastName", txtAddStudentLastName.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Address", txtAddStudentAddress.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Zipcode", txtAddStudentZipcode.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Telnum", txtAddStudentTelNum.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_MobNum", txtAddStudentMobNum.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Class", comAddStudentClass.Items(comAddStudentClass.SelectedIndex).ToString)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Grade", txtAddStudentGrade.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_SchoolID", comAddStudentSchool.SelectedValue.ToString)
                daInsertAddStudent.InsertCommand.ExecuteNonQuery()
                'บันทึกข้อมูลวิชาเรียนลงใน SubLearn
                btnAddStudentToSubLearn()
                clickBtnAddImageStudent = False
                'กด cancle ใน openfiledialog
            Else
                'บันทึกลงตาราง Student
                sql = "INSERT INTO Student VALUES(@Student_ID, @Student_ReceiptID, @Student_DayRegister, 'NULL', @Student_Name, @Student_LastName, @Student_Address, @Student_Zipcode, @Student_TelNum, @Student_MobNum, @Student_Class, @Student_Grade, @Student_SchoolID)"
                daInsertAddStudent.InsertCommand = New SqlCommand(sql, con)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_ID", txtAddStudentID.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_ReceiptID", txtAddStudentReceiptID.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_DayRegister", datAddStudentDayRegister.Value.ToString("s")) 'ได้ค่าในรุป yyy-mm-ddThh:mm:ss / yyyy = ค.ศ. เมื่อถูกเก็บใน DB จะถูกแปลงอัตโนมัติเป็น พ.ศ. 
                'daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Image", b)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Name", txtAddStudentName.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_LastName", txtAddStudentLastName.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Address", txtAddStudentAddress.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Zipcode", txtAddStudentZipcode.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Telnum", txtAddStudentTelNum.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_MobNum", txtAddStudentMobNum.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Class", comAddStudentClass.Items(comAddStudentClass.SelectedIndex).ToString)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Grade", txtAddStudentGrade.Text)
                daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_SchoolID", comAddStudentSchool.SelectedValue.ToString)
                daInsertAddStudent.InsertCommand.ExecuteNonQuery()
                'บันทึกข้อมูลวิชาเรียนลงใน SubLearn
                btnAddStudentToSubLearn()
            End If
            'ไม่ได้กดปุ่มเลือกรูป
        Else
            'บันทึกลงตาราง Student
            sql = "INSERT INTO Student VALUES(@Student_ID, @Student_ReceiptID, @Student_DayRegister, 'NULL', @Student_Name, @Student_LastName, @Student_Address, @Student_Zipcode, @Student_TelNum, @Student_MobNum, @Student_Class, @Student_Grade, @Student_SchoolID)"
            daInsertAddStudent.InsertCommand = New SqlCommand(sql, con)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_ID", txtAddStudentID.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_ReceiptID", txtAddStudentReceiptID.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_DayRegister", datAddStudentDayRegister.Value.ToString("s")) 'ได้ค่าในรุป yyy-mm-ddThh:mm:ss / yyyy = ค.ศ. เมื่อถูกเก็บใน DB จะถูกแปลงอัตโนมัติเป็น พ.ศ. 
            'daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Image", b)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Name", txtAddStudentName.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_LastName", txtAddStudentLastName.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Address", txtAddStudentAddress.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Zipcode", txtAddStudentZipcode.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Telnum", txtAddStudentTelNum.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_MobNum", txtAddStudentMobNum.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Class", comAddStudentClass.Items(comAddStudentClass.SelectedIndex).ToString)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_Grade", txtAddStudentGrade.Text)
            daInsertAddStudent.InsertCommand.Parameters.AddWithValue("@Student_SchoolID", comAddStudentSchool.SelectedValue.ToString)
            daInsertAddStudent.InsertCommand.ExecuteNonQuery()
            'บันทึกข้อมูลวิชาเรียนลงใน SubLearn
            btnAddStudentToSubLearn()
        End If
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtAddStudentID.Text = ""
        txtAddStudentReceiptID.Text = ""
        datAddStudentDayRegister.Value = DateTime.Now
        picAddStudent.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtAddStudentName.Text = ""
        txtAddStudentLastName.Text = ""
        txtAddStudentAddress.Text = ""
        txtAddStudentZipcode.Text = ""
        txtAddStudentTelNum.Text = ""
        txtAddStudentMobNum.Text = ""
        txtAddStudentGrade.Text = ""
        txtAddStudentCourse.Text = ""
        comAddStudentClass.SelectedIndex = 0
        comAddStudentSchool.SelectedIndex = 0
        chkAddMath.Checked = False
        chkAddThaiLang.Checked = False
        chkAddEngLang.Checked = False
        chkAddScience.Checked = False
        chkAddSocial.Checked = False
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()
        'สร้าง ID อัตโนมัติ
        'createStudentID()

        'สร้าง studentID
        txtAddStudentID.Text = createID("Student")
    End Sub
    'บันทึกข้อมูลพนักงาน
    Private Sub btnAddStaff_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddStaff.Click
        con.Open()
        If (clickBtnAddImageStaff = True) Then
            If (clickCancleBtnAddImageStaff <> 2) Then
                sql = "INSERT INTO Staff VALUES(@Staff_ID, @Staff_Image, @Staff_Name, @Staff_LastName, @Staff_Address, @Staff_Zipcode, @Staff_TelNum, @Staff_MobNum, @Staff_Position, @Staff_Salary)"
                daInsertAddStaff.InsertCommand = New SqlCommand(sql, con)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_ID", txtAddStaffID.Text)
                picTobinary(picAddStaff.ImageLocation.ToString)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Image", DataImage)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Name", txtAddStaffName.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_LastName", txtAddStaffLastName.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Address", txtAddStaffAddress.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Zipcode", txtAddStaffZipcode.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_TelNum", txtAddStaffTelNum.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_MobNum", txtAddStaffMobNum.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Position", txtAddStaffPosition.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Salary", txtAddStaffSalary.Text)
                daInsertAddStaff.InsertCommand.ExecuteNonQuery()
                clickBtnAddImageStaff = False
            Else
                sql = "INSERT INTO Staff VALUES(@Staff_ID, 'NULL', @Staff_Name, @Staff_LastName, @Staff_Address, @Staff_Zipcode, @Staff_TelNum, @Staff_MobNum, @Staff_Position, @Staff_Salary)"
                daInsertAddStaff.InsertCommand = New SqlCommand(sql, con)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_ID", txtAddStaffID.Text)
                'picTobinary(picAddStaff.ImageLocation.ToString)
                'daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Image", DataImage)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Name", txtAddStaffName.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_LastName", txtAddStaffLastName.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Address", txtAddStaffAddress.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Zipcode", txtAddStaffZipcode.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_TelNum", txtAddStaffTelNum.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_MobNum", txtAddStaffMobNum.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Position", txtAddStaffPosition.Text)
                daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Salary", txtAddStaffSalary.Text)
                daInsertAddStaff.InsertCommand.ExecuteNonQuery()
            End If
        Else
            sql = "INSERT INTO Staff VALUES(@Staff_ID, 'NULL', @Staff_Name, @Staff_LastName, @Staff_Address, @Staff_Zipcode, @Staff_TelNum, @Staff_MobNum, @Staff_Position, @Staff_Salary)"
            daInsertAddStaff.InsertCommand = New SqlCommand(sql, con)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_ID", txtAddStaffID.Text)
            'picTobinary(picAddStaff.ImageLocation.ToString)
            'daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Image", DataImage)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Name", txtAddStaffName.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_LastName", txtAddStaffLastName.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Address", txtAddStaffAddress.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Zipcode", txtAddStaffZipcode.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_TelNum", txtAddStaffTelNum.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_MobNum", txtAddStaffMobNum.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Position", txtAddStaffPosition.Text)
            daInsertAddStaff.InsertCommand.Parameters.AddWithValue("@Staff_Salary", txtAddStaffSalary.Text)
            daInsertAddStaff.InsertCommand.ExecuteNonQuery()
        End If
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtAddStaffID.Text = ""
        picAddStaff.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtAddStaffName.Text = ""
        txtAddStaffLastName.Text = ""
        txtAddStaffAddress.Text = ""
        txtAddStaffZipcode.Text = ""
        txtAddStaffTelNum.Text = ""
        txtAddStaffMobNum.Text = ""
        txtAddStaffPosition.Text = ""
        txtAddStaffSalary.Text = ""
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()
        'สร้าง ID พนักงาน
        txtAddStaffID.Text = createID("Staff")
    End Sub
    'บันทึกข้อมูลครู
    Private Sub btnAddTeacher_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddTeacher.Click
        con.Open()
        If (clickBtnAddImageTeacher = True) Then

            If (clickCancleBtnAddImageTeacher <> 2) Then
                sql = "INSERT INTO Teacher VALUES(@Teacher_Id, @Teacher_Image, @Teacher_Name, @Teacher_LastName, @Teacher_Address, @Teacher_Zipcode, @Teacher_TelNum, @Teacher_MobNum, @Teacher_Salary ,@Teacher_SubjectID)"
                daInsertAddTeacher.InsertCommand = New SqlCommand(sql, con)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Id", txtAddTeacherID.Text)
                picTobinary(picAddTeacher.ImageLocation.ToString)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Image", DataImage)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Name", txtAddTeacherName.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_LastName", txtAddTeacherLastName.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Address", txtAddTeacherAddress.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Zipcode", txtAddTeacherZipcode.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_TelNum", txtAddTeacherTelNum.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_MobNum", txtAddTeacherMobNum.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Salary", txtAddTeacherSalary.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_SubjectID", comAddTeacherSubject.SelectedValue)
                daInsertAddTeacher.InsertCommand.ExecuteNonQuery()
                clickBtnAddImageTeacher = False
            Else
                sql = "INSERT INTO Teacher VALUES(@Teacher_Id, 'NULL', @Teacher_Name, @Teacher_LastName, @Teacher_Address, @Teacher_Zipcode, @Teacher_TelNum, @Teacher_MobNum, @Teacher_Salary ,@Teacher_SubjectID)"
                daInsertAddTeacher.InsertCommand = New SqlCommand(sql, con)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Id", txtAddTeacherID.Text)
                'picTobinary(picAddTeacher.ImageLocation.ToString)
                'daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Image", DataImage)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Name", txtAddTeacherName.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_LastName", txtAddTeacherLastName.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Address", txtAddTeacherAddress.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Zipcode", txtAddTeacherZipcode.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_TelNum", txtAddTeacherTelNum.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_MobNum", txtAddTeacherMobNum.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Salary", txtAddTeacherSalary.Text)
                daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_SubjectID", comAddTeacherSubject.SelectedValue)
                daInsertAddTeacher.InsertCommand.ExecuteNonQuery()
            End If
        Else
            sql = "INSERT INTO Teacher VALUES(@Teacher_Id, 'NULL', @Teacher_Name, @Teacher_LastName, @Teacher_Address, @Teacher_Zipcode, @Teacher_TelNum, @Teacher_MobNum, @Teacher_Salary ,@Teacher_SubjectID)"
            daInsertAddTeacher.InsertCommand = New SqlCommand(sql, con)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Id", txtAddTeacherID.Text)
            'picTobinary(picAddTeacher.ImageLocation.ToString)
            'daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Image", DataImage)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Name", txtAddTeacherName.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_LastName", txtAddTeacherLastName.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Address", txtAddTeacherAddress.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Zipcode", txtAddTeacherZipcode.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_TelNum", txtAddTeacherTelNum.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_MobNum", txtAddTeacherMobNum.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_Salary", txtAddTeacherSalary.Text)
            daInsertAddTeacher.InsertCommand.Parameters.AddWithValue("@Teacher_SubjectID", comAddTeacherSubject.SelectedValue)
            daInsertAddTeacher.InsertCommand.ExecuteNonQuery()
        End If
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtAddTeacherID.Text = ""
        picAddTeacher.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtAddTeacherName.Text = ""
        txtAddTeacherLastName.Text = ""
        txtAddTeacherAddress.Text = ""
        txtAddTeacherZipcode.Text = ""
        txtAddTeacherTelNum.Text = ""
        txtAddTeacherMobNum.Text = ""
        txtAddTeacherSalary.Text = ""
        comAddTeacherSubject.SelectedIndex = 0
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()
        con.Close()
        'สร้าง ID ครู
        txtAddTeacherID.Text = createID("Teacher")
    End Sub
    'บันทึกข้อมูลโรงเรียน
    Private Sub btnAddSchool_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAddSchool.Click
        con.Open()
        sql = "INSERT INTO School VALUES(@School_ID, @School_Name, @School_StudentNum)"
        daInsertAddSchool.InsertCommand = New SqlCommand(sql, con)
        daInsertAddSchool.InsertCommand.Parameters.AddWithValue("@School_ID", txtAddSchoolID.Text)
        daInsertAddSchool.InsertCommand.Parameters.AddWithValue("@School_Name", txtAddSchoolName.Text)
        daInsertAddSchool.InsertCommand.Parameters.AddWithValue("@School_StudentNum", txtAddSchoolStudentNum.Text)
        daInsertAddSchool.InsertCommand.ExecuteNonQuery()
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtAddSchoolID.Text = ""
        txtAddSchoolName.Text = ""
        txtAddSchoolStudentNum.Text = ""
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()

        'สร้าง ID โรงเรียน
        txtAddSchoolID.Text = createID("School")
    End Sub
    'แก้ไขข้อมูลนักเรียน
    Private Sub btnEditStudent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditStudent.Click
        con.Open()
        'ถ้าคลิกปุ่มเลือกรูปเพื่อเปลี่ยนรูป
        If (clickBtnEditImageStudent = True) Then
            Try
                'กดเปลี่ยนรูป ใน openfiledialog
                If clickCancleBtnEditImageStudent <> 2 Then
                    sql = "UPDATE Student SET Student_ID=@Student_ID, Student_ReceiptID=@Student_ReceiptID, Student_DayRegister=@Student_DayRegister, Student_Image=@Student_Image, Student_Name=@Student_Name, Student_LastName=@Student_LastName, Student_Address=@Student_Address, Student_Zipcode=@Student_Zipcode, Student_TelNum=@Student_TelNum, Student_MobNum=@Student_MobNum, Student_Class=@Student_Class, Student_Grade=@Student_Grade, Student_SchoolID=@Student_SchoolID WHERE Student_ID=@Student_ID"
                    daUpdateEditStudent.UpdateCommand = New SqlCommand(sql, con)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_ID", txtEditStudentID.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_ReceiptID", txtEditStudentReceiptID.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_DayRegister", datEditStudentDayRegister.Value.ToString("s"))
                    picTobinary(picEditStudent.ImageLocation.ToString)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Image", DataImage)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Name", txtEditStudentName.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_LastName", txtEditStudentLastName.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Address", txtEditStudentAddress.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Zipcode", txtEditStudentZipcode.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_TelNum", txtEditStudentTelNum.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_MobNum", txtEditStudentMobNum.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Class", comEditStudentClass.Items(comAddStudentClass.SelectedIndex).ToString)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Grade", txtEditStudentGrade.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_SchoolID", comEditStudentSchool.SelectedValue.ToString)
                    'ลบข้อมูลที่เช็คใน chkbox ออกให้หมดก่อนแล้วค่อนใส่ข้อมูล update ใหม่
                    chkboxCheckEditStudent()
                    daUpdateEditStudent.UpdateCommand.ExecuteNonQuery()
                    clickBtnEditImageStudent = False
                    'กด cancle ใน openfiledialog จะไม่บันทึกหรือแก้ในรุปที่มีอยู่แล้วใน DB
                Else
                    sql = "UPDATE Student SET Student_ID=@Student_ID, Student_ReceiptID=@Student_ReceiptID, Student_DayRegister=@Student_DayRegister, Student_Name=@Student_Name, Student_LastName=@Student_LastName, Student_Address=@Student_Address, Student_Zipcode=@Student_Zipcode, Student_TelNum=@Student_TelNum, Student_MobNum=@Student_MobNum, Student_Class=@Student_Class, Student_Grade=@Student_Grade, Student_SchoolID=@Student_SchoolID WHERE Student_ID=@Student_ID"
                    daUpdateEditStudent.UpdateCommand = New SqlCommand(sql, con)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_ID", txtEditStudentID.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_ReceiptID", txtEditStudentReceiptID.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_DayRegister", datEditStudentDayRegister.Value.ToString("s"))
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Name", txtEditStudentName.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_LastName", txtEditStudentLastName.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Address", txtEditStudentAddress.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Zipcode", txtEditStudentZipcode.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_TelNum", txtEditStudentTelNum.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_MobNum", txtEditStudentMobNum.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Class", comEditStudentClass.Items(comAddStudentClass.SelectedIndex).ToString)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Grade", txtEditStudentGrade.Text)
                    daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_SchoolID", comEditStudentSchool.SelectedValue.ToString)
                    'ลบข้อมูลที่เช็คใน chkbox ออกให้หมดก่อนแล้วค่อนใส่ข้อมูล update ใหม่
                    chkboxCheckEditStudent()
                    daUpdateEditStudent.UpdateCommand.ExecuteNonQuery()
                End If
            Catch ex As Exception
            End Try
            'ถ้าไม่ได้คลิกปุ่มเลือกรูปจะไม่บันทึกหรือแก้ในรูปที่มีอยู่แล้วใน DB
        Else
            sql = "UPDATE Student SET Student_ID=@Student_ID, Student_ReceiptID=@Student_ReceiptID, Student_DayRegister=@Student_DayRegister, Student_Name=@Student_Name, Student_LastName=@Student_LastName, Student_Address=@Student_Address, Student_Zipcode=@Student_Zipcode, Student_TelNum=@Student_TelNum, Student_MobNum=@Student_MobNum, Student_Class=@Student_Class, Student_Grade=@Student_Grade, Student_SchoolID=@Student_SchoolID WHERE Student_ID=@Student_ID"
            daUpdateEditStudent.UpdateCommand = New SqlCommand(sql, con)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_ID", txtEditStudentID.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_ReceiptID", txtEditStudentReceiptID.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_DayRegister", datEditStudentDayRegister.Value.ToString("s"))
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Name", txtEditStudentName.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_LastName", txtEditStudentLastName.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Address", txtEditStudentAddress.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Zipcode", txtEditStudentZipcode.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_TelNum", txtEditStudentTelNum.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_MobNum", txtEditStudentMobNum.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Class", comEditStudentClass.Items(comEditStudentClass.SelectedIndex).ToString)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_Grade", txtEditStudentGrade.Text)
            daUpdateEditStudent.UpdateCommand.Parameters.AddWithValue("@Student_SchoolID", comEditStudentSchool.SelectedValue.ToString)
            'ลบข้อมูลที่เช็คใน chkbox ออกให้หมดก่อนแล้วค่อนใส่ข้อมูล update ใหม่
            chkboxCheckEditStudent()
            daUpdateEditStudent.UpdateCommand.ExecuteNonQuery()
        End If
        con.Close()
    End Sub
    'แก้ไขข้อมูลพนักงาน
    Private Sub btnEditStaff_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditStaff.Click
        con.Open()
        If (clickBtnEditImageStaff = True) Then
            Try
                If (clickCancleBtnEditImageStaff <> 2) Then
                    sql = "UPDATE Staff SET Staff_ID=@Staff_ID, Staff_Image=@Staff_Image, Staff_Name=@Staff_Name, Staff_LastName=@Staff_LastName, Staff_Address=@Staff_Address, Staff_Zipcode=@Staff_Zipcode, Staff_TelNum=@Staff_TelNum, Staff_MobNum=@Staff_MobNum, Staff_Position=@Staff_Position, Staff_Salary=@Staff_Salary WHERE Staff_ID=@Staff_ID"
                    daUpdateEditStaff.UpdateCommand = New SqlCommand(sql, con)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_ID", txtEditStaffID.Text)
                    picTobinary(picEditStaff.ImageLocation.ToString)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Image", DataImage)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Name", txtEditStaffName.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_LastName", txtEditStaffLastName.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Address", txtEditStaffAddress.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Zipcode", txtEditStaffZipcode.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_TelNum", txtEditStaffTelNum.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_MobNum", txtEditStaffMobNum.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Position", txtEditStaffPosition.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Salary", txtEditStaffSalary.Text)
                    daUpdateEditStaff.UpdateCommand.ExecuteNonQuery()
                    clickBtnEditImageStaff = False
                Else
                    sql = "UPDATE Staff SET Staff_ID=@Staff_ID, Staff_Name=@Staff_Name, Staff_LastName=@Staff_LastName, Staff_Address=@Staff_Address, Staff_Zipcode=@Staff_Zipcode, Staff_TelNum=@Staff_TelNum, Staff_MobNum=@Staff_MobNum, Staff_Position=@Staff_Position, Staff_Salary=@Staff_Salary WHERE Staff_ID=@Staff_ID"
                    daUpdateEditStaff.UpdateCommand = New SqlCommand(sql, con)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_ID", txtEditStaffID.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Name", txtEditStaffName.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_LastName", txtEditStaffLastName.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Address", txtEditStaffAddress.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Zipcode", txtEditStaffZipcode.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_TelNum", txtEditStaffTelNum.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_MobNum", txtEditStaffMobNum.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Position", txtEditStaffPosition.Text)
                    daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Salary", txtEditStaffSalary.Text)
                    daUpdateEditStaff.UpdateCommand.ExecuteNonQuery()
                End If
            Catch ex As Exception
            End Try
        Else
            sql = "UPDATE Staff SET Staff_ID=@Staff_ID, Staff_Name=@Staff_Name, Staff_LastName=@Staff_LastName, Staff_Address=@Staff_Address, Staff_Zipcode=@Staff_Zipcode, Staff_TelNum=@Staff_TelNum, Staff_MobNum=@Staff_MobNum, Staff_Position=@Staff_Position, Staff_Salary=@Staff_Salary WHERE Staff_ID=@Staff_ID"
            daUpdateEditStaff.UpdateCommand = New SqlCommand(sql, con)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_ID", txtEditStaffID.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Name", txtEditStaffName.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_LastName", txtEditStaffLastName.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Address", txtEditStaffAddress.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Zipcode", txtEditStaffZipcode.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_TelNum", txtEditStaffTelNum.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_MobNum", txtEditStaffMobNum.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Position", txtEditStaffPosition.Text)
            daUpdateEditStaff.UpdateCommand.Parameters.AddWithValue("@Staff_Salary", txtEditStaffSalary.Text)
            daUpdateEditStaff.UpdateCommand.ExecuteNonQuery()
        End If
        con.Close()
    End Sub
    'แก้ไขข้อมูลครู
    Private Sub btnEditTeacher_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditTeacher.Click
        con.Open()
        If (clickBtnEditImageTeacher = True) Then
            Try
                If (clickCancleBtnEditImageTeacher <> 2) Then
                    sql = "UPDATE Teacher SET Teacher_ID=@Teacher_ID, Teacher_Image=@Teacher_Image, Teacher_Name=@Teacher_Name, Teacher_LastName=@Teacher_LastName, Teacher_Address=@Teacher_Address, Teacher_Zipcode=@Teacher_Zipcode, Teacher_TelNum=@Teacher_TelNum, Teacher_MobNum=@Teacher_MobNum, Teacher_Salary=@Teacher_Salary, Teacher_SubjectID=@Teacher_SubjectID WHERE Teacher_ID=@Teacher_ID"
                    daUpdateEditTeacher.UpdateCommand = New SqlCommand(sql, con)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_ID", txtEditTeacherID.Text)
                    picTobinary(picEditTeacher.ImageLocation.ToString)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Image", DataImage)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Name", txtEditStudentName.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_LastName", txtEditTeacherLastName.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Address", txtEditTeacherAddress.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Zipcode", txtEditTeacherZipcode.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_TelNum", txtEditTeacherTelNum.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_MobNum", txtEditTeacherMobNum.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Salary", txtEditTeacherSalary.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_SubjectID", comEditTeacherSubject.SelectedValue)
                    daUpdateEditTeacher.UpdateCommand.ExecuteNonQuery()
                    clickBtnEditImageTeacher = False
                Else
                    sql = "UPDATE Teacher SET Teacher_ID=@Teacher_ID, Teacher_Name=@Teacher_Name, Teacher_LastName=@Teacher_LastName, Teacher_Address=@Teacher_Address, Teacher_Zipcode=@Teacher_Zipcode, Teacher_TelNum=@Teacher_TelNum, Teacher_MobNum=@Teacher_MobNum, Teacher_Salary=@Teacher_Salary, Teacher_SubjectID=@Teacher_SubjectID WHERE Teacher_ID=@Teacher_ID"
                    daUpdateEditTeacher.UpdateCommand = New SqlCommand(sql, con)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_ID", txtEditTeacherID.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Name", txtEditStudentName.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_LastName", txtEditTeacherLastName.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Address", txtEditTeacherAddress.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Zipcode", txtEditTeacherZipcode.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_TelNum", txtEditTeacherTelNum.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_MobNum", txtEditTeacherMobNum.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Salary", txtEditTeacherSalary.Text)
                    daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_SubjectID", comEditTeacherSubject.SelectedValue)
                    daUpdateEditTeacher.UpdateCommand.ExecuteNonQuery()
                End If
            Catch ex As Exception
            End Try
        Else
            sql = "UPDATE Teacher SET Teacher_ID=@Teacher_ID, Teacher_Name=@Teacher_Name, Teacher_LastName=@Teacher_LastName, Teacher_Address=@Teacher_Address, Teacher_Zipcode=@Teacher_Zipcode, Teacher_TelNum=@Teacher_TelNum, Teacher_MobNum=@Teacher_MobNum, Teacher_Salary=@Teacher_Salary, Teacher_SubjectID=@Teacher_SubjectID WHERE Teacher_ID=@Teacher_ID"
            daUpdateEditTeacher.UpdateCommand = New SqlCommand(sql, con)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_ID", txtEditTeacherID.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Name", txtEditTeacherName.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_LastName", txtEditTeacherLastName.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Address", txtEditTeacherAddress.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Zipcode", txtEditTeacherZipcode.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_TelNum", txtEditTeacherTelNum.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_MobNum", txtEditTeacherMobNum.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_Salary", txtEditTeacherSalary.Text)
            daUpdateEditTeacher.UpdateCommand.Parameters.AddWithValue("@Teacher_SubjectID", comEditTeacherSubject.SelectedValue)
            daUpdateEditTeacher.UpdateCommand.ExecuteNonQuery()
        End If
        con.Close()
    End Sub

    'แก้ไขข้อมูลโรงเรียน
    Private Sub btnEditSchool_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditSchool.Click
        con.Open()
        sql = "UPDATE School SET School_ID=@School_ID, School_Name=@School_Name, School_StudentNum=@School_StudentNum WHERE School_ID=@School_ID"
        daUpdateEditSchool.UpdateCommand = New SqlCommand(sql, con)
        daUpdateEditSchool.UpdateCommand.Parameters.AddWithValue("@School_ID", txtEditSchoolID.Text)
        daUpdateEditSchool.UpdateCommand.Parameters.AddWithValue("@School_Name", txtEditSchoolName.Text)
        daUpdateEditSchool.UpdateCommand.Parameters.AddWithValue("@School_StudentNum", txtEditSchoolStudentNum.Text)
        daUpdateEditSchool.UpdateCommand.ExecuteNonQuery()
        con.Close()
    End Sub
    'ลบข้อมูลนักเรียน
    Private Sub btnDeleteStudent_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDeleteStudent.Click
        con.Open()
        'ลบข้อมูลนักเรียนใน SubLearn แล้วจึงลบใน Student
        sql = "DELETE FROM SubLearn WHERE SubLearn_StudentID=@SubLearn_StudentID"
        daDeleteEditSubLearn.DeleteCommand = New SqlCommand(sql, con)
        daDeleteEditSubLearn.DeleteCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
        daDeleteEditSubLearn.DeleteCommand.ExecuteNonQuery()

        sql = "DELETE FROM Student WHERE Student_ID=@Student_ID"
        daDeleteEditStudent.DeleteCommand = New SqlCommand(sql, con)
        daDeleteEditStudent.DeleteCommand.Parameters.AddWithValue("@Student_ID", txtEditStudentID.Text)
        daDeleteEditStudent.DeleteCommand.ExecuteNonQuery()
        con.Close()

        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditStudentID.Text = ""
        txtEditStudentReceiptID.Text = ""
        datEditStudentDayRegister.Value = DateTime.Now
        picEditStudent.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtEditStudentName.Text = ""
        txtEditStudentLastName.Text = ""
        txtEditStudentAddress.Text = ""
        txtEditStudentZipcode.Text = ""
        txtEditStudentTelNum.Text = ""
        txtEditStudentMobNum.Text = ""
        txtEditStudentGrade.Text = ""
        comEditStudentClass.SelectedIndex = 0
        comEditStudentSchool.SelectedIndex = 0
        txtEditStudentCourse.Text = ""
        chkEditMath.Checked = False
        chkEditThaiLang.Checked = False
        chkEditEngLang.Checked = False
        chkEditScience.Checked = False
        chkEditSocial.Checked = False
        btnEditStudentSearchBy_Click(sender, e)
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()

        'สร้าง studentID
        txtAddStudentID.Text = createID("Student")
    End Sub
    'ลบข้อมูลพนักงาน
    Private Sub btnDeleteStaff_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDeleteStaff.Click
        con.Open()
        sql = "DELETE FROM Staff WHERE Staff_ID=@Staff_ID"
        daDeleteEditStaff.DeleteCommand = New SqlCommand(sql, con)
        daDeleteEditStaff.DeleteCommand.Parameters.AddWithValue("@Staff_ID", txtEditStaffID.Text)
        daDeleteEditStaff.DeleteCommand.ExecuteNonQuery()
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditStaffID.Text = ""
        picEditStaff.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtEditStaffName.Text = ""
        txtEditStaffLastName.Text = ""
        txtEditStaffAddress.Text = ""
        txtEditStaffZipcode.Text = ""
        txtEditStaffTelNum.Text = ""
        txtEditStaffMobNum.Text = ""
        txtEditStaffPosition.Text = ""
        txtEditStaffSalary.Text = ""
        btnEditStaffSearchBy_Click(sender, e)
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()

        'สร้าง ID พนักงาน
        txtAddStaffID.Text = createID("Staff")
    End Sub
    'ลบข้อมูลครู
    Private Sub btnDeleteTeacher_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDeleteTeacher.Click
        con.Open()
        sql = "DELETE FROM Teacher WHERE Teacher_ID=@Teacher_ID"
        daDeleteEditTeacher.DeleteCommand = New SqlCommand(sql, con)
        daDeleteEditTeacher.DeleteCommand.Parameters.AddWithValue("@Teacher_ID", txtEditTeacherID.Text)
        daDeleteEditTeacher.DeleteCommand.ExecuteNonQuery()
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditTeacherID.Text = ""
        picEditTeacher.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtEditTeacherName.Text = ""
        txtEditTeacherLastName.Text = ""
        txtEditTeacherAddress.Text = ""
        txtEditTeacherZipcode.Text = ""
        txtEditTeacherTelNum.Text = ""
        txtEditTeacherMobNum.Text = ""
        txtEditTeacherSalary.Text = ""
        comEditTeacherSubject.SelectedIndex = 0
        btnEditTeacherSearchBy_Click(sender, e)
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()

        'สร้าง ID ครู
        txtAddTeacherID.Text = createID("Teacher")
    End Sub
    'ลบโรงเรียน
    Private Sub btnDeleteSchool_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDeleteSchool.Click
        con.Open()
        sql = "DELETE FROM School WHERE School_ID=@School_ID"
        daDeleteEditSchool.DeleteCommand = New SqlCommand(sql, con)
        daDeleteEditSchool.DeleteCommand.Parameters.AddWithValue("@School_ID", txtEditSchoolID.Text)
        daDeleteEditSchool.DeleteCommand.ExecuteNonQuery()
        con.Close()
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditSchoolID.Text = ""
        txtEditSchoolName.Text = ""
        txtEditSchoolStudentNum.Text = ""
        btnEditSchoolSearchBy_Click(sender, e)
        con.Close()
        'นับจำนวนนักเรียน พนักงาน ครู โรงเรียน
        countStudent()
        countStaff()
        countTeacher()
        countSchool()

        'สร้าง ID โรงเรียน
        txtAddSchoolID.Text = createID("School")
    End Sub
    'กดปุ่มค้นหานักเรียน
    Private Sub btnEditStudentSearchBy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditStudentSearchBy.Click
        Dim ds As New DataSet
        Dim searchBy As String
        'เช็คว่าจะเลือกค้นหาตามอะไร
        If comEditStudentSearchBy.SelectedIndex = 0 Then 'ชื่อ
            searchBy = "Student_Name"
        ElseIf comEditStudentSearchBy.SelectedIndex = 1 Then 'ระดับชั้น
            searchBy = "Student_Class"
        Else
            searchBy = "Student_Name"
        End If
        con.Open()
        sql = "SELECT Student_ID,Student_Name FROM Student WHERE " + searchBy + " LIKE '%" + txtEditStudentSearchBy.Text + "%'"
        daSelectSearchStudent.SelectCommand = New SqlCommand(sql, con)
        daSelectSearchStudent.SelectCommand.ExecuteNonQuery()
        daSelectSearchStudent.Fill(ds, "Student")
        'หารายชื่อคนที่ค้นหาเจอแล้วเพิ่มใน lstbox
        lstEditStudentSearchBy.DataSource = ds.Tables("Student")
        lstEditStudentSearchBy.DisplayMember = "Student_Name"
        lstEditStudentSearchBy.ValueMember = "Student_ID"
        con.Close()
    End Sub
    'โชว์ชื่อนักเรียนใน lst
    Private Sub lstEditStudentSearchBy_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstEditStudentSearchBy.SelectedIndexChanged
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditStudentID.Text = ""
        txtEditStudentReceiptID.Text = ""
        datEditStudentDayRegister.Value = DateTime.Now
        picEditStudent.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtEditStudentName.Text = ""
        txtEditStudentLastName.Text = ""
        txtEditStudentAddress.Text = ""
        txtEditStudentZipcode.Text = ""
        txtEditStudentTelNum.Text = ""
        txtEditStudentMobNum.Text = ""
        txtEditStudentGrade.Text = ""
        txtEditStudentCourse.Text = ""
        chkEditMath.Checked = False
        chkEditThaiLang.Checked = False
        chkEditEngLang.Checked = False
        chkEditScience.Checked = False
        chkEditSocial.Checked = False

        Dim ds As New DataSet
        'MsgBox(lstEditStudentSearchBy.SelectedValue.ToString)
        con.Close() 'ปิดเพราะจะถูกทำหลังจากเพิ่มรายชื่อลง lstEditStudentSearchBy.DataSource = ds.Tables("Student")
        con.Open()
        sql = "SELECT * FROM Student WHERE Student_ID='" + lstEditStudentSearchBy.SelectedValue.ToString + "'"
        Try
            daSelectSearchStudentToLstbox.SelectCommand = New SqlCommand(sql, con)
            daSelectSearchStudentToLstbox.SelectCommand.ExecuteNonQuery()
            daSelectSearchStudentToLstbox.Fill(ds, "Student")
            txtEditStudentID.Text = ds.Tables("Student").Rows(0)(0).ToString 'ID
            txtEditStudentReceiptID.Text = ds.Tables("Student").Rows(0)(1).ToString 'ReceiptID
            datEditStudentDayRegister.Value = ds.Tables("Student").Rows(0)(2).ToString
            Try
                'แปลง binary image เป็น bitmap
                Dim bits As Byte() = CType(ds.Tables(0).Rows(0)(3), Byte())
                Dim memorybits As New MemoryStream(bits)
                Dim bitmap As New Bitmap(memorybits)
                picEditStudent.Image = bitmap
            Catch ex As Exception
            End Try
            txtEditStudentName.Text = ds.Tables("Student").Rows(0)(4).ToString
            txtEditStudentLastName.Text = ds.Tables("Student").Rows(0)(5).ToString
            txtEditStudentAddress.Text = ds.Tables("Student").Rows(0)(6).ToString
            txtEditStudentZipcode.Text = ds.Tables("Student").Rows(0)(7).ToString
            txtEditStudentTelNum.Text = ds.Tables("Student").Rows(0)(8).ToString
            txtEditStudentMobNum.Text = ds.Tables("Student").Rows(0)(9).ToString
            comEditStudentClass.Text = ds.Tables("Student").Rows(0)(10).ToString
            txtEditStudentGrade.Text = ds.Tables("Student").Rows(0)(11).ToString
            'หาชื่อโรงเรียน
            Dim daSchool As New SqlDataAdapter("SELECT School_Name FROM School WHERE School_ID = '" + ds.Tables("Student").Rows(0)(12).ToString + "'", con)
            Dim dsSchool As New DataSet
            daSchool.Fill(dsSchool, "School")
            comEditStudentSchool.Text = dsSchool.Tables("school").Rows(0)(0).ToString
            'เช็คใน checkbox
            Dim daSubLearn As New SqlDataAdapter("SELECT SubLearn_SubjectID FROM SubLearn WHERE SubLearn_StudentID='" + txtEditStudentID.Text + "'", con)
            Dim dsSubLearn As New DataSet
            daSubLearn.Fill(dsSubLearn, "SubLearn")
            For i As Integer = 0 To dsSubLearn.Tables("SubLearn").Rows.Count - 1
                If dsSubLearn.Tables("SubLearn").Rows(i)(0) = "sub00001" Then
                    chkEditMath.Checked = True
                End If
                If dsSubLearn.Tables("SubLearn").Rows(i)(0) = "sub00002" Then
                    chkEditThaiLang.Checked = True
                End If
                If dsSubLearn.Tables("SubLearn").Rows(i)(0) = "sub00003" Then
                    chkEditEngLang.Checked = True
                End If
                If dsSubLearn.Tables("SubLearn").Rows(i)(0) = "sub00004" Then
                    chkEditScience.Checked = True
                End If
                If dsSubLearn.Tables("SubLearn").Rows(i)(0) = "sub00005" Then
                    chkEditSocial.Checked = True
                End If
            Next
            'โชว์ค่า SubLearn_CourseName
            daSubLearn = New SqlDataAdapter("SELECT SubLearn_CourseName FROM SubLearn WHERE SubLearn_StudentID='" + txtEditStudentID.Text + "'", con)
            dsSubLearn = New DataSet
            daSubLearn.Fill(dsSubLearn, "SubLearn")
            txtEditStudentCourse.Text = dsSubLearn.Tables("SubLearn").Rows(0)(0).ToString
        Catch ex As Exception
        End Try
        con.Close()
    End Sub
    'กดปุ่มค้นหาพนักงาน
    Private Sub btnEditStaffSearchBy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditStaffSearchBy.Click
        Dim ds As New DataSet
        con.Open()
        sql = "SELECT Staff_ID,Staff_Name FROM Staff WHERE Staff_Name LIKE '%" + txtEditStaffSearchBy.Text + "%'"
        daSelectSearchStaff.SelectCommand = New SqlCommand(sql, con)
        daSelectSearchStaff.SelectCommand.ExecuteNonQuery()
        daSelectSearchStaff.Fill(ds, "Staff")
        'หารายชื่อคนที่ค้นหาเจอแล้วเพิ่มใน lstbox
        lstEditStaffSearchBy.DataSource = ds.Tables("Staff")
        lstEditStaffSearchBy.DisplayMember = "Staff_Name"
        lstEditStaffSearchBy.ValueMember = "Staff_ID"
        con.Close()
    End Sub
    'โชว์ชื่อพนักงานบน lst
    Private Sub lstEditStaffSearchBy_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstEditStaffSearchBy.SelectedIndexChanged
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditStaffID.Text = ""
        picEditStaff.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtEditStaffName.Text = ""
        txtEditStaffLastName.Text = ""
        txtEditStaffAddress.Text = ""
        txtEditStaffZipcode.Text = ""
        txtEditStaffTelNum.Text = ""
        txtEditStaffMobNum.Text = ""
        txtEditStaffPosition.Text = ""
        txtEditStaffSalary.Text = ""

        Dim ds As New DataSet
        con.Close()
        con.Open()
        sql = "SELECT * FROM Staff WHERE Staff_ID='" + lstEditStaffSearchBy.SelectedValue.ToString + "'"
        Try
            daSelectSearchStaffToLstbox.SelectCommand = New SqlCommand(sql, con)
            daSelectSearchStaffToLstbox.SelectCommand.ExecuteNonQuery()
            daSelectSearchStaffToLstbox.Fill(ds, "Staff")
            txtEditStaffID.Text = ds.Tables("Staff").Rows(0)(0).ToString 'ID
            Try
                'แปลง binary image เป็น bitmap
                Dim bits As Byte() = CType(ds.Tables(0).Rows(0)(1), Byte())
                Dim memorybits As New MemoryStream(bits)
                Dim bitmap As New Bitmap(memorybits)
                picEditStaff.Image = bitmap
            Catch ex As Exception
            End Try
            txtEditStaffName.Text = ds.Tables("Staff").Rows(0)(2).ToString
            txtEditStaffLastName.Text = ds.Tables("Staff").Rows(0)(3).ToString
            txtEditStaffAddress.Text = ds.Tables("Staff").Rows(0)(4).ToString
            txtEditStaffZipcode.Text = ds.Tables("Staff").Rows(0)(5).ToString
            txtEditStaffTelNum.Text = ds.Tables("Staff").Rows(0)(6).ToString
            txtEditStaffMobNum.Text = ds.Tables("Staff").Rows(0)(7).ToString
            txtEditStaffPosition.Text = ds.Tables("Staff").Rows(0)(8).ToString
            txtEditStaffSalary.Text = ds.Tables("Staff").Rows(0)(9).ToString
        Catch ex As Exception
        End Try
        con.Close()
    End Sub
    'กดปุ่มค้นหาครู
    Private Sub btnEditTeacherSearchBy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditTeacherSearchBy.Click
        Dim ds As New DataSet
        con.Open()
        sql = "SELECT Teacher_ID,Teacher_Name FROM Teacher WHERE Teacher_ID LIKE '%" + txtEditTeacherSearchBy.Text + "%'"
        daSelectSearchTeacher.SelectCommand = New SqlCommand(sql, con)
        daSelectSearchTeacher.SelectCommand.ExecuteNonQuery()
        daSelectSearchTeacher.Fill(ds, "Teacher")
        'หารายชื่อคนที่ค้นหาเจอแล้วเพิ่มใน lstbox
        lstEditTeacherSearchBy.DataSource = ds.Tables("Teacher")
        lstEditTeacherSearchBy.DisplayMember = "Teacher_Name"
        lstEditTeacherSearchBy.ValueMember = "Teacher_ID"
        con.Close()
    End Sub
    'โชว์ชื่อครูบน lst
    Private Sub lstEditTeacherSearchBy_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstEditTeacherSearchBy.SelectedIndexChanged
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtEditTeacherID.Text = ""
        picEditTeacher.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtEditTeacherName.Text = ""
        txtEditTeacherLastName.Text = ""
        txtEditTeacherAddress.Text = ""
        txtEditTeacherZipcode.Text = ""
        txtEditTeacherTelNum.Text = ""
        txtEditTeacherMobNum.Text = ""
        txtEditTeacherSalary.Text = ""
        comEditTeacherSubject.Text = ""

        Dim ds As New DataSet
        con.Close()
        con.Open()
        sql = "SELECT * FROM Teacher WHERE Teacher_ID='" + lstEditTeacherSearchBy.SelectedValue.ToString + "'"
        Try
            daSelectSearchTeacherToLstbox.SelectCommand = New SqlCommand(sql, con)
            daSelectSearchTeacherToLstbox.SelectCommand.ExecuteNonQuery()
            daSelectSearchTeacherToLstbox.Fill(ds, "Teacher")
            txtEditTeacherID.Text = ds.Tables("Teacher").Rows(0)(0)
            Try
                'แปลง binary image เป็น bitmap
                Dim bits As Byte() = CType(ds.Tables(0).Rows(0)(1), Byte())
                Dim memorybits As New MemoryStream(bits)
                Dim bitmap As New Bitmap(memorybits)
                picEditTeacher.Image = bitmap
            Catch ex As Exception
            End Try
            txtEditTeacherName.Text = ds.Tables("Teacher").Rows(0)(2)
            txtEditTeacherLastName.Text = ds.Tables("Teacher").Rows(0)(3)
            txtEditTeacherAddress.Text = ds.Tables("Teacher").Rows(0)(4)
            txtEditTeacherZipcode.Text = ds.Tables("Teacher").Rows(0)(5)
            txtEditTeacherTelNum.Text = ds.Tables("Teacher").Rows(0)(6)
            txtEditTeacherMobNum.Text = ds.Tables("Teacher").Rows(0)(7)
            txtEditTeacherSalary.Text = ds.Tables("Teacher").Rows(0)(8)
            Dim daSubject As New SqlDataAdapter("SELECT Subject_Name FROM Subject WHERE Subject_ID='" + ds.Tables("Teacher").Rows(0)(9) + "'", con)
            Dim dsSubject As New DataSet
            daSubject.Fill(dsSubject, "Subject")
            comEditTeacherSubject.Text = dsSubject.Tables("Subject").Rows(0)(0)
        Catch ex As Exception
        End Try
        con.Close()
    End Sub
    'กดปุ่มค้นหาโรงเรียน
    Private Sub btnEditSchoolSearchBy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEditSchoolSearchBy.Click
        Dim ds As New DataSet
        con.Open()
        sql = "SELECT School_ID,School_Name FROM School WHERE School_Name LIKE '%" + txtEditSchoolSearchBy.Text + "%'"
        daSelectSearchSchool.SelectCommand = New SqlCommand(sql, con)
        daSelectSearchSchool.SelectCommand.ExecuteNonQuery()
        daSelectSearchSchool.Fill(ds, "School")
        'หารายชื่อโรงเรียนที่ค้นหาเจอแล้วเพิ่มใน lstbox
        lstEditSchoolSearchBy.DataSource = ds.Tables("School")
        lstEditSchoolSearchBy.DisplayMember = "School_Name"
        lstEditSchoolSearchBy.ValueMember = "School_ID"
        con.Close()
    End Sub
    'โชว์ชื่อโรงเรียนบน lst
    Private Sub lstEditSchoolSearchBy_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstEditSchoolSearchBy.SelectedIndexChanged
        Dim ds As New DataSet
        con.Close()
        con.Open()
        sql = "SELECT * FROM School WHERE School_ID='" + lstEditSchoolSearchBy.SelectedValue.ToString + "'"
        Try
            daSelectSearchSchoolToLstbox.SelectCommand = New SqlCommand(sql, con)
            daSelectSearchSchoolToLstbox.SelectCommand.ExecuteNonQuery()
            daSelectSearchSchoolToLstbox.Fill(ds, "School")
            txtEditSchoolID.Text = ds.Tables("School").Rows(0)(0)
            txtEditSchoolName.Text = ds.Tables("School").Rows(0)(1)
            txtEditSchoolStudentNum.Text = ds.Tables("School").Rows(0)(2)
        Catch ex As Exception
        End Try
        con.Close()
        countStudentBySchool()
    End Sub

    'โชว์รายชื่อผู้จัดทำ
    Private Sub btnAbout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAbout.Click
        MessageBox.Show("1.นายกิตติพัฒน์  เมธาชูโชค  50215702" + vbNewLine + "2.นายปฏิพล        เกาะน้อย    50215720" + vbNewLine + "3.นายสดุดี          วงศ์จำรัส     50215730" + vbNewLine + "ภาควิชาคณิตศาสตร์", "ผู้จัดทำ", MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    'แปลงรูปเป็นไบนารีเพื่อเก็บลง DB
    Private Sub picTobinary(ByVal ImagePath As String)
        Dim fs As New FileStream(ImagePath, FileMode.Open)
        DataImage = New [Byte](fs.Length) {}
        fs.Read(DataImage, 0, fs.Length)
    End Sub
    'บันทึกข้อมูลวิชาที่นักเรียนเรียนลงใน SubLearn
    Private Sub btnAddStudentToSubLearn()
        'บันทึกลงตาราง SubLearn
        If (chkAddMath.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtAddStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00001")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtAddStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkAddThaiLang.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtAddStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00002")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtAddStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkAddEngLang.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtAddStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00003")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtAddStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkAddScience.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtAddStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00004")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtAddStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkAddSocial.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtAddStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00005")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtAddStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
    End Sub
    'ลบข้อมูลที่เช็คใน chkbox ในหน้า EditStudent ออกให้หมดก่อนแล้วค่อยใส่ข้อมูล update ใหม่
    Private Sub chkboxCheckEditStudent()
        sql = "DELETE FROM SubLearn WHERE SubLearn_StudentID=@SubLearn_StudentID"
        daDeleteEditSubLearn.DeleteCommand = New SqlCommand(sql, con)
        daDeleteEditSubLearn.DeleteCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
        daDeleteEditSubLearn.DeleteCommand.ExecuteNonQuery()
        'บันทึกลงตาราง SubLearn
        If (chkEditMath.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00001")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtEditStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkEditThaiLang.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00002")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtEditStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkEditEngLang.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00003")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtEditStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkEditScience.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00004")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtEditStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
        If (chkEditSocial.Checked = True) Then
            sql = "INSERT INTO SubLearn VALUES(@SubLearn_StudentID, @SubLearn_SubjectID, @SubLearn_CourseName)"
            daInsertAddSubLearn.InsertCommand = New SqlCommand(sql, con)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_StudentID", txtEditStudentID.Text)
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_SubjectID", "sub00005")
            daInsertAddSubLearn.InsertCommand.Parameters.AddWithValue("@SubLearn_CourseName", txtEditStudentCourse.Text)
            daInsertAddSubLearn.InsertCommand.ExecuteNonQuery()
        End If
    End Sub

    'นับจำนวนนักเรียน
    Public Sub countStudent()
        con.Open()
        sql = "SELECT * FROM Student"
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        da.SelectCommand = New SqlCommand(sql, con)
        da.SelectCommand.ExecuteNonQuery()
        da.Fill(ds, "Student")
        Dim countStudent As String = ds.Tables("Student").Rows.Count
        txtCountStudent.Text = countStudent
        con.Close()
    End Sub
    'นับจำนวนพนักงาน
    Public Sub countStaff()
        con.Open()
        sql = "SELECT * FROM Staff"
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        da.SelectCommand = New SqlCommand(sql, con)
        da.SelectCommand.ExecuteNonQuery()
        da.Fill(ds, "Staff")
        Dim countStudent As String = ds.Tables("Staff").Rows.Count
        txtCountStaff.Text = countStudent
        con.Close()
    End Sub
    'นับจำนวนครู
    Public Sub countTeacher()
        con.Open()
        sql = "SELECT * FROM Teacher"
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        da.SelectCommand = New SqlCommand(sql, con)
        da.SelectCommand.ExecuteNonQuery()
        da.Fill(ds, "Teacher")
        Dim countStudent As String = ds.Tables("Teacher").Rows.Count
        txtCountTeacher.Text = countStudent
        con.Close()
    End Sub
    'นับจำนวนโรงเรียน
    Public Sub countSchool()
        con.Open()
        sql = "SELECT * FROM School"
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        da.SelectCommand = New SqlCommand(sql, con)
        da.SelectCommand.ExecuteNonQuery()
        da.Fill(ds, "School")
        Dim countStudent As String = ds.Tables("School").Rows.Count
        txtCountSchool.Text = countStudent
        con.Close()
    End Sub
    'บันทึกจำนวนนักเรียนในแต่ละโรงเรียน
    Public Sub countStudentBySchool()
        con.Open()
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        sql = "SELECT COUNT(Student_ID) FROM Student WHERE Student_SchoolID=@Student_School_ID"
        da.SelectCommand = New SqlCommand(sql, con)
        da.SelectCommand.Parameters.AddWithValue("@Student_School_ID", lstEditSchoolSearchBy.SelectedValue.ToString)
        da.Fill(ds, "Student")
        da.SelectCommand.ExecuteNonQuery()
        Dim count As Integer = ds.Tables("Student").Rows(0)(0)
        con.Close()
        If (lstEditSchoolSearchBy.SelectedValue.ToString <> "System.Data.DataRowView") Then
            txtEditSchoolStudentNum.Text = count
        Else
        End If
    End Sub
    ''นับจำนวนนักเรียนเพื่อกำหนดรหัสผ่าน
    'Public Sub createStudentID()
    '    con.Open()
    '    Dim da As New SqlDataAdapter
    '    Dim ds As New DataSet
    '    sql = "SELECT Student_ID FROM Student"
    '    da.SelectCommand = New SqlCommand(sql, con)
    '    da.SelectCommand.ExecuteNonQuery()
    '    da.Fill(ds, "Student")
    '    Dim countRow As Integer = ds.Tables("Student").Rows.Count
    '    Dim studentID As String
    '    Dim lastStudentID As String
    '    Dim numIDStr As String = ""
    '    Dim numID As Integer
    '    If countRow = 0 Then
    '        studentID = "str00001"
    '    Else
    '        lastStudentID = ds.Tables("Student").Rows(countRow - 1)(0)

    '        For i As Integer = 3 To lastStudentID.Length - 1
    '            numIDStr = numIDStr + lastStudentID(i)
    '        Next
    '    End If
    '    numID = Convert.ToInt32(numIDStr)
    '    numID += 1
    '    numIDStr = numID.ToString
    '    If numIDStr.Length = 1 Then
    '        studentID = "0000" + numIDStr
    '    ElseIf numIDStr.Length = 2 Then
    '        studentID = "000" + numIDStr
    '    ElseIf numIDStr.Length = 3 Then
    '        studentID = "00" + numIDStr
    '    ElseIf numIDStr.Length = 4 Then
    '        studentID = "0" + numIDStr
    '    ElseIf numIDStr.Length = 5 Then
    '        studentID = numIDStr
    '    End If
    '    con.Close()
    '    studentID = "stu" + studentID
    '    txtAddStudentID.Text = studentID
    'End Sub

    'นับจำนวนแต่ละแถวในแต่ละตารางเพื่อกำหนดรหัสผ่าน
    Public Function createID(ByVal name As String) As String
        con.Open()
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet
        sql = "SELECT " + name + "_ID FROM " + name
        da.SelectCommand = New SqlCommand(sql, con)
        da.SelectCommand.ExecuteNonQuery()
        da.Fill(ds, name)
        Dim countRow As Integer = ds.Tables(name).Rows.Count
        Dim ID As String
        Dim lastID As String
        Dim numIDStr As String = ""
        Dim numID As Integer
        Dim strID1 As String = name(0)
        Dim strID2 As String = name(1)
        Dim strID3 As String = name(2)
        If countRow = 0 Then

            ID = strID1.ToLower + strID2.ToLower + strID3.ToLower + "00001"
        Else
            lastID = ds.Tables(name).Rows(countRow - 1)(0)

            For i As Integer = 3 To lastID.Length - 1
                numIDStr = numIDStr + lastID(i)
            Next
        End If
        Try
            numID = Convert.ToInt32(numIDStr)
        Catch ex As Exception
        End Try
        numID += 1
        numIDStr = numID.ToString
        If numIDStr.Length = 1 Then
            ID = "0000" + numIDStr
        ElseIf numIDStr.Length = 2 Then
            ID = "000" + numIDStr
        ElseIf numIDStr.Length = 3 Then
            ID = "00" + numIDStr
        ElseIf numIDStr.Length = 4 Then
            ID = "0" + numIDStr
        ElseIf numIDStr.Length = 5 Then
            ID = numIDStr
        End If
        con.Close()
        ID = strID1.ToLower + strID2.ToLower + strID3.ToLower + ID
        Return ID
    End Function

    Private Sub btnClearStudentControl_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClearStudentControl.Click
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        txtAddStudentReceiptID.Text = ""
        datAddStudentDayRegister.Value = DateTime.Now
        picAddStudent.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtAddStudentName.Text = ""
        txtAddStudentLastName.Text = ""
        txtAddStudentAddress.Text = ""
        txtAddStudentZipcode.Text = ""
        txtAddStudentTelNum.Text = ""
        txtAddStudentMobNum.Text = ""
        txtAddStudentGrade.Text = ""
        txtAddStudentCourse.Text = ""
        comAddStudentClass.SelectedIndex = 0
        comAddStudentSchool.SelectedIndex = 0
        chkAddMath.Checked = False
        chkAddThaiLang.Checked = False
        chkAddEngLang.Checked = False
        chkAddScience.Checked = False
        chkAddSocial.Checked = False
    End Sub

    Private Sub btnClearStaffControl_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClearStaffControl.Click
        'reset ข้อมูลที่อยู่ใน control ต่างๆ
        picAddStaff.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtAddStaffName.Text = ""
        txtAddStaffLastName.Text = ""
        txtAddStaffAddress.Text = ""
        txtAddStaffZipcode.Text = ""
        txtAddStaffTelNum.Text = ""
        txtAddStaffMobNum.Text = ""
        txtAddStaffPosition.Text = ""
        txtAddStaffSalary.Text = ""
    End Sub

    Private Sub btnClearTeacherControl_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClearTeacherControl.Click
        picAddTeacher.Image = Database_Project_Application.My.Resources.Resources.SmileFace
        txtAddTeacherName.Text = ""
        txtAddTeacherLastName.Text = ""
        txtAddTeacherAddress.Text = ""
        txtAddTeacherZipcode.Text = ""
        txtAddTeacherTelNum.Text = ""
        txtAddTeacherMobNum.Text = ""
        txtAddTeacherSalary.Text = ""
        comAddTeacherSubject.SelectedIndex = 0
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        txtAddSchoolName.Text = ""
        txtAddSchoolStudentNum.Text = ""
    End Sub
End Class
