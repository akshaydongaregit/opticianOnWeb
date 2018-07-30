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
        <label class="title">Dispense Report</label>
        </div>
        
        <%
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String name = request.getParameter("name");
            String uname = request.getParameter("uname");
            String sprice = request.getParameter("sprice");
            String tprice = request.getParameter("tprice");
            
        %>
        
        <form class="form">
            
            <input type="date" name="from" class="input input-date" placeholder="From Date" value="<%=from!=null?from:""%>"> 
            <label>&nbsp;&nbsp;To&nbsp;&nbsp;</label> 
            <input type="date" class="input input-date" name="to" placeholder="To Date" value="<%=to!=null?to:""%>">&nbsp;&nbsp;
            <input type="text" class="input input-text" name="name" placeholder="Patient Name" value="<%=name!=null?name:""%>">&nbsp;&nbsp;
            <input type="text" class="input input-text" name="uname" placeholder="User Name" value="<%=uname!=null?uname:""%>"> <br> <br>
            <input type="text" class="input input-text" name="sprice" placeholder="start amount" value="<%=sprice!=null?sprice:""%>">
            <label>&nbsp;&nbsp;To&nbsp;&nbsp;</label> 
            <input type="text" class="input input-text" name="tprice" placeholder="stop amount" value="<%=tprice!=null?tprice:""%>">
            <input type="submit" class="btn" value="Generate" text="Generate">
    
        </form>
        
        <%
            
            
            if(from!=null && !from.equals("") && to!=null)
            try {
                File reportFile = new File(application.getRealPath("Reports/Dispensereport.jasper"));
                if (!reportFile.exists())
                            throw new JRRuntimeException("File WebappReport.jasper not found. The report design must be compiled first.");
               
                Map parameters = new HashMap();
                parameters.put("fromd",new SimpleDateFormat("yyyy-mm-dd").parse(from));
                parameters.put("tod",new SimpleDateFormat("yyyy-mm-dd").parse(to));
                JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
               
                 JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, cn);
                
                HtmlExporter exporter = new HtmlExporter();
                StringWriter reportout=new StringWriter();
                
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
                
                } catch (Exception e) {
			e.printStackTrace();
		}
            
            
                if((name!=null && !name.equals("") ) || (uname!=null && !uname.equalsIgnoreCase("")) || (sprice!=null && !sprice.equals("")))
                try {
                File reportFile = new File(application.getRealPath("Reports/InvoiceReportFrame.jasper"));
                if (!reportFile.exists())
                            throw new JRRuntimeException("File InvoiceReportFrame.jasper not found. The report design must be compiled first.");
               
                Map parameters = new HashMap();
                
                if(name!=null && !name.equals("") )
                    parameters.put("name",name);
                if(uname!=null && !uname.equals(""))
                    parameters.put("uname",uname);
                if(name.equals(""))
                    parameters.put("name","");
                if(uname.equals(""))
                    parameters.put("uname","");
                if(sprice!=null && !sprice.equals(""))
                {
                    parameters.put("sprice",Integer.parseInt(sprice));
                    parameters.put("tprice",Integer.parseInt(tprice));
                }
                
                if(sprice.equals(""))
                    parameters.put("sprice",-1);
                
                System.out.print("parameters : "+parameters);
                
                JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
               
                 JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, cn);
                
                HtmlExporter exporter = new HtmlExporter();
                StringWriter reportout=new StringWriter();
                
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
                
                } catch (Exception e) {
			e.printStackTrace();
		}
        %>
    </body>
</html>
