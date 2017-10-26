<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/cotizaciones_online.aspx.cs" Inherits="cotizaciones_online" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
    <form id="form1" runat="server">
        <div style=" width:100%;text-align: center;">
            <img style="width: 50%;" src="http://crm.inklaser.mx/img_mario/logo.png"/>
            <div style="font-family: 'Montserrat', sans-serif; font-size:large; text-align: center;">
                <asp:Label ID="lblMensaje" runat="server" Text="comentario"></asp:Label>
            </div>
            <!--
            <div style ="text-align: center;">
               <a href=link runat="server" style="font-family: 'Montserrat', sans-serif;
                    background:#3498DB;
                    padding: 10px 30px 10px 30px;
                    display:inline;
                    color:White;
                    font-size:large;
                    text-decoration:none;
                    border-style:none;">Aprobar</a>
            </div>
            -->
            <br />
            <br />
            <br />
            <div style="font-family: 'Montserrat', sans-serif; font-size:x-large; text-align: center;">
                <asp:Label ID="lblNombre" runat="server" Text="Inserta Nombre aqui"></asp:Label>
                <br />
                <asp:Label ID="lblTelOficina" runat="server" Text="Inserta Telefono aqui "></asp:Label>
                <asp:Label ID="lblTelCelular" runat="server" Text="| Inserta Celular aqui"></asp:Label>
                <br />
                <asp:Label ID="lblCorreo" runat="server" Text="Inserta Correo aqui "></asp:Label>
                <asp:Label ID="lblDireccionWeb" runat="server" Text="| http://www.inklaser.mx"></asp:Label>
                <br />
                <asp:Label ID="lblOficina" runat="server" Text="Oficinas Corporativas "></asp:Label>
                <asp:Label ID="lblDireccion1" runat="server" Text="| C. Ambar #984"></asp:Label>
                <br />
                <asp:Label ID="lblDireccion2" runat="server" Text="Fracc. Mediterraneo "></asp:Label>
                <asp:Label ID="lblDireccion3" runat="server" Text="| Ensenada, B.C. México"></asp:Label>
                <br />
            </div>
        </div>
        <div>
            <img style ="width:100%;" src="http://crm.inklaser.mx/img_mario/botones2.png"/>
        </div>
        <div>
            <img style ="width:100%;" src="http://crm.inklaser.mx/img_mario/barra2.png"/>
        </div>
    </form>
    <div style ="text-align: center;">
        <a href="http://crm.inklaser.mx/aviso_privacidad.htm" runat="server" style="font-family: 'Montserrat', sans-serif;">Aviso de Privacidad</a>
    </div>
</body>
</html>
