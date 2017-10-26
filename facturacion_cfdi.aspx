<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/facturacion_cfdi.aspx.cs" Inherits="facturacion_cfdi" %>

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

        function aplicar_spiner(caja, valor) {
            $('#' + caja).spinner({
                max: valor, min: 1
            });
        }
    </script>

    <script>
        var delay;
        var progressbar;

        function dialogo_cargando() {
            delay = 2000;
            $(document).ready(function () {
                $("#menu").hide();
            });
            $('#dialog').dialog({
                modal: true,
                closeOnEscape: false,
                open: function (event, ui) {
                    iniciar_barra();
                    $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
                }
            });
            __doPostBack('downloadButton_oculto', '');
        }

        function destruir_dialogo_cargando() {
            delay = 10;
        }

        function destruir_de_volada() {
            $('.ui-dialog-content').dialog('close');

        }

        function rapido_error() {
            $('.ui-dialog-content').dialog('close');
            $('#panel_error').dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        window.close();
                    }
                }
            });
        }

        function dialogo_cargando_exportador() {
            delay = 330;
            $('#dialog').dialog({
                modal: true,
                closeOnEscape: false,
                open: function (event, ui) {
                    iniciar_barra();
                    $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
                }
            });
            __doPostBack('boton_exportar', '');
        }

        function iniciar_barra() {
            if (progressbar) {
                $("#progressbar").progressbar("destroy");
            }
            progressbar = $("#progressbar"),
            progressLabel = $("#etiqueta_cargando");
            progressbar.progressbar({
                value: false,
                change: function () {
                    progressLabel.text(progressbar.progressbar("value") + "%");
                },
                complete: function () {
                    progressLabel.text("Listo!");
                    $('.ui-dialog-content').dialog('close');
                }
            });

            function progress() {
                var val = progressbar.progressbar("value") || 0;
                progressbar.progressbar("value", val + 2);
                if (val < 99) {
                    setTimeout(progress, delay);
                }
            }
            setTimeout(progress, 5000);
            val = 0;
            progressLabel.text("Cargando..");
        }
    </script>
    <style>
        #progressbar {
            margin-top: 20px;
        }

        .progress-label {
            font-weight: bold;
            text-shadow: 1px 1px 0 #fff;
        }

        .ui-dialog-titlebar-close {
            display: none;
        }
    </style>
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
            <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-spin fa-3x"></i></asp:Label>
        </asp:Panel>
        <div id="menu" class="barra_superior">
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
            <asp:UpdatePanel ID="cargando" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="dialog" title="Generacion de CFDI">
                        <div class="progress-label"></div>
                        <div id="progressbar"></div>
                    </div>
                    <asp:Button ID="downloadButton_oculto" OnClick="cargar_funciones" runat="server" Style="display: none;" Text="Button" />
                    </div>
                    <asp:Panel ID="panel_error" Visible="false" runat="server" title="E R R O R">
                        <div id="dialog-error">
                            <p>
                                <span class="ui-icon ui-icon-alert" style="float: left;margin: 0 7px 50px 0;"></span>
                                La Generacion de este CFDI tuvo un error, el mensaje que devuelve el PAC es este:
                            </p>
                            <p>
                                <asp:Label ID="log_error" runat="server"></asp:Label>
                            </p>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="downloadButton_oculto" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
