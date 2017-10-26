<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/reportes_sucursales.aspx.cs" Inherits="reportes_sucursales" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<style>
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
        width: 53em;
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
    .oculto{
        display:none;
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
    .titulo_cierre{
        font-size:large;
    }
    .margen_izquierdo_10{
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
    .letrero{
        border-style:hidden;
        font-size:larger;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reportes de Sucursales - Inklaser</title>
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
    <script>
        var facturacion;
        var delay = 900;
        var progressbar;
                    /*
            Te amo  Medina <3 
            ________***______**______ 
            _______******____*****_____ 
            ______*********__*********____ 
            _____***********_***********____ 
            _____***********************_____ 
            ______********************______ 
            _______*****************_______ 
            ________**************________ 
            _________***********_________ 
            __________********__________ 
            ___________*****___________ 
            ____________**____________

            */
        $(function () {
            $('#fecha').datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: new Date(2015, 1 - 1, 1),
                maxDate: "0M",
            });
            $('#fecha_fin').datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: new Date(2015, 1 - 1, 1),
                maxDate: "0M",
            });
        });
       // $('#caja_fecha_user_inicio').datepicker();
        //$('#caja_fecha_user_final').datepicker();
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
                }, 600);
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
            var suma = 0, a;
            var myTableArray = new Array();
            $('.clon_categorias').closest(".clon_falso").remove();
            var clon = $(div).clone();
            $('.clon_categorias').html(clon.show());
            var tabla = $(div).find('tbody > tr');
            for (var i = 1; i < tabla.length; i++) {
                myTableArray[i] = tabla.eq(i).find('.total_falso');
                a = parseFloat(myTableArray[i].text());
                if(a > 0)
                {
                    suma += parseFloat(myTableArray[i].text());
                }
                a = 0;
            }
            suma = (suma).toFixed(2);
            iva = suma * 0.16;
            suma = parseFloat(suma);
            suma = (suma + iva).toFixed(2);
            var redondeo = Math.round(suma * 2) / 2;
            suma = redondeo;
            $('#etiqueta_total').text("");
            $('#etiqueta_total').text("$ " + suma);
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
            var iva = 0;
            $('.clon_barra_1').html($barra_1);
            $('.clon_barra_2').html($barra_2);
            var suma = 0;
            var temp;
            var myTableArray = new Array();
            var tabla = $('#tabla_ventas tr[class!="GridHeader"]');
            for (var i = 0; i < tabla.length; i++) {
                myTableArray[i] = tabla.eq(i).find('.total');
                temp = parseFloat(myTableArray[i].text());
                if (isNaN(temp)) {
                }
                else {
                    suma += temp;
                }
            }
            suma = Math.round(suma * 100) / 100;
            $('#total_principal').text("");
            $('#total_principal').text("$ " + suma);
        });
        function mostrar_panel_fechas() {
            if ($('#div_usuario_caja').is(":visible")) {
                $('#div59').hide();
                $('#div_usuario_caja').hide(500);
            }
            if ($('#div_fechas_caja').is(":visible"))
            {
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
        function abrir_facturacion() {
            if (!facturacion || facturacion.closed) {
                iniciar_barra();
                facturacion = window.open("facturacion_cfdi.aspx", "Facturacion", "width = " + 600 + ", height = " + 400 + ",scrollbars = yes,resizable = false");
            }
            else {
                facturacion.focus();
            }
            return false;
        }
        function dialogo_cargando_exportador() {
            delay = 330;
            $('#dialogo_cargando').dialog({
                modal: true,
                closeOnEscape: false,
                open: function (event, ui) {
                    iniciar_barra();
                    $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
                }
            });
            __doPostBack('boton_facturar', '');
        }

    </script>
    <script>
        function iniciar_barra() {
            if (progressbar)
            {
                $("#progressbar").progressbar("destroy");
            }
            progressbar = $("#progressbar"),
            progressLabel = $("#etiqueta_cargando");
            //progressLabel.text = "Cargando...";
            progressbar.progressbar({
                value: false,
                change: function () {
                    progressLabel.text(progressbar.progressbar("value") + "%");
                },
                complete: function () {
                    progressLabel.text("Listo!");
                    $('#dialogo_cargando').closest('.ui-dialog-content').dialog('close');
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
        function dialogo_confirmacion() {
            $('#dialogo_confirmacion').dialog({
                modal: true,
                buttons: {
                    Aceptar: function () {
                        __doPostBack('boton_oculto_facturar', '');
                    },
                    Cancelar: function () {
                        $(this).dialog("close");
                        __doPostBack('boton_oculto_cancelar_facturar', '');
                    }
                }
            });
        }
    </script>
</head>
<body>
    <form id="formulario" runat="server">
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
                <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Reporte Sucursales</asp:Label>
                <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                    OnClientClick="salir();return false;"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario_" runat="server"></asp:Label>
            </div>
            <div class="contenido capitalizar">
                <div class="separador_altas">
                </div>
                <div class="izquierdo">
                    <div id="controles_busqueda">
                        <ul class="lista_cotizacion">
                            <li>
                                <p class="texto_titulos">
                                    Generar Reporte:
                                </p>
                            </li>
                            <li>
                                <p class="texto_titulos">
                                    De:
                                </p>
                                <asp:TextBox ID="fecha" CssClass="caja_fecha" runat="server"></asp:TextBox>
                            </li>
                            <li id="li_fecha_fin">
                                <p class="texto_titulos">
                                    A:
                                </p>
                                <asp:TextBox ID="fecha_fin" CssClass="caja_fecha" runat="server"></asp:TextBox>
                            </li>
                            <li>
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
                <div class="derecho">
                    <div class="barra">
                        <asp:Label ID="fecha_barra" runat="server" Text="" CssClass="titulo_barra tipo_texto"></asp:Label>
                        <a href="JavaScript:dialogo_cargando_exportador();" style="position: absolute;right: 2%; font-size:xx-large;top: 15%; display:none;"><i class="fa fa-file" aria-hidden="true" style="color: white;"></i></a>
                        <asp:LinkButton ID="boton_facturar" runat="server" style="display:none;" OnClick="boton_facturar_Click"></asp:LinkButton>
                    </div>
                    <div id="tabs">
                        <ul>
                            <li><a href="#tab-registros">Registros</a></li>
                            <li><a href="#tab-categorias">Categorias</a></li>
                            <li><a href="#tab-corte">Corte</a></li>
                            <li><a href="#tab-estadisticas">Estadisticas</a></li>
                        </ul>
                        <div id="tab-registros">
                            <div>
                                <div id="barra_1" class="barra" style="height: 1.5em; text-align: center;">
                                    <asp:Label ID="titulo_grafica_barra" runat="server" Text="Ventas Sucursal" CssClass="tipo_texto texto_chico"></asp:Label>
                                </div>
                                <div id="barra_2" class="barra" style="height: 1.5em; text-align: center;">
                                    <asp:Label ID="etiqueta_periodo" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                </div>
                                <div class="superior limitado" style="min-height: 63%;">
                                    <ul class="ul_principal">
                                        <li>
                                            <div class="div-53">
                                                <asp:Panel ID="panel_ventas_detalles" runat="server">
                                                    <asp:GridView ID="tabla_ventas" runat="server" AutoGenerateColumns="False" CssClass="tabla" DataKeyNames="clave_venta"
                                                        OnRowDataBound="tabla_ventas_RowDataBound">
                                                        <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" />
                                                        <PagerSettings Visible="False" />
                                                        <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                        <AlternatingRowStyle CssClass="GridRow" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="panel_check_seleccionar_factura" runat="server" Visible="false">
                                                                        <asp:CheckBox ID="filacheck" runat="server" />
                                                                    </asp:Panel>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                                            <asp:BoundField HeaderText="CLV" DataField="clave_venta"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Total" DataField="total" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F}" HtmlEncode="false">
                                                                <ItemStyle CssClass="total" />
                                                            </asp:BoundField>
                                                            <asp:BoundField HeaderText="Fecha" DataField="fecha" SortExpression="fecha" DataFormatString="{0:dd/MMMM/yyyy - hh:mm tt}"></asp:BoundField>
                                                            <asp:TemplateField HeaderText="Detalles Venta">
                                                                <ItemStyle CssClass="centro" />
                                                                <ItemTemplate>
                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_venta")+ "lv" %>');">
                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_venta") + "lv" %>" src="png/plus.png" /></a>
                                                                    <div id="div<%# Eval("clave_venta") + "lv" %>" style="display: none" title="Productos <%# Eval("clave_venta")%>">
                                                                        <div class="limitado_chico">
                                                                            <asp:GridView ID="tabla_detalles" class="tabla" runat="server" AutoGenerateColumns="false">
                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                <PagerSettings Visible="False" />
                                                                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo"></asp:BoundField>
                                                                                    <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                                                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                        <asp:Label ID="Label4" runat="server" Text="Total:" CssClass="tipo_texto texto_chico"></asp:Label>
                                        <asp:Label ID="total_principal" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-categorias">
                            <div class="clon_barra_1">
                            </div>
                            <div class="clon_barra_2">
                            </div>
                            <div>
                                <div class="superior limitado" style="min-height: 63%;">
                                    <div class="categorias">
                                        <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                            <asp:Label ID="Label1" runat="server" Text="Categorias" CssClass="tipo_texto texto_chico"></asp:Label>
                                        </div>
                                        <div class="superior limitado" style="height: 400px">
                                            <asp:Panel ID="ventas_categoria" runat="server">
                                                <asp:GridView ID="tabla_categorias" runat="server" AutoGenerateColumns="False" CssClass="tabla" DataKeyNames="subcategoria" OnRowDataBound="tabla_categorias_RowDataBound">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Categoria" DataField="categoria"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Sub-Categoria" DataField="subcategoria"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Detalles Venta">
                                                            <ItemStyle CssClass="centro" />
                                                            <ItemTemplate>
                                                                <a href="JavaScript:muestralo('div<%# Eval("subcategoria") %>');" class="controles_tablas">
                                                                    <i id="imgdiv<%# Eval("subcategoria")%>" class="fa fa-plus-circle" style="color: white"></i></a>
                                                                <div id="div<%# Eval("subcategoria")%>" style="display: none" class="clon_falso" title="Productos <%# Eval("subcategoria")%>">
                                                                    <div class="">
                                                                        <asp:GridView ID="tabla_categorias_desglosadas" class="tabla" runat="server" AutoGenerateColumns="false" DataKeyNames="codigo,fecha" OnRowDataBound="tabla_categorias_desglosadas_RowDataBound">
                                                                            <HeaderStyle CssClass="GridHeader" />
                                                                            <PagerSettings Visible="False" />
                                                                            <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                                            <AlternatingRowStyle CssClass="GridRow" />
                                                                            <Columns>
                                                                                <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo"></asp:BoundField>
                                                                                <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                                                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ></asp:BoundField>
                                                                                <asp:BoundField HeaderText="Total" DataField="total" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F}" HtmlEncode="false" ItemStyle-CssClass="total_falso"></asp:BoundField>
                                                                                <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MMMM/yyyy  HH:MM tt}"></asp:BoundField>
                                                                                <asp:TemplateField>
                                                                                    <ItemStyle CssClass="centro" />
                                                                                    <ItemTemplate>
                                                                                        <a href="JavaScript: sacatela('div<%# Eval("codigo") + "sub" %>');" class="">
                                                                                            <img alt="Detalles" id="imgdiv<%# Eval("codigo") + "sub" %>" src="png/plus.png" /></a>
                                                                                        <div id="div<%# Eval("codigo")+ "sub"%>" style="display: none" class="clon_falso" title="Productos <%# Eval("codigo")%>">
                                                                                            <div class="limitado_chico">
                                                                                                <asp:GridView ID="tabla_registro_vendedores" class="tabla" runat="server" AutoGenerateColumns="false">
                                                                                                    <HeaderStyle CssClass="GridHeader" />
                                                                                                    <PagerSettings Visible="False" />
                                                                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                                                                    <Columns>
                                                                                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MMMM/yyyy  HH:MM tt}"></asp:BoundField>
                                                                                                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                                                                                    </Columns>
                                                                                                </asp:GridView>
                                                                                            </div>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>                            
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div id="registros_catalogo" class="div_productos_catalogo">
                                        <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                            <asp:Label ID="Label2" runat="server" Text="Productos" CssClass="tipo_texto texto_chico"></asp:Label>
                                        </div>
                                        <div class="superior limitado" style="height: 395px !important;">
                                            <div class="clon_categorias">
                                            </div>
                                        </div>
                                        <div>
                                            <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                                <asp:Label ID="Label3" runat="server" Text="Total:" CssClass="tipo_texto texto_chico"></asp:Label>
                                                <asp:Label ID="etiqueta_total" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="tab-corte">
                            <div class="barra" style="height: 1.5em; text-align: center;">
                                <asp:Label ID="Label6" runat="server" Text="Corte Caja" CssClass="tipo_texto texto_chico"></asp:Label>
                            </div>
                            
                            
                            <asp:UpdatePanel ID="actualizable_detalles_caja" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="barra" style="height: 1.5em; text-align: center;">
                                        <div class="controles_graficas" style="margin-top: 0%; display: inline;">
                                            <a href="JavaScript:mostrar_panel_fechas();" class="margen_izquierdo_10"><i class="fa fa-calendar" aria-hidden="true" style="color: white;"></i></a>
                                            <div id="div_fechas_caja" class="panel_mamalon" style="display: none">
                                                <div id="div58" style="display:none">
                                                    <i class="tipo_texto" style="color: white;font-weight: bolder;">De:</i>
                                                    <asp:TextBox ID="caja_fecha_user_inicio" runat="server" placeholder="Fecha Inicial"></asp:TextBox>
                                                    <i class="tipo_texto" style="color: white;font-weight: bolder;">A:</i>
                                                    <asp:TextBox ID="caja_fecha_user_final" runat="server" placeholder="Fecha Final"></asp:TextBox>
                                                    <asp:LinkButton ID="boton_fecha_caja" runat="server" class="margen_izquierdo_10" OnClick="boton_fecha_caja_Click"><i class="fa fa-check-circle" aria-hidden="true" style="color: white;"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                            <a class="margen_izquierdo_10" href="JavaScript:mostrar_panel_usuario();"><i class="fa fa-user" aria-hidden="true" style="color: white;"></i></a>
                                            <div id="div_usuario_caja" class="panel_mamalon" style="display: none">
                                                <div id="div59" style="display: none">
                                                    <i class="tipo_texto" style="color: white;font-weight: bolder;">Nombre:</i>
                                                    <asp:TextBox ID="caja_usuario_caja" runat="server"></asp:TextBox>
                                                    <asp:LinkButton ID="boton_usuario_caja"  runat="server" class="margen_izquierdo_10" OnClick="boton_usuario_caja_Click"><i class="fa fa-check-circle" aria-hidden="true" style="color: white;"></i></asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Label ID="Label7" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                    </div>
                                    <div class="superior limitado" style="min-height: 63%;">
                                        <div class="limitado" style="height: 400px">
                                            <div class="categorias">
                                                <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                                    <asp:Label ID="Label5" runat="server" Text="Sesiones Caja" CssClass="tipo_texto texto_chico"></asp:Label>
                                                </div>
                                                <asp:Panel ID="panel_cajeros" runat="server">
                                                    <asp:GridView ID="tabla_cajeros" runat="server" AutoGenerateColumns="False" CssClass="tabla" DataKeyNames="id_registro,vendedor,sucursal" OnRowCommand="tabla_cajeros_RowCommand">
                                                        <HeaderStyle CssClass="GridHeader" />
                                                        <PagerSettings Visible="False" />
                                                        <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                        <EmptyDataRowStyle CssClass="letrero" />
                                                        <EmptyDataTemplate>
                                                            <div class=" tipo_texto" style="margin-top: 5em;margin-left: 3em;">
                                                                <i class="fa fa-times-circle" aria-hidden="true"> No se encontraron registros</i>
                                                            </div>
                                                        </EmptyDataTemplate>
                                                        <AlternatingRowStyle CssClass="GridRow" />
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Sesion" DataField="id_registro"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Nombre" DataField="vendedor"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Sucursal" DataField="sucursal"></asp:BoundField>
                                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="ver" runat="server" CausesValidation="False" ToolTip="Ver Detalles"
                                                                        CommandName="detalles" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye opcion_tabla"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </div>

                                        <div class="div_productos_catalogo">
                                            <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                                <div class="controles_graficas">
                                                    <a href="#"><i class="fa fa-print" aria-hidden="true" style="color: white;"></i></a>
                                                    <a href="#"><i class="fa fa-envelope-o" aria-hidden="true" style="color: white;"></i></a>
                                                </div>
                                                <asp:Label ID="titulo_caja_detalles" runat="server" Text="Detalles" CssClass="tipo_texto texto_chico"></asp:Label>
                                            </div>
                                            <div class="limitado" style="height:395px !important;">
                                                <asp:Panel ID="panel_resumen_turno" runat="server" Visible="false">
                                                    <ul class="" style="list-style:none;">
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Fecha Apertura</label>
                                                            <asp:label ID="caja_apertura"  runat="server" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Fecha Cierre</label>
                                                            <asp:label ID="caja_cierre"  runat="server" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Estado</label>
                                                            <asp:label ID="caja_estado" runat="server"  CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Fondo De Caja</label>
                                                            <asp:label ID="caja_fondo" runat="server"  CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Total Sistema Efectivo</label>
                                                            <asp:label ID="caja_venta_efectivo" runat="server" Enabled="false" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Total Sistema Tarjeta</label>
                                                            <asp:label ID="caja_venta_tarjeta" runat="server" Enabled="false" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Total Gastos</label>
                                                            <asp:label ID="caja_pagos" runat="server" Enabled="false" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Total Caja Efectivo Sin Fondo</label>
                                                            <asp:label ID="caja_total_efectivo" runat="server" Enabled="false" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Total Caja Tarjeta</label>
                                                            <asp:label ID="caja_total_tarjeta" runat="server" Enabled="false" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                        <li class="">
                                                            <label class="titulo_cierre tipo_texto">Diferencia:</label>
                                                            <asp:label ID="caja_diferencia" runat="server" Enabled="false" CssClass="caja_sumaria"></asp:label>
                                                        </li>
                                                    </ul>
                                                </asp:Panel>
                                            </div>
                                            <div>
                                                <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                                    <asp:Label ID="titulo_diferencia_copia" runat="server" Text="Diferencia:" CssClass="tipo_texto texto_chico"></asp:Label>
                                                    <asp:Label ID="copia_diferencia" runat="server" Text="" CssClass="tipo_texto texto_chico"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tabla_cajeros" EventName="RowCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="boton_fecha_caja" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="boton_usuario_caja" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                           
                        </div>
                        <div id="tab-estadisticas">
                            <div class="clon_barra_1">
                            </div>
                            <div class="clon_barra_2">
                            </div>
                            <div class="superior limitado" style="min-height: 63%;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div id="dialogo_cargando" title="Cargando..." style="display: none;">
                <div id="progressbar">
                    <div class="progress-label"><asp:Label ID="etiqueta_cargando" runat="server" Text="Cargando..."></asp:Label></div>
                </div>
            </div>
            <div id="dialogo_confirmacion" title="Atencion!" style="display:none;">
                <p>
                    <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 50px 0;"></span>
                    Verificar Cantidad A Facturar Porfavor :
                </p>
                <p>
                    Total A Facturar: <b>
                        <asp:Label ID="etiqueta_total_facturar" runat="server" Text=""></asp:Label></b>.
                </p>
            </div>
        </div>

        <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="boton_oculto_si_Click" Style="display: none;" />
        <asp:LinkButton ID="boton_oculto_facturar" runat="server" OnClick="boton_oculto_facturar_Click" Style="display: none;"></asp:LinkButton>
        <asp:LinkButton ID="boton_oculto_cancelar_facturar" runat="server" OnClick="boton_oculto_cancelarfacturar_Click" Style="display: none;"></asp:LinkButton>
    </form>
</body>
</html>
<style>
  .ui-progressbar {
    position: relative;
  }
  .progress-label {
    position: absolute;
    left: 40%;
    top: 4px;
    font-weight: bold;
    text-shadow: 1px 1px 0 #fff;
  }
  </style>
