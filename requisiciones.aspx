<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/requisiciones.aspx.cs"
    Inherits="requisiciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript">
    function convertir_mover() {
        $("#panel_atender_requisicion").draggable();
        $("#panel_ordenes_compra_requisicion").draggable();
    }
    var imprimir_requisicion, imprimir_orden_compra;
    function abrir_imprimir_requisicion() {
        if (!imprimir_requisicion || imprimir_requisicion.closed) {
            imprimir_requisicion = window.open("imprimir_requisicion.aspx", "Imprimir Requisicion", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_requisicion.focus();
        }
    }
    function abrir_imprimir_orden_compra() {
        if (!imprimir_orden_compra || imprimir_orden_compra.closed) {
            imprimir_orden_compra = window.open("imprimir_ordenes.aspx", "Imprimir Orden", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_orden_compra.focus();
        }
    }
    function cerrar_ventanas() {
        if (imprimir_requisicion && !imprimir_requisicion.closed) {
            imprimir_requisicion = window.open("about:blank", "Imprimir Requisicion");
            imprimir_requisicion.close();
        }
        if (imprimir_orden_compra && !imprimir_orden_compra.closed) {
            imprimir_orden_compra = window.open("about:blank", "Imprimir Orden");
            imprimir_orden_compra.close();
        }
    }
    var mouse = false, keyboard = false;
    $(function () {

        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };
        setInterval(actualizacion, 5000);
    });

    function actualizacion() {
        if (!mouse && !keyboard) {
            var boton = document.getElementById('actualizar');
            boton.click();
        }
        else {
            mouse = false;
            keyboard = false;
            window.opener.document.getElementById('caja_contador').value = "0";
        }
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        ventana = 0;
        if (boton.toString() == 'si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_cancelar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_procesar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_procesar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_aprobar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_aprobar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_rechazar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_rechazar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_pendientes') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_pendientes');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_terminadas') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_terminadas');
                boton.click();
            }, 600);
        }
    }
    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje');
            boton.click();
        }, 1800);

    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
    function panel_sobrepuesto_comentario() {
        $("#panel_comentario").dialog({
            width: "auto",
            title: "Comentarios"
        });
        convertir_mover();
    }
    window.onload = function () {

    }
    function pageLoad() {
        $(function () {
            $("#buscar_fecha").datepicker({ dateFormat: 'm/d/yy', disableTextInput: true, maxDate: "0D" }).val();
        });
        $(function () {
            var $rows = $('#tabla_requisiciones tr[class!="GridHeader"]');
            $('#buscar_texto').keyup(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });
        });
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Requisiciones</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formulario" runat="server">
        <div class="principal">
            <asp:ScriptManager ID="manejador_scripts" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="panel_actualizacion_padre" runat="server" ChildrenAsTriggers="True"
                UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                        <asp:Panel ID="panel_confirmacion" runat="server" CssClass="panel_confirmacion">
                            <p class="texto_bloqueo">
                                <asp:Label runat="server" ID="Mensaje_confirmacion" Text=""></asp:Label>&nbsp;<i
                                    class="fa fa-question-circle rojo"></i>
                            </p>
                            <asp:LinkButton ID="si" runat="server" CssClass="boton_confirmacion boton_si" OnClick="boton_si_Click">Si</asp:LinkButton>
                            <asp:LinkButton ID="no" runat="server" CssClass="boton_confirmacion boton_no" OnClick="boton_no_Click">No</asp:LinkButton>
                            <div class="separador_altas">
                            </div>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                        </asp:Panel>
                        <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClick="cerrar_mensaje_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Requisiciones</asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                            OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="separador_altas"></div>
                    <div class="contenido">
                        <div class="panel_procesar">
                            <asp:Label ID="etiqueta_buscar" runat="server" CssClass="etiquetas_barra_superior" Text="Buscar por: "></asp:Label>
                            <asp:TextBox type="text" ID="buscar_texto" runat="server" CssClass="caja_buscar" placeholder="Introduzca busqueda"></asp:TextBox>
                        </div>
                        <asp:Panel ID="panel_atender_requisicion" draggable="true" runat="server" CssClass="ui-widget-content panel_sobrepuesto" Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="cerrar_panel_sobrepuesto" runat="server" CausesValidation="False"
                                    OnClick="cerrar_panel_Click" ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <asp:Panel ID="panel_comentario" runat="server" CssClass="panel_precios modulo-esp"
                                Style="display: none">
                                <asp:Label ID="etiqueta_comentarios" EnableViewState="false" runat="server" CssClass="control"
                                    Text="Comentario"></asp:Label>
                                <asp:TextBox ID="caja_comentarios" runat="server" CssClass="caja_comentario control"
                                    TextMode="MultiLine" Enabled="False" onfocus="return posicionar_cursor(this.id);"></asp:TextBox>
                            </asp:Panel>
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_codigo_clave" EnableViewState="false" runat="server" CssClass="etiquetas_barra_superior"
                                    Text="Clave Requisicion"></asp:Label>
                                <asp:TextBox ID="caja_codigo_requisicion" CssClass="caja_buscar" runat="server" Enabled="False"></asp:TextBox>
                            </div>
                            <div class="limitado_chico">
                                <asp:GridView ID="tabla_productos_requisicion" runat="server" AutoGenerateColumns="False"
                                    CssClass="tabla" DataSource='<%# datos_productos_requisicion() %>' OnRowCommand="tabla_productos_requisicion_RowCommand"
                                    DataKeyNames="clave_carrito_requisicion,codigo_proveedor" ShowHeaderWhenEmpty="True">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Clave" DataField="clave_carrito_requisicion"></asp:BoundField>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                        <asp:BoundField HeaderText="Costo" DataField="precio" DataFormatString="{0:F}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="N.Costo" ShowHeader="True">
                                            <HeaderStyle CssClass="costo_h" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="costo_modificable" CssClass="cantidad_costo" onkeypress="return numeros_punto(event);"
                                                    MaxLength="10" runat="server" Width="80px" Text='<%#Eval("precio","{0:N2}") %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Proveedor" DataField="proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                        <asp:BoundField HeaderText="Costo T." DataField="precio_total" DataFormatString="{0:F}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Aprobacion" ShowHeader="True">
                                            <HeaderStyle CssClass="cabecera_columna_clientes columna_boton" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="checar" runat="server" CssClass="checado" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="comentarios" runat="server" CausesValidation="False" ToolTip="Ver comentarios del producto en la requisicion"
                                                    CommandName="comentario" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-comment opcion_tabla"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="actualizar" runat="server" CausesValidation="False" ToolTip="Actualizar nuevo costo"
                                                    CommandName="nuevo_costo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-refresh opcion_tabla"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="separador_altas"></div>
                            <asp:Panel ID="panel_procesar" runat="server" CssClass="panel_procesar">
                                <asp:LinkButton ID="boton_procesar" runat="server" ToolTip="Procesar la requisicion"
                                    Style="text-decoration: none;" CssClass="botones_requisiciones aprobar" OnClick="boton_procesar_Click">Procesar</asp:LinkButton>
                                <asp:LinkButton ID="boton_aprobar" runat="server" ToolTip="Aprobar la requisicion"
                                    Style="text-decoration: none;" CssClass="botones_requisiciones aprobar" OnClick="boton_aprobar_Click">Aprobar</asp:LinkButton>
                                <asp:LinkButton ID="boton_rechazar" runat="server" ToolTip="Rechazar elementos de la requisicion"
                                    Style="text-decoration: none;" CssClass="botones_requisiciones rechazar" OnClick="boton_rechazar_Click">Rechazar</asp:LinkButton>
                                <asp:LinkButton ID="seleccionar_todo" runat="server" ToolTip="Seleccionar todos los productos"
                                    Style="text-decoration: none;" CssClass="botones_requisiciones seleccionar" OnClick="seleccionar_todo_Click">Seleccionar</asp:LinkButton>
                                <asp:LinkButton ID="boton_oculto" runat="server" Enabled="false" CssClass="boton_procesar button small"
                                    Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                            </asp:Panel>
                            <div class="separador_altas"></div>
                        </asp:Panel>
                        <asp:Panel ID="panel_ordenes_compra_requisicion" draggable="true" runat="server" CssClass="ui-widget-content panel_sobrepuesto_enviar" Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="cerrar_ordenes_compras_requisicion" runat="server" CausesValidation="False"
                                    OnClick="cerrar_panel_ordenes_compra_Click" ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_req" EnableViewState="false" runat="server" CssClass="etiquetas_barra_superior"
                                    Text="Clave Requisicion"></asp:Label>
                                <asp:TextBox ID="caja_requisicion" CssClass="caja_buscar" runat="server" Enabled="False"></asp:TextBox>
                            </div>
                            <div class="separador_altas"></div>
                            <div class="limitado_chico">
                                <asp:GridView ID="tabla_ordenes_compra_requisicion" runat="server" AutoGenerateColumns="False"
                                    CssClass="tabla" DataSource='<%# datos_ordenes_compra_requisicion() %>' OnRowCommand="tabla_ordenes_compra_requisicion_RowCommand"
                                    DataKeyNames="clave_orden_compra" ShowHeaderWhenEmpty="True">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Clave" DataField="clave_orden_compra"></asp:BoundField>
                                        <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ver" runat="server" CausesValidation="False" ToolTip="Ver orden de compra"
                                                    CommandName="ver" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye opcion_tabla"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="separador_altas"></div>
                        </asp:Panel>
                        <div class="limitado" draggable="true">
                            <asp:GridView ID="tabla_requisiciones" runat="server" CssClass="tabla" DataSource='<%# datos_requisiciones() %>'
                                DataKeyNames="clave_requisicion" OnRowCommand="tabla_requisiciones_RowCommand"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Clave" DataField="clave_requisicion" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cliente" DataField="cliente"></asp:BoundField>
                                    <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    <asp:BoundField HeaderText="Proveedor" DataField="proveedor"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="atender" runat="server" CausesValidation="False" ToolTip="Atender requisicion"
                                                CommandName="atender_requisicion" CssClass="atender" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-circle-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="boton_imprimir_requisicion" runat="server" CausesValidation="False"
                                                ToolTip="imprimir requisicion" CommandName="imprimir_requisicion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-pdf-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True" Visible="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="boton_cancelar_requisicion" runat="server" CausesValidation="False"
                                                ToolTip="Cancelar requisicion" CommandName="cancelar_requisicion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-close controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True" Visible="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ordenes" runat="server" CausesValidation="False"
                                                ToolTip="Ordenes de compra" CommandName="ordenes" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-history controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="controles">
                            <asp:Label ID="etiqueta_numero_requisiciones" CssClass="etiquetas_barra_superior"
                                EnableViewState="false" runat="server" Text="No Requisiciones"></asp:Label>
                            <asp:TextBox ID="caja_numero_requisiciones" runat="server" CssClass="caja_buscar"
                                Enabled="False"></asp:TextBox>
                            <asp:LinkButton ID="boton_pendientes" runat="server" ToolTip="Mostrar requisiciones pendientes"
                                Style="text-decoration: none" OnClick="boton_pendientes_Click" CssClass="botones_requisiciones_chicos aprobar">Pendientes</asp:LinkButton>
                            <asp:LinkButton ID="boton_terminadas" runat="server" ToolTip="Mostrar requisiciones terminadas"
                                Style="text-decoration: none" OnClick="boton_terminadas_Click" CssClass="botones_requisiciones_chicos rechazar">Terminadas</asp:LinkButton>
                        </div>
                    </div>
                    <asp:Button ID="actualizar" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"
                        OnClick="actualizar_Click" />
                    <asp:LinkButton ID="boton_oculto_cancelar" OnClick="boton_oculto_cancelar_Click"
                        runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_procesar" OnClick="boton_oculto_procesar_Click"
                        runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_aprobar" OnClick="boton_oculto_aprobar_Click" runat="server"
                        Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_rechazar" OnClick="boton_oculto_rechazar_Click"
                        runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:Button ID="boton_oculto_pendientes" runat="server" OnClick="boton_oculto_pendientes_Click"
                        Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_terminadas" runat="server" OnClick="boton_oculto_terminadas_Click"
                        Visible="True" Style="visibility: hidden" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="tabla_requisiciones" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
