<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/facturacion_especial.aspx.cs" Inherits="codigo_facturacion_especial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Facturacion</title>
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/mario.css" />
    <script type="text/javascript">
        var imprimir_factura_electronica = null;
        var imprimir_xml = null;
        $(function () {
            $("input:checkbox").change(function () {
                if ($(this).prop("checked")) {
                    var fila = $(this).closest("tr");
                    var valor = parseInt(fila.find("td:eq(4)").text());
                    var caja_cantidad = fila.find(".valor_maximo_facturacion_electronica").attr("id");
                    aplicar_spiner(caja_cantidad, valor);
                    $('#' + caja_cantidad).val(valor);
                    $('#' + caja_cantidad).show();
                }
                else {
                    var fila = $(this).closest("tr");
                    var caja_cantidad = fila.find(".valor_maximo_facturacion_electronica").attr("id");
                    $('#' + caja_cantidad).val("");
                    if ($('#' + caja_cantidad).spinner("instance")) {
                        $('#' + caja_cantidad).spinner("destroy");
                        $('#' + caja_cantidad).hide();
                    } else {
                        $('#' + caja_cantidad).spinner();
                        $('#' + caja_cantidad).show();
                    }
                }
            });
            $("#tabs").tabs({
                activate: function () {
                    var tab_guardado = $('#tabs').tabs('option', 'active');
                    $("#<%=tab_seleccionado.ClientID%>").val(tab_guardado);
                },
                active: document.getElementById('<%= tab_seleccionado.ClientID %>').value
            });
        });
        function abrir() {
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        onload = abrir();
        function salir() {
            window.close();
        }
        function abrir_imprimir_facturacion() {
            if (!imprimir_factura_electronica || imprimir_factura_electronica.closed) {
                imprimir_factura_electronica = window.open("imprimir_factura_electronica.aspx", "Imprimir Factura", "width=1200, height=700,scrollbars = yes,resizable = false");
            }
            else {
                imprimir_factura_electronica.focus();
            }
        }
        function abrir_imprimir_xml() {
            if (!imprimir_xml || imprimir_xml.closed) {
                imprimir_xml = window.open("imprimir_xml.aspx", "Mostrar XML", "width=1200, height=700,scrollbars = yes,resizable = false");
            }
            else {
                imprimir_xml.focus();
            }
        }
        function cargar(boton) {
            if (boton.toString() == 'llenar_campos') {
                setTimeout(function () {
                    var boton = document.getElementById('llenar_campos');
                    boton.click();
                }, 1000);
            }
        }
        function aplicar_spiner(caja, valor) {
            $('#' + caja).spinner({
                max: valor, min: 1
            });
        }
    </script>
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizacion" runat="server"></asp:UpdatePanel>
        <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
            <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-spin fa-3x"></i></asp:Label>
        </asp:Panel>
        <div class="barra_superior">
            <div class="espacio_logotipo">
                <img class="logotipo" src="img/inklaser.jpeg" />
            </div>
            <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Facturacion Electronica</asp:Label>
            <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i>
            </asp:LinkButton>
            <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
        </div>
        <div id="tabs" style="position: absolute; margin-top: 5%; width: 100%">
            <ul>
                <li><a href="#tabs-1">Solicitud</a></li>
                <li><a href="#tabs-2">Facturas Pendientes</a></li>
                <li><a href="#tabs-3">Facturas Terminadas</a></li>
            </ul>
            <div id="tabs-1">
                <ul class="lista_horizontales">
                    <li>
                        <ul class="lista_verticales">
                            <li>
                                <p>
                                    <asp:Label ID="tipo_factura" runat="server">Tipo de Factura:</asp:Label>
                                </p>
                                <asp:DropDownList ID="lista_tipo_factura" runat="server" AutoPostBack="True" Enabled="false" CssClass="caja_normal_facturacion" OnSelectedIndexChanged="lista_tipo_factura_SelectedIndexChanged">
                                    <asp:ListItem>SELECCIONAR</asp:ListItem>
                                    <asp:ListItem>INGRESO</asp:ListItem>
                                    <asp:ListItem>EGRESO</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="metodo_pago" runat="server">Forma de Pago:</asp:Label>
                                </p>
                                <asp:DropDownList ID="lista_metodo_pago" runat="server" AutoPostBack="true" CssClass="caja_normal_facturacion" OnSelectedIndexChanged="lista_metodo_pago_SelectedIndexChanged">
                                    <asp:ListItem>SELECCIONAR</asp:ListItem>
                                    <asp:ListItem>EFECTIVO</asp:ListItem>
                                    <asp:ListItem>CHEQUE</asp:ListItem>
                                    <asp:ListItem>TRANSFERENCIA</asp:ListItem>
                                    <asp:ListItem>TARJETA DE CREDITO</asp:ListItem>
                                    <asp:ListItem>TARJETA DE DEBITO</asp:ListItem>
                                    <asp:ListItem>POR DEFINIR</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="tipo_venta" runat="server">Tipo de Pago:</asp:Label>
                                </p>
                                <asp:DropDownList ID="lista_tipo_venta" runat="server" AutoPostBack="True" CssClass="caja_normal_facturacion" OnSelectedIndexChanged="lista_tipo_pago_SelectedIndexChanged">
                                    <asp:ListItem>SELECCIONAR</asp:ListItem>
                                    <asp:ListItem>PAGO EN UNA SOLA EXHIBICION</asp:ListItem>
                                    <asp:ListItem>PAGO EN PARCIALIDADES O DIFERIDO</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="lista_verticales">
                            <li>
                                <p>
                                    <asp:Label ID="cliente_facturar" runat="server">Cliente:</asp:Label>
                                </p>
                                <asp:DropDownList ID="lista_cliente_facturar" runat="server" CssClass="caja_normal_facturacion" AutoPostBack="True" OnSelectedIndexChanged="lista_cliente_facturar_SelectedIndexChanged">
                                    <asp:ListItem>SELECCIONAR</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="banco" runat="server" Visible="false">Banco:</asp:Label>
                                </p>
                                <asp:DropDownList ID="lista_tipo_banco" CssClass="caja_normal_facturacion" runat="server" Visible="false">
                                    <asp:ListItem>SELECCIONAR</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="digitos" runat="server" Visible="false">Cuenta Bancaria:</asp:Label>
                                </p>
                                <asp:TextBox ID="caja_digitos" runat="server" CssClass="caja_normal_facturacion" MaxLength="4" Style="text-transform: uppercase" Visible="false"></asp:TextBox>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="lista_verticales">
                            <li>
                                <p>
                                    <asp:Label ID="folio_factura" runat="server">Folio de Factura:</asp:Label>
                                </p>
                                <asp:TextBox ID="caja_folio_factura" CssClass="caja_normal_facturacion" runat="server"></asp:TextBox>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="dias_pagar" runat="server">Dias a Pagar:</asp:Label>
                                </p>
                                <asp:TextBox ID="caja_dias_pagar" CssClass="caja_normal_facturacion" runat="server" Enabled="false"></asp:TextBox>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="cotizacion_facturar" runat="server" Visible="false">Cotizacion:</asp:Label>
                                </p>
                                <asp:DropDownList ID="lista_cotizacion_facturar" runat="server" CssClass="caja_normal_facturacion" AutoPostBack="True" Enabled="true" Visible="false" OnSelectedIndexChanged="lista_cotizacion_facturar_SelectedIndexChanged"></asp:DropDownList>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <ul class="lista_verticales">
                            <li>
                                <p>
                                    <asp:Label ID="uso_cfdi" runat="server">Uso CFDI:</asp:Label>
                                </p>
                                 <asp:DropDownList ID="lista_uso_cfdi" runat="server" CssClass="caja_normal_facturacion" AutoPostBack="True" Enabled="true" OnSelectedIndexChanged="lista_uso_cfdi_SelectedIndexChanged">
                                     <asp:ListItem>SELECCIONAR</asp:ListItem>
                                     <asp:ListItem>ADQUISICION POR MERCANCIAS</asp:ListItem>
                                     <asp:ListItem>DEVOLUCIONES, DESCUENTOS, BONIFICACIONES</asp:ListItem>
                                     <asp:ListItem>GASTOS EN GENERAL</asp:ListItem>
                                     <asp:ListItem>EQUIPO DE COMPUTO Y ACCESORIOS</asp:ListItem>
                                     <asp:ListItem>POR DEFINIR</asp:ListItem>
                                 </asp:DropDownList>
                            </li>
                    </li>
                </ul>
                <asp:Panel ID="panel_informacion_muestra" runat="server" CssClass="panel_sobrepuesto_tabla_muestra_facturacion_electronica" Visible="false">
                    <div class="separador_altas s_azul"></div>
                    <div class="limitado_chico">
                        <asp:GridView ID="tabla_informacion_muestra" runat="server" AutoGenerateColumns="False" DataKey="codigo" DataSource='<%# insertar_tabla_productos_muestra() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
                            <PagerSettings />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField HeaderText="Código" DataField="codigo_informacion_muestra">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto_informacion_muestra">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad_informacion_muestra">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Precio" DataField="precio_informacion_muestra" DataFormatString="{0:C2}">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="controles" style="margin-left: 10%;">
                        <asp:Label ID="marcador_requisicion_muestra" runat="server" Visible="false">Incluir Requisicion ?</asp:Label>
                        <asp:CheckBox ID="verificar_requisicion_muestra" runat="server" AutoPostBack="true" Visible="false" OnCheckedChanged="verificar_requisicion_muestra_CheckedChanged" />
                        <asp:Label ID="mensaje_informacion_muestra" runat="server">Desea Agregar esta cotizacion?</asp:Label>
                        <asp:LinkButton ID="boton_informacion_muestra_si" runat="server" Style="text-decoration: none;" OnClick="boton_informacion_muestra_si_Click">SI</asp:LinkButton>
                        <asp:LinkButton ID="boton_informacion_muestra_no" runat="server" Style="text-decoration: none;" OnClick="boton_informacion_muestra_no_Click">NO</asp:LinkButton>
                    </div>
                </asp:Panel>
                <asp:Panel ID="panel_informacion_requisicion" runat="server" CssClass="panel_sobrepuesto_tabla_requisicion_facturacion_electronica" Visible="false">
                    <div class="separador_altas s_azul"></div>
                    <div class="limitado_chico">
                        <asp:GridView ID="tabla_facturacion_electronica_requisicion" runat="server" AutoGenerateColumns="False" DataKey="codigo" DataSource='<%# insertar_tabla_productos_requisicion() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
                            <PagerSettings />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField HeaderText="Código" DataField="codigo_informacion_requisicion">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto_informacion_requisicion">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad_informacion_requisicion">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Precio" DataField="precio_informacion_requisicion" DataFormatString="{0:C2}">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="controles" style="margin-left: 10%;">
                        <asp:Label ID="mensaje_informacion_requisicion" runat="server">Desea Agregar esta Requisicion?</asp:Label>
                        <asp:LinkButton ID="boton_informacion_requisicion_si" runat="server" Style="text-decoration: none;" OnClick="boton_informacion_requisicion_si_Click">SI</asp:LinkButton>
                        <asp:LinkButton ID="boton_informacion_requisicion_no" runat="server" Style="text-decoration: none;" OnClick="boton_informacion_requisicion_no_Click">NO</asp:LinkButton>
                    </div>
                </asp:Panel>
                <div class="separador_mario"></div>
                <div class="main_izquierdo">
                    <div class="separador_altas s_azul">
                        <p class="negro_grande">Productos Pre-Factura</p>
                    </div>
                    <div class="limitado_corto">
                        <asp:GridView ID="tabla_facturacion_electronica_previa" runat="server" AutoGenerateColumns="False" DataKey="codigo" DataSource='<%# insertar_tabla_productos_previa() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="validador_facturacion" runat="server" Checked="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Código" DataField="codigo_facturacion_electronica_previo">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto_facturacion_electronica_previo">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Precio Unitario" DataField="precio_unitario_facturacion_electronica_previo" DataFormatString="{0:C2}">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad Total" DataField="cantidad_facturacion_electronica_previo">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Cantidad a Facturar">
                                    <ItemTemplate>
                                        <asp:TextBox ID="caja_cantidad_facturar_previo" class="valor_maximo_facturacion_electronica" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Precio Total" DataField="precio_total_facturacion_electronica_previo" DataFormatString="{0:C2}">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Clave" DataField="clave_facturacion_electronica_previo">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="controles_abajo">
                        <asp:LinkButton ID="boton_pasar_valores" runat="server" CssClass="botones_cotizaciones_chicos b_verde" Visible="false" OnClick="boton_pasar_valores_Click">Agregar</asp:LinkButton>
                    </div>
                    <p>
                        <asp:Label ID="nota_factura" runat="server">Nota:</asp:Label>
                    </p>
                    <asp:TextBox ID="caja_nota_factura" CssClass="caja_normal_facturacion" runat="server"></asp:TextBox>
                </div>
                <div class="main_derecho">
                    <div class="separador_altas s_azul">
                        <p class="negro_grande">Productos a Facturar</p>
                    </div>
                    <div class="limitado_corto">
                        <asp:GridView ID="tabla_facturacion_electronica_final" runat="server" AutoGenerateColumns="False" DataKey="codigo" DataSource='<%# insertar_tabla_productos_final() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField HeaderText="Código" DataField="codigo_facturacion_electronica_final">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="producto_facturacion_electronica_final">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Precio Unitario" DataField="precio_unitario_facturacion_electronica_final" DataFormatString="{0:C2}">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad Faltante" DataField="cantidad_faltante_facturacion_electronica_final">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Cantidad Facturada">
                                    <ItemTemplate>
                                        <asp:TextBox ID="caja_cantidad_facturada_final" Enabled="false" Text='<%#Eval("caja_cantidad_facturada_final") %>' runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Precio Total" DataField="precio_total_facturacion_electronica_final" DataFormatString="{0:C2}">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Clave" DataField="clave_facturacion_electronica_final">
                                    <HeaderStyle CssClass="cabecera_gridview" />
                                </asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="controles_abajo">
                        <asp:LinkButton ID="boton_guardar_facturacion" runat="server" CssClass="botones_cotizaciones_chicos b_turqueza" Visible="false" OnClick="boton_guardar_facturacion_Click">Guardar</asp:LinkButton>
                    </div>
                    <p>
                        <asp:Label ID="orden_compra_factura" runat="server">Orden Compra:</asp:Label>
                    </p>
                    <asp:TextBox ID="caja_orden_compra_factura" CssClass="caja_normal_facturacion" runat="server"></asp:TextBox>
                </div>
            </div>
            <div id="tabs-2">
                <asp:GridView ID="tabla_facturas_pendientes" runat="server" CssClass="tabla_factura_terminada" DataSource='<%# datos_facturas_pendientes()  %>'
                    DataKeyNames="clave_folio_factura_pendiente" OnRowCommand="tabla_facturas_pendientes_RowCommand"
                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                    <HeaderStyle CssClass="GridHeader" />
                    <PagerSettings Visible="False" />
                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                    <AlternatingRowStyle CssClass="GridRow" />
                    <Columns>
                        <asp:BoundField HeaderText="Clave" DataField="clave_folio_factura_pendiente"></asp:BoundField>
                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal_factura_pendiente"></asp:BoundField>
                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor_factura_pendiente"></asp:BoundField>
                        <asp:BoundField HeaderText="Cliente" DataField="cliente_factura_pendiente"></asp:BoundField>
                        <asp:BoundField HeaderText="Estado" DataField="estado_factura_pendiente"></asp:BoundField>
                        <asp:BoundField HeaderText="Fecha" DataField="fecha_factura_pendiente"></asp:BoundField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Ver XML"
                                    CommandName="XML" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-code-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" ToolTip="Ver PDF"
                                    CommandName="PDF" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-pdf-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" ToolTip="Enviar por correo"
                                    CommandName="Enviar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-envelope-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" ToolTip="Descargar los archivos"
                                    CommandName="Descargar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-download controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="Completar" runat="server" CausesValidation="False" ToolTip="Facturar productos pendientes de la Factura parcial"
                                    CommandName="Completar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-usd controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div id="tabs-3">
                <asp:GridView ID="tabla_facturas_terminadas" runat="server" CssClass="tabla_factura_terminada" DataSource='<%# datos_facturas_terminadas()  %>'
                    DataKeyNames="clave_folio_factura_terminada" OnRowCommand="tabla_facturas_terminadas_RowCommand"
                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                    <HeaderStyle CssClass="GridHeader" />
                    <PagerSettings Visible="False" />
                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                    <AlternatingRowStyle CssClass="GridRow" />
                    <Columns>
                        <asp:BoundField HeaderText="Clave" DataField="clave_folio_factura_terminada"></asp:BoundField>
                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal_factura_terminada"></asp:BoundField>
                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor_factura_terminada"></asp:BoundField>
                        <asp:BoundField HeaderText="Cliente" DataField="cliente_factura_terminada"></asp:BoundField>
                        <asp:BoundField HeaderText="Estado" DataField="estado_factura_terminada"></asp:BoundField>
                        <asp:BoundField HeaderText="Fecha" DataField="fecha_factura_terminada"></asp:BoundField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Ver XML"
                                    CommandName="XML" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-code-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" ToolTip="Ver PDF"
                                    CommandName="PDF" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-file-pdf-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" ToolTip="Enviar por correo"
                                    CommandName="Enviar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-envelope-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" ToolTip="Descargar los archivos"
                                    CommandName="Descargar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-download controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ShowHeader="True">
                            <ItemTemplate>
                                <asp:LinkButton ID="Cancelar" runat="server" CausesValidation="False" ToolTip="Cancelar Factura"
                                    CommandName="Cancelar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash-o controles_tablas"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:HiddenField ID="tab_seleccionado" runat="server" Value="0" />
    </form>
</body>
</html>
