<%-- 
    Document   : dispense
    Created on : Jan 20, 2018, 8:38:22 PM
    Author     : DONGRE
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Optosoft - Report Wizard</title>
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/reportsstyle.css">
        <link rel="stylesheet" href="../css/jasper.css">
        
    </head>
    
    <body>
      
        <%@ page errorPage="error.jsp" %>
        <%@ page import="net.sf.jasperreports.engine.*" %>
        <%@ page import="net.sf.jasperreports.engine.util.*" %>
        <%@ page import="net.sf.jasperreports.engine.export.*" %>
        <%@ page import="net.sf.jasperreports.j2ee.servlets.*" %>
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@include file="../master/user-selector.jsp" %>
        <div class="header">
        <label class="title">Patient Report</label>
        </div>
        <form class="form">
            
            <input type="date" name="from" class="input input-date" placeholder="From Date"> 
            <label>&nbsp;&nbsp;To&nbsp;&nbsp;</label> 
            <input type="date" class="input input-date" name="to" placeholder="To Date">
            <input type="submit" class="btn" value="Generate" text="Generate">
        </form>
        <br>
        <%
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            if(from!=null && to!=null)
            try {
                File reportFile = new File(application.getRealPath("Reports/Patientreport.jasper"));
                if (!reportFile.exists())
                            throw new JRRuntimeException("File WebappReport.jasper not found. The report design must be compiled first.");
               
                Map parameters = new HashMap();
                parameters.put("fromd",new SimpleDateFormat("yyyy-mm-dd").parse(from));
                parameters.put("to",new SimpleDateFormat("yyyy-mm-dd").parse(to));
                JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
               
                 JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, cn);
                 
                 StringWriter reportout=new StringWriter();
                 
                HtmlExporter exporter = new HtmlExporter();
                session.setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperPrint);
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, reportout);
               //exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "../servlets/image?image=");
                exporter.exportReport();
                String report=reportout.toString();
                Scanner rscanner=new Scanner(report);
                int i=0;
                while(i<10){rscanner.nextLine();i++;}
                while(rscanner.hasNextLine()){String l=rscanner.nextLine(); if(l.equals("</body>")) break; out.write("\n"+l);}
                
                //out.write(reportout.toString());
                } catch (Exception e) {
			e.printStackTrace();
		}
        %>
    </body>
</html>
