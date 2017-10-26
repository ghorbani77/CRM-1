<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/maximos_minimos.aspx.cs" Inherits="maximos_minimos" %>

<style>
    .panel_izquierdo {
        float: left;
        overflow: auto;
        max-height: 200px;
        display: inline-block;
    }

    .panel_derecho {
        float: right;
        overflow: auto;
        max-width: 600px;
        max-height: 400px;
        position: absolute;
        display: inline-block;
    }

    .capitalizar {
        text-transform: capitalize;
    }

    .lista {
        width: 20%;
        margin-top: 1%;
        margin-left: 1%;
        height: 30px;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
    }

    .opciones {
        display: inline-block;
        height: 53px;
        width: 61%;
        left: 20%;
        background: #2483c5;
        position: absolute;
        margin-top: 1%;
    }

    .opciones_filtrado {
        list-style-type: none;
        position: absolute;
        display: inline-block;
        width: 90%;
    }

    .separador_5 {
        margin-right: 5px;
        font-family: 'Montserrat', sans-serif;
    }

    #header-fixed {
        overflow-x: auto;
        overflow-y: auto;
        width: 95.5%;
        display: none;
        z-index: 1;
        position: fixed;
        border-width: 1px;
        margin-left: 1.5%;
    }

    .botones_proceso {
        padding-top: 0.875rem;
        padding-right: 1.75rem;
        padding-bottom: 0.9375rem;
        padding-left: 1.75rem;
        font-size: 0.8125rem;
        color: white;
        margin-left: 2%;
    }

    .gris {
        background: #9E9E9E;
    }

    .gris_plata {
        background: #16487f;
    }

    .lis_custom {
        display: inline-block;
        position: absolute;
        left: 40%;
        width: 50%;
    }

    .filtro {
        display: inline-block;
        position: absolute;
    }

    .botones_proceso:hover {
        background: #17a05e;
    }

    caja_medina {
        margin-top: 15px;
        width: 70%;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
        border-radius: 4px;
    }

    .li_procesar {
        position: relative;
        display: inline-block;
        left: 90%;
        width: 50%;
        top: 4px;
    }

    .centro {
        width: 100%;
        left: 5%;
        right: 5%;
    }

    .flota_derecho {
        float: right;
    }

    .turqueza {
        background: #009688;
    }

    ul.sub-menu {
        display: none;
    }

    nav {
        background-color: #007acc;
        padding: 10px 0;
    }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

            nav ul li {
                display: inline-block;
                position: relative;
            }

        nav li ul {
            background-color: #007acc;
            position: absolute;
            left: 0;
            /* make this equal to the line-height of the links (specified below) */
            width: 200px;
            z-index: 2;
        }

        nav li li {
            position: relative;
            margin: 0;
            display: block;
        }

            nav li li ul {
                position: absolute;
                top: 0;
                left: 200px; /* make this equal to the width of the sub nav above */
                margin: 0;
            }

        nav a {
            line-height: 40px;
            padding: 0 12px;
            margin: 0 12px;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

            nav a:hover,
            nav a:focus,
            nav a:active {
                color: rgb(50,50,50);
            }

        /* style sub level links */
        nav li li a {
            border-bottom: solid 1px #cffaff;
            margin: 0 10px;
            padding: 0;
        }

        nav li li:last-child a {
            border-bottom: none;
        }

        /* show arrows for dropdowns */
        nav li.dropdown > a {
            /*background-image: url('../img/arrow-down.png');*/
            content: "\f107";
            font-family: FontAwesome;
            background-position: right 20px;
            background-repeat: no-repeat;
        }

        nav li li.dropdown > a {
            background-image: url('../img/arrow-right.png');
            background-position: right 16px;
            background-repeat: no-repeat;
        }

    .pequeno {
        right: 5%;
        position: absolute;
        display: inline-block;
        bottom: 9%;
        font-size: x-small !important;
    }

    .etiqueta_titulo_dinamica {
        display: inline-block;
        color: white;
        font-size: x-large;
        font-family: 'Montserrat', sans-serif;
        width: 100%;
        margin-left: 45%;
    }

    .limitado_custom {
        width: 100%;
        height: 30em;
        overflow: auto;
    }

    .grafica_anidada {
        position: absolute;
        display: inline-block;
        top: 10em;
        left: 15%;
        width: 70%;
        height: auto;
    }

    .barra {
        position: relative;
        background: #007acc;
        width: 64%;
        border-radius: 2px;
        margin-left: 19%;
        top: 9%;
    }

    .controles_graficas {
        float: left;
        margin-top: 1%;
        margin-left: 1%;
    }
</style>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Maximos Y Minimos</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/chart2/Chart.js"></script>
    <script type="text/javascript" src="js/chart2/Chart.min.js"></script>
    <script type="text/javascript">
        var panel = 0;
        var etiqueta;
        var grafica_1;
        function abrir() {
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        onload = abrir();
        $(document).ready(function () {
            $('.dropdown').hover(
                function () {
                    var id = $(this).find('a').attr("id");
                    if (id == "boton_sucursales") {
                        etiqueta = ("Configuracion Cantidades Reorden");
                    }
                    else if (id == "boton_selecciona_articulos") {
                        etiqueta = ("Seleccionar Productos Reorden");
                    }
                    else if (id == "boton_resurtir_inventario") {
                        etiqueta = "Ordenar Productos Inventario";
                    }
                    $(this).children('.sub-menu').stop(true, true).slideToggle();
                    $('#etiqueta_seleccion').text(etiqueta);
                }
            ).mouseleave(function () {
                $('#etiqueta_seleccion').hide();
            }).mouseenter(function () {
                $('#etiqueta_seleccion').show();
            });
            $(document).tooltip();
        }); // end ready
        function salir() {
            window.close();
        }
        function reset() {
            $('input:checkbox').removeAttr('checked');

        }
        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            });
            console.log("Desarrollado Por InkLaser");
            console.log("v.1.0.jamb");
            console.log("CRM");
        });
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
            reset();
            setTimeout(function () {
                //var boton = $j('#cerrar_mensaje');
                //boton.click();
                $('#mensajes').hide();
            }, 1800);
        }
        function cerrar_mensaje() {
            $('#mensajes').hide();
            return false;
        }
        $(function () {
            $("#seleccionar").click(function () {
                var i;
                var checkboxes = $(this).closest('form').find(':checkbox');

                for (i = 0; i < checkboxes.length; i++) {
                    if ($(checkboxes.eq(i)).is(':checked')) {
                        checkboxes.eq(i).prop('checked', false);
                    } else if (checkboxes.eq(i).is(':visible')) {
                        checkboxes.eq(i).prop('checked', true);
                    }
                }
            });
            $("#reset").click(function () {
                tabla = $('table[class!=GridHeader]');
                tr = tabla.find('tr');
                for (i = 0; i < tr.length; i++) {
                    tr[i].style.display = "";
                } //fin cliclo
            });
            var $rows = $('table[class!=GridHeader] tr[class!="GridHeader"]');
            $('#buscale').click(function () {
                var val = $.trim($("#caja_busqueda").val()).replace(/ +/g, ' ').toLowerCase();

                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });
            $('.boton_azul').click(function () {
                //$(this).find('input[type=checkbox]').prop('checked', true);
                var $row = $(this).closest("tr");
                var checkBoxes = $row.find('input[type=checkbox]')
                $row.find('input[type=checkbox]').prop('checked', !checkBoxes.prop("checked"));
                $row.toggleClass("verde_activado");
            });
            $(function () {
                if ($('#div_inventario_limitado').offset()) {
                    var tableOffset = $('#div_inventario_limitado').offset().top;
                    var $header = $('#tabla_inventario > tbody > .GridHeader').clone();
                    var $fixedHeader = $('#header-fixed').append($header);

                    $('#div_inventario_limitado').scroll(function () {
                        var offset = $(this).scrollTop();

                        if (offset => tableOffset && $fixedHeader.is(":hidden")) {
                            $fixedHeader.show();
                        }
                        else if (offset < tableOffset) {
                            $fixedHeader.hide();
                        }
                        if (offset == 0) {
                            $fixedHeader.hide();
                        }
                    });
                }
            });
            $(function () {
                if ($('#div_panel_reorden').offset()) {
                    var tableOffset = $('#div_panel_reorden').offset().top;
                    var $header = $('#tabla_inventario_reorden > tbody > .GridHeader').clone();
                    var $fixedHeader = $('#header-fixed').append($header);

                    $('#div_panel_reorden').scroll(function () {
                        var offset = $(this).scrollTop();

                        if (offset => tableOffset && $fixedHeader.is(":hidden")) {
                            $fixedHeader.show();
                        }
                        else if (offset < tableOffset) {
                            $fixedHeader.hide();
                        }
                        if (offset == 0) {
                            $fixedHeader.hide();
                        }
                    });
                }
            });
        });
        $(function () {
            $("#lista_vendedores").change(function () {
                if ($(this).val() != "Seleccionar") {
                    $('#li_procesar').show();
                }
                else {
                    $('#li_procesar').hide();
                }
            });
        });
        function clientes_libres() {
            tabla = document.getElementById('tabla_inventario');
            tr = tabla.getElementsByTagName('tr');
            for (i = 0; i < tr.length; i++) {
                tr[i].style.display = "";
            } //fin cliclo
            var $rows = $('#tabla_inventario tr[class!="GridHeader"]');
            var val = $.trim("Sistema").replace(/ +/g, ' ').toLowerCase();
            $rows.show().filter(function () {
                var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                return ! ~text.indexOf(val);
            }).hide();
        }
        function clientes_sin_actividad() {
            tabla = document.getElementById('tabla_inventario');
            tr = tabla.getElementsByTagName('tr');
            for (i = 0; i < tr.length; i++) {
                tr[i].style.display = "";
            } //fin cliclo
            var tabla = $('#tabla_inventario tr[class="GridRow rojo_error"]');
            var tabla_clientes = $('#tabla_inventario tr[class="GridRow falso"]');
            tabla_clientes.hide();
            tabla.show();
        } //fin funcion
        /*$(document).ready(function () {
            $(".cantidad").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A, Command+A
                    (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
        });*/
        $(document).ready(function () {
            $(".cantidad").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $("input:checkbox").change(function () {
                if ($(this).prop("checked")) {
                    var fila = $(this).closest("tr");
                    var valor = fila.find("td:eq(6)").text();
                    var caja_cantidad = fila.find(".cantidad").attr("id");
                    var valor2 = fila.find("td:eq(5)").text();
                    var numero_ = valor - valor2;
                    if (numero_ < 0) {
                        $('#' + caja_cantidad).val("0");
                    }
                    else {
                        $('#' + caja_cantidad).val(numero_);
                    }
                }
                else {
                    var fila = $(this).closest("tr");
                    var caja_cantidad = fila.find(".cantidad").attr("id");
                    $('#' + caja_cantidad).val("");
                }
            });
        });

        function sacalo(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            var ventas = new Array();
            var lista = $(div).find('.clase_falsa_ventas');
            lista = $(lista).attr("id");
            var lista1 = document.getElementById(lista);
            var graficate = $(div).find('.clase_falsa_grafica');
            graficate = $(graficate).attr("id");
            var grafica1 = document.getElementById(graficate).getContext("2d");
            for (i = 0; i < lista1.options.length; i++) {
                ventas[i] = lista1.options[i].value;
            }
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            var color = new Array();
            for (var j = 0; j < 1; j++) {
                colorsito = '#';
                for (var i = 0; i < 6; i++) {
                    colorsito += letras[Math.floor(Math.random() * 16)];
                }
                color[j] = colorsito;
            }

            var datos_grafica_1 = {
                type: 'bar',
                data: {
                    labels: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
                    datasets: [{
                        data: ventas,
                        backgroundColor: color[0],
                        label: "Cantidades Vendidas"
                    }]
                }
            }
            if (div.style.display == "none") {
                div.style.display = "inline";
                $(div).dialog({
                    width: 'auto',
                    close: function (event, ui) {
                        div.style.display = "none";
                        img.src = "png/plus.png";
                        if (grafica_1) {
                            grafica_1.clear();
                            grafica_1.destroy();
                        }
                    }
                });
                img.src = "png/minus.png";
                grafica_1 = new Chart(grafica1, datos_grafica_1);
            } else {
                $(div).closest('.ui-dialog-content').dialog('close');
                img.src = "png/plus.png";
            }
        }
        function sacalo2(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                $(div).dialog({
                    width: 'auto', close:
                    function (a, b) {
                        div.style.display = "none";
                        img.src = "png/plus.png";
                    }
                });
                img.src = "png/minus.png";
            } else {
                $(div).closest('.ui-dialog-content').dialog('close');
                img.src = "png/plus.png";
            }
            $(div).on('dialogclose', function (event) {

            });
        }
    </script>
