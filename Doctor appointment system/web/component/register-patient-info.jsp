<form id="form-regis-patient" action="#" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td width="150px">
                Identification Number
            </td>
            <td width="200px">
                : <input type="text" id="txtIdNumber" name="txtIdNumber" />
            </td>
        </tr>
        <tr>
            <td>
                Name
            </td>
            <td>
                : <input type="text" id="txtName" name="txtName" />
            </td>
        </tr>
        <tr>
            <td>
                Lastname
            </td>
            <td>
                : <input type="text" id="txtLastname" name="txtLastname" />
            </td>
        </tr>
        <tr>
            <td>
                Birthdate
            </td>
            <td>
                : <input type="text" id="txtBirthdate" name="txtBirthdate" />
            </td>
        </tr>
        <tr>
            <td>
                Gender
            </td>
            <td>
                :
                <select id="ddlGender">
                    <option value="Male">
                        Male
                    </option>
                    <option value="Female">
                        Female
                    </option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Weight (kg.)
            </td>
            <td>
                : <input type="text" id="txtWeight" name="txtWeight" />
            </td>
        </tr>
        <tr>
            <td>
                Height (cm.)
            </td>
            <td>
                : <input type="text" id="txtHeight" name="txtHeight" />
            </td>
        </tr>
        <tr>
            <td>
                Blood Group
            </td>
            <td>
                :
                <select id="ddlBloodGroup">
                    <option value="A">
                        A
                    </option>
                    <option value="AB">
                        AB
                    </option>
                    <option value="B">
                        B
                    </option>
                    <option value="O">
                        O
                    </option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Address
            </td>
            <td>
                : <textarea id="txtAddress" name="txtAddress" style="width:185px" rows="3"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                Telephone Number
            </td>
            <td>
                : <input type="text" id="txtTelNumber" name="txtTelNumber" />
            </td>
        </tr>
        <tr>
            <td>
                Image
            </td>
            <td>
                : <span id="uploadimage"><a href="#">Upload</a></span><span style="display:block;" id="uploadmsg"></span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="btnRegister" value="Register" />
            </td>
        </tr>
    </table>
</form>
