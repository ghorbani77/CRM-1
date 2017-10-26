<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/cotizaciones.aspx.cs" Inherits="cotizaciones" %>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript">
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
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
    function buscar_con_memoria() {
        var tipo_busqueda = '<%= Session["tipo_busqueda"] %>';
        var busqueda = '<%= Session["busqueda"] %>';
        var filtro = busqueda.toUpperCase();
        var tabla = document.getElementById('tabla_cotizaciones');
        var renglones = tabla.rows;
        var i = 0, renglon, celda;
        if (tipo_busqueda == "texto") {
            document.getElementById('buscar_texto').value = busqueda;
        }
        if (tipo_busqueda == "fecha") {
            $('#buscar_fecha').value = busqueda;
        }
        for (i = 1; i < renglones.length; i++) {
            renglon = renglones[i];
            var resultado = false;
            for (var j = 0; j < renglon.cells.length; j++) {
                celda = renglon.cells[j];
                if (celda.innerHTML.toUpperCase().indexOf(filtro) >= 0) {
                    resultado = true;
                    break;
                }
            }
            if (!resultado) {
                renglon.style['display'] = 'none';

            }
            else {
                renglon.style.display = '';
            }
        }
        return false;
    }
    $(document).ready(function () {
        buscar_con_memoria();
    });
    function pageLoad() {
        $(function () {
            $("#buscar_fecha").datepicker({ dateFormat: 'm/d/yy', disableTextInput: true, maxDate: "0D" }).val();
        });
        $(function () {
            var $rows = $('#tabla_cotizaciones tr[class!="GridHeader"]');
            $('#buscar_fecha').change(function () {
                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
<html id="ventana" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Mis cotizaciones</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizaciones" runat="server">
            <ContentTemplate>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
                </asp:Panel>
                <div class="principal">
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Mis cotizaciones</asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir" OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="separador_altas"></div>
                    <div class="contenido">
                        <div class="panel_procesar">
                            <asp:Label ID="etiqueta_buscar" runat="server" CssClass="etiquetas_barra_superior" Text="Buscar por: "></asp:Label>
                            <asp:RadioButton ID="texto" runat="server" Text="Cliente" AutoPostBack="True" GroupName="busqueda" OnCheckedChanged="texto_CheckedChanged" />
                            <asp:RadioButton ID="fecha" Text="Fecha" runat="server" AutoPostBack="True" GroupName="busqueda" OnCheckedChanged="fecha_CheckedChanged" />
                            <asp:TextBox type="text" ID="buscar_texto" runat="server" CssClass="caja_buscar" placeholder="Introduzca busqueda"></asp:TextBox>
                            <asp:TextBox type="text" ID="buscar_fecha" runat="server" CssClass="caja_buscar" placeholder="Seleccione Fecha"></asp:TextBox>
                        </div>
                        <div class="limitado">
                            <asp:GridView ID="tabla_cotizaciones" runat="server" CssClass="tabla" DataSource="<%# datos_cotizaciones() %>"
                                DataKeyNames="clave_cotizacion" OnRowCommand="tabla_cotizaciones_OnRowCommand"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Clave" DataField="clave_cotizacion" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cliente" DataField="cliente"></asp:BoundField>
                                    <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                    <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ver_cotizacion" runat="server" CausesValidation="False"
                                                ToolTip="Ver cotizacion" CommandName="ver" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-check-circle-o controles_tablas"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="separador_altas"></div>
                    </div>

                    <div class="controles">
                        <div class="panel_procesar">
                            <asp:LinkButton ID="boton_pendientes" runat="server" OnClick="boton_pendientes_Click" ToolTip="Mostrar cotizaciones pendientes" Style="text-decoration: none" CssClass="botones_requisiciones aprobar">Pendientes</asp:LinkButton>
                            <asp:LinkButton ID="boton_terminadas" runat="server" OnClick="boton_terminadas_Click" ToolTip="Mostrar cotizaciones terminadas" Style="text-decoration: none" CssClass="botones_requisiciones rechazar">Terminadas</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <asp:Button ID="boton_oculto_pendientes" runat="server" OnClick="boton_oculto_pendientes_Click" Visible="True" Style="visibility: hidden" />
                <asp:Button ID="boton_oculto_terminadas" runat="server" OnClick="boton_oculto_terminadas_Click" Visible="True" Style="visibility: hidden" />
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>














