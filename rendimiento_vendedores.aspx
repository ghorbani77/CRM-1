<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/rendimiento_vendedores.aspx.cs" Inherits="rendimiento_vendedores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/chart2/Chart.js"></script>
    <script type="text/javascript" src="js/chart2/Chart.min.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link rel="stylesheet" href="css/base.css" type="text/css" />
    <link rel="stylesheet" href="css/material-design-font.css" />
    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css" type="text/css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="css/efectos_hover/hover.css" rel="stylesheet" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>

        function validar_cantidades() {
            $('#caja_monto_meta').keyup(function () {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            });
        }

        function cargar_fechas() {
            $('#caja_fecha_rendimiento_inicio').datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: "0D",
                maxDate: "1M",
            });
            $('#caja_fecha_rendimiento_final').datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: "1D",
                maxDate: "12M",
            });
        }
        function pageLoad(sender, arg) {
            if (!arg.get_isPartialLoad()) {
                cargar_fechas();
                validar_cantidades();
            }
            cargar_fechas();
            validar_cantidades();
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
                }
                else {
                    mouse = false;
                    keyboard = false;
                }
            }, 1000);
        })()
        function abrir() {
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        function salir() {

            window.close();
        }

        function cargar(boton) {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
            ventana = 0;
            if (boton.toString() == 'si') {
                setTimeout(function () {
                    var boton = document.getElementById('boton_oculto_si');
                    boton.click();
                }, 500);
            }
        }

        function mensaje() {
            setTimeout(function () {
                $('#mensajes').hide();
            }, 1800);
        }
        function cerrar_mensaje() {
            $('#mensajes').hide();
        }

        function sacalo(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                $(div).dialog({ width: 'auto' });
                img.src = "png/minus.png";
            } else {
                //div.style.display = "none";
                $(div).closest('.ui-dialog-content').dialog('close');
                img.src = "png/plus.png";
            }
            $(div).on('dialogclose', function (event) {
                div.style.display = "none";
                img.src = "png/plus.png";
            });
        }

        function sacatela(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                $(div).dialog({ width: 'auto' });
                img.src = "png/minus.png";
            } else {
                div.style.display = "none";
                $(div).closest('.ui-dialog-content').dialog('close');
                img.src = "png/plus.png";
            }
            $(div).on('dialogclose', function (event) {
                div.style.display = "none";
                img.src = "png/plus.png";
            });

        }

        function muestralo(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            var a;
            var myTableArray = new Array();
            $('.clon_categorias').closest(".clon_falso").remove();
            var clon = $(div).clone();
            $('.clon_categorias').html(clon.show());
        }

        $(function () {
            var tabs = $("#tabs").tabs();
            tabs.find(".ui-tabs-nav").sortable({
                axis: "x",
                stop: function () {
                    tabs.tabs("refresh");
                }
            });
        });

        $(function () {
            var $barra_1 = $('#barra_1').clone();
            var $barra_2 = $('#barra_2').clone();
            $('.clon_barra_1').html($barra_1);
            $('.clon_barra_2').html($barra_2);
        });
        function mostrar_panel_fechas() {
            if ($('#div_usuario_caja').is(":visible")) {
                $('#div59').hide();
                $('#div_usuario_caja').hide(500);
            }
            if ($('#div_exportar_caja').is(":visible")) {
                $('#div_exportar').hide();
                $('#div_exportar_caja').hide(500);
            }
            if ($('#div_fechas_caja').is(":visible")) {
                $('#div58').hide();
                $('#div_fechas_caja').hide(500);
            }
            else {
                $('#div_fechas_caja').show(500);
                $('#div58').show(500);
            }
            $('#caja_fecha_user_inicio').datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: new Date(2015, 1 - 1, 1),
                maxDate: "0M",
            });
            $('#caja_fecha_user_final').datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: new Date(2015, 1 - 1, 1),
                maxDate: "0M",
            });
            return false;
        }
        function mostrar_panel_usuario() {
            $('#caja_usuario_caja').keyup(function (e) {
                if (e.keyCode == 13) {
                    boton_usuario_caja.click();
                }
            });
            if ($('#div_exportar_caja').is(":visible")) {
                $('#div_exportar').hide();
                $('#div_exportar_caja').hide(500);
            }
            if ($('#div_fechas_caja').is(":visible")) {
                $('#div58').hide();
                $('#div_fechas_caja').hide(500);
            }
            if ($('#div_usuario_caja').is(":visible")) {
                $('#div59').hide();
                $('#div_usuario_caja').hide(500);
            }
            else {
                $('#div_usuario_caja').show(500);
                $('#div59').show(500);
            }
            return false;
        }
        function mostrar_panel_exportar() {
            if ($('#div_fechas_caja').is(":visible")) {
                $('#div58').hide();
                $('#div_fechas_caja').hide(500);
            }
            if ($('#div_usuario_caja').is(":visible")) {
                $('#div59').hide();
                $('#div_usuario_caja').hide(500);
            }
            if ($('#div_exportar_caja').is(":visible")) {
                $('#div_exportar').hide();
                $('#div_exportar_caja').hide(500);
            }
            else {
                $('#div_exportar_caja').show(500);
                $('#div_exportar').show(500);
            }
            return false;
        }

        $(function () {
            $('#buscar_tabla').keyup(function (e) {
                if (e.keyCode == 13) {
                    var $rows = $('#tabla_registros tr[class!="GridHeader"]');
                    var val = $.trim($('#buscar_tabla').val()).replace(/ +/g, ' ').toLowerCase();
                    $rows.show().filter(function () {
                        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                        return ! ~text.indexOf(val);
                    }).hide();
                }
            });
        });

        function buscar_registros() {
            var $rows = $('#tabla_registros tr[class!="GridHeader"]');
            var val = $.trim($('#buscar_tabla').val()).replace(/ +/g, ' ').toLowerCase();
            $rows.show().filter(function () {
                var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                return ! ~text.indexOf(val);
            }).hide();
        }
        function reset() {
            tabla = $('#tabla_registros');
            tr = tabla.find('tr');
            for (i = 0; i < tr.length; i++) {
                tr[i].style.display = "";
            } //fin cli
            $('#buscar_tabla').val("");
        }

        function activar_exportacion() {
            /*var boton = document.getElementById('boton_exportar');
            $(boton).hide();
            $('#i_cargando').show();
            document.getElementById('i_cargando').style.display = "inline";*/
        }
        $(function () {
            var tooltips = $("[title]").tooltip({
                position: {
                    my: "left top",
                    at: "right+5 top-5",
                    collision: "none"
                }
            });
        });

        function validar_formulario() {
            var box1 = document.getElementById("caja_nombre_rendimiento");
            var box2 = document.getElementById("caja_descripcion");
            var caja_1 = $('#caja_nombre_rendimiento').val()
            var caja_2 = $('#caja_descripcion').val();

            var lista_1 = document.getElementById("lista_medicion");
            var lista_2 = document.getElementById("lista_categorias_metas");
            var lista_3 = document.getElementById("lista_tipo_meta");

            var eleccion1 = lista_1.options[lista_1.selectedIndex].value;
            var eleccion2 = lista_2.options[lista_2.selectedIndex].value;
            var eleccion3 = lista_3.options[lista_3.selectedIndex].value;

            var seleccion_usuario1 = lista_1.options[lista_1.selectedIndex].text;
            var seleccion_usuario2 = lista_1.options[lista_1.selectedIndex].text;
            var seleccion_usuario3 = lista_1.options[lista_1.selectedIndex].text;

            if (lista_1.selectedIndex != 0 && lista_2.selectedIndex != 0 && lista_3.selectedIndex != 0) {
                if (caja_1 != "" && caja_2 != "") {
                    modal();
                    var boton = document.getElementById('boton_guardar_rendimiento');
                    boton.click();
                }
            }
            if (lista_1.selectedIndex == 0) {
                $(lista_1).addClass("error");
            }
            else {
                $(lista_1).removeClass("error");
            }
            if (lista_2.selectedIndex == 0) {
                $(lista_2).addClass("error");
            }
            else {
                $(lista_2).removeClass("error");
            }
            if (lista_3.selectedIndex == 0) {
                $(lista_3).addClass("error");
            }
            else {
                $(lista_3).removeClass("error");
            }
            if (caja_1 == "") {
                $(box1).addClass("error");
            }
            else {
                $(box1).removeClass("error");
            }
            if (caja_2 == "") {
                $(box2).addClass("error");
            }
            else {
                $(box2).removeClass("error");
            }
        }

        function validar_formulario_2() {
            var box1 = document.getElementById("caja_monto_meta");
            var box2 = document.getElementById("caja_fecha_rendimiento_inicio");
            var box3 = document.getElementById("caja_fecha_rendimiento_final");

            var caja_1 = $('#caja_monto_meta').val()
            var caja_2 = $('#caja_fecha_rendimiento_inicio').val();
            var caja_3 = $('#caja_fecha_rendimiento_final').val();

            var lista_1 = 0;
            var lista_2 = 0;
            var lista_3 = 0;

            lista_1 = document.getElementById("lista_rendimientos");
            lista_2 = document.getElementById("lista_vendedores");
            lista_3 = document.getElementById("lista_sucursales_rendimiento");

            if (lista_2 == null)
            {
                lista_2 = document.getElementById("lista_medicion");
                lista_2.selectedIndex = 1;
            }

            if (lista_3 == null)
            {
                lista_3 = document.getElementById("lista_medicion");
                lista_3.selectedIndex = 1;
            }

            if (lista_1.selectedIndex != 0 && lista_2.selectedIndex != 0 && lista_3.selectedIndex != 0) {
                if (caja_1 != "" && caja_2 != "" && caja_3 != "") {

                    modal_2();
                    var boton = document.getElementById('boton_guardar_rendimiento_vendedor');
                    boton.click();
                }
            }

            if (lista_1.selectedIndex == 0) {
                $(lista_1).addClass("error");
            }
            else {
                $(lista_1).removeClass("error");
            }

            if (lista_2.selectedIndex == 0) {
                $(lista_2).addClass("error");
            }
            else {
                $(lista_2).removeClass("error");
            }

            if (lista_3.selectedIndex == 0) {
                $(lista_3).addClass("error");
            }
            else {
                $(lista_3).removeClass("error");
            }

            if (caja_1 == "") {
                $(box1).addClass("error");
            }
            else {
                $(box1).removeClass("error");
            }

            if (caja_2 == "") {
                $(box2).addClass("error");
            }
            else {
                $(box2).removeClass("error");
            }

            if (caja_3 == "") {
                $(box2).addClass("error");
            }
            else {
                $(box3).removeClass("error");
            }
        }

        function modal() {
            $("#dialogo").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        function modal_2() {
            $("#dialogo_2").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        function barra()
        {
            $("#").progressbar({
                value: 4
            });
        }
        function dialogo_erro()
        {
            $('#dialogo_erro').dialog({modal:true});
        }

    </script>
    <title>Rendimiento Vendedores</title>
</head>
<body>
    <form id="formulario_rendimiento_vendedores" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="principal capitalizar">
            <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
            </asp:Panel>
            <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                <asp:Panel ID="panel_confirmacion" runat="server" CssClass="panel_confirmacion">
                    <p class="texto_bloqueo">
                        <asp:Label runat="server" ID="Mensaje_confirmacion" Text=""></asp:Label>&nbsp;<i
                            class="fa fa-question-circle rojo"></i>
                    </p>
                    <asp:LinkButton ID="si" runat="server" CssClass="boton_confirmacion boton_si" OnClick="si_Click">Si</asp:LinkButton>
                    <asp:LinkButton ID="no" runat="server" CssClass="boton_confirmacion boton_no" OnClick="no_Click">No</asp:LinkButton>
                    <div class="separador_altas">
                    </div>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Style="display: none">
                <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                    <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                </asp:Panel>
                <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClientClick="cerrar_mensaje();return false;"><i class="fa fa-close"></i></asp:LinkButton>
            </asp:Panel>
            <div class="barra_superior">
                <div class="espacio_logotipo">
                    <img class="logotipo" src="img/inklaser.jpeg" />
                </div>
                <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Metas / Rendimiento</asp:Label>
                <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                    OnClientClick="salir();return false;"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario_" runat="server"></asp:Label>
            </div>
            <div class="contenido capitalizar">
                <div class="separador_altas">
                </div>
                <div class="izquierdo" style="display: none;">
                    <div id="controles_busqueda">
                        <ul class="lista_cotizacion">
                            <li>
                                <p class="texto_titulos">
                                    Selecciona Area:
                                </p>
                                <asp:DropDownList ID="areas" runat="server" CssClass="lista_cotizacion">
                                    <asp:ListItem>Selecciona</asp:ListItem>
                                    <asp:ListItem>Vendedores</asp:ListItem>
                                    <asp:ListItem>Sucursales</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                            <li style="display: none;">
                                <p class="texto_titulos">
                                    De:
                                </p>
                                <asp:TextBox ID="fecha" CssClass="caja_fecha" runat="server"></asp:TextBox>
                            </li>
                            <li id="li_fecha_fin" style="display: none;">
                                <p class="texto_titulos">
                                    A:
                                </p>
                                <asp:TextBox ID="fecha_fin" CssClass="caja_fecha" runat="server"></asp:TextBox>
                            </li>
                            <li style="display: none;">
                                <p class="texto_titulos">
                                    Sucursal:
                                </p>
                                <asp:DropDownList ID="lista_sucursales" runat="server">
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:LinkButton ID="boton_buscar" runat="server" ToolTip="Buscar Cotizaciones" Style="text-decoration: none;"
                                    CssClass="botones_controles aprobar" OnClick="boton_buscar_Click">Buscar</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="derecho" style="width: 95%;">
                    <div class="barra">
                        <asp:Label ID="fecha_barra" runat="server" Text="" CssClass="titulo_barra tipo_texto"></asp:Label>

                    </div>
                    <div id="tabs">
                        <ul>
                            <li><a href="#tab-estadisticas">Estadisticas</a></li>
                            <li><a href="#tab-categorias">Configuracion</a></li>
                            <li><a href="#tab-registros">Libre</a></li>
                            <li style="display: none;"><a href="#tab-corte">****</a></li>

                        </ul>
                        <div id="tab-registros">
                            <div>
                                <div id="barra_1" class="barra" style="height: 1.5em; text-align: center;">
                                    <asp:Label ID="titulo_grafica_barra" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                </div>
                                <div id="barra_2" class="barra" style="height: 1.5em; text-align: center;">
                                    <asp:Label ID="etiqueta_periodo" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                </div>
                                <div class="superior limitado" style="min-height: 63%;">
                                    <ul class="ul_principal">
                                        <li>
                                            <div class="div-53">
                                                <asp:Panel ID="panel_registros" runat="server">
                                                    <asp:GridView ID="tabla_registros" runat="server" AutoGenerateColumns="False" CssClass="tabla">
                                                        <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" />
                                                        <PagerSettings Visible="False" />
                                                        <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                        <AlternatingRowStyle CssClass="GridRow" />
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Descripcion" DataField="movimiento"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Codigo" DataField="codigo" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F}" HtmlEncode="false"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Fecha" DataField="fecha" SortExpression="fecha" DataFormatString="{0:dd/MMMM/yyyy - hh:mm tt}"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063; padding: 1%; width: 98%">
                                        <asp:Label ID="Label4" runat="server" Text="Buscar" CssClass="tipo_texto texto_chico"></asp:Label>
                                        <asp:TextBox ID="buscar_tabla" runat="server" CssClass=""></asp:TextBox>
                                        <asp:Label ID="total_principal" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                        <a href="JavaScript:buscar_registros();"><i class="fa fa-search" aria-hidden="true"></i></a>
                                        <a href="JavaScript:reset();"><i class="fa fa-refresh" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-corte">
                            <div class="clon_barra_1">
                            </div>
                            <div class="clon_barra_2">
                            </div>
                        </div>
                        <div id="tab-categorias">
                            <div class="barra" style="height: 1.5em; text-align: center;">
                                <asp:Label ID="Label6" runat="server" Text="Configuracion" CssClass="tipo_texto texto_chico"></asp:Label>
                            </div>
                            <asp:UpdatePanel ID="actualizable_detalles" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="contenedor_paneles_mamalones" class="barra" style="height: 1.5em; text-align: center;">
                                        <asp:Label ID="Label7" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                    </div>
                                    <div class="superior limitado" style="min-height: 63%;">
                                        <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063; width: 40%;">
                                            <asp:Label ID="Label5" runat="server" Text="Crear Meta" CssClass="tipo_texto texto_chico"></asp:Label>
                                        </div>
                                        <div class="limitado" style="height: 400px">
                                            <div class="categorias">
                                                <div style="display: inline-grid;">
                                                    <asp:Label ID="etiqueta_rendimiento" runat="server" Text="Nombre" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:TextBox ID="caja_nombre_rendimiento" runat="server" CssClass="caja_media" ToolTip="Ingresa un nombre para tu meta con el cual puedas identificarlo posteriormente."></asp:TextBox>
                                                    <asp:Label ID="etiqueta_objetivo" runat="server" Text="Medicion Meta" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:DropDownList ID="lista_medicion" runat="server" CssClass="lista" ToolTip="Ingresa el objetivo ,este sera definido por el contexto de tu meta ya sea que midas ventas ($) o numero de prospectos.">
                                                        <asp:ListItem>Selecciona</asp:ListItem>
                                                        <asp:ListItem>Monetario</asp:ListItem>
                                                        <asp:ListItem>Cantidad</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="etiqueta_categoria" runat="server" Text="Area" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:DropDownList ID="lista_categorias_metas" runat="server" CssClass="lista" ToolTip="Ingresa el objetivo ,este sera definido por el contexto de tu meta ya sea que midas ventas ($) o numero de prospectos.">
                                                        <asp:ListItem>Selecciona</asp:ListItem>
                                                        <asp:ListItem>Ventas</asp:ListItem>
                                                        <asp:ListItem>Prospectos / Clientes</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="Label9" runat="server" Text="Tipo" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:DropDownList ID="lista_tipo_meta" runat="server" CssClass="lista" ToolTip="Selecciona el tipo de meta individual o por sucursal">
                                                        <asp:ListItem>Selecciona</asp:ListItem>
                                                        <asp:ListItem>Individual</asp:ListItem>
                                                        <asp:ListItem>Sucursal</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="etiqueta_descripcion" runat="server" Text="Descripcion" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:TextBox ID="caja_descripcion" runat="server" CssClass="caja_media" ToolTip="Breve descripcion de tu meta."></asp:TextBox>
                                                    <a href="JavaScript:validar_formulario();" class="botones_requisiciones b_verde" style="margin-top: 15%; width: 50%;"><i style="margin-left: 20%;">Guardar</i></a>
                                                    <asp:LinkButton ID="boton_guardar_rendimiento" runat="server" CssClass="botones_requisiciones b_verde" Text="Guardar" OnClick="boton_guardar_rendimiento_Click" Style="margin-top: 25%; margin-left: 50%; display: none"></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="div_productos_catalogo">
                                            <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                                <div class="controles_graficas">
                                                    <a href="#"><i class="fa fa-print" aria-hidden="true" style="color: white; display: none;"></i></a>
                                                </div>
                                                <asp:Label ID="titulo_caja_detalles" runat="server" Text="Asignar Meta" CssClass="tipo_texto texto_chico"></asp:Label>
                                            </div>
                                            <div class="limitado" style="height: 395px !important;">
                                                <asp:Panel ID="panel_detalles" CssClass="" runat="server" Style="display: inline-grid;">
                                                    <asp:Label ID="etiqueta_lista_metas" runat="server" Text="Meta" CssClass="separador_5 tipo_texto"></asp:Label>
                                                    <asp:DropDownList ID="lista_rendimientos" CssClass="lista" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lista_rendimientos_SelectedIndexChanged">
                                                        <asp:ListItem>Seleccionar</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="etiqueta_grupos_vendedor" runat="server" Text="" CssClass="separador_5 tipo_texto"></asp:Label>
                                                    <asp:DropDownList ID="lista_vendedores" CssClass="lista" runat="server" Visible="false" OnSelectedIndexChanged="lista_vendedores_SelectedIndexChanged">
                                                        <asp:ListItem>Selecciona</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="lista_sucursales_rendimiento" CssClass="lista" runat="server" Visible="false" OnSelectedIndexChanged="lista_sucursales_rendimiento_SelectedIndexChanged">
                                                        <asp:ListItem>Selecciona</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="etiqueta_monto_meta" runat="server" Text="Monto($)" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:TextBox ID="caja_monto_meta" CssClass="lista" MaxLength="6" runat="server"></asp:TextBox>
                                                    <asp:Label ID="etiqueta_inicio" runat="server" Text="Inicio" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:TextBox ID="caja_fecha_rendimiento_inicio" CssClass="lista" runat="server"></asp:TextBox>
                                                    <asp:Label runat="server" ID="etiqueta_final" Text="Final" CssClass="tipo_texto separador_5"></asp:Label>
                                                    <asp:TextBox ID="caja_fecha_rendimiento_final" CssClass="lista" runat="server"></asp:TextBox>
                                                    <a href="JavaScript:validar_formulario_2();" class="botones_requisiciones b_verde" style="margin-top: 15%; width: 50%;"><i style="margin-left: 20%;">Guardar</i></a>
                                                    <asp:LinkButton ID="boton_guardar_rendimiento_vendedor" runat="server" OnClick="boton_guardar_rendimiento_vendedor_Click"></asp:LinkButton>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="boton_guardar_rendimiento" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="boton_guardar_rendimiento_vendedor" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="lista_rendimientos" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="lista_vendedores" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="lista_sucursales_rendimiento" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div id="tab-estadisticas">
                            <div class="clon_barra_1">
                            </div>
                            <div class="clon_barra_2">
                            </div>
                            <div class="superior limitado" style="min-height: 63%;">
                                <div class="panel_izquierdo">
                                    <div class="contenedor_graficas">

                                        <div class="barra" style="height: 1.5em; text-align: center;">
                                            <div class="controles_graficas">
                                                <a href="JavaScript:graficar_clientes('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                            </div>
                                            <asp:Label ID="Label2" runat="server" Text="Rendimiento" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                        </div>
                                        <canvas id="grafica_productos" class="grafica"></canvas>

                                    </div>
                                    <div class="contenedor_graficas">

                                        <div class="barra" style="height: 1.5em; text-align: center;">
                                            <div class="controles_graficas">
                                                <a href="JavaScript:graficar_clientes('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                            </div>
                                            <asp:Label ID="Label3" runat="server" Text="Objetivos" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                        </div>
                                        <canvas id="grafica_movimientos" class="grafica"></canvas>

                                    </div>
                                </div>
                                <div class="panel_derecho">
                                    <div class="contenedor_graficas">

                                        <div class="barra" style="height: 1.5em; text-align: center;">
                                            <div class="controles_graficas">
                                                <a href="JavaScript:graficar_clientes('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                            </div>
                                            <asp:Label ID="Label1" runat="server" Text="Stats" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                        </div>
                                        <canvas id="grafica_clientes" class="grafica"></canvas>
                                    </div>
                                    <div class="contenedor_graficas">
                                        <div class="barra" style="height: 1.5em; text-align: center;">
                                            <div class="controles_graficas">
                                                <a href="JavaScript:graficar_clientes('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_clientes('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                            </div>
                                            <asp:Label ID="Label8" runat="server" Text="Clientes" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                        </div>
                                        <canvas id="grafica_trasferencias" class="grafica"></canvas>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="dialogo" title="Operacion Exitosa!!">
            <p>
                <span class="ui-icon ui-icon-circle-check" style="float: left; margin: 0 7px 50px 0;"></span>
                Se a creado una meta nueva, esta ya esta disponible en la lista de metas.
            </p>
            <p>
                Aviso: <b>Recuerda utilizar las metas ya dadas de alta.</b>.
            </p>
        </div>
        <div id="dialogo_2" title="Operacion Exitosa!!">
            <p>
                <span class="ui-icon ui-icon-disk" style="float: left; margin: 0 7px 50px 0;"></span>
                Se guardo correctamente el registro.
            </p>
            <p>
                Aviso: <b>La.</b>.
            </p>
        </div>
        
    </form>
</body>
</html>
<style>


    .caja_media {
        display: inline-block;
        width: 100%;
        height: 1.5em;
        box-sizing: border-box;
        outline: none;
        border: 1px solid lightgray;
        border-radius: 3px;
    }
    .lista{
        display: inline-block;
        width: 100%;
        height: 1.5em;
        box-sizing: border-box;
        outline: none;
        border: 1px solid lightgray;
        border-radius: 3px;
    }
    .error {
        border-color: red;
    }

    .ayuda_centro {
    }

    .ayuda {
        display: inline-block;
        float: right;
        width: 45%;
    }

    .separador_5 {
        margin: 5%;
    }

    .barra {
        position: relative;
        background: #007acc;
        width: 100%;
        height: 50px;
        border-radius: 2px;
    }

    .titulo_barra {
        position: relative;
        top: 20%;
        color: rgb(255, 255, 255);
        float: left;
        text-decoration: none;
        display: inline-block;
        margin-left: 20px;
        font-weight: bolder;
        font-size: x-large !important;
    }

    .control_calendario {
        position: inherit;
        background: #2471A3;
        color: white;
        padding: 6px 7px 6px 7px;
        border-radius: 35px;
    }

    .caja_fecha {
        width: 60%;
        height: 30px;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
    }

    .ui-menu-item a.ui-state-focus {
        background: #faa;
    }

    .ui-datepicker-trigger {
        border: none;
        background: none;
    }

    .posicion_calendario {
        top: 2em;
        cursor: pointer;
        cursor: hand;
    }

    .superior {
        height: 47%;
        position: relative;
        display: inline-block;
        background: transparent !important;
        top: 0;
    }

    .inferior {
        height: 47%;
        position: relative;
        display: inline-block;
        background: transparent !important;
        bottom: 0;
    }

    .contenedor_ganancias {
        -webkit-box-sizing: content-box;
        -moz-box-sizing: content-box;
        box-sizing: content-box;
        width: 14em;
        position: absolute;
        top: 1em;
        left: 1em;
        padding: 3em;
        overflow: hidden;
        border: 1px solid;
        -webkit-border-radius: 30px;
        border-radius: 30px;
        color: rgba(255,255,255,1);
        text-align: center;
        -o-text-overflow: ellipsis;
        text-overflow: ellipsis;
        -webkit-box-shadow: 0 0 0 0 rgba(0,0,0,1);
        box-shadow: 0 0 0 0 rgba(0,0,0,1);
        text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
    }

    .titulo_superior {
        position: absolute;
        top: 10%;
        left: 0px;
        color: #2C3E50;
        text-decoration: none;
        display: inline-block;
        margin-left: 7%;
        font-weight: bolder;
        font-size: x-large !important;
    }

    .titulo_inferior {
        position: absolute;
        top: 55%;
        left: 0px;
        color: #2C3E50;
        text-decoration: none;
        display: inline-block;
        margin-left: 7%;
        font-weight: bolder;
        font-size: x-large !important;
    }

    .titulo_der_sup {
        position: absolute;
        top: 10%;
        right: 0px;
        color: #2C3E50;
        text-decoration: none;
        display: inline-block;
        margin-right: 7%;
        font-weight: bolder;
        font-size: x-large;
    }

    .titulo_der_inf {
        position: absolute;
        top: 55%;
        right: 0px;
        color: #2C3E50;
        text-decoration: none;
        display: inline-block;
        margin-right: 7%;
        font-weight: bolder;
        font-size: x-large !important;
    }

    .capitalizar {
        text-transform: capitalize;
    }

    .ul_principal {
        list-style: none;
        position: absolute;
        display: inline-block;
    }

    .grafica_1 {
        position: absolute;
        display: inline-block;
    }

    .texto_chico {
        font-size: medium;
        color: white;
        margin-top: 3px;
        text-align: CENTER;
        display: inline-block;
    }

    .ui-widget-header {
        background: #e9e9e9 !important;
    }

    .contenedor_tabs {
        width: 97%;
        height: 65%;
    }

    .grande {
        font-size: large !important;
    }

    .controles_graficas {
        float: left;
        margin-top: 1%;
        margin-left: 1%;
    }

    .margen_derecho_10 {
        margin-right: 12%;
    }

    .black {
        color: #000000;
    }

    .div-53 {
        width: 100%;
    }

    .categorias {
        width: 40%;
    }

    .div_productos_catalogo {
        width: 55%;
        position: absolute;
        display: inline-block;
        right: 0;
        top: 0;
    }

    .ui-widget-header {
        color: rgba(0, 0, 0, 0.8) !important;
    }

    .oculto {
        display: none;
    }

    .caja_sumaria {
        display: block;
        margin-top: 1%;
        margin-bottom: 1%;
        width: 90%;
        margin-left: 2%;
        background: antiquewhite;
        border-radius: 2px;
    }

    .titulo_cierre {
        font-size: large;
    }

    .margen_izquierdo_10 {
        margin-left: 4px;
    }

    .panel_mamalon {
        position: absolute;
        width: 57%;
        display: block;
        background: rgba(0, 122, 204, 0.84);
        height: 2.5em;
        z-index: 10;
        top: 1em;
        padding-top: 1em;
        border-radius: 2px;
    }

    .letrero {
        border-style: hidden;
        font-size: larger;
    }

    .panel_izquierdo {
        float: left;
        position: relative;
        display: inline-block;
        width: 45%;
        height: auto;
    }

    .panel_derecho {
        float: right;
        position: relative;
        display: inline-block;
        width: 45%;
        height: 90%;
    }

    .contenedor_graficas {
        width: 100%;
        height: 20em;
        position: relative;
        display: inline-block;
    }

    .grafica {
        width: 98%;
        height: 85%;
    }
</style>
