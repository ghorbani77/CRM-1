<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/inventario_inspecciones.aspx.cs" Inherits="inventario_inspecciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inspecciones de Inventario - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="css/mario.css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/material-design-font.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"
        integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
        integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="crossorigin="anonymous"></script>
        <script type="text/javascript" language="javascript">
            function MainFunction() {
                var $rows = $('#tabla_inspecciones tr[class!="GridHeader"]');
                $('#buscarTexto').keyup(function () {
                    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                    $rows.show().filter(function () {
                        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                        return ! ~text.indexOf(val);
                    }).hide();
                });
                $('#buscarFecha').change(function () {
                    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                    $rows.show().filter(function () {
                        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                        return ! ~text.indexOf(val);
                    }).hide();
                });
                $(function () {
                    $("#buscarFecha").datepicker({ dateFormat: 'dd/mm/yy', maxDate: "0D" }).val();
                });
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
                }, 5000);
            })()
            function cargar(boton) {
                document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";

                if (boton.toString() == 'rbListaBuscar') {
                    setTimeout(function () {
                        var boton = document.getElementById('boton_oculto_rbListaBuscar');
                        boton.click();
                    }, 500);
                }
            }
            function abrir() {
                window.moveTo(0, 0);
                window.resizeTo(screen.availWidth, screen.availHeight);
            }
            onload.abrir();
            function salir() {
                window.close();
            }
</script>
</head>
<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="principalito">
                <div class="large-12 header-requisiciones header-prom">
                    <!--SECCION MENU-->
                    <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                        display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label>
                    </asp:Panel>
                    <span class="titulo left">Inspecciones de Inventario</span>
                </div>
                <div class="row">
                    <div class="inventario large-12 columns separador-top2 ajustador-tablas">
                      <div>
                        <asp:Label ID="lblBuscar" runat="server" Text="Seleccionar por: "></asp:Label>
                        <asp:RadioButtonList ID="rbListaBuscar" class ="ListaBuscar" runat="server" AutoPostBack="true" onselectedindexchanged="rbListaBuscar_SelectedIndexChanged">
                            <asp:ListItem>Texto</asp:ListItem>
                            <asp:ListItem>Fecha</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:TextBox type="text" id="buscarTexto" runat="server" placeholder="Seleccione para Buscar por Texto" Width="500px"></asp:TextBox>
                        <asp:TextBox type="text" id="buscarFecha" runat="server" placeholder="Seleccione para Buscar por Fecha" Width="300px"></asp:TextBox>
                    </div>
                        <div class="datos_pedidos">
                            <div class="limitado">
                                 <asp:GridView ID="tabla_inspecciones" runat="server" CssClass="tabla_pedidos" DataSource='<%# datos_inspecciones() %>'   
                                    DataKeyNames="clave_inspeccion" 
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible = "false">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
		                            <AlternatingRowStyle CssClass="GridAlternateRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Clave" DataField="clave_inspeccion" Visible="True" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Cliente" DataField="cliente" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad Inventario" DataField="cantidad_inventario"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad Fisica" DataField="cantidad_fisica"></asp:BoundField>
                                        <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                        <asp:BoundField HeaderText="Comentarios" DataField="comentario"></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha_inspeccion" DataFormatString="{0:d}" ></asp:BoundField>
                                    </Columns>
                                </asp:GridView> 
                            </div>
                            <br />
                            <br />
                            <div class="pie_tabla_pedidos large-2">
                                <ul class="horizontal">
                                    <li>
                                        <p>
                                            <asp:Label ID="LabelNumeroCotizaciones" runat="server" Text="No. Requisiciones"></asp:Label></p>
                                        <asp:TextBox ID="caja_numero_requisiciones" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                                </ul>
                            </div>
                        </div>
                        <div class="botones_pedidos">
                            <asp:LinkButton ID="BotonSalir" runat="server" OnClick="BotonSalir_Click" ToolTip="Salir"
                                Style="text-decoration: none" CssClass="boton_volver button small alert">Salir</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
             <!--'botones ocultos' -->
            <asp:Button ID="boton_oculto_rbListaBuscar" runat="server" OnClick="boton_oculto_rbListaBuscar_Click"
                Visible="True" Style="visibility: hidden" />
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>
