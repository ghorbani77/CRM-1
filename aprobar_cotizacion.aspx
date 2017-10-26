<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/aprobar_cotizacion.aspx.cs" Inherits="aprobar_cotizacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" language="javascript">
    function cargar() {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        setTimeout(function () {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
            var boton = document.getElementById('boton_oculto_proceso');
            boton.click();
        }, 2000);
    }
    function listo() {
        document.getElementById("<%= panel_listo.ClientID %>").style.display = "inline";
        setTimeout(function () {
            document.getElementById("<%= panel_listo.ClientID %>").style.display = "none";
            window.close();
        }, 2000);
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Procesando orden</title>
     <link href="css/procesando_cotizacion.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body class="procesando">
<form id="formulario" runat="server">
    <asp:Panel id="panel_cargando" runat="server"  Style="text-decoration: none;
                    display: none">
        <asp:Image ID="logotipo_ink" runat="server" />
        <asp:Label ID="leyenda_procesando" runat="server">Estamos procesando su cotizacion porfavor espere....</asp:Label>
        <asp:Label ID="logo_procesando" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-4x"></i></asp:Label>
        <asp:LinkButton ID="boton_oculto_proceso" OnClick="boton_oculto_proceso_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
   </asp:Panel>
    <asp:Panel id="panel_listo" runat="server"  Style="text-decoration: none;
                    display: none">
        <asp:Image ID="logotipo_ink_listo" runat="server" />
        <asp:Label ID="leyenda_procesando_listo" runat="server">Su cotizacion ha sido procesada gracias...</asp:Label>
        
   </asp:Panel>
</form>
</body>
</html>
