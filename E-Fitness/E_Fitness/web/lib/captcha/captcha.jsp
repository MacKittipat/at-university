<%@page import="java.util.*;" %>
<%
    String captcha = request.getParameter("captcha");
    session.setAttribute("captcha", captcha);
    /* this compare captcha's number from POST and SESSION */
    if((captcha != null) && (captcha == session.getAttribute("captcha")))
	{
		// ??? 9 ???????
        out.print(9); /* YOUR CODE GOES HERE */
        session.removeAttribute("captcha"); /* this line makes session free, we recommend you to keep it */
	} 
    /* in case that form isn't submitted this file will create a random number and save it in session */
    else if(captcha != null){
        out.print("Failed!");
    }else
	{
		Random rn = new Random();
        int rand = rn.nextInt(5);
        session.setAttribute("captcha", rand);
        out.print(rand);
     }
%>
        

