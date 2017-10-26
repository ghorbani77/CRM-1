<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/sesion.aspx.cs" Inherits="sesion" %>
<script type="text/javascript" language="javascript">
    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje_mostrar');
            boton.click();
        }, 2500);
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Relationship Management - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
     <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
     <link rel="stylesheet" href="css/material-design-font.css">
      <link rel="stylesheet" href="css/custom.css" />
  </head>
    
<body>
    
    <div class="row">
      <div class="large-6 large-centered medium-centered columns icono-centrado">
    
    <form id="form1" runat="server">
   
  
 <div class="menu_login">
  <asp:Panel ID="mensajes_generales" runat="server" CssClass="mensajes_gris_login" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                            </asp:Panel>
                        <asp:Label ID="mensaje_mostrar" CssClass="mensaje" runat="server" Text="Error"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje_mostrar" CssClass="cerrar_mensajes_correo" runat="server" onclick="cerrar_mensajes_mostrar_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
        <p class="candado"> <i class="fa fa-lock fa-5x lock-icon-login"></i></p>
 
   
    
        <asp:Label ID="usuario" runat="server" Text="User"></asp:Label>
        <asp:TextBox ID="usuario_texto" runat="server" CssClass="caja_usuario"></asp:TextBox>
      
        
        <asp:Label ID="password" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="password_texto" runat="server" CssClass="caja_password" 
                TextMode="Password"></asp:TextBox>
       
        
            <asp:Button ID="iniciar" runat="server" CssClass="button tiny right" Text="Login"
                onclick="iniciar_Click" ToolTip="Login"/>
       
    </div>
    
    </form>
          
        </div></div>
</body>
</html>
