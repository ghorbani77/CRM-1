<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/ventas_crm.aspx.cs" Inherits="ventas_crm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" language="javascript">
    function salir() {
        window.close();
    }
    function cerrar_mensaje() {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
        mensaje();
    }
    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje_mostrar');
            boton.click();
        }, 1000);
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
                
            }, 1000); 
        } //fin del if boton_si 
        if (boton.toString() == 'boton_entregar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_entregar');
                boton.click();

            }, 1000);
        } //fin del if boton_entregar
        if (boton.toString() == 'asignar_entrega') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_asignar_entrega');
                boton.click();

            }, 1000);
        } //fin del if boton_asignar_entrega
        if (boton.toString() == 'RadioButton1') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_radio');
                boton.click();
            }, 1000);
        } //fin del if radiobutton1
       if (boton.toString() == 'RadioButton2') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_radio2');
                boton.click();
            }, 1000);

        } //fin del if radiobutton2 
        if (boton.toString() == 'entregar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_entregar');
                boton.click();

            }, 1000);
        } //fin del if boton_entregar
        if (boton.toString() == 'entrego') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_persona');
                boton.click();

            }, 1000);
        } //fin del if boton_entregar
        if (boton.toString() == 'foto') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_foto_factura');
                boton.click();

            }, 1000);
        } //fin del if boton_foto

    }//fin de cargar

    function foto() {

        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        
            var boton = document.getElementById('boton_oculto_foto');
            boton.click();

        }
        function abrir() {
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        onload = abrir();
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ventas - Inklaser</title>
    <link rel="stylesheet" href="css/gridview.css"/>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'
        type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
        rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
</head>
<body bgcolor="#e6e6e6">
    <form id="formulario" runat="server">
        <!- poner aqui el uper panel  -->
        <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;display: none">
            <asp:Label ID="loading" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label>
        </asp:Panel>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                    <!--MENU-->
                    <div id="menu">
                        <i class="fa fa-truck fa-2x blanco"></i><asp:Label ID="vendedor" runat="server" CssClass="nombre_vendedor">Entrega de pedidos</asp:Label>
                            <div class="botones_menu">     
                                <asp:LinkButton ID="salir" runat="server" CssClass="boton" ToolTip="Salir" onclick="boton_volver_Click"><img id="f" class="icono" src="png/f.png"></asp:LinkButton>
                            </div> 
                    </div>         
                    <!--FIN-->
                    <div id="main" runat=server >
                        <!--PANEL MENSAJES-->
                        <asp:Panel ID="panel_mensajes" runat="server" CssClass="mensajes" Visible="false">
                            <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                                <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                            </asp:Panel>
                            <asp:Label ID="mensaje_mostrar" CssClass="mensaje" runat="server" Text="Error"></asp:Label>
                            <asp:LinkButton ID="cerrar_mensaje_mostrar" CssClass="cerrar_mensajes_correo" runat="server" onclick="cerrar_mensajes_mostrar_Click"><i class="fa fa-close"></i></asp:LinkButton>
                        </asp:Panel>
                        <!--FIN-->
                        <!--PANEL ATENDER-->
                        <asp:Panel ID="panel_atender_venta" CssClass="panel_atender" runat="server" visible="false">
                             <div class="cabecera_productos">
                                <asp:Label ID="venta" runat="server" CssClass="titulo_subpanel">Venta</asp:Label>
                                    <asp:LinkButton ID="cerrar_panel_productos" runat="server" CssClass="cerrar_modulos" ToolTip="cerrar"  OnClick="boton_cerrar_atender_venta_Click"><i class="fa fa-close"></i></asp:LinkButton>
                             </div> 
                             <div class="contenido_productos">
                                <asp:GridView ID="tabla_productos_venta" runat="server" CssClass="tabla" DataSource='<%# datos_productos_venta() %>' 
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="cabecera_tabla" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="renglon_tabla" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="renglon_tabla_alternativo" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Proveedor" DataField="proveedor" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Producto" DataField="codigo" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Descripcion" DataField="producto" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" Visible="True"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                             </div>
                             <asp:LinkButton ID="boton_foto" runat="server"  style="text-decoration: none;"
                                class="botones_proceso boton_azul">  Foto
                             </asp:LinkButton>
                             <asp:LinkButton ID="boton_factura" runat="server" ToolTip="Agregar numero de  Factura"
                                Style="text-decoration: none;" CssClass="botones_proceso_factura boton_azul" OnClick="boton_factura_Click">Agregar Factura
                             </asp:LinkButton>
                        </asp:Panel>
                        <!--FIN-->
                        <!--PANEL AGREGAR FACTURA-->
                        <asp:Panel ID="panel_factura" runat="server" CssClass="panel_atender_chico" Visible="False">
                            <div class="cabecera_productos">
                                <asp:Label ID="venta_factura" runat="server" CssClass="titulo_subpanel">Venta</asp:Label>
                                <asp:LinkButton ID="boton_cerrar_llamada" runat="server" CssClass="cerrar_modulos"
                                    OnClick="boton_cancelar_Click"><i class="fa fa-close"></i>
                                </asp:LinkButton>
                            </div> 
                            <div class="controles_paneles">
                                <asp:Label ID="etiqueta_comentarios" runat="server" Text="No. Factura"></asp:Label>
                                <asp:TextBox ID="caja_factura" runat="server" MaxLength="10" CssClass="caja_codigo" Style="text-transform: lowercase"></asp:TextBox> 
                                <asp:LinkButton ID="boton_si" runat="server" ToolTip="agregar No. Factura" OnClick="boton_si_Click"
                                    OnClientClick="return confirm('Desea Agregar la factura?');"
                                    Style="text-decoration: none;" CssClass="botones_proceso_guardar boton_panel_chico boton_verde">Guardar
                                </asp:LinkButton>
                            </div>
                        </asp:Panel>
                        <!--PANEL historial-->
                        <asp:Panel ID="panel_historial" runat="server" CssClass="panel_atender " Visible="False">
                            <div class="cabecera_productos">
                                <asp:Label ID="cotizacion" runat="server" CssClass="titulo_subpanel"></asp:Label>
                                <asp:LinkButton ID="cerrar_historial" runat="server" CssClass="cerrar_modulos"
                                    OnClick="boton_cerrar_historial_Click"><i class="fa fa-close"></i>
                                </asp:LinkButton>
                            </div> 
                            <div>
                                <asp:GridView ID="tabla_historial" runat="server" CssClass="tabla" DataSource='<%# datos_historial() %>'
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="cabecera_tabla" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="renglon_tabla" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="renglon_tabla_alternativo" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Descripcion" DataField="descripcion" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Usuario" DataField="usuario" Visible="True"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        <!--FIN-->
                        <!--PANEL FOTO-->
                        <asp:Panel ID="panel_foto" runat="server" CssClass="panel_atender_foto" Visible="false">
                            <div class="cabecera_productos">
                                <asp:Label ID="venta_foto" runat="server" CssClass="titulo_subpanel">Venta</asp:Label>
                                <asp:LinkButton ID="cerrar_foto" runat="server" CssClass="cerrar_modulos"
                                    OnClick="boton_cerrar_foto_factura_Click"><i class="fa fa-close"></i>
                                </asp:LinkButton> 
                            </div>     
                            <asp:Image ID="foto_factura" runat="server" CssClass="imagen_factura" />
                        </asp:Panel>
                        <!--FIN-->
                        <div class="opciones">
                            <ul class="opciones_filtrado">
                                <li>
                                    <asp:RadioButton ID="RadioButton1" runat="server" 
                                        GroupName="crico" CssClass="Cricoradio" AutoPostBack="true" 
                                        oncheckedchanged="RadioButton1_CheckedChanged" Checked="true"  />&nbsp;<asp:Label ID="R1" runat="server" Text="Enviadas"></asp:Label>
                                </li>
                                <li>
                                    <asp:RadioButton ID="RadioButton2" runat="server" 
                                    GroupName="crico" CssClass="Cricoradio" AutoPostBack="true" 
                                    oncheckedchanged="RadioButton2_CheckedChanged"  />&nbsp;<asp:Label ID="R2" runat="server" Text="Procesadas"></asp:Label>
                                </li>
                            </ul>               
                        </div>
                        <div class="contenido">
                            <asp:GridView ID="tabla_ventas" runat="server" CssClass="tabla" DataSource='<%# datos_ventas() %>'
                                DataKeyNames="clave_venta,factura,clave_cotizacion" onrowcommand="tabla_ventas_RowCommand"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                <HeaderStyle CssClass="cabecera_tabla" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="renglon_tabla" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="renglon_tabla_alternativo" />
                                <Columns>
                                    <asp:BoundField HeaderText="Venta" DataField="clave_venta" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cotizacion" DataField="clave_cotizacion" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Pedido" DataField="clave_pedido" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cliente" DataField="nombre" Visible="True"></asp:BoundField>
                                    <asp:BoundField  HeaderText="Factura" DataField="factura" Visible="true" ></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="atender_venta" runat="server" CausesValidation="False" ToolTip="Atender el Pedido"
                                                CommandName="atender" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-circle-o opcion_tabla"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="asignar_entrega" runat="server" CausesValidation="False" ToolTip="Cambiar quien entrega" OnClientClick="return confirm('Desea cambiar la entrega a OTROS ?');"
                                                CommandName="asignar_entrega" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-truck opcion_tabla"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="cambiar_factura" runat="server" CausesValidation="False" ToolTip="Cambiar Numero de Factura"
                                                CommandName="cambiar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil opcion_tabla"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="foto_factura" runat="server" CausesValidation="False" ToolTip="Foto de la Factura"
                                                CommandName="foto" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-camera opcion_tabla"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="entregar" runat="server" CausesValidation="False" ToolTip="Entregar Pedido" OnClientClick="return confirm('Desea Entregar el Pedido?');"
                                                CommandName="entregar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-square-o opcion_tabla"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="entrego" runat="server" CausesValidation="False" ToolTip="Historial" 
                                                CommandName="entrego" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-user-circle opcion_tabla "></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:FileUpload ID="FileUpload01"  onchange=" this.form.submit(); foto();" CssClass="ocultar" runat="server"/>
                    </div>
                    <asp:LinkButton ID="boton_oculto_si" OnClick="boton_oculto_si_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_entregar" OnClick="boton_oculto_entregar_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
                     <asp:LinkButton ID="boton_oculto_asignar_entrega" OnClick="boton_oculto_asignar_entrega_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_persona" OnClick="boton_oculto_persona_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_foto_factura" OnClick="boton_oculto_foto_factura_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_radio" OnClick="boton_oculto_radio1_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_radio2" OnClick="boton_oculto_radio2_Click" runat="server" Enabled="true" CssClass="boton_procesar button small"
                        Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i>
                    </asp:LinkButton>
            </ContentTemplate>    
        </asp:UpdatePanel>
    </form>
</body>
</html>
