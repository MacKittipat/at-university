<%-- 
    Document   : upload
    Created on : 2 ก.ย. 2552, 17:42:04
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*,
        java.io.*,
        org.apache.commons.fileupload.*,
        org.apache.commons.fileupload.disk.*,
        org.apache.commons.fileupload.servlet.*,
        org.apache.commons.io.*"
%>

<%
    String isDoctor = "";
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if(isMultipart){
        FileItemFactory  factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;
        try{
            items = upload.parseRequest(request);
        }catch(Exception e){}
        Iterator itr = items.iterator();
        while(itr.hasNext()){
            FileItem item = (FileItem)itr.next();
            if(item.isFormField()){
                String fname = item.getFieldName(); //key of data
                String fvalue = item.getString(); //value of data
                isDoctor = fvalue;
            }else{
                if(!isDoctor.equals("doctor")){  //upload patient
                    String imageBaseName = FilenameUtils.getBaseName(item.getName()); //name only
                    String imageExtension = FilenameUtils.getExtension(item.getName()); //extension only
                    String imageName = imageBaseName + "_" + System.currentTimeMillis() + "." + imageExtension;
                    if(item.getSize() > 307200){ //รูปห้ามใหญ่กว่า 300kb
                        out.print(" Error please upload image with size less than 300kb");
                    }else{ //ถ้ารูปเล็กกว่า 300kb จะ upload ได้
                        File savedFile = new File(config.getServletContext().getRealPath("/") + "upload/patient/" + imageName);
                        item.write(savedFile);
                        out.print(imageName);
                    }
                }else{ // upload doctor
                    String imageBaseName = FilenameUtils.getBaseName(item.getName()); //name only
                    String imageExtension = FilenameUtils.getExtension(item.getName()); //extension only
                    String imageName = imageBaseName + "_" + System.currentTimeMillis() + "." + imageExtension;
                    if(item.getSize() > 307200){ //รูปห้ามใหญ่กว่า 300kb
                        out.print(" Error please upload image with size less than 300kb");
                    }else{ //ถ้ารูปเล็กกว่า 300kb จะ upload ได้
                        File savedFile = new File(config.getServletContext().getRealPath("/") + "upload/doctor/" + imageName);
                        item.write(savedFile);
                        out.print(imageName);
                    }
                }
            }
        }
    }
%>
