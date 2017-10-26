<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/editar_clientes.aspx.cs" Inherits="editar_clientes" %>
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
    function activar_boton() 
    {

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
    function correo_invalido() 
    {
        alert('Error el correo no es valido verificar');
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
    }
    function usuario_existente() 
    {
        alert('Error cliente existente verifique el nombre del cliente');
    }
    function sucursal_existente() 
    {
        alert('Error cliente existente verifique el nombre de la sucursal');
    }
    document.onkeypress = stopRKey;
    window.onbeforeunload = salida;
    function salida() 
    {
        var botonsito = document.getElementById('boton_cancelar');
        botonsito.click();
    }
	</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Modificacion de clientes - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type "text/javascript" src="js/vendor/modernizr.js"></script>
    <script type "text/javascript" src="javascript/funciones.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/material-design-font.css">
</head>
</head>
<body bgcolor="#0080c0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
     <div class="large-12 header-cotizaciones header-alta header-prom">
        <div class="controles">
            <span class="titulo left">Modificación de clientes</span>
        </div>
            
         <ul class="inline-list right ul-prom">
            <li>
                <asp:LinkButton ID="boton_cancelar" runat="server" CssClass="boton" onclick="boton_salir_Click" ToolTip="Cancelar"><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton>
                <span>Salir</span>
            </li>
         </ul>
      </div>
        
    <div class="large-12 columns">        
       <!-- <div class="large-6 columns ">-->
        <div class="large-12 titulo-circulo">
            <i class="fa fa-group titulo_clientes"></i>
            <span> Datos del cliente</span></div>
           
            <!-- termina modulo especial -->
            
    <!--</div>-->
  <div class="large-10 columns">      
   <div class="modulo-nor">
    <ul class="">
                    <li><p><asp:Label ID="nombre" runat="server">Nombre</asp:Label></p><asp:TextBox ID="caja_nombre" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="200"></asp:TextBox></li>
            
                    <li><p><asp:Label ID="comercial" runat="server">Comercial</asp:Label></p><asp:TextBox ID="caja_comercial" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="200"></asp:TextBox></li>
            
                    <li class="li-inline"><p><asp:Label ID="tipo" runat="server" >Tipo de cliente</asp:Label></p><asp:DropDownList ID="tipo_cliente" runat="server" CssClass="lista micha">
                      <asp:ListItem>Credito</asp:ListItem>
                      <asp:ListItem>Contado</asp:ListItem>
                      <asp:ListItem>Gobierno</asp:ListItem>
                      <asp:ListItem>Medio Mayoreo</asp:ListItem>
                      <asp:ListItem>Mayoreo</asp:ListItem>
                      </asp:DropDownList>
                    </li>
                    <li><p><asp:Label ID="rfc" runat="server">RFC</asp:Label></p><asp:TextBox ID="caja_rfc" runat="server" CssClass="caja_chica micha" Style="text-transform: uppercase" MaxLength="30"></asp:TextBox></li>
            
                </ul> 

    <ul class="inline-list">
        <li><p><asp:Label ID="zona_mensajeria" runat="server">Zona de mensajeria</asp:Label></p><asp:DropDownList ID="lista_zonas" runat="server" CssClass="lista micha" Enabled="True">
          <asp:ListItem>Norte</asp:ListItem>
          <asp:ListItem>Sur</asp:ListItem>
          <asp:ListItem>Este</asp:ListItem>
          <asp:ListItem>Oeste</asp:ListItem>
          </asp:DropDownList>
        </li>
    </ul>
    <ul>
        <li><p><asp:Label ID="calle" runat="server">Calle</asp:Label></p><asp:TextBox ID="caja_calle" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" Enabled="true"></asp:TextBox></li>
    </ul>
            
    <ul class="inline-list">
                
                <li><p><asp:Label ID="numero_exterior" runat="server" CssClass="texto">Numero exterior</asp:Label></p><asp:TextBox ID="caja_numero_exterior" runat="server" CssClass="caja_mini micha" Enabled="true"></asp:TextBox></li>
        
                <li><p>Numero interior</p><asp:TextBox ID="caja_numero_interior" runat="server" CssClass="caja_super_mini micha" Enabled="true" Style="text-transform: uppercase"></asp:TextBox></li>
        
    </ul>
  
        
        
    <ul>

        <li><p><asp:Label ID="pais" runat="server">Pais</asp:Label></p>
            <asp:DropDownList ID="lista_paises" runat="server" CssClass="lista" onselectedindexchanged="lista_paises_SelectedIndexChanged" 
                            
                AutoPostBack="True" Enabled="true">
          </asp:DropDownList></li>

          <li>  <p><asp:Label ID="estado" runat="server">Estado</asp:Label></p>
              <asp:DropDownList ID="lista_estados" runat="server" CssClass="lista" 
                  AutoPostBack="True" Enabled="true"  onselectedindexchanged="lista_estados_SelectedIndexChanged"
                 >
          </asp:DropDownList></li>

          <li>    <p>
            <asp:Label ID="municipio" runat="server">Municipio</asp:Label></p><asp:TextBox ID="caja_municipio" runat="server" CssClass="lista" Style="text-transform: uppercase" MaxLength="300" Enabled="false"></asp:TextBox></li>

        <li><p><asp:Label ID="codigo_postal" runat="server">Codigo postal</asp:Label></p>
            <asp:DropDownList 
            ID="caja_codigo_postal" runat="server" CssClass="caja_mini" onselectedindexchanged="caja_codigo_postal_SelectedIndexChanged" 
            AutoPostBack="True" Enabled="true"></asp:DropDownList></li>
    
        <li>   <p> 
            <asp:Label ID="colonia" runat="server">Colonia</asp:Label></p>
            <asp:DropDownList ID="lista_colonias" runat="server" CssClass="lista" AutoPostBack="True" Enabled="true" onselectedindexchanged="lista_colonias_SelectedIndexChanged">
          </asp:DropDownList>
    </li>
    </ul>
    
        
    <ul>
        <li><p><asp:Label ID="referencia_ubicacion" runat="server">Referencia de ubicacion</asp:Label></p><asp:TextBox ID="caja_referencia" runat="server" CssClass="caja_larga" Enabled="true"></asp:TextBox></li>
    
        <li><p><asp:Label ID="telefono" runat="server">Telefono</asp:Label></p><asp:TextBox ID="caja_telefono" runat="server" CssClass="caja_chica" MaxLength="30"></asp:TextBox></li>
    
        <li><p><asp:Label ID="telefono_extra" runat="server">Telefono 2</asp:Label></p><asp:TextBox ID="caja_telefono_extra" runat="server" CssClass="caja_chica" MaxLength="30"></asp:TextBox></li>
    
        <li><p><asp:Label ID="contacto" runat="server">Contacto</asp:Label></p><asp:TextBox ID="caja_contacto" runat="server" CssClass="caja_mediana" MaxLength="100" Style="text-transform: uppercase"></asp:TextBox></li>
    
        <li><p><asp:Label ID="correo" runat="server">Correo</asp:Label></p><asp:TextBox ID="caja_correo" runat="server" CssClass="caja_mediana" MaxLength="200"></asp:TextBox></li>
    </ul>
        
   
        
    <asp:LinkButton ID="boton_guardar" runat="server" 
                ToolTip="Guardar cambios" style="text-decoration:none" 
                CssClass="boton_guardar button small success"
                Visible="True" onclick="boton_guardar_Click">Guardar</asp:LinkButton>
    
        
  
            
            <asp:LinkButton ID="boton_fantasma" runat="server" style="text-decoration:none;visibility:hidden" CssClass="boton_guardar" ><i class="fa fa-cog fa-spin"></i>Proceso</asp:LinkButton>
            </div> <!-- termina modulo especial -->
            
        </div>
         
        
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
        
    </div>
        <!--#include virtual="footer.aspx"--> 


