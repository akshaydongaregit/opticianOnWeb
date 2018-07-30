<%-- 
    Document   : report
    Created on : Jan 20, 2018, 12:03:41 AM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Optosoft - Report Wizard</title>
    </head>
    
    <body>
      
        <%@ page errorPage="error.jsp" %>
        <%@ page import="net.sf.jasperreports.engine.*" %>
        <%@ page import="net.sf.jasperreports.engine.util.*" %>
        <%@ page import="net.sf.jasperreports.engine.export.*" %>
        <%@ page import="net.sf.jasperreports.j2ee.servlets.*" %>
        <%@ page import="java.util.*" %>
        <%@ page import="java.io.*" %>
        <%@include file="master/user-selector.jsp" %>
        <%
            try {
                
                File reportFile = new File(application.getRealPath("/Reports/report4.jasper"));
                if (!reportFile.exists())
                            throw new JRRuntimeException("File WebappReport.jasper not found. The report design must be compiled first.");

                Map parameters = new HashMap();
                JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, cn);
                
                HtmlExporter exporter = new HtmlExporter();

                session.setAttribute(ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE, jasperPrint);

                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
               //exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "../servlets/image?image=");

                exporter.exportReport();

                %> <script language="javascript">alert("report has been loaded and filled");</script><%
                } catch (Exception e) {
			e.printStackTrace();
		}
        %>
    </body>
</html>
