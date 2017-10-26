<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/configuracion.aspx.cs" Inherits="configuracion" %>

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
        window.focus();
    }
    onload = abrir();
    function activar_boton_fantasma() 
    {
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_tipo_cambio.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_tp() {
        document.getElementById("<%= boton_fantasma_tp.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_tipo_cambio_sistema.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_iva() 
    {
        document.getElementById("<%= boton_fantasma_iva.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_iva.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_inactividad() 
    {
        document.getElementById("<%= boton_fantasma_inactividad.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_inactividad.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_metas_cantidad() 
    {
        document.getElementById("<%= boton_fantasma_metas_cantidad.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_metas_cantidad.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_metas_volumen() 
    {
        document.getElementById("<%= boton_fantasma_metas_volumen.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_metas_volumen.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_metas_clientes() 
    {
        document.getElementById("<%= boton_fantasma_metas_clientes.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_metas_clientes.ClientID %>").style.display = "none";
    }
    function salir() 
    {
        window.close();
    }
    function parametro_modificado() 
    {
        alert('El parametro fue modificado correctamente');
    }
    function campo_incompleto() 
    {
        alert('valor no ingresado verificar');
    }
    function cantidad_invalida() 
    {
        alert('valor de tipo de cambio no valido');
    }
    function cantidad_no_permitida() 
    {
        alert('valor de tipo de cambio no valido');
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Configuracion - Inklaser</title>
 <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/material-design-font.css">
    </head>
</head>
    
    
<body bgcolor="#006699">
    
    <form id="formulario_configuracion" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate> 
   
               <div class="large-12 ">             
                     
    <div class="large-12 header-configuracion header-prom">
        
        
     
    <div class="controles">
        
        
        
    <span class="titulo left">Parametros del sistema</span>
            
             <ul class="inline-list right ul-prom">
       
                  <li>
            <asp:LinkButton ID="edicion_proveedores" runat="server" CssClass="boton" 
                            ToolTip="Edicion de proveedores" onclick="edicion_proveedores_Click"><i class="fa fa-pencil icono_boton"></i></asp:LinkButton></li>
                 <li>
            <asp:LinkButton ID="alta_proveedores" runat="server" CssClass="boton" 
                            ToolTip="Alta de proveedores" onclick="alta_proveedores_Click"><i class="fa fa-truck icono_boton"></i></asp:LinkButton></li>
                 
            <li>
    <asp:LinkButton ID="boton_salir" runat="server" CssClass="boton" 
            ToolTip="Salir" onclick="boton_salir_Click"><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton>
                 </li>
                 
                 
            </ul>
            </div>
    
        
        <div class="large-12 columns titulo-configuracion">
   
    </div>
        
        <div class="large-12 columnas-parametros">
        
        <div class="large-6 columns">
        
 

    
    
    
   
   
    
    <ul class="vertical">
    
        
    <li>
        <p>
           <i class="fa fa-plus"></i>&nbsp;&nbsp;IVA (%)&nbsp;&nbsp; <asp:TextBox ID="caja_iva" runat="server" CssClass="cajas" Enabled="False" 
            MaxLength="5"></asp:TextBox>         
          </p>
            <asp:LinkButton ID="boton_iva" runat="server" CssClass="boton_editar button tiny boton-sin-margen" ToolTip="Editar parametro iva" OnClientClick="activar_boton_fantasma_iva();" onclick="boton_iva_Click">
            <i class="<%=Session["icono_iva"]%> fa-lg"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="boton_fantasma_iva" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></asp:LinkButton>
            <hr />
        </li>


        <li>
        <p>
           <i class="fa fa-flag"></i>&nbsp;&nbsp;Meta Ventas Cantidad ($)&nbsp;&nbsp; 
           <asp:TextBox ID="caja_metas_cantidad" runat="server" CssClass="cajas" Enabled="False" 
            MaxLength="10"></asp:TextBox>      
         </p>
            <asp:LinkButton ID="boton_metas_cantidad" runat="server" CssClass="boton_editar button tiny boton-sin-margen" ToolTip="Editar metas mensuales por cantidad" OnClientClick="activar_boton_fantasma_metas_cantidad();" onclick="boton_metas_cantidad_Click">
            <i class="<%=Session["icono_metas_cantidad"]%> fa-lg"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="boton_fantasma_metas_cantidad" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></asp:LinkButton>
            <hr />
        </li>


        <li>
        <p>
        <i class="fa fa-flag"></i>&nbsp;&nbsp;Meta Volumen Ventas&nbsp;&nbsp;
        <asp:TextBox ID="caja_metas_volumen" runat="server" CssClass="cajas" Enabled="False" 
            MaxLength="8"></asp:TextBox>    
    </p>
        <asp:LinkButton ID="boton_metas_volumen" runat="server" CssClass="boton_editar button tiny boton-sin-margen" ToolTip="Editar meta de volumen de ventas por mes" OnClientClick="activar_boton_fantasma_metas_volumen();" onclick="boton_metas_volumen_Click">
            <i class="<%=Session["icono_metas_volumen"]%> fa-lg"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="boton_fantasma_metas_volumen" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></asp:LinkButton>
            <hr />
        </li>


        <li>
        <p>
        <i class="fa fa-flag"></i>&nbsp;&nbsp;Meta Clientes Mensuales&nbsp;&nbsp;
         <asp:TextBox ID="caja_metas_clientes" runat="server" CssClass="cajas" Enabled="False" 
            MaxLength="8"></asp:TextBox>        
    </p>
       <asp:LinkButton ID="boton_metas_clientes" runat="server" CssClass="boton_editar button tiny boton-sin-margen" ToolTip="Editar meta de cantidad de clientes por mes" OnClientClick="activar_boton_fantasma_metas_clientes();" onclick="boton_metas_clientes_Click">
            <i class="<%=Session["icono_metas_clientes"]%> fa-lg"></i>
            </asp:LinkButton>
            <asp:LinkButton ID="boton_fantasma_metas_clientes" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></asp:LinkButton>
            <hr />
        </li>

            <li>
         <p>
         <i class="fa fa-clock-o"></i>&nbsp;&nbsp;T. Inactividad (m) &nbsp;&nbsp;  
             <asp:TextBox ID="caja_inactividad" runat="server" CssClass="cajas" 
            Enabled="False" MaxLength="5"></asp:TextBox>
                        </p>
            <asp:LinkButton ID="boton_inactividad" runat="server" CssClass="boton_editar  button tiny boton-sin-margen" ToolTip="Editar el tiempo de inactividad" OnClientClick="activar_boton_fantasma_inactividad();" onclick="boton_inactividad_Click">
                 <i class="<%=Session["icono_inactividad"]%> fa-lg"></i>
                        </asp:LinkButton>
        
         <asp:LinkButton ID="boton_fantasma_inactividad" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin fa-lg"></i></asp:LinkButton>
         <hr />
           </li>
           <li>
           <p><i class="fa fa-wrench"></i>&nbsp;&nbsp;Mantenimiento</p>
               <asp:CheckBox ID="mantenimiento" runat="server" 
                   Text="Activar modo mantenimiento" 
                   oncheckedchanged="mantenimiento_CheckedChanged" AutoPostBack="True"/>
           </li>
           
    </ul>
    </div>
    
         
        <div class="large-6 columns">
        
    
    
    
    
    
    
    
    
    
    <ul class="vertical">

    <li>
        <p><i class="fa fa-building-o"></i>&nbsp;&nbsp;Proveedor</p>
        <asp:DropDownList ID="lista_proveedores" runat="server" CssClass="cajas" 
            AutoPostBack="True" 
            onselectedindexchanged="lista_proveedores_SelectedIndexChanged"></asp:DropDownList></li>
        
        
    <li>
        <p><i class="fa fa-flag"></i>&nbsp;&nbsp;Tipo de proveedor</p>
        <asp:TextBox ID="caja_tipo_proveedor" runat="server" CssClass="cajas" Enabled="False"></asp:TextBox></li>
        <li>
        <p>
        <i class="fa fa-money"></i>&nbsp;&nbsp;Tipo de cambio ($)&nbsp;&nbsp;
        <asp:TextBox ID="caja_tipo_cambio" runat="server" CssClass="cajas" 
            Enabled="False" MaxLength="6"></asp:TextBox>
            </p>
        
        <asp:LinkButton 
            ID="boton_tipo_cambio" runat="server" CssClass="boton_editar button tiny boton-sin-margen"  
            ToolTip="Editar el tipo de cambio del proveedor" OnClientClick="activar_boton_fantasma();" 
            onclick="boton_tipo_cambio_Click"><i class="<%=Session["icono_tipo_cambio"]%> fa-lg"></i></asp:LinkButton>
            <asp:LinkButton ID="boton_fantasma" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
            <hr />
            </li>

            <li>
        <p>
        <i class="fa fa-money"></i>&nbsp;&nbsp;Tipo de cambio sistema ($)&nbsp;&nbsp;
        <asp:TextBox ID="caja_tipo_cambio_sistema" runat="server" CssClass="cajas" 
            Enabled="False" MaxLength="6"></asp:TextBox>
            </p>
        
        <asp:LinkButton ID="boton_tipo_cambio_sistema" runat="server" CssClass="boton_editar button tiny boton-sin-margen"  
            ToolTip="Editar el tipo de cambio del proveedor" OnClientClick="activar_boton_fantasma_tp();" 
            onclick="boton_tipo_cambio_sistema_Click"><i class="<%=Session["icono_tipo_cambio_sistema"]%> fa-lg"></i></asp:LinkButton>
            <asp:LinkButton ID="boton_fantasma_tp" runat="server" Enabled="false" CssClass="boton_editar" style="text-decoration:none;visibility:hidden"><i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
            <hr />
            </li>
     
    <li>
        <p><i class="fa fa-truck"></i>&nbsp;&nbsp;Numero Proveedores</p>
        <asp:TextBox ID="caja_numero_proveedores" runat="server" CssClass="cajas" Enabled="False"></asp:TextBox></li>
        

        <li><p><i class="fa fa-home"></i>&nbsp;&nbsp;Numero sucursales</p>
        <asp:TextBox ID="caja_numero_sucursales" runat="server" CssClass="cajas" Enabled="False"></asp:TextBox></li>
    
          <li>
        <p><i class="fa fa-user"></i>&nbsp;&nbsp;Numero vendedores</p>
        <asp:TextBox ID="caja_numero_vendedores" runat="server" CssClass="cajas" Enabled="False"></asp:TextBox></li>
        
        
    <li>
         <p><i class="fa fa-calendar"></i>&nbsp;&nbsp;Fecha</p>
        <asp:TextBox ID="caja_fecha" runat="server" CssClass="cajas" Enabled="False"></asp:TextBox></li>
    
    </ul>
    
    </div>
        
        </div>
        </div>
        </div>
    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lista_proveedores" 
                EventName="SelectedIndexChanged" />
        </Triggers>
     </asp:UpdatePanel>
    </form>
    <!--#include virtual="footer.aspx"--> 

