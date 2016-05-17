/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){

});
function deleteAppointment(appointmentId){
    var deletes =  confirm("Are you Sure?");
    if(deletes == true){
        $("#list-" + appointmentId).slideUp();
        $.post("query/delete_appointment.jsp", {
            appointmentId:appointmentId
        });
    }   
}