<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/ordenes_compra.aspx.cs"
    Inherits="ordenes_compra" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    function convertir_mover() {
        $("#panel_procesar_orden_compra").draggable();
        $("#panel_guia").draggable();
    }
    var imprimir_ordenes;
    //Función que busca el DIV, coge su valor y lo guarda en el HiddenField
    function abrir_imprimir_ordenes() {
        if (!imprimir_ordenes || imprimir_ordenes.closed) {
            imprimir = window.open("imprimir_ordenes.aspx", "Imprimir ordenes", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_ordenes.focus();
        }
    }
    function cerrar_ventanas() {
        if (imprimir_ordenes && !imprimir_ordenes.closed) {
            imprimir_ordenes = window.open("about:blank", "Imprimir ordenes");
            imprimir_ordenes.close();
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
                //  var boton = window.opener.document.getElementById('actualizar');
                // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                // window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);

    })()
    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje');
            boton.click();
        }, 1800);

    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'eliminar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_eliminar');
                boton.click();
                document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
            }, 1000);
        }
        if (boton.toString() == 'modificar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_modificar');
                boton.click();
                document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
            }, 1000);
        }

        if (boton.toString() == 'seleccion_ordenes') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_seleccion_ordenes');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'boton_procesar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_procesar');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'envio_correo') {
            setTimeout(function () {
                var boton = document.getElementById('boton_fantasma_si');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'asignar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_asignar');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'listo') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_listo');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'asignar_f') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_asignar_f');
                boton.click();
            }, 1000);
        }
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
    function pageLoad() {
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ordenes de compra</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'
        type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="formulario" runat="server">
        <div class="principal">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="panel_actualizacion" runat="server">
                <ContentTemplate>
                    <!- poner aqui el super panel -->
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server" CssClass="loading_rojo"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
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
                            <img alt="" class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Ordenes de compra</asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                            OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="separador_altas">
                    </div>
                    <div class="contenido">
                        <div class="panel_procesar">
                            <asp:RadioButton ID="ordenes_enviadas" Text="Enviadas" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" Checked="true"
                                OnCheckedChanged="ordenes_enviadas_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_procesadas" Text="Procesadas" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" OnCheckedChanged="ordenes_procesadas_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_asignadas" Text="Asignadas" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" OnCheckedChanged="ordenes_asignadas_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_almacen_locales" Text="Almacen locales" runat="server"
                                GroupName="crico" Visible="False"
                                AutoPostBack="true"
                                OnCheckedChanged="ordenes_almacen_locales_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_clientes" Text="Clientes" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" OnCheckedChanged="ordenes_clientes_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_foraneas" Text="Almacen Foraneas" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" OnCheckedChanged="ordenes_foraneas_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_sin_asignar" Text="Sin asignar" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" OnCheckedChanged="ordenes_sin_asignar_CheckedChanged" />
                            <asp:RadioButton ID="ordenes_listas" Text="Listas" runat="server" GroupName="crico" Visible="False"
                                AutoPostBack="true" OnCheckedChanged="ordenes_listas_CheckedChanged" />
                        </div>
                        <div class="limitado">
                            <asp:Panel ID="panel_guia" CssClass="ui-widget-content panel_sobrepuesto" runat="server" Visible="False">
                                <div class="separador_altas s_azul">
                                    <asp:LinkButton ID="cerrar_panel_sobrepuesto_guia" runat="server" CausesValidation="False"
                                        OnClick="cerrar_panel_guia_Click" ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                                </div>
                                <div class="separador_altas"></div>
                                <asp:Label ID="e_orden" runat="server" Text="Clave Orden" CssClass="etiquetas_barra_superior"></asp:Label>
                                <asp:TextBox ID="text_clave_orden" runat="server" Enabled="False" CssClass="caja_chica"></asp:TextBox>
                                <asp:Label ID="e_guia" runat="server" CssClass="etiquetas_barra_superior" Text="No. de Guia"></asp:Label>
                                <asp:TextBox ID="txt_no_guia" runat="server" Enabled="true" MaxLength="50" CssClass="caja_chica"></asp:TextBox>
                                <asp:Label ID="e_mensajeria" CssClass="etiquetas_barra_superior" runat="server" Text="Mensajeria"></asp:Label>
                                <asp:DropDownList ID="lista_mensajeria" runat="server" CssClass="caja_chica">
                                </asp:DropDownList>
                                <asp:LinkButton ID="boton_agregar_guia" runat="server" ToolTip="Agregar Guia" OnClick="agregar_nueva_guia"
                                    Style="text-decoration: none;" CssClass="botones_controles aprobar">Agregar</asp:LinkButton>
                                <asp:LinkButton ID="boton_modificar" runat="server" ToolTip="Guardar Cambios" OnClick="boton_modificar_click"
                                    Style="text-decoration: none; visibility: hidden !important; display: none;"
                                    CssClass="botones_controles_arriba aprobar">Guardar</asp:LinkButton>
                                <asp:LinkButton ID="boton_cancelar_editar" runat="server" ToolTip="Cancelar Edicion"
                                    Style="text-decoration: none; visibility: hidden; display: none; margin-left: 6px;"
                                    CssClass="botones_controles_arriba rechazar">Cancelar</asp:LinkButton>
                                <div class="limitado_chico">
                                    <asp:GridView ID="tabla_guia" runat="server" CssClass="tabla" AutoGenerateColumns="False"
                                        DataSource='<%# datos_guias() %>' ShowHeaderWhenEmpty="True" DataKeyNames="guia,estado,mensajeria"
                                        OnRowCommand="tabla_guias_RowCommand">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Guia" DataField="Guia"></asp:BoundField>
                                            <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                            <asp:BoundField HeaderText="Mensajeria" DataField="mensajeria"></asp:BoundField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_buscar_guia" runat="server" CausesValidation="False" ToolTip="Buscar Guia"
                                                        CommandName="buscar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-search controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_editar_guia" runat="server" CausesValidation="False" ToolTip="Modificar Guia"
                                                        CssClass="editar" CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btn_eliminar_guia" CssClass="confirmacion quitar_edicion" runat="server"
                                                        CausesValidation="False" ToolTip="Eliminar Guia" CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="panel_procesar_orden_compra" runat="server" CssClass="ui-widget-content panel_sobrepuesto"
                                Visible="False">
                                <div class="separador_altas s_azul">
                                    <asp:LinkButton ID="cerrar_panel_sobrepuesto" runat="server" CausesValidation="False"
                                        OnClick="cerrar_panel_Click" ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                                </div>
                                <div class="panel_procesar">
                                    <asp:Label ID="etiqueta_codigo_clave" runat="server" CssClass="etiquetas_barra_superior"
                                        Text="Clave Orden"></asp:Label>
                                    <asp:TextBox ID="caja_codigo_pedido" runat="server" Enabled="False" CssClass="caja_buscar"></asp:TextBox>
                                </div>
                                <div class="separador_altas">
                                </div>
                                <div class="limitado_chico">
                                    <asp:GridView ID="tabla_productos_orden_compra" runat="server" AutoGenerateColumns="False"
                                        CssClass="tabla" DataSource='<%# datos_productos_orden_compra() %>' ShowHeaderWhenEmpty="True"
                                        OnRowCommand="tabla_productos_orden_compra_RowCommand1">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Clave" DataField="clave_carrito_orden_compra"></asp:BoundField>
                                            <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor"></asp:BoundField>
                                            <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                            <asp:BoundField HeaderText="Cantidad" DataField="cantidad_total"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Surtir" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="cantidad" CssClass="caja_modificable" onkeypress="return numeros(event);"
                                                        MaxLength="10" runat="server" Width="80px" Text='<%#Eval("cantidad_total") %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Aprobar" ShowHeader="True">
                                                <HeaderStyle CssClass="cabecera_columna_clientes columna_boton" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="checar" runat="server" CssClass="checado" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="eliminar" runat="server" CausesValidation="False" ToolTip="Eliminar producto de la orden de compra y el backorder "
                                                        OnClientClick="return confirm('Desea eliminar el producto del carrito de compra?');"
                                                        CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="modificar" runat="server" CausesValidation="False" ToolTip="Modificar o Eliminar Producto de la orden"
                                                        OnClientClick="return confirm('Desea modificar el producto del carrito de compra?');"
                                                        CommandName="modificar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-floppy-o controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="controles">
                                    <asp:Panel ID="panel_procesar" runat="server" CssClass="panel_procesar">
                                        <!--------------------------------------------------------------------------------------->
                                        <asp:LinkButton ID="boton_procesar" runat="server" ToolTip="Procesar la orden de compra hacia el inventario"
                                            Style="text-decoration: none;" CssClass="botones_requisiciones b_azul" OnClick="boton_procesar_Click">Procesar</asp:LinkButton>
                                        <asp:LinkButton ID="boton_oculto" runat="server" Enabled="false" CssClass="boton_procesar button small"
                                            Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                                    </asp:Panel>
                                </div>
                            </asp:Panel>
                            <asp:GridView ID="tabla_ordenes_compra" runat="server" CssClass="tabla" DataSource='<%# datos_ordenes_compra() %>'
                                DataKeyNames="clave_orden_compra" OnRowCommand="tabla_ordenes_compra_RowCommand"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Sucursal" DataField="sucursal" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Proveedor" DataField="proveedor" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Clave" DataField="clave_orden_compra" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cliente" DataField="cliente"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Procesar la orden de compra para surtir inventario"
                                                CommandName="Procesar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-circle-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" ToolTip="Enviar orden de compra"
                                                CommandName="Enviar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-envelope-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" ToolTip="imprimir orden de compra"
                                                CommandName="PDF" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-pdf-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Listo" runat="server" CausesValidation="False" ToolTip="Marcar como Lista para recoger"
                                                OnClientClick="return confirm('Desea cambiar el estado de la orden de compra a lista para recoger?');"
                                                CommandName="listo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-square-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Local" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="asignar" runat="server" CausesValidation="False" ToolTip="Asignar a Mensajero"
                                                OnClientClick="return confirm('Desea asignar esta orden de compra al Mensajero?');"
                                                CommandName="asignar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-truck controles_tablas" ></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Foraneo" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="asignar_f" runat="server" CausesValidation="False" ToolTip="Asignar a Mensajero"
                                                OnClientClick="return confirm('Desea asignar esta orden de compra al Mensajero?');"
                                                CommandName="asignar_f" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-truck controles_tablas" ></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Guias" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="guia" runat="server" CausesValidation="False" ToolTip="Asignar a Guias"
                                                CssClass=" guia super_panel" CommandName="guia" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-barcode controles_tablas" ></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="controles">
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_numero_pedidos" runat="server" CssClass="etiquetas_barra_superior"
                                    Text="No Ordenes De Compra"></asp:Label>
                                <asp:TextBox ID="caja_numero_pedidos" runat="server" CssClass="caja_buscar" Enabled="False"></asp:TextBox>
                            </div>
                        </div>
                        <asp:LinkButton ID="boton_oculto_eliminar" OnClick="boton_oculto_eliminar_Click"
                            runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_modificar" OnClick="boton_oculto_modificar_Click"
                            runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_seleccion_ordenes" OnClick="boton_oculto_seleccion_ordenes_Click" runat="server"
                            Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_procesar" OnClick="boton_oculto_procesar_Click"
                            runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_asignar" OnClick="asignar_mensajero" runat="server"
                            Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_asignar_f" OnClick="asignar_mensajero_foraneo" runat="server"
                            Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_listo" OnClick="orden_lista" runat="server" Enabled="true"
                            CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden">Procesando&nbsp;&nbsp;<i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_fantasma_si" runat="server" OnClick="boton_oculto_si_Click"
                            Style="text-decoration: none; visibility: hidden" CssClass="boton_cotizar button small info"
                            Enabled="true"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;Enviando...</asp:LinkButton>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="tabla_ordenes_compra" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="tabla_guia" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
    </body>
    </html>