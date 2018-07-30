<%-- 
    Document   : cdefinit
    Created on : Dec 12, 2017, 9:09:44 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
       <%
            String frameTypes[]=new String[]{
                "Full Rim",
                "Rimless",
                "Semi-Rimless",
                "Half-Eye",
                "Other"
            };
        
            String lensTypes[]=new String[]{
                "Polycarbonate",
                "Other",
                "Trivex",
                "High-index plastic",
                "Aspheric",
                "Photochromic",
                "Bifocal",
                "Trifocal",
                "Progressive"
        };
       %>
       
        <%! 
            String formSearchConditionForPatient(HttpServletRequest request)
            {
                 /*Parse the request*/
                String patientName = request.getParameter("txtpatientname");
                String optname = request.getParameter("txtopticianname");
                String pid = request.getParameter("txtpatientid");
                String contno = request.getParameter("txtcontactno");
                String sdate = request.getParameter("txtstartdate");
                String tdate = request.getParameter("txttodate");
                
                 //form search condition
                 String searchcond="";
                 String cond =" checked=0 ";
                    boolean m=true;
                    System.out.print("\n cond  :"+cond);
                if(patientName!=null || optname!=null || pid!=null || contno!=null || sdate!=null || tdate!=null)
                {
                    if(patientName!=null && !patientName.equalsIgnoreCase("") )
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" name = '"+patientName+"'";
                    }
                    if(optname!=null && !optname.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" user_name = '"+optname+"'";
                    }if(pid!=null && !pid.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" id = '"+pid+"'";
                    }if(contno!=null && !contno.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" contact_no = '"+contno+"'";
                    }if(sdate!=null && tdate!=null && !(sdate.equals("") && tdate.equals("")))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" arrival between '"+sdate+"' and '"+tdate+"'";
                    }
                        
                
                }
                
                    if(!cond.equals(""))
                       searchcond=" where "+cond;
                return searchcond;
            }
            
            String formSearchConditionForFindPatient(HttpServletRequest request)
            {
                 /*Parse the request*/
                String patientName = request.getParameter("txtpatientname");
                String optname = request.getParameter("txtopticianname");
                String pid = request.getParameter("txtpatientid");
                String contno = request.getParameter("txtcontactno");
                String sdate = request.getParameter("txtstartdate");
                String tdate = request.getParameter("txttodate");
                
                 //form search condition
                 String searchcond="";

                if(patientName!=null || optname!=null || pid!=null || contno!=null || sdate!=null || tdate!=null)
                {
                    String cond ="";
                    boolean m=false;
                    if(patientName!=null && !patientName.equalsIgnoreCase("") )
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" patient_name = '"+patientName+"'";
                    }
                    if(optname!=null && !optname.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" optician = '"+optname+"'";
                    }if(pid!=null && !pid.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" patient_id = '"+pid+"'";
                    }if(contno!=null && !contno.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" contact_no = '"+contno+"'";
                    }if(sdate!=null && tdate!=null && !(sdate.equals("") && tdate.equals("")))
                    {
                        cond+=" arrival between '"+sdate+"' and '"+tdate+"'";
                    }

                    if(!cond.equals(""))
                       searchcond=" where "+cond;
                }
                
                return searchcond;
            }
            String formSearchConditionForInvoice(HttpServletRequest request)
            {
                
                String patientName = request.getParameter("txtpatientname");
                String username = request.getParameter("txtcreatedby");
                String pid = request.getParameter("txtpatientid");
                String invno = request.getParameter("txtinvoiceno");
                String contno = request.getParameter("txtcontactno");
                String sdate = request.getParameter("txtstartdate");
                String tdate = request.getParameter("txttodate");
                
                String csdate = request.getParameter("txtcreatstartdate");
                String ctdate = request.getParameter("txtcreattodate");
                String dsdate = request.getParameter("txtdelstartdate");
                String dtdate = request.getParameter("txtdeltodate");
                
                 //form search condition
                 
                    String cond ="";
                    boolean m=false;
                    System.out.print("\n cond  :"+cond);
                if(patientName!=null || username!=null || pid!=null || invno!=null || contno!=null || sdate!=null || tdate!=null)
                {
                    if(patientName!=null && !patientName.equalsIgnoreCase("") )
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" name = '"+patientName+"'";
                    }
                    if(username!=null && !username.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" username = '"+username+"'";
                    }/*if(pid!=null && !pid.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" patient_id = '"+pid+"'";
                    }*/if(invno!=null && !invno.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" id = '"+invno+"'";
                    }
                    if(contno!=null && !contno.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" contact_no = '"+contno+"'";
                    }if(sdate!=null && tdate!=null && !(sdate.equals("") && tdate.equals("")))
                    {
                        cond+=" created between '"+sdate+"' and '"+tdate+"'";
                    }if(csdate!=null && ctdate!=null && !(csdate.equals("") && ctdate.equals("")))
                    {
                        cond+=" created between '"+csdate+"' and '"+ctdate+"'";
                    }if(dsdate!=null && dtdate!=null && !(dsdate.equals("") && dtdate.equals("")))
                    {
                        cond+=" delivered between '"+dsdate+"' and '"+dtdate+"'";
                    }

                }
                
                return cond;
            }
            
            String formSearchConditionForViewInvoice(HttpServletRequest request)
            {
                 /*Parse the request*/
                String patientName = request.getParameter("txtpatientname");
                String username = request.getParameter("txtcreatedby");
                String pid = request.getParameter("txtpatientid");
                String invno = request.getParameter("txtinvoiceno");
                String contno = request.getParameter("txtcontactno");
                String sdate = request.getParameter("txtstartdate");
                String tdate = request.getParameter("txttodate");
                
                String csdate = request.getParameter("txtcreatstartdate");
                String ctdate = request.getParameter("txtcreattodate");
                String dsdate = request.getParameter("txtdelstartdate");
                String dtdate = request.getParameter("txtdeltodate");
                
                 //form search condition
                 String searchcond="";

                 
                    String cond =" deliverded=0 ";
                    boolean m=true;
                    System.out.print("\n cond  :"+cond);
                if(patientName!=null || username!=null || pid!=null || invno!=null || contno!=null || sdate!=null || tdate!=null)
                {
                    if(patientName!=null && !patientName.equalsIgnoreCase("") )
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" name = '"+patientName+"'";
                    }
                    if(username!=null && !username.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" username = '"+username+"'";
                    }/*if(pid!=null && !pid.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" patient_id = '"+pid+"'";
                    }*/if(invno!=null && !invno.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" id = '"+invno+"'";
                    }
                    if(contno!=null && !contno.equals(""))
                    {
                        if(m) cond+=" and "; else m=true;
                        cond+=" contact_no = '"+contno+"'";
                    }if(sdate!=null && tdate!=null && !(sdate.equals("") && tdate.equals("")))
                    {
                        cond+=" created between '"+sdate+"' and '"+tdate+"'";
                    }if(csdate!=null && ctdate!=null && !(csdate.equals("") && ctdate.equals("")))
                    {
                        cond+=" created between '"+csdate+"' and '"+ctdate+"'";
                    }if(dsdate!=null && dtdate!=null && !(dsdate.equals("") && dtdate.equals("")))
                    {
                        cond+=" delivered between '"+dsdate+"' and '"+dtdate+"'";
                    }

                }
                
                    if(!cond.equals(""))
                       searchcond=" where "+cond;
                    
                return searchcond;
            }
            
            String formSearchConditionForFindInvoice(HttpServletRequest request)
            {
                String searchcond="";
                String cond= formSearchConditionForInvoice(request);
                if(!cond.equals(""))
                {
                    System.out.print("cond :"+cond);
                    return " where deliverded=1 and "+cond;
                }
                return " where deliverded = 1";
            }

        %>
        
    </body>
</html>
