<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/pedidos_pendientes.aspx.cs" Inherits="pedidos_pendientes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
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
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_procesar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_procesar');
                boton.click();
            }, 600);
        }
    }
    function convertir_mover() {
        $("#panel_atender_pedido").draggable();
        $("#panel_comentarios_notas").draggable();
    }
    function cerrar_mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje');
            boton.click();
        }, 1000);
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pedidos pendientes - Inklaser</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/mario.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizaciones" runat="server">
            <ContentTemplate>
                <div class="principal">
                    <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                    </asp:Panel>
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Pedidos pendientes</asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                            OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="separador_altas">
                    </div>
                    <div class="contenido">
                        <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                        </asp:Panel>
                        <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClick="cerrar_mensaje_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
                        <asp:Panel ID="panel_atender_pedido" runat="server" CssClass="ui-widget-content panel_sobrepuesto" Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="boton_cerrar_atender_pedido" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_atender_pedido_Click"><i class="fa fa-times"></i></asp:LinkButton>
                            </div>
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_codigo_clave" CssClass="etiquetas_barra_superior" runat="server" Text="Clave pedido pendiente"></asp:Label>
                                <asp:TextBox ID="caja_codigo_pedido_pendiente" runat="server" Enabled="False" CssClass="caja_chica"></asp:TextBox>
                            </div>
                            <div class="limitado_chico">
                                <asp:GridView ID="tabla_productos_pedido" runat="server" AutoGenerateColumns="False" CssClass="tabla" DataSource='<%# datos_productos_pedido_pendiente() %>' ShowHeaderWhenEmpty="True">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad Apartada" DataField="cantidad_apartada"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad Surtida" DataField="cantidad_apartada_surtida"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="separador_altas">
                            </div>
                            <asp:Panel ID="panel_procesar" runat="server" CssClass="panel_procesar">
                                <asp:LinkButton ID="boton_procesar" runat="server" ToolTip="Procesar el backorder" Style="text-decoration: none;" CssClass="botones_requisiciones aprobar" OnClick="boton_procesar_Click">Procesar</asp:LinkButton>
                            </asp:Panel>
                            <div class="separador_altas">
                            </div>
                        </asp:Panel>
                        <div class="limitado">
                            <asp:GridView ID="tabla_pedidos_pendientes" runat="server" CssClass="tabla" DataSource='<%# datos_pedidos_pendientes() %>'
                                DataKeyNames="clave_pedido_pendiente"
                                OnRowCommand="tabla_pedidos_pendientes_RowCommand"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                PagerSettings-Visible="false">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Clave" DataField="clave_pedido_pendiente" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cliente" DataField="cliente"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad Requerida" DataField="cantidad"></asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="atender_backorder" runat="server" CausesValidation="False" ToolTip="Mostrar detalles del backorder"
                                                CommandName="atender_backorder" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-circle-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="controles">
                            <asp:Label ID="etiqueta_numero_pedidos_pendientes" CssClass="etiquetas_barra_superior" runat="server" Text="Pendientes"></asp:Label>
                            <asp:TextBox ID="caja_numero_pedidos_pendientes" runat="server" CssClass="caja_chica" Enabled="False"></asp:TextBox>
                            <asp:LinkButton ID="boton_regresar" runat="server" ToolTip="Volver al inventario" Style="text-decoration: none" CssClass="botones_requisiciones_chicos b_azul" OnClick="boton_regresar_Click">Volver</asp:LinkButton>
                        </div>
                    </div>
                </div>
                  <asp:LinkButton ID="boton_oculto_procesar" OnClick="boton_oculto_procesar_Click" runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
