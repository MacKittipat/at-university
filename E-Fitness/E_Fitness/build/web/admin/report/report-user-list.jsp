<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <form action="admin/report/report-user-list-pdf.jsp" method="post">
            <table>
                <tr>
                    <td>
                        Active
                    </td>
                    <td>
                        <input type="radio" name="radActive" value="active" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Unactive
                    </td>
                    <td>
                        <input type="radio" name="radActive" value="unactive" />
                    </td>
                </tr>
                <tr>
                    <td>
                        All
                    </td>
                    <td>
                        <input type="radio" name="radActive" value="all" />
                    </td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Submit" />
        </form>

    </body>
</html>
