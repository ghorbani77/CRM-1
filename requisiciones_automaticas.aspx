<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/requisiciones_automaticas.aspx.cs" Inherits="requisiciones_automaticas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" language="javascript">
    (function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };

        window.onload = function() {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
          };

        setInterval(function () {
            if (!mouse && !keyboard) {
                //  var boton = window.opener.document.getElementById('actualizar');
                // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()

   function panel
   {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
   }
   
    
    

  
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8"/>
    <title>Inklaser</title>
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
    <style> </style>
</head>


   
 
<body bgcolor="#e6e6e6">
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                    display: inline">
     <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label>
                    </asp:Panel>
     
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
     </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    </div>
    </form>
   
</body>


</html>