</head>
<body>
    <form id="formulario_maximos_minimos" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="principal capitalizar">
            <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                <div class="barra">
                    <div class="barra_progreso">
                    </div>
                </div>
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
                <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Control Cantidades Inventario</asp:Label>
                <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                    OnClientClick="javascript: return salir();"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
            </div>
        </div>
        <div class="contenido">
            <div class="panel_procesar_cotizacion" style="background: #007acc;">
                <nav>
                    <ul>
                        <li class="dropdown">
                            <asp:LinkButton ID="boton_sucursales" runat="server" OnClientClick="return false;"
                                Style="text-decoration: none" CssClass="botones_cotizaciones b_azul primero"><i class="fa fa-university"></i><i class="fa fa-chevron-down pequeno"></i></asp:LinkButton>
                            <ul class="sub-menu texto_titulos">
                                <li>
                                    <asp:LinkButton ID="boton_seleccionar_reaorden_1" CssClass="super_panel" runat="server" OnClick="confirmacion_sucursales" CommandArgument="1"
                                        Style="text-decoration: none">Matriz</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_seleccionar_reaorden_2" CssClass="super_panel" runat="server" OnClick="confirmacion_sucursales" CommandArgument="2"
                                        Style="text-decoration: none">Cortez</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_seleccionar_reaorden_3" CssClass="super_panel" runat="server" OnClick="confirmacion_sucursales" CommandArgument="3"
                                        Style="text-decoration: none">Cuarta</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_seleccionar_reaorden_4" CssClass="super_panel" runat="server" OnClick="confirmacion_sucursales" CommandArgument="4"
                                        Style="text-decoration: none">CBTIS</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a id="boton_selecciona_articulos" href="#" class="botones_cotizaciones b_azul primero"><i class="fa fa-building"></i><i class="fa fa-chevron-down pequeno"></i></a>
                            <ul class="sub-menu texto_titulos">
                                <li>
                                    <asp:LinkButton ID="boton_1" runat="server" CssClass="super_panel" OnClick="confirmacion_boton_seleccion" CommandArgument="1"
                                        Style="text-decoration: none">Matriz</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_2" runat="server" CssClass="super_panel" OnClick="confirmacion_boton_seleccion" CommandArgument="2"
                                        Style="text-decoration: none">Cortez</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_3" runat="server" CssClass="super_panel" OnClick="confirmacion_boton_seleccion" CommandArgument="3"
                                        Style="text-decoration: none">Cuarta</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_4" runat="server" CssClass="super_panel" OnClick="confirmacion_boton_seleccion" CommandArgument="4"
                                        Style="text-decoration: none">CBTIS</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <asp:LinkButton ID="boton_resurtir_inventario" runat="server" OnClientClick="return false;"
                                Style="text-decoration: none" CssClass="botones_cotizaciones b_azul primero"><i class="fa fa-cube"></i><i class="fa fa-chevron-down pequeno"></i></asp:LinkButton>
                            <ul class="sub-menu texto_titulos">
                                <li>
                                    <asp:LinkButton ID="boton_resurtir_inventario_matriz" CssClass="super_panel" runat="server" OnClick="boton_resurtir_inventario_click" CommandArgument="1"
                                        Style="text-decoration: none">Matriz</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_resurtir_inventario_cortez" CssClass="super_panel" runat="server" OnClick="boton_resurtir_inventario_click" CommandArgument="2"
                                        Style="text-decoration: none">Cortez</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_resurtir_inventario_cuarta" CssClass="super_panel" runat="server" OnClick="boton_resurtir_inventario_click" CommandArgument="3"
                                        Style="text-decoration: none">Cuarta</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="boton_resurtir_inventario_cbtis" CssClass="super_panel" runat="server" OnClick="boton_resurtir_inventario_click" CommandArgument="4"
                                        Style="text-decoration: none">CBTIS</asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <label id="etiqueta_seleccion" class="titulo tipo_texto" style="color: white"></label>
                        </li>
                    </ul>

                </nav>
            </div>
            <div class="separador_altas">
            </div>
            <div id="div_derecho" class="centro" style="background: white; border-radius: 2px;">
                <asp:Panel ID="panel_inventario_basico" runat="server">
                    <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                        <asp:Label ID="titulo_tabla" runat="server" Text="Titulo" CssClass=" texto_titulos tipo_texto" Style="color: white; position: inherit; top: 10%;"></asp:Label>
                    </div>

                    <div id="div_maximos_minimos">
                        <table id="header-fixed" class="GridHeader"></table>
                        <div id="div_derecho_inventario">
                            <asp:Panel ID="panel_maximos_minimos" runat="server">
                                <div id="div_inventario_limitado" class="limitado">
                                    <asp:UpdatePanel ID="actualizacion_maximos_minimos" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="tabla_inventario" runat="server" CssClass="tabla" AutoGenerateColumns="false"
                                                DataKeyNames="codigo" OnRowDataBound="tabla_inventario_RowDataBound">
                                                <HeaderStyle CssClass="GridHeader" />
                                                <PagerSettings Visible="False" />
                                                <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Left" />
                                                <AlternatingRowStyle CssClass="GridRow" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="filacheck" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Proveedor" DataField="proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Codigo" DataField="codigo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Modelo" DataField="modelo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Maximo" DataField="maximo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Nuv. Maximo" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>

                                                            <asp:TextBox ID="caja_nuevo_maximo" ToolTip="Nuevo Maximo" Text="" runat="server" class="cantidad" Width="50px"></asp:TextBox>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Reorden" DataField="reorden" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Nuv. Reorden" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>

                                                            <asp:TextBox ID="caja_nuevo_reorden" Text="" ToolTip="Nuevo Reorden" runat="server" class="cantidad" Width="50px"></asp:TextBox>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Minimo" DataField="minimo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Nuv. Minimo" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>

                                                            <asp:TextBox ID="caja_nuevo_minimo" ToolTip="Nuevo Minimo" Text="" runat="server" class="cantidad" Width="50px"></asp:TextBox>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Estadisticas" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Panel ID="panel_estadisticas" runat="server" Visible="false">
                                                                <a href="JavaScript:sacalo('div<%# Eval("codigo")+ "re" %>');">
                                                                    <img alt="Detalles" id="imgdiv<%# Eval("codigo")+ "re" %>" src="png/plus.png" /></a>
                                                                <div id="div<%# Eval("codigo")+ "re" %>" style="display: none" class="panel" title="Codigo:  <%# Eval("codigo")%>">
                                                                    <div class="limitado_custom">
                                                                        <asp:GridView ID="tabla_datos" runat="server" CssClass="tabla" AutoGenerateColumns="false" OnRowDataBound="tabla_datos_RowDataBound" DataKeyNames="codigo">
                                                                            <HeaderStyle CssClass="GridHeader" />
                                                                            <PagerSettings Visible="False" />
                                                                            <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Left" />
                                                                            <AlternatingRowStyle CssClass="GridRow" />
                                                                            <Columns>
                                                                                <asp:BoundField HeaderText="Dias Sin Venta" DataField="cantidad" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:DropDownList ID="lista_de_ventas" runat="server" CssClass="clase_falsa_ventas" Style="display: none;"></asp:DropDownList>

                                                                                        <div class="grafica_anidada">
                                                                                            <canvas id="graficas<%# Eval("codigo")+ "re" %>" width="300" height="250" class="clase_falsa_grafica"></canvas>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField HeaderText="Ultima Venta" DataField="ultima_venta" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                <asp:BoundField HeaderText="Movimientos" DataField="movimientos" ItemStyle-HorizontalAlign="Center" />
                                                                                <asp:BoundField HeaderText="codigo" DataField="codigo" ItemStyle-HorizontalAlign="Center" />
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                        <div class="barra" style="height: 1.5em; text-align: center; background: #ec7063;">
                                                                            <asp:Label ID="Label1" runat="server" Text="Grafica" CssClass="tipo_texto texto_chico"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="panel_sucursales" runat="server" Visible="false">
                    <div id="div_panel_sucursales" class="limitado">
                        <asp:ListView ID="lista_sucursales" runat="server" GroupItemCount="1" GroupPlaceholderID="groupPlaceHolder1"
                            ItemPlaceholderID="itemPlaceHolder1">
                            <LayoutTemplate>
                                <table>
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <td>
                                    <table class="lista_sucursales">
                                        <tr>
                                            <td>
                                                <b><u><span class="etiquetas_barra_superior">
                                                    <%# Eval("nombre_sucursal") %></span></u></b>
                                                <input type="hidden" name="country" <%# Eval("id_sucursal") %>>
                                            </td>
                                            <td>
                                                <asp:LinkButton Text="Ver Inventario" ID="boton_inventario_sucursales" CommandArgument='<%# Eval("id_sucursal") %>' OnCommand="accion_sucursales" runat="server" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </asp:Panel>
                <div></div>
                <asp:Panel ID="panel_seleccion_reorden" runat="server" Visible="false">
                    <div id="div_panel_reorden" class="limitado">
                        <asp:UpdatePanel ID="panel_actualizable" runat="server">
                            <ContentTemplate>
                                <div>
                                    <asp:TextBox ID="caja_busqueda_servidor" runat="server" ></asp:TextBox>
                                    <asp:GridView ID="tabla_inventario_reorden" runat="server" CssClass="tabla" AutoGenerateColumns="false"
                                        DataKeyNames="codigo">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="filacheck" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Proveedor" DataField="proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Codigo" DataField="codigo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Modelo" DataField="modelo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <asp:LinkButton ID="boton_oculto_cargar_inventario" runat="server" OnClick="boton_oculto_cargar_inventario_Click" style="display:none;"></asp:LinkButton>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="boton_oculto_cargar_inventario" EventName="Click"/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </asp:Panel>
                <asp:Panel ID="panel_resurtir_inventario" runat="server" Visible="false">
                    <asp:UpdatePanel ID="actualizacion_resurtir_inventario" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <div id="div_resurtir_inventario" class="limitado">
                                <asp:GridView ID="tabla_inventario_resusrtir" runat="server" CssClass="tabla" AutoGenerateColumns="false"
                                    DataKeyNames="codigo" OnRowDataBound="tabla_inventario_resusrtir_RowDataBound">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="fila_check_box" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Proveedor" DataField="proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Modelo" DataField="modelo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Maximo" DataField="maximo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Reorden" DataField="reorden" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:BoundField HeaderText="Minimo" DataField="minimo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Cantidad a Surtir" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:TextBox ID="caja_cantidad" ToolTip="Cantidad" Text="" runat="server" class="cantidad" Width="50px"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Peticion A:" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="lista_sucursales" runat="server" CssClass="capitalizar">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ordenes" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Panel ID="panel_ordenes" runat="server" Visible="false">
                                                    <a href="JavaScript:sacalo2('div<%# Eval("codigo")+ "e"%>');">
                                                        <img alt="Detalles" id="imgdiv<%# Eval("codigo")+ "e"%>" src="png/plus.png" /></a>
                                                    <div id="div<%# Eval("codigo")+ "e"%>" style="display: none" class="panel" title="Codigo:  <%# Eval("codigo")%>">
                                                        <div class="limitado_custom" style="max-width: 800px; max-height: 200px;">
                                                            <asp:GridView ID="tabla_ordenes" runat="server" CssClass="tabla" AutoGenerateColumns="false" Width="400">
                                                                <HeaderStyle CssClass="GridHeader" />
                                                                <PagerSettings Visible="False" />
                                                                <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Left" />
                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="Descripcion" DataField="descripcion" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                                    <asp:BoundField HeaderText="Clave" DataField="clave" ItemStyle-HorizontalAlign="Center" />
                                                                    <asp:BoundField HeaderText="Fecha" DataField="fecha" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MMMM/yyyy  HH:MM tt}" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                </asp:Panel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                </asp:Panel>
            </div>
            <div id="div_filtrado">
                <div class="opciones" id="opciones" runat="server">
                    <ul class="opciones_filtrado">
                        <li class="filtro">
                            <asp:Label ID="Label1" runat="server" Text="Buscar" CssClass="separador_5"></asp:Label>
                            <asp:TextBox type="text" ID="caja_busqueda" runat="server" CssClass=" caja_medina" placeholder="Introduzca busqueda"></asp:TextBox>
                        </li>
                        <li class="lis_custom">
                            <asp:LinkButton ID="buscale" ToolTip="Busca en la tabla principal" runat="server" class="botones_proceso gris_plata" OnClientClick="return false;"><i class="fa fa-search" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="reset" runat="server" ToolTip="Reinicia la busqueda" class="botones_proceso gris_plata" OnClientClick="return false;"><i class="fa fa-refresh" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="seleccionar" ToolTip="Selecciona todos los productos visibles" runat="server" class="botones_proceso gris_plata"
                                OnClientClick="return false;"><i class="fa fa-check-square-o" aria-hidden="true"></i></asp:LinkButton>
                        </li>
                        <li id="li_procesar" class="li_procesar">
                            <asp:Panel ID="panel_boton_procesar_minimos" runat="server" Visible="false">
                                <asp:LinkButton ID="boton_procesar_asignacion" runat="server" ToolTip="Modifica las cantidades de maximo,minimo,reorden" class="botones_proceso gris_plata"
                                    OnClick="boton_actualizar_cantidades_click"><i class="fa fa-cogs" aria-hidden="true"></i></asp:LinkButton>
                            </asp:Panel>
                        </li>
                        <li id="li_procesar_reorden" class="li_procesar">
                            <asp:Panel ID="panel_boton_procesar_reorden" runat="server" Visible="false">
                                <asp:LinkButton ID="boton_procesar_reorden" runat="server" ToolTip="Configura los productos para reorden" class="botones_proceso gris_plata"
                                    OnClick="procesar_seleccion_de_productos_reorden"><i class="fa fa-cogs" aria-hidden="true"></i></asp:LinkButton>
                            </asp:Panel>
                            <asp:Panel ID="panel_boton_solicitar_requisicion" runat="server" Visible="false">
                                <asp:LinkButton ID="boton_solicitar_productos_requisicion" runat="server" OnClick="boton_solicitar_productos_requisicion_Click"
                                    ToolTip="Generar requisicion de los productos seleccionados" Style="text-decoration: none" CssClass="botones_proceso turqueza primero"><i class="fa fa-shopping-cart"></i></asp:LinkButton>
                            </asp:Panel>
                        </li>
                        <li class="li_procesar" style="left: 79% !important;">
                            <asp:Panel ID="panel_boton_trasferencia" runat="server" Visible="false" Style="position: absolute; display: inline-table; bottom: 0em;">
                                <asp:LinkButton ID="boton_solicitar_productos_trasferencia" runat="server" OnClick="confirmacion_boton_trasferencia"
                                    ToolTip="Generar una orden de trasferencia por los productos selecionados" Style="text-decoration: none" CssClass="botones_proceso turqueza"><i class="fa fa-truck"></i></asp:LinkButton>
                            </asp:Panel>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="boton_oculto_si_Click"
            Style="display: none;"></asp:LinkButton>
        <asp:HiddenField ID="campo_bandera" runat="server" />
    </form>
</body>
</html>

