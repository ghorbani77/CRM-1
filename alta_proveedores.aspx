<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/alta_proveedores.aspx.cs" Inherits="alta_proveedores" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    (function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
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
    function abrir() 
    {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function activar_boton() {


        document.getElementById("<%= boton_guardar.ClientID %>").style.display = "Visible";
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "hidden";
    }
    function salir() 
    {
        window.close();
    }
    function desactivar_boton() 
    {
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "visible";
        document.getElementById("<%= boton_guardar.ClientID %>").style.display = "none"
    }
    function tipo_cambio_invalido() 
    {
        alert('Error el tipo de cambio no es valido');
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
    }
    function proveedor_existente() 
    {
        alert('Error proveedor existente verifique el nombre del proveedor');
    }
    document.onkeypress = stopRKey;
	</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title>Alta de Proveedores</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/material-design-font.css">
</head>
</head>
<body bgcolor="#0080c0">
    <form id="form2" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    
            <div class="large-12 header-cotizaciones header-proveedores header-prom">
    
        

    <div class="controles">
        
        
        
    <span class="titulo left">Alta de proveedores</span>
        </div>
            
             <ul class="inline-list right ul-prom">
                 
            <li>
    <asp:LinkButton ID="boton_cancelar" runat="server" CssClass="boton" 
            ToolTip="Cancelar" onclick="boton_cancelar_Click"><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton>
            <span>Salir</span>
                 </li>
                 
                 
            </ul>

        
        </div>
        
    <div class="large-12 columns">
        
        
        <div class="large-5 columns ">
        
            <div class="large-12 titulo-circulo">
        <i class="fa fa-user titulo_clientes"></i>
            <span> Datos del proveedor</span></div>
            
   
    
        
        <div class="modulo-nor">
        <ul class="">
           <li><p><asp:Label ID="nombre" runat="server">Proveedor</asp:Label></p><asp:TextBox ID="caja_nombre" runat="server" CssClass="caja_mediana" MaxLength="200" Style="text-transform: uppercase"></asp:TextBox></li>
           <li><p><asp:Label ID="nombre_comercial" runat="server">Comercial</asp:Label></p><asp:TextBox ID="caja_nombre_comercial" runat="server" CssClass="caja_mediana" MaxLength="1000" Style="text-transform: uppercase"></asp:TextBox></li>
           <li><asp:Label ID="direccion" runat="server">Domicilio</asp:Label>&nbsp;&nbsp;<asp:TextBox ID="caja_direccion" runat="server" CssClass="caja_larga" Style="text-transform: uppercase" MaxLength="2000"></asp:TextBox></li>
           <li><p><asp:Label ID="tipo" runat="server">Tipo de proveedor</asp:Label></p><asp:DropDownList 
              ID="tipo_proveedor" runat="server" CssClass="lista" AutoPostBack="True" onselectedindexchanged="tipo_proveedor_SelectedIndexChanged">
          <asp:ListItem>Extranjero</asp:ListItem>
          <asp:ListItem>Nacional</asp:ListItem>
          </asp:DropDownList></li>

          <li><p><asp:Label ID="local" runat="server">Proveedor Local</asp:Label></p><asp:DropDownList 
              ID="DDLLocal" runat="server" CssClass="lista">
          <asp:ListItem>SI</asp:ListItem>
          <asp:ListItem>NO</asp:ListItem>
          </asp:DropDownList></li>


      <li><p><asp:Label ID="tipo_cambio" runat="server">Tipo de cambio</asp:Label></p><asp:TextBox 
              ID="caja_tipo_cambio" runat="server" CssClass="caja_chica" 
              Style="text-transform: uppercase" MaxLength="10"></asp:TextBox></li>
            
            </ul> 
            </div> <!-- termina modulo especial -->
            
            </div>
        
        
    
        <div class="large-7 columns"> 
        
            <div class="large-12 titulo-circulo">
        <i class="fa fa-asterisk"></i>
            <span>Caracteristicas</span></div>
            
   
    
   
       
        <div class="modulo-nor">
    <ul class="inline-list">
        
          <li class="li-inline"><p><asp:Label ID="telefono" runat="server">Telefono</asp:Label></p><asp:TextBox ID="caja_telefono" runat="server" CssClass="caja_chica" MaxLength="30"></asp:TextBox></li>
    <li class="li-inline"><p><asp:Label ID="contacto" runat="server">Contacto</asp:Label></p><asp:TextBox ID="caja_contacto" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100" ></asp:TextBox></li>
    <li class="li-inline"><p><asp:Label ID="correo" runat="server">Correo</asp:Label></p><asp:TextBox ID="caja_correo" runat="server" CssClass="caja_mediana" MaxLength="200" Style="text-transform: lowercase"></asp:TextBox></li>
    <li class="li-inline"><p><asp:Label ID="pago" runat="server">Pago</asp:Label></p><asp:DropDownList 
              ID="lista_pagos" runat="server" CssClass="lista">
          <asp:ListItem>Contado</asp:ListItem>
          <asp:ListItem>Credito</asp:ListItem>
          </asp:DropDownList></li>
        </ul>
 
    <asp:LinkButton ID="boton_guardar" runat="server" ToolTip="Guardar registro del nuevo proveedor" style="text-decoration:none" CssClass="boton_guardar button small success" onclick="boton_guardar_Click" OnClientClick="desactivar_boton();"><i class="fa fa-save"></i>&nbsp;&nbsp;Guardar</asp:LinkButton>
    <asp:LinkButton ID="boton_fantasma" runat="server" style="text-decoration:none;visibility:hidden" CssClass="boton_guardar button small success"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;Proceso</asp:LinkButton>
            </div> <!-- termina modulo especial -->
            
        </div>
         
        
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
        
    </div>
        <!--#include virtual="footer.aspx"--> 
