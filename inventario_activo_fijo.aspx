<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/inventario_activo_fijo.aspx.cs" Inherits="inventario_activo_fijo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" language="javascript">
   

    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 500);

        }

        if (boton.toString() == 'boton_transferir_activo_fijo') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_transferir_activo_fijo');
                boton.click();
            }, 500);
        }

        if (boton.toString() == 'LinkButton2') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_LinkButton2');
                boton.click();
            }, 500);
        }
       
    }
    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje_mostrar');
            boton.click();
        }, 1800);
    }
    function uploadError(sender, args) {
        document.getElementById('mensaje_imagen').innerText = args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>";
    }
   
    
   
    function posicionar_cursor(textControlID) {
        var texto = document.getElementById(textControlID);
        if (texto != null && texto.value.length > 0) {
            if (texto.createTextRange) {
                var rango_campo_texto = texto.createTextRange();
                rango_campo_texto.moveStart('character', texto.value.length);
                rango_campo_texto.collapse();
                rango_campo_texto.select();
            } else if (texto.setSelectionRange) {
                var size = texto.value.length;
                texto.setSelectionRange(size, size);
            }
        }
    }
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
                var boton = document.getElementById('actualizar');
                boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 15000);
    })()
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
  
    function salir() {
        this.close();
    }
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
    }
    function verificar_enter_dos(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('introducir_codigo');
            boton.click();
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inventario Activo Fijo</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script src="js/vendor/modernizr.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
      <link rel="stylesheet" href="css/Nestor.css">
    <script src="javascript/funciones.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="principalito">
         <!--panel transferir de inventario activo fijo a sucursal1 -->

       <asp:Panel ID="panel_mensajes" runat="server" CssClass="mensajes" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                            </asp:Panel>
                        <asp:Label ID="mensaje_mostrar" CssClass="mensaje" runat="server" Text="Error"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje_mostrar" CssClass="cerrar_mensajes_correo" runat="server" onclick="cerrar_mensajes_mostrar_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
       <!-- panel surtir activo fijo-->

           <asp:Panel ID="panel_activo_fijo_surtir" runat="server" CssClass="modulo-esp-foto"
                    Visible="False">
                    <div class="controles_atender_pedido">
                        <div class="cerrar-modulo">
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="boton_cerrar_atender_pedido"
                               OnClick="boton_cerrar_panel_transferir_Click"><i class="fa fa-times"></i>  &nbsp;&nbsp;Cerrar modulo</asp:LinkButton></div>
                        <ul class="vertical">
                            <li>
                                <p>
                                    <asp:Label ID="Label1" runat="server" Text="Producto"></asp:Label></p>
                                <asp:TextBox  ID="caja_nombre_producto_surtir" runat="server"  Enabled="False" CssClass="caja_codigo_pedido"></asp:TextBox></li>
                            
                        </ul>

                          <ul class="horizontal inline-list inputs-cotizacion">
                            <li>
                                <p>
                                    <asp:Label ID="Label2" runat="server" Text="No Existencia"></asp:Label></p>
                                <asp:TextBox ID="caja_numero_productos_surtir" runat="server" CssClass="cajas_chicas" Enabled="False" ></asp:TextBox></li>
                            
                            
                            <li>
                                <p>
                                    <asp:Label ID="Label3" runat="server" Text="No a surtir"></asp:Label></p>
                                <asp:TextBox ID="caja_cantidad_surtir" runat="server" CssClass="cajas_chicas" MaxLength=4 Enabled="True" ></asp:TextBox> <asp:LinkButton ID="LinkButton2" runat="server"  OnClick="boton_surtir_activo_fijo_click" ToolTip="Surtir inventario activo fijo"
                            Style="text-decoration: none" CssClass="boton_regresar button small">Surtir</asp:LinkButton> </li>
                       
                        </ul>

                        
                    </div>
                </asp:Panel>
       
       
       <!-- calis-->
      

         <!--PANEL TRANSFERIR SUCURSAL UNO -->
                
               <asp:Panel ID="panel_transferencia_activo_fijo" runat="server" CssClass="modulo-esp-foto"
                    Visible="False">
                    <div class="controles_atender_pedido">
                        <div class="cerrar-modulo">
                            <asp:LinkButton ID="boton_cerrar_actividad" runat="server" CssClass="boton_cerrar_atender_pedido"
                               OnClick="boton_cerrar_transferencia_sucursal1_Click"><i class="fa fa-times"></i>  &nbsp;&nbsp;Cerrar modulo</asp:LinkButton></div>
                        <ul class="vertical">
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_codigo_clave" runat="server" Text="Producto"></asp:Label></p>
                                <asp:TextBox  ID="caja_nombre_producto" runat="server"  Enabled="False" CssClass="caja_codigo_pedido"></asp:TextBox></li>
                            
                        </ul>

                          <ul class="horizontal inline-list inputs-cotizacion">
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_productos" runat="server" Text="No Existencia"></asp:Label></p>
                                <asp:TextBox ID="caja_numero_productos" runat="server" CssClass="cajas_chicas" Enabled="False" ></asp:TextBox></li>
                            
                            
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_cantidad_surtir_sucursal1" runat="server" Text="No a transferir"></asp:Label></p>
                                <asp:TextBox ID="caja_cantidad_surtir_sucursal1" runat="server" CssClass="cajas_chicas" MaxLength=4 Enabled="True" ></asp:TextBox> <asp:LinkButton ID="boton_transferir_activo_fijo" runat="server" OnClick="boton_surtir_cantidad_click" ToolTip="transferir a Activo Fijo"
                            Style="text-decoration: none" CssClass="boton_regresar button small">Transferir</asp:LinkButton> </li>
                       
                        </ul>

                        
                    </div>
                </asp:Panel>

        
          <!--SECCION SIN RESULTADOS-->
                <asp:Panel ID="panel_no_resultados_busqueda" runat="server" CssClass="no_resultados"
                    Visible="False">
                    <br />
                    <br />
                    <i class="fa fa-frown-o fa-2x"></i>&nbsp;&nbsp;<asp:Label ID="leyenda" runat="server"
                        CssClass="texto" Text="No se encontraron resultados relacionados con esta busqueda"></asp:Label>
                </asp:Panel>
                <!--TERMINA SECCION SIN RESULTADOS-->
        
        
        <!-- bfin panel transferir de inventario activo fijo a sucursal1 -->
       
         <!--panel de carga -->
                     <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                    display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>
         <div class="fijo">
        <div class="large-12 header-requisiciones header-prom">
        <span class="titulo left">Inventario Activo Fijo</span>
         <ul class="inline-list right ul-prom">
         <li>
         <asp:LinkButton ID="boton_salir" runat="server" CssClass="boton_salir" OnClick="boton_salir_Click"  ToolTip="Salir">   <i class="fa fa-sign-out"></i>
         <span>Salir</span>
         </asp:LinkButton>
         </li>
         </ul>
         </div>        

                        <div class="large-12 columns borde-punteado-bottom separador-top">
                    <ul class="inline-list">
                        <li>
                            <asp:Label ID="t_busqueda" runat="server" Text="Buscar por" CssClass="medio"></asp:Label></li>
                        <li>
                            <asp:DropDownList ID="tipo_busqueda" runat="server" CssClass="lista_tipo_busqueda"
                                AutoPostBack="True" OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged" >
                                <asp:ListItem>Codigo de proveedor</asp:ListItem>
                                <asp:ListItem>Codigo de barras</asp:ListItem>
                                <asp:ListItem>Codigo de fabricante</asp:ListItem>
                                <asp:ListItem>Modelo</asp:ListItem>
                                <asp:ListItem>Producto</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <div class="cuadro_busqueda">
                                <asp:TextBox ID="caja_busqueda" placeholder="Introduce una busqueda" runat="server"
                                    Enabled="True" CssClass="caja_busqueda" onfocus="return posicionar_cursor(this.id);"></asp:TextBox>
                                <asp:LinkButton ID="boton_buscar" runat="server" ToolTip="Buscar" Style="text-decoration: none;"
                                 OnClick="boton_buscar_Click"  OnClientClick="activar_boton_buscar_oculto();"  ><i class="fa fa-gear"></i></asp:LinkButton>
                                    <asp:LinkButton ID="botonsote" runat="server" Enabled="false" ><i class="fa fa-gear fa-spin" ></i></asp:LinkButton>
                            </div>
                        </li>
                    </ul>
                </div>
                </div>
        
        
        
     
      
         <asp:Panel ID="panel_inventario" runat="server" Visible="False">
       
         <asp:GridView ID="tabla_inventario" runat="server" CssClass="tabla_pedidos" DataSource='<%# datos_inventario_activoFijo() %>'   
        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" OnRowCommand="tabla_inventario_fijo_RowCommand" DataKeyNames="codigo_proveedor"
        PageSize="50" >
        <PagerSettings Visible="False"/>
		<RowStyle CssClass="reng" HorizontalAlign="Left"/>
        <HeaderStyle CssClass="cabecera" />
	    <Columns>
        <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor">
                                <HeaderStyle   CssClass="cabecera_inventario_fijo " />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Descripcion" DataField="producto">
                                <HeaderStyle CssClass="cabecera_inventario_fijo" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Modelo" DataField="modelo">
                                <HeaderStyle CssClass="cabecera_inventario_fijo " />
                            </asp:BoundField>
                             <asp:BoundField HeaderText="Cantidad" DataField="cantidad">
                                <HeaderStyle CssClass="cabecera_inventario_fijo " />
                            </asp:BoundField>
        <asp:TemplateField HeaderText="" ShowHeader="True">
                                <HeaderStyle CssClass="cabecera_inventario_fijo" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="boton_transferencia_sucursal1" runat="server" CausesValidation="False" ToolTip="Transferir a sucursal matriz"
                                        CommandName="transferencia_sucursal1" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><div class="colores_icono verde" ><i class="fa fa-exchange opcion_tabla"></i></div></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle CssClass="control" />
                            </asp:TemplateField>
                      <asp:TemplateField HeaderText="" ShowHeader="True">
                                <HeaderStyle CssClass="cabecera_inventario_fijo" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="boton_surtir_sucursal1" runat="server" CausesValidation="False" ToolTip="Surtir"
                                        CommandName="surtir_activo_fijo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><div class="colores_icono amarillo" ><i class="fa fa-plus-square opcion_tabla"></i></div></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle CssClass="control" />
                            </asp:TemplateField>
         </Columns>
     
        </asp:GridView> 
        </asp:Panel>

        <!--botones ocultos-->
          <asp:Button ID="boton_oculto_buscar" runat="server" OnClick="boton_oculto_buscar_Click" Text="actualizar" Visible="True" Style="visibility:hidden" />
          <asp:Button ID="boton_oculto_transferir_activo_fijo" runat="server" OnClick="boton_oculto_transferir_activo_fijo_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
          <asp:Button ID="boton_oculto_LinkButton2" runat="server" OnClick="boton_oculto_surtir_activo_fijo_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />

 

       
          </div>
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="tipo_busqueda" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="tabla_inventario" EventName="RowCommand" />
        </Triggers>
        </asp:UpdatePanel>
        </form>
</body>
</html>
<!--#include virtual="footer.aspx"--> 
