<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/reportes_ventas.aspx.cs" Inherits="reportes_ventas" %>

<style>
    .barra {
        position: relative;
        background:#007acc;
        width: 100%;
        height: 50px;
        border-radius:2px;
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
        height:47%;
        position: relative;
        display: inline-block;
        background: transparent !important;
        top: 0;
    }
    .inferior {
        height: 47%;
        position:relative;
        display: inline-block;
        background: transparent !important;
        bottom:0;
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
        border-radius: 3px;
        color: rgba(255,255,255,1);
        text-align: center;
        -o-text-overflow: ellipsis;
        text-overflow: ellipsis;
        -webkit-box-shadow: 0 0 0 0 rgba(0,0,0,1);
        box-shadow: 0 0 0 0 rgba(0,0,0,1);
        text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
        background: rgb(234, 237, 237);
        margin-top: 3%;
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
        font-size: larger;
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
        font-size: larger;
    }
    .titulo_der_sup{
        position: absolute;
        top: 10%;
        right: 0px;
        color: #2C3E50;
        text-decoration: none;
        display: inline-block;
        margin-right: 7%;
        font-weight: bolder;
        font-size: larger;
    }
    .titulo_der_inf{
        position: absolute;
        top: 55%;
        right: 0px;
        color: #2C3E50;
        text-decoration: none;
        display: inline-block;
        margin-right: 7%;
        font-weight: bolder;
        font-size:larger;
    }
    .capitalizar {
        text-transform: capitalize;
    }
    .ul_principal{
        list-style:none;
        position:absolute;
        display:inline-block;
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
        width:97%;
        height:65%;
    }
    .grande {
        font-size: large !important;
    }
    .controles_graficas {
        float: left;
        margin-top: 1%;
        margin-left: 1%;
    }

    .margen_derecho_10{
        margin-right: 12%;
    }
    .barra_etiquetas {
        position: relative;
        background: #007acc;
        width: 20em;
        height: 50px;
        border-radius: 2px;
        margin-left: 1em;
    }
    .separador_6 {
        margin-top: 6%;
    }
</style>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Dashboard Ventas - Inklaser</title>
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/chart2/Chart.js"></script>  
    <script type="text/javascript" src="js/chart2/Chart.min.js"></script>  
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link rel="stylesheet" href="css/base.css" type="text/css" />
    <link rel="stylesheet" href="css/material-design-font.css" />
    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.css" type="text/css" /> 
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css"/>   
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />         
    <script>
        <%  var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();  %> 
        var dibuja_grafica_puntos;
        var grafica_pastel;
        var grafica_clientes;
        var grafica_productos;
        var grafica_estados,grafica_vendedores;

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
        onload = abrir();
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

        $(function () {
            $('#fecha').datepicker({changeMonth: true,
                changeYear: true,
                minDate: new Date(2015, 1 - 1, 1),
                maxDate: "0M",});
            $('#fecha_fin').datepicker({changeMonth: true,
                changeYear: true,
                minDate: new Date(2015, 1 - 1, 1),
                maxDate: "0M",});
        });
       
        
        function graficar_barras(tipo)
        {  
            var grafica_barra = document.getElementById("grafica_1").getContext("2d");
            var etiquetas =$('#etiquetas_grafica_barras').val().split('?');
            var datos = $('#datos_grafica_barras').val().split('?');   
            var tamano = datos.length;
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            var color = new Array();
            for(var j = 0; j < tamano; j ++ )
            {
                colorsito = '#';
                for (var i = 0; i < 6; i++ ) {
                    colorsito += letras[Math.floor(Math.random() * 16)];
                }
                color[j] = colorsito;
            }
            var datos_grafica_1 = {
                type: 'horizontalBar',
                data: {
                    labels: etiquetas,
                    datasets: [{
                        data:datos,
                        backgroundColor: color,
                        label:"%"
                    }]
                }
            }
            if (grafica_vendedores) {
                grafica_vendedores.clear();
                grafica_vendedores.destroy();
            }
            var dato = jQuery.extend(true, {}, datos_grafica_1);
            dato.type = tipo;     
            grafica_vendedores = new Chart(grafica_barra,dato);
        }

        function graficar()
        {
            graficar_barras('horizontalBar');
            graficar_pastel('pie');
            graficar_puntos('line');
            graficar_clientes('bar');
            graficar_productos('bar');
            graficar_estados('bar');
        }

        function graficar_pastel(tipo)
        {  
            var grafica_pastel_canvas = document.getElementById("grafica_pastel").getContext("2d");
            var etiquetas_pastel =  <%= serializer . Serialize ( etiquetas_pastel )  %>;
            var datos_pastel =  <%= serializer . Serialize ( datos_pastel )  %>;   
            var tamano = datos_pastel.length;
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            var chispas = new Array();
            var chocolates = new Array();
            var ingredientes = new Array();
            for(var j = 0; j < tamano; j ++ )
            {
                colorsito = '#';
                for (var i = 0; i < 6; i++ ) {
                    colorsito += letras[Math.floor(Math.random() * 16)];
                }
                chispas[j] = colorsito;
            }
            ingredientes  = {
                type: 'pie',
                data: {
                    labels: etiquetas_pastel,
                    datasets: [{
                        data:datos_pastel,
                        backgroundColor: chispas,
                        label:"Sucursales"
                    }]
                }
            }
            if (grafica_pastel) {
                grafica_pastel.clear();
                grafica_pastel.destroy();
            }
            var dato = jQuery.extend(true, {}, ingredientes);
            dato.type = tipo;     
            grafica_pastel = new Chart(grafica_pastel_canvas,dato);          
        }
        
        function graficar_puntos(tipo)
        {  
            var grafica_puntos = document.getElementById("grafica_puntos").getContext("2d");
            var etiquetas_1_punto =$('#etiquetas_1_grafica_punto').val().split('?');
            var etiquetas_2_punto =$('#etiquetas_2_grafica_punto').val().split('?');
            var datos_1_punto = $('#datos_1_grafica_puntos').val().split('?');  
            var datos_2_punto = $('#datos_2_grafica_puntos').val().split('?'); 
            var tamano = datos_1_punto.length;
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            var chispas = new Array();
            var chocolates = new Array();
            var ingredientes = new Array();
          
            for(var j = 0; j < 12; j ++ )
            {
                colorsito = '#';
                for (var i = 0; i < 6; i++ ) {
                    colorsito += letras[Math.floor(Math.random() * 16)];
                }
                chispas[j] = colorsito;
            }
          
            if(tamano > 2)
            {
                var datos_anuales  = {
                    type: 'line',
                    data: {
                        labels: etiquetas_1_punto,
                        datasets: [{
                            data:datos_1_punto,
                            backgroundColor: 'rgba(0, 127, 255, 0.4)',
                            label:"Actual"
                        },
                        {
                            data:datos_2_punto,
                            backgroundColor: 'rgba(171, 82, 164, 0.5)',
                            label:"Pasado"
                        }
                        ]
                    }
                }
            }
            else
            {
                tamano = 2;           
                var datos_anuales  = {
                    type: 'bar',
                    data: {
                        labels: etiquetas_1_punto,
                        datasets: [{
                            data:datos_1_punto,
                            backgroundColor: "0, 127, 255, 0.8",
                            label:"Actual"
                        },
                        {
                            data:datos_2_punto,
                            backgroundColor: "171, 82, 164, 0.8",
                            label:"Pasado"
                        }
                        ]
                    }
                }
            }

            if (dibuja_grafica_puntos) {
                dibuja_grafica_puntos.clear();
                dibuja_grafica_puntos.destroy();
            }
            var dato = jQuery.extend(true, {}, datos_anuales);
            dato.type = tipo;
            dibuja_grafica_puntos = new Chart(grafica_puntos,dato);
        } 

        function graficar_clientes(tipo)
        {  
            var grafica_barra = document.getElementById("grafica_clientes").getContext("2d");
            var etiquetas =$('#etiquetas_cliente').val().split('?');
            var datos = $('#datos_cliente').val().split('?');   
            var tamano = datos.length;
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            if(tipo == "line")
            {
                var color;
                color = 'rgba(171, 82, 164, 0.5)';
            }
            else{
                var color = new Array();
                for(var j = 0; j < tamano; j ++ )
                {
                    colorsito = '#';
                    for (var i = 0; i < 6; i++ ) {
                        colorsito += letras[Math.floor(Math.random() * 16)];
                    }
                    color[j] = colorsito;
                }
            }
            
            
            var datos_anuales = {
                type: 'bar',
                data: {
                    labels: etiquetas,
                    datasets: [{
                        data:datos,
                        backgroundColor: color,
                        label:"Clientes"
                    }]
                }
            }
            if (grafica_clientes) {
                grafica_clientes.clear();
                grafica_clientes.destroy();
            }
            var dato = jQuery.extend(true, {}, datos_anuales);
            dato.type = tipo;
            grafica_clientes = new Chart(grafica_barra,dato);
        }

        function graficar_productos(tipo)
        {  
            var grafica_barra = document.getElementById("grafica_productos").getContext("2d");
            var etiquetas =$('#etiquetas_productos').val().split('?');
            var datos = $('#datos_productos').val().split('?');   
            var tamano = datos.length;
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            var color = new Array();
            for(var j = 0; j < tamano; j ++ )
            {
                colorsito = '#';
                for (var i = 0; i < 6; i++ ) {
                    colorsito += letras[Math.floor(Math.random() * 16)];
                }
                color[j] = colorsito;
            }
            
            var datos_anuales = {
                type: 'bar',
                data: {
                    labels: etiquetas,
                    datasets: [{
                        data:datos,
                        backgroundColor: color,
                        label:"Productos"
                    }]
                }
            }
            if (grafica_productos) {
                grafica_productos.clear();
                grafica_productos.destroy();
            }
            var dato = jQuery.extend(true, {}, datos_anuales);
            dato.type = tipo;
            grafica_productos = new Chart(grafica_barra,dato);
        }

        function graficar_estados(tipo)
        {  
            var grafica_barra = document.getElementById("grafica_estados").getContext("2d");
            var etiquetas =$('#etiquetas_estados').val().split('?');
            var datos = $('#datos_estados').val().split('?');   
            var tamano = datos.length;
            var letras = '0123456789ABCDEF'.split('');
            var colorsito = '#';
            var color = new Array();
            for(var j = 0; j < tamano; j ++ )
            {
                colorsito = '#';
                for (var i = 0; i < 6; i++ ) {
                    colorsito += letras[Math.floor(Math.random() * 16)];
                }
                color[j] = colorsito;
            }
            
            var datos_anuales = {
                type: 'bar',
                data: {
                    labels: etiquetas,
                    datasets: [{
                        data:datos,
                        backgroundColor: color,
                        label:"Productos"
                    }]
                }
            }
            if (grafica_estados) {
                grafica_estados.clear();
                grafica_estados.destroy();
            }
            var dato = jQuery.extend(true, {}, datos_anuales);
            dato.type = tipo;
            grafica_estados = new Chart(grafica_barra,dato);
        }
       
        $( function() {
            var tabs = $( "#tabs" ).tabs();
            tabs.find( ".ui-tabs-nav" ).sortable({
                axis: "x",
                stop: function() {
                    tabs.tabs( "refresh" );
                }
            });
        });
    </script>
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="script" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
        <asp:HiddenField ID="datos_grafica_barras" runat="server" />
        <asp:HiddenField ID="etiquetas_grafica_barras" runat="server" />
        <asp:HiddenField ID="datos_grafica_pastel" runat="server" />
        <asp:HiddenField ID="etiquetas_grafica_pastel" runat="server" />
        <asp:HiddenField ID="etiquetas_1_grafica_punto" runat="server"/>
        <asp:HiddenField ID ="etiquetas_2_grafica_punto" runat="server" />
        <asp:HiddenField ID="datos_1_grafica_puntos" runat="server" />
        <asp:HiddenField ID="datos_2_grafica_puntos" runat ="server" />
        <asp:HiddenField ID="etiquetas_cliente" runat="server" />
        <asp:HiddenField ID="datos_cliente" runat="server" />
        <asp:HiddenField ID="etiquetas_productos" runat="server" />
        <asp:HiddenField ID="datos_productos" runat="server" />
        <asp:HiddenField ID="etiquetas_estados" runat="server" />
        <asp:HiddenField ID="datos_estados" runat="server" />
        <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="boton_oculto_si_Click" style="display:none;"/>
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
                <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Reporte Ventas</asp:Label>
                <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                    OnClientClick="javascript: return salir();"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
            </div>
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
                            <asp:TextBox ID="fecha" CssClass="caja_fecha" runat="server" ></asp:TextBox>
                        </li>
                        <li id="li_fecha_fin">
                            <p class="texto_titulos">
                                A:
                            </p>
                            <asp:TextBox ID="fecha_fin" CssClass="caja_fecha" runat="server"></asp:TextBox>
                        </li>
                        <li style="display:none;">
                            <p class="texto_titulos">
                                Buscar Cliente
                            </p>
                            <asp:TextBox ID="busqueda_cliente" CssClass="caja_lista" runat="server"></asp:TextBox>
                        </li>
                        <li style="display:none;">
                            <p class="texto_titulos">
                                Buscar Producto
                            </p>
                            <asp:TextBox ID="caja_producto" CssClass="caja_lista" runat="server"></asp:TextBox>
                        </li>
                        <li>
                            <asp:LinkButton ID="boton_buscar_confirmacion" runat="server" ToolTip="Buscar Cotizaciones" Style="text-decoration: none;"
                                CssClass="botones_controles aprobar" OnClick="boton_buscar_confirmacion_Click">Buscar</asp:LinkButton>
                        </li>
                        <asp:Panel ID="buscar_vendedor" runat="server" Visible="false">
                            <li>
                                <p class="texto_titulos">
                                    Buscar Vendedor
                                </p>
                                <asp:TextBox ID="caja_buscar_vendedor" CssClass="caja_lista" runat="server"></asp:TextBox>
                            </li>
                            <li>
                                <asp:LinkButton ID="boton_buscar_vendedor_confirmacion" runat="server" ToolTip="Buscar Vendedor"
                                    Style="text-decoration: none;" CssClass="botones_controles aprobar" OnClick="boton_buscar_vendedor_confirmacion_Click">Buscar</asp:LinkButton>
                            </li>
                        </asp:Panel>
                    </ul>
                </div>
            </div>
            <div class="derecho">
                <div class="barra">
                    <asp:Label ID="fecha_barra" runat="server" Text="" CssClass="titulo_barra tipo_texto"></asp:Label>
                </div>
                <div id="tabs">
                    <ul>
                        <li><a href="#tab-estadisticas">Estadisticas</a></li>
                        <li><a href="#tabs-2">Sumaria</a></li>
                        <li><a href="#tabs-3">Registros</a></li>
                    </ul>
                    <div id="tab-estadisticas">
                        <div class="superior limitado" style="min-height:63%;">
                            <ul class="ul_principal">                              
                                <li>
                                    <div id="div_grafica_ventas" class="grafica_1">
                                        <div class="barra" style="height: 1.5em; text-align: center;">
                                            <div class="controles_graficas">
                                                <a href="JavaScript:graficar_barras('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_barras('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_barras('doughnut');"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_barras('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                            </div>
                                            <asp:Label ID="titulo_grafica_barra" runat="server" Text="% Representativo Ventas Por Vendedor" CssClass="tipo_texto texto_chico"></asp:Label>
                                        </div>
                                        <canvas id="grafica_1" width="450" height="250"></canvas>
                                    </div>
                                </li>
                                <li style = "margin-left: 29em;">                                 
                                    <div id="div_grafica_pastel">
                                        <div class="barra" style="height: 1.5em; text-align: center;">
                                            <div class="controles_graficas">
                                                <a href="JavaScript:graficar_pastel('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_pastel('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_pastel('doughnut');"><i class="fa fa-dot-circle-o" aria-hidden="true"></i></a>
                                                <a href="JavaScript:graficar_pastel('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                            </div>
                                            <asp:Label ID="etiqueta_pastel" runat="server" Text="Ventas Sucursal" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                        </div>
                                        <div class="separador" style="height: 25px;"></div>
                                        <canvas id="grafica_pastel" width="400" height="200"></canvas>
                                    </div>
                                </li>
                            </ul>
                            <div>
                                <ul class="ul_principal" style="top: 19em;">
                                    <li>                                                                           
                                        <div id="div_grafica_puntos">
                                            <div class="barra" style="height: 1.5em; text-align: center;">
                                                <div class="controles_graficas">
                                                    <a href="JavaScript:graficar_puntos('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_puntos('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_puntos('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                </div>
                                                <asp:Label ID="Label3" runat="server" Text="Ventas Periodo Versus" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <canvas id="grafica_puntos" width="400" height="200"></canvas>
                                        </div>
                                    </li>
                                     <li style = "margin-left: 29em; position: absolute; top:0;">                                                                         
                                        <div id="div_grafica_clientes">
                                            <div class="barra" style="height: 1.5em; text-align: center;">
                                                <div class="controles_graficas">
                                                    <a href="JavaScript:graficar_clientes('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_clientes('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_clientes('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_clientes('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                                </div>
                                                <asp:Label ID="Label4" runat="server" Text="Clientes" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <canvas id="grafica_clientes" width="400" height="200"></canvas>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div>
                                <ul class="ul_principal" style="top: 35em;">
                                    <li>
                                        <div id="div_grafica_estado">
                                            <div class="barra" style="height: 1.5em; text-align: center;">
                                                <div class="controles_graficas">
                                                    <a href="JavaScript:graficar_estados('pie');"><i class="fa fa-pie-chart" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_estados('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_estados('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                </div>
                                                <asp:Label ID="Label7" runat="server" Text="Estado De Cotizaciones" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <canvas id="grafica_estados" width="400" height="200"></canvas>
                                        </div>
                                    </li>
                                    <li style="margin-left: 29em; position: absolute; top: 0;">
                                        <div id="div_grafica_productos">
                                            <div class="barra" style="height: 1.5em; text-align: center;">
                                                <div class="controles_graficas">
                                                    <a href="JavaScript:graficar_productos('line');"><i class="fa fa-area-chart" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_productos('horizontalBar');"><i class="fa fa-bar-chart fa-rotate-90" aria-hidden="true"></i></a>
                                                    <a href="JavaScript:graficar_productos('bar');"><i class="fa fa-bar-chart" aria-hidden="true"></i></a>
                                                </div>
                                                <asp:Label ID="Label8" runat="server" Text="Productos" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <canvas id="grafica_productos" width="400" height="200"></canvas>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="tabs-2">
                        <div class="contenedor_tabs">
                            <div class="main_izquierdo">
                                <ul class="ul_principal">
                                    <li>
                                        <div id="div_indicador_1" class="inferior">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label11" runat="server" Text="Ventas" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_1" class="contenedor_ganancias">
                                                <asp:Label ID="indicador_ganancias" runat="server" CssClass="titulo_superior tipo_texto" Text="Ticket:"></asp:Label>
                                                <asp:Label ID="indicador_ganancias_por" runat="server" CssClass="titulo_inferior tipo_texto" Text="Total:"></asp:Label>
                                                <i></i>
                                                <asp:Label ID="etiqueta_cantidad" runat="server" CssClass="titulo_der_sup tipo_texto" Text=""></asp:Label>
                                                <asp:Label ID="etiqueta_total" runat="server" CssClass="titulo_der_inf tipo_texto" Text=""></asp:Label>
                                            </div>
                                        </div>                                       
                                    </li>
                                    <li>
                                        <div id="div_indicador_2" class="inferior separador_6" style="top: 6em;">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label12" runat="server" Text="" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_2" class="contenedor_ganancias" >
                                                <asp:Label ID="Label1" runat="server" CssClass="titulo_superior tipo_texto" Text="Ventas:"></asp:Label>
                                                <asp:Label ID="Label2" runat="server" CssClass="titulo_inferior tipo_texto" Text="Ganancias:"></asp:Label>
                                                <asp:Label ID="etiqueta_total_ventas" runat="server" CssClass="titulo_der_sup tipo_texto" Text=""></asp:Label>
                                                <asp:Label ID="etiqueta_ganancias" runat="server" CssClass="titulo_der_inf tipo_texto" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="div_indicador_3" class="inferior separador_6" style="top: 12em;">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label15" runat="server" Text="Clientes" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_3" class="contenedor_ganancias" >
                                                <asp:Label ID="Label5" runat="server" CssClass="titulo_superior tipo_texto" Text="Clientes:"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" CssClass="titulo_inferior tipo_texto" Text="Nuevos:"></asp:Label>
                                                <asp:Label ID="etiqueta_clientes" runat="server" CssClass="titulo_der_sup tipo_texto" Text=""></asp:Label>
                                                <asp:Label ID="etiqueta_clientes_nuevos" runat="server" CssClass="titulo_der_inf tipo_texto" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="div_indicador_4" class="inferior separador_6" style="top: 18em;">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label16" runat="server" Text="Ventas A Clientes:" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_4" class="contenedor_ganancias" >
                                                <asp:Label ID="Label9" runat="server" CssClass="titulo_superior tipo_texto grande" Text="Registrados:"></asp:Label>
                                                <asp:Label ID="Label10" runat="server" CssClass="titulo_inferior tipo_texto" Text="Nuevos:"></asp:Label>
                                                <asp:Label ID="etiqueta_clientes_registrados" runat="server" CssClass="titulo_der_sup tipo_texto" Text=""></asp:Label>
                                                <asp:Label ID="etiqueta_clientes_activos" runat="server" CssClass="titulo_der_inf tipo_texto" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="main_derecho">
                                <ul class="ul_principal">
                                    <li>
                                        <div id="div_indicador_5" class="inferior">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label29" runat="server" Text="Compras" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_5" class="contenedor_ganancias" >
                                                <asp:Label ID="Label13" runat="server" CssClass="titulo_superior tipo_texto" Text="Compras:"></asp:Label>
                                                <asp:Label ID="Label14" runat="server" CssClass="titulo_inferior tipo_texto" Text="Total:"></asp:Label>
                                                <asp:Label ID="etiqueta_compras" runat="server" CssClass="titulo_der_sup tipo_texto" Text=""></asp:Label>
                                                <asp:Label ID="etiqueta_compras_total" runat="server" CssClass="titulo_der_inf tipo_texto" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="div_indicador_6" class="inferior separador_6" style="top: 6em;">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label30" runat="server" Text="Facturas" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_6" class="contenedor_ganancias" >
                                                <asp:Label ID="Label17" runat="server" CssClass="titulo_superior tipo_texto grande" Text="Facturas Pendientes:"></asp:Label>
                                                <asp:Label ID="Label18" runat="server" CssClass="titulo_inferior tipo_texto" Text="Total:"></asp:Label>
                                                <asp:Label ID="Label19" runat="server" CssClass="titulo_der_sup tipo_texto" Text="0"></asp:Label>
                                                <asp:Label ID="Label20" runat="server" CssClass="titulo_der_inf tipo_texto" Text="$0"></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="div_indicador_7" class="inferior separador_6" style="top: 12em;">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label31" runat="server" Text="" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_7" class="contenedor_ganancias">
                                                <asp:Label ID="Label21" runat="server" CssClass="titulo_superior tipo_texto grande" Text="Facturas Atrasadas:"></asp:Label>
                                                <asp:Label ID="Label22" runat="server" CssClass="titulo_inferior tipo_texto" Text="Total:"></asp:Label>
                                                <asp:Label ID="Label23" runat="server" CssClass="titulo_der_sup tipo_texto" Text="0"></asp:Label>
                                                <asp:Label ID="Label24" runat="server" CssClass="titulo_der_inf tipo_texto" Text="$0"></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div id="div_indicador_8" class="inferior separador_6" style="top: 18em;">
                                            <div class="barra_etiquetas" style="height: 1.5em; text-align: center;">
                                                <asp:Label ID="Label32" runat="server" Text="" CssClass="tipo_texto texto_chico margen_derecho_10"></asp:Label>
                                            </div>
                                            <div id="div_etiqueta_indicador_8" class="contenedor_ganancias">
                                                <asp:Label ID="Label25" runat="server" CssClass="titulo_superior tipo_texto grande" Text="Facturas Pagadas:"></asp:Label>
                                                <asp:Label ID="Label26" runat="server" CssClass="titulo_inferior tipo_texto" Text="Total:"></asp:Label>
                                                <asp:Label ID="Label27" runat="server" CssClass="titulo_der_sup tipo_texto" Text="0"></asp:Label>
                                                <asp:Label ID="Label28" runat="server" CssClass="titulo_der_inf tipo_texto" Text="$0"></asp:Label>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>                     
                    </div>
                    <div id="tabs-3">
                         <div class="contenedor_tabs">
                             <asp:UpdatePanel ID="panel_registros" runat="server" UpdateMode="Conditional">
                                 <ContentTemplate>
                                     <fieldset id="campo_ventas">
                                         <asp:Panel ID="panel_ventas" runat="server">
                                             <div class="limitado">
                                                 <asp:GridView ID="tabla_registros_ventas" runat="server" CssClass="tabla_cotizaciones">
                                                     <HeaderStyle CssClass="GridHeader" />
                                                     <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                                     <AlternatingRowStyle CssClass="GridRow" />
                                                     <Columns>
                                                         <asp:BoundField HeaderText="Clave" DataField="clave_carrito_cotizacion" />
                                                         <asp:BoundField HeaderText="Clave" DataField="clave_carrito_cotizacion" />
                                                         <asp:BoundField HeaderText="Clave" DataField="clave_carrito_cotizacion" />
                                                         <asp:BoundField HeaderText="Clave" DataField="clave_carrito_cotizacion" />
                                                         <asp:BoundField HeaderText="Clave" DataField="clave_carrito_cotizacion" />
                                                     </Columns>
                                                 </asp:GridView>
                                             </div>
                                         </asp:Panel>
                                     </fieldset>
                                 </ContentTemplate>
                             </asp:UpdatePanel>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>