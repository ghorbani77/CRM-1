<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/modificar_cliente.cs" Inherits="modificar_cliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="jquery-timepicker-1.3.5/jquery.timepicker.js"></script>
<link href="jquery-timepicker-1.3.5/jquery.timepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    var error = 0;   
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();

    function salir() {
        window.close();
    }

    function domicilio() {
        $("#tabs").tabs({ active: 1 });
    }

    function comisiones() {
        $("#tabs").tabs({ active: 2 });
    }

    function personal() {
        $("#tabs").tabs({ active: 5 });
    }
    function subsucursales() {
        $("#tabs").tabs({ active: 7 });
    }
    function mostrar_editar_personal(){
        //panel_editar_personal

    
    }
    function pageLoad() {

        $('.tab-nav').click(function () {
            $tabs.tabs("option", "active", $(this).attr("rel"));
        });

        $(document).ready(function () {
            $('input.timepicker').timepicker({
                timeFormat: 'h:mm p',
                interval: 30,
                minTime: '7:00am',
                maxTime: '7:00pm',
                /*defaultTime: '8',
                startTime: '8',*/
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        });

        $(function () { $("#tabs").tabs(); });

        $('#sin_rfc').change(function () {
            if (this.checked) {
                $("#caja_rfc").val("XAXX010101000");
            } else {
                $("#caja_rfc").val("");
            }
        });
        $('#representante_sin_rfc').change(function () {
            if (this.checked) {
                $("#caja_rfc_representante").val("XAXX010101000");
            } else {
                $("#caja_rfc_representante").val("");
            }
        });
        
      

        $("#boton_guardar_personal").click(function () {
            var err_p = 0;
            $(".personal").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '' ) {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', '#e03f3f');
                    err_p++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (err_p == 0) {
                return true;
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i>Favor de completar todos los campos.</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });

        $("#boton_guardar_subsucursal").click(function () {
            var err_p = 0;
            $(".subsucursal").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', '#e03f3f');
                    err_p++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (err_p == 0) {
                return true;
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i>Favor de completar todos los campos.</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });

        
        $('#boton_agregar_comision').click(function () {
            if ($('#lista_vendedores').val() != "VENDEDOR" && $('#caja_tasa_cliente').val() != "") {
                $("#lista_vendedores").css('border-width', '1px');
                $("#lista_vendedores").css('border-color', '#cccccc');
                $("#caja_tasa_cliente").css('border-width', '1px');
                $("#caja_tasa_cliente").css('border-color', '#cccccc');
            } else {
                if ($('#lista_vendedores').val() == "VENDEDOR") {
                    $("#lista_vendedores").css('border-width', '2px');
                    $("#lista_vendedores").css('border-color', '#e03f3f');
                } else {
                    $("#lista_vendedores").css('border-width', '1px');
                    $("#lista_vendedores").css('border-color', '#cccccc');
                }
                if ($('#caja_tasa_cliente').val() == "") {
                    $("#caja_tasa_cliente").css('border-width', '2px');
                    $("#caja_tasa_cliente").css('border-color', '#e03f3f');
                } else {
                    $("#caja_tasa_cliente").css('border-width', '1px');
                    $("#caja_tasa_cliente").css('border-color', '#cccccc');
                }
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Revise los campos </div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });

        $('#boton_aceptar').click(function () {
            var error = 0;
            if ($("#caja_rfc").val() == "") {
                error++;
                $("#caja_rfc").css('border-width', '2px');
                $("#caja_rfc").css('border-color', '#e03f3f');
            } else {
                $("#caja_rfc").css('border-width', '1px');
                $("#caja_rfc").css('border-color', '#cccccc');
            }

            /*$(".needed").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', '#e03f3f');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });*/
            $(".dropdown").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == 'Seleccionar' || $(this).val() == 'PAIS' || $(this).val() == 'ESTADO' || $(this).val() == 'CP' ) {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', '#e03f3f');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });

            if (error == 0) {
                return true;
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });
        var departamento = $("#caja_departamento").val();
        if (departamento == 'VENTAS' || departamento == 'ATENCION A CLIENTES') {            
            $("#ocho").css("visibility", "hidden");            
            $("#ocho").css("display", "none");
            //$("#seis").css("visibility", "hidden");
            //$("#seis").css("display", "none");
            $("#nueve").css("visibility", "hidden");
            $("#nueve").css("display", "none");
        }
      
    }/**Final pageLoad**/
    
        function nada(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return false;
        }

        function cliente_existente() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Cliente existente, verificar la información</div> ';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
        }
        function personal_existente() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Personal existente, verificar la información</div> ';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
        }

        function up() {
            posicionar_cursor();
            var boton = document.getElementById('buscar');
            boton.click();
        }
        function up_suc() {
            posicionar_cursor();
            var boton = document.getElementById('busca_suc');
            boton.click();
        }

        function posicionar_cursor(textControlID) {
            var texto = document.getElementById(textControlID);
            if (texto != null && texto.value.length > 0) {
                if (texto.createTextRange) {
                    var rango_campo_texto = texto.createTextRange();
                    rango_campo_texto.moveStart('character', texto.value.length);
                    rango_campo_texto.collapse();
                    rango_campo_texto.select();
                } else if (texto.setSelectionRange) {
                    var size = texto.value.length;
                    texto.setSelectionRange(size, size);
                }
            }
        }
     
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editar clientes - Inklaser</title>
    <meta charset="utf-8" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />     
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'type='text/css'>
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/melissa.css" /> 
    <style type="text/css">  
        .notificacion_div{
            left:40%; 
            top:40%;
            position:absolute;
            z-index:999;
        }
        .notificacion_mensaje{
            background: #e81414;
            height: 30px;
            padding: 3px 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 1.1em;
            text-align: center;
            color: #ffffff;
            /*opacity: 0.8;  */
            border-radius: 20px;
            font-weight: bold;
            z-index:999;
            top: 50%;
            left: 50%;
            width:30em;
           
            margin-top: -9em; 
            margin-left: -15em; 
            position:fixed;
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }       
        a, a:hover, a:active, a:focus {
            text-decoration: none;
            outline: 0;
        }
        .ui-widget-header {
            border: 0px solid #dddddd;
            background: #2471a3;
            color: white;
            font-weight: bold;
        }
       .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {/* La pestaña activa*/
            border: none;
            background: white !important;
            font-weight: normal;
            text-decoration: none;
        }
       .ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {/*Para los links*/
           color: #2471a3 !important; 
           text-decoration: none; 
           border:none;
           text-decoration: none
        }
        .ui-tab:hover {/*Obviamente para el hover :v*/
            background: white;
            border:none;
        }
        .ui-tabs .ui-tabs-nav li {/* Margen de las tabs no activas*/
           margin: 0px; 
           padding:0px;
        }
        .ui-tabs .ui-tabs-nav {
            margin: 0;
            padding: 0px;
            padding-top:2px;
        }
        .ui-tabs .ui-tabs-nav li { background: #2471a3; }
        .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {/*BORDE*/
            border:0px;            
        }
        .ui-state-default a, .ui-state-default a:link .ui-button {
            color: white;
            text-decoration: none;
        }
        .ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus, .ui-button:hover, .ui-button:focus {
            border: none;
            font-weight: normal;
        }
        .ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited, a.ui-button, a:link.ui-button, a:visited.ui-button, .ui-button {
            color: #fffefe;
            text-decoration: none;
        }
       .ui-tabs { position: relative; padding: 0px; }
       .ui-widget-content { border:0px;}
        .ui-widget.ui-widget-content {
            border: 0px solid #c5c5c5;
        }       
       input[type="checkbox"] { 
        -webkit-appearance: checkbox;
        -webkit-box-shadow:inset 0px 1px 6px #ECF3F5 !important;
        box-shadow: inset 0px 1px 6px #ECF3F5 !important;
       }
       .ui-widget-content {
           /* border: 1px solid #dddddd;
            background: #ffffff;*/
            color: #143f5a;
       }
       ul.lista_banco li { 
           margin-left:20px; 
           line-height:3em;
       }
       fieldset {
          margin-top:1.5em;
          width: 50%;
          font:80%/1 sans-serif;
        }
       .input_form {
        color: #888;
        border: 1px solid #C5E2FF;
        outline: 0;
        -webkit-box-shadow:inset 0px 1px 6px #ECF3F5 !important;
        box-shadow: inset 0px 1px 6px #ECF3F5 !important;
        font: 200 12px/25px Arial, Helvetica, sans-serif;
        }
       .Hide{
            display:none; 
        }

       .modulo-esp1 {           
            left: 48%;
            padding: 15px;
            position: fixed;
            top: 420px;
            transform: translate(-50%, -50%);           
        }
       .input_large{width:200%;}
       .observaciones{width:60em;}
       input:focus, .input_form:focus {
          box-shadow: 0 0 5px rgba(81, 203, 238, 1);
          padding: 3px 0px 3px 3px;
          margin: 5px 1px 3px 0px;
          border: 1px solid rgba(81, 203, 238, 1);
          background-color: #f5fbff;/*#eff9ff*/
        }
    </style>   
</head>
<body bgcolor="">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
     <div class="barra_superior" >
            <div class="espacio_logotipo">
                <img class="logotipo" src="img/inklaser.jpeg" />
            </div>
            <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Modificar clientes</asp:Label>
            <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir" OnClientClick="salir();" ><i class="fa fa-times fa-lg"></i></asp:LinkButton>                
      </div>
        <!--FORMULARIO-->
    <asp:HiddenField id="caja_departamento" runat="server"/>
    <div id="principal" class="contenido" style="background-color:blue; height:80%; width:100%; position:fixed; top:0; left:0px;">
       
        <div id="tabs" style=" height:100%; width:100%;">
                  <ul id="menu_principal" class="tabs-">
                    <li id="uno"><a href="#identificacion">Identificación</a></li>
                    <li id="dos"><a href="#domicilio">Domicilio</a></li>
                    <li id="tres"><a href="#configuracion">Configuración</a></li>
                    <li id="cuatro"><a href="#tarjeta">Tarjeta</a></li>
                    <li id="cinco"><a href="#operacion">Operación</a></li>
                    <li id="seis"><a href="#personal">Personal</a></li>
                    <li id="siete"><a href="#contable">Contable</a></li>
                    <li id="ocho"><a href="#sucursales">Sub-sucursales</a></li>
                  </ul>

                <div id="identificacion" style="">
                    
                  <asp:Panel ID="identificacion_datos_identificacion" runat="server">
                      <div class="mytextdiv"><div class="mytexttitle"><b>Datos de identificación </b></div></div>
                       <ul class="lista_banco" > 
                        <li>Número: <asp:TextBox ID="caja_numero_cliente" runat="server" Enabled="false"  placeholder=""  CssClass=" input_form caja_busqueda " ></asp:TextBox>
                        </li>
                        <li>Nombre (Paterno/Materno/Nombre) o Razón Social</li><li> <asp:TextBox ID="caja_nombre_razon" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                        <li>Nombre comercial <asp:TextBox ID="caja_nombre_comercial" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                        <li>RFC <asp:TextBox ID="caja_rfc" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                            <li>Público en general(sin RFC) <asp:CheckBox ID="sin_rfc" runat="server" CssClass=" "></asp:CheckBox></li>
                        <li>CURP <asp:TextBox ID="caja_curp" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li>Nacionalidad <asp:TextBox ID="caja_nacionalidad" runat="server"  placeholder=""  CssClass="input_form " ></asp:TextBox>
                        </li>
                        <li>Notas de venta <asp:DropDownList ID="caja_notas_ventas" runat="server"  placeholder=""  CssClass="input_form dropdown" >
                            <asp:ListItem>Seleccionar</asp:ListItem>
                             <asp:ListItem>Sin definir</asp:ListItem>
                            <asp:ListItem>Desglosar IVA</asp:ListItem>
                            <asp:ListItem>Sin desglosar IVA</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                    </ul>
                    </asp:Panel>

                    <asp:Panel ID="identificacion_clasificacion" runat="server">
                    <div class="mytextdiv"><div class="mytexttitle"><b>Clasificación del cliente </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" >                        
                        <li>Zona <asp:TextBox ID="caja_zona" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                        <li>Ruta <asp:TextBox ID="caja_ruta" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                    </ul>
                    </asp:Panel>

                    <asp:Panel ID="identificacion_configuracion" runat="server" Visible="false">
                    <div class="mytextdiv"><div class="mytexttitle"><b>Configuración </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" > 
                        <li>Fecha Alta <asp:TextBox ID="caja_fecha_alta" runat="server" Enabled="false" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                        <li><asp:CheckBox ID="caja_baja" runat="server" CssClass="caja_busqueda "></asp:CheckBox> Dar de baja</li>
                        <li>Fecha Baja <asp:TextBox ID="caja_fecha_baja" Enabled="false" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li>Tipo de venta <asp:DropDownList ID="caja_tipo_pago" runat="server"  placeholder=""  CssClass="input_form dropdown" >
                            <asp:ListItem>Seleccionar</asp:ListItem>
                            
                             </asp:DropDownList>
                        </li>
                        <li>Descuento <asp:TextBox ID="caja_descuento" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                        <li>Precio a dar <asp:DropDownList ID="caja_precio_dar" runat="server"  placeholder=""  CssClass="input_form dropdown" >
                            <asp:ListItem>Seleccionar</asp:ListItem>
                             <asp:ListItem>Definido</asp:ListItem>
                            <asp:ListItem>Base</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                        <li>Tipo precio <asp:DropDownList ID="caja_tipo_precio" runat="server"  placeholder=""  CssClass="input_form dropdown" >
                            <asp:ListItem>Seleccionar</asp:ListItem>
                            <asp:ListItem>Crédito</asp:ListItem>
                            <asp:ListItem>Contado</asp:ListItem> 
                            <asp:ListItem>Gobierno</asp:ListItem>
                            <asp:ListItem>Web</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                    </ul>
                   </asp:Panel>

                    <asp:Panel ID="identificacion_credito" runat="server" Visible="false">
                      <div class="mytextdiv"><div class="mytexttitle"><b>Sistema de descuento </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" > 
                        <li><asp:CheckBox ID="caja_suspender_credito" runat="server" CssClass="caja_busqueda "></asp:CheckBox> Suspender crédito</li>
                        <li>Días crédito <asp:TextBox ID="caja_dias_credito" runat="server" CssClass="caja_busqueda input_form credCob" ></asp:TextBox></li>
                        <li>Tolerancia <asp:TextBox ID="caja_tolerancia" runat="server" CssClass="caja_busqueda input_form credCob" ></asp:TextBox></li>
                        <li>Máx. Doctos. <asp:TextBox ID="caja_max_doctos" runat="server" CssClass="caja_busqueda input_form credCob" ></asp:TextBox></li>
                        <li>Límite en pesos <asp:TextBox ID="caja_limite_pesos_descuento" runat="server" CssClass="caja_busqueda input_form credCob" ></asp:TextBox></li>
                        <li>Descuento P.P. <asp:TextBox ID="caja_descuento_p" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                        <li>Facturas vencidas <asp:TextBox ID="caja_facturas_vencidas" runat="server" Enabled="false" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li><asp:CheckBox ID="caja_imprimir_facturas_pagadas" runat="server" CssClass="caja_busqueda "></asp:CheckBox> Imprimir sello, cadena y generar XML en facturas pagadas (imprimir original cuando ya esté pagada)</li>
                    </ul>
             
                      <div class="mytextdiv"><div class="mytexttitle"><b>Datos adicionales </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" > 
                        <li>Ventas <asp:TextBox ID="caja_ventas" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li>Referencia Banamex <asp:TextBox ID="caja_referencia_banamex" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li><br />
                       
                    </ul>
                    </asp:Panel>
                  </div>
        <!----------------------------DOMICILIO------------------------------------------------------------------------------------------------------------>
                <div id="domicilio">
                     <div class="mytextdiv"><div class="mytexttitle"><b>Domicilio fiscal </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" > 
                        <li>Calle <asp:TextBox ID="caja_calle" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                        <li>Número externo <asp:TextBox ID="caja_numero_externo" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                        <li>Número interno <asp:TextBox ID="caja_numero_interno" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li>Referencia ubicación <asp:TextBox ID="caja_referencia_ubicacion" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                    </ul>  
                    <ul class="lista_banco" > 
                        <li>País <asp:DropDownList ID="caja_pais" runat="server"  placeholder=""  AutoPostBack="True" onselectedindexchanged="lista_paises_SelectedIndexChanged" CssClass="input_form dropdown" >
                             <asp:ListItem>Seleccionar</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                         <li>Estado <asp:DropDownList ID="caja_estado" runat="server"  placeholder=""  AutoPostBack="True" CssClass="input_form dropdown" onselectedindexchanged="lista_estados_SelectedIndexChanged" >
                             <asp:ListItem>Seleccionar</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                        <li>Código postal <asp:DropDownList ID="caja_codigo_postal" runat="server"  AutoPostBack="True" placeholder=""  CssClass="input_form dropdown" onselectedindexchanged="caja_codigo_postal_SelectedIndexChanged" >
                             <asp:ListItem>Seleccionar</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                        <li>Colonia <asp:DropDownList ID="caja_colonia" runat="server"  placeholder=""  CssClass="input_form dropdown" >
                             <asp:ListItem>Seleccionar</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                        <li>Ciudad <asp:TextBox ID="caja_ciudad" runat="server"  placeholder=""  CssClass="input_form " ></asp:TextBox></li>
                        
                        
                    </ul>   
                      <div class="mytextdiv"><div class="mytexttitle"><b>Teléfonos y fax </b></div><div class="divider"></div></div>
                     <ul class="lista_banco" > 
                        <li>Teléfono <asp:TextBox ID="caja_telefono" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li>Teléfono extra <asp:TextBox ID="caja_telefono_extra" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                     </ul>
                    <ul class="lista_banco" > 
                        <li>Observaciones</li>
                        </ul>
                    <ul class="lista_banco" > 
                    <li><asp:TextBox ID="caja_observaciones_domicilio" runat="server" TextMode="MultiLine" CssClass="caja_busqueda input_form" style="width:100em;" Rows="10" ></asp:TextBox></li>
                    </ul>
                  </div>
        <!----------------------------CONFIGURACIÓN------------------------------------------------------------------------------------------------------------>
                <div id="configuracion">
                     <div class="mytextdiv"><div class="mytexttitle"><b>Dirección electrónica general </b></div><div class="divider"></div></div>
                     <ul class="lista_banco" > 
                        <li>Correo electrónico <asp:TextBox ID="caja_correo" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                     </ul>

                    <asp:Panel ID="configuracion_comisiones" runat="server" Visible="false" style=" min-height:300px;" ScrollBars="Vertical">
                      <div class="mytextdiv"><div class="mytexttitle"><b>Sistema de comisiones </b></div><div class="divider"></div></div>
                        <ul class="lista_banco" > 
                            <li>Agregar comisión a <asp:DropDownList ID="lista_vendedores" runat="server" CssClass="caja_busqueda input_form dropdown" ></asp:DropDownList></li>
                            <li> comisión de <asp:TextBox ID="caja_tasa_cliente" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                            <li><asp:LinkButton ID="boton_agregar_comision" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_agregar_comision_vendedor" ><i class="fa fa-plus" ></i> Agregar </asp:LinkButton></li>
                        </ul>
                        <asp:GridView ID="tabla_comisiones_vendedores" runat="server" AutoGenerateColumns="False"  DataKeyNames="id" DataSource='<%# datos_comisiones_vendedores() %>' onrowcommand="tabla_comisiones_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                            <HeaderStyle CssClass="GridHeader" />
		                    <PagerSettings Visible="False" />
		                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField HeaderText="Id" DataField="id" ></asp:BoundField>
                                <asp:BoundField HeaderText="Vendedor" DataField="vendedor" ></asp:BoundField>
                                <asp:BoundField HeaderText="Tasa de comisión" DataField="comision"></asp:BoundField>

                                <asp:TemplateField HeaderText="" ShowHeader="True">
                                    <ItemTemplate>
                                            <asp:LinkButton ID="boton_cotizar" runat="server" CausesValidation="False" ToolTip="Eliminar" Enabled="true" 
                                            CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-times opcion_tabla controles_tablas"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />                        
                        </asp:TemplateField>

                            </Columns>
                       </asp:GridView>
                    </asp:Panel>

                       <div class="mytextdiv"><div class="mytexttitle"><b>Mensaje de información en la venta y cobranza del cliente </b></div><div class="divider"></div></div>
                     <ul class="lista_banco" > 
                        <li>Mensaje en Ventas y Cobranza <asp:TextBox ID="caja_mensaje_ventas_cobranza" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                     </ul>                        
                  </div>
        <!----------------------------TARJETA------------------------------------------------------------------------------------------------------------>
                <div id="tarjeta">
                    <asp:Panel ID="panel_tarjeta" runat="server" Visible="true">
                        <div class="mytextdiv"><div class="mytexttitle"><b>Datos de tarjeta para cargos </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                            <li>Nombre del tarjeta habiente <asp:TextBox ID="caja_nombre_tarjetahabiente" runat="server" CssClass="caja_busqueda input_form input_large" ></asp:TextBox></li>
                        </ul>
                        <ul  class="lista_banco">
                            <li>Número de la tarjeta <asp:TextBox ID="caja_numero_tarjeta" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                            <li>Mes <asp:DropDownList ID="caja_mes_tarjeta" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem> 
                                <asp:ListItem>Enero</asp:ListItem>
                                <asp:ListItem>Febrero</asp:ListItem>
                                <asp:ListItem>Marzo</asp:ListItem>
                                <asp:ListItem>Abril</asp:ListItem>
                                <asp:ListItem>Mayo</asp:ListItem>
                                <asp:ListItem>Junio</asp:ListItem>
                                <asp:ListItem>Julio</asp:ListItem>
                                <asp:ListItem>Agosto</asp:ListItem>
                                <asp:ListItem>Septiembre</asp:ListItem>
                                <asp:ListItem>Octubre</asp:ListItem>
                                <asp:ListItem>Noviembre</asp:ListItem>
                                <asp:ListItem>Diciembre</asp:ListItem>
                                </asp:DropDownList>
                            </li>
                              <li>Año <asp:DropDownList ID="caja_tarjeta_year" runat="server"  placeholder=""  CssClass="input_form " >
                                 <asp:ListItem>Seleccionar</asp:ListItem>
                                 </asp:DropDownList>
                            </li>
                            </ul>
                        <ul  class="lista_banco">
                            <li>CVV código <asp:TextBox ID="caja_codigo_cvv" runat="server" CssClass="caja_busqueda input_form"  ></asp:TextBox></li>    
                            <li>Tipo de tarjeta<asp:DropDownList ID="caja_tipo_tarjeta" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                <asp:ListItem>Visa</asp:ListItem>
                                <asp:ListItem>Mastercard</asp:ListItem>
                                <asp:ListItem>American Express</asp:ListItem>
                                 </asp:DropDownList>
                            </li>  
                         </ul>
                        </asp:Panel>
                        
                   </div>
        <!----------------------------OPERACIÓN------------------------------------------------------------------------------------------------------------>
                <div id="operacion">
                         <div class="mytextdiv"><div class="mytexttitle"><b>Datos de entrega  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>Nombre del almacenista <asp:TextBox ID="caja_nombre_almacenista" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                             <li>Domicilio para la entrega de mercancías <asp:TextBox ID="caja_domicilio_entrega" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                             <li>Encargado de recoger mercancía en paqueterías <asp:TextBox ID="caja_recoger_mercancia" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                             <li>Responsable general <asp:TextBox ID="caja_responsable_general" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Encargado regional <asp:TextBox ID="caja_engarcado_regional" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Supervisor <asp:TextBox ID="caja_supervisor" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Mensajería<asp:DropDownList ID="caja_mensajeria" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                <asp:ListItem>Casa</asp:ListItem>
                                <asp:ListItem>Inklaser</asp:ListItem>
                                <asp:ListItem>Multipack aereo</asp:ListItem>
                                 <asp:ListItem>Multipack terrestre</asp:ListItem>
                                 </asp:DropDownList>
                            </li> 
                             <li>Día de entrega<asp:DropDownList ID="caja_dia_entrega" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                 <asp:ListItem>Sin definir</asp:ListItem>
                                <asp:ListItem>Lunes</asp:ListItem>
                                <asp:ListItem>Martes</asp:ListItem>
                                <asp:ListItem>Miércoles</asp:ListItem>
                                 <asp:ListItem>Jueves</asp:ListItem>
                                 <asp:ListItem>Viernes</asp:ListItem>
                                 <asp:ListItem>Sábado</asp:ListItem>
                                 <asp:ListItem>Domingo</asp:ListItem>
                                 <asp:ListItem>Todos los días</asp:ListItem>
                                 </asp:DropDownList>
                            </li> 
                             <li>Horario de entrega matutina entre <asp:TextBox ID="caja_horario_entrega_matutino_1" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li> y <asp:TextBox ID="caja_horario_entrega_matutino_2" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li>Horario de entrega vespertina entre <asp:TextBox ID="caja_horario_entrega_vespertino_1" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li> y <asp:TextBox ID="caja_entrega_vespertino_2" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                          </ul>
                        <ul  class="lista_banco">
                             <li>Observaciones</li><li> <asp:TextBox ID="caja_entrega_observaciones" runat="server" CssClass="caja_busqueda observaciones input_form" ></asp:TextBox></li>
                         </ul>
                      <div class="mytextdiv"><div class="mytexttitle"><b>Datos de revisión  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>Día de revisión<asp:DropDownList ID="caja_dia_revision" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                 <asp:ListItem>Sin definir</asp:ListItem>
                                <asp:ListItem>Lunes</asp:ListItem>
                                <asp:ListItem>Martes</asp:ListItem>
                                <asp:ListItem>Miércoles</asp:ListItem>
                                 <asp:ListItem>Jueves</asp:ListItem>
                                 <asp:ListItem>Viernes</asp:ListItem>
                                 <asp:ListItem>Sábado</asp:ListItem>
                                 <asp:ListItem>Domingo</asp:ListItem>
                                 <asp:ListItem>Todos los días</asp:ListItem>
                                 </asp:DropDownList>

                             </li>
                             <li>Horario de revision matutina entre <asp:TextBox ID="caja_revision_matutina_1" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li> y <asp:TextBox ID="caja_revision_matutina_2" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li>Horario de revisión vespertina entre <asp:TextBox ID="caja_revision_vespertina_1" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li> y <asp:TextBox ID="caja_revision_vespertina_2" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                               </ul>
                        <ul  class="lista_banco">
                             <li>Observaciones </li><li> <asp:TextBox ID="caja_observaciones_revision" runat="server" CssClass="caja_busqueda input_form observaciones" ></asp:TextBox></li>
                         </ul>
                      <div class="mytextdiv"><div class="mytexttitle"><b>Datos de cobranza  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>Día de cobranza<asp:DropDownList ID="caja_dia_cobranza" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                 <asp:ListItem>Sin definir</asp:ListItem>
                                <asp:ListItem>Lunes</asp:ListItem>
                                <asp:ListItem>Martes</asp:ListItem>
                                <asp:ListItem>Miércoles</asp:ListItem>
                                 <asp:ListItem>Jueves</asp:ListItem>
                                 <asp:ListItem>Viernes</asp:ListItem>
                                 <asp:ListItem>Sábado</asp:ListItem>
                                 <asp:ListItem>Domingo</asp:ListItem>
                                 <asp:ListItem>Todos los días</asp:ListItem>
                                 </asp:DropDownList></li>
                             <li>Horario de cobranza matutina entre  <asp:TextBox ID="caja_cobranza_matutina_1" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li> y <asp:TextBox ID="caja_cobranza_matutina_2" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li>Horario de cobranza vespertina entre <asp:TextBox ID="caja_cobranza_vespertina_1" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                             <li> y  <asp:TextBox ID="caja_cobranza_vespertina_2" runat="server" CssClass="caja_busqueda input_form timepicker" ></asp:TextBox></li>
                              </ul>
                        <ul  class="lista_banco">
                             <li>Observaciones </li><li> <asp:TextBox ID="caja_observaciones_cobranza" runat="server" CssClass="caja_busqueda input_form observaciones" ></asp:TextBox></li>
                             </ul>
                        <ul  class="lista_banco">
                             <li>Días no laborales del cliente</li><li>  <asp:TextBox ID="caja_no_laborales" runat="server" CssClass="caja_busqueda input_form input_large" ></asp:TextBox></li>
                         </ul>
                      <div class="mytextdiv"><div class="mytexttitle"><b>Datos predefinidos  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>Moneda de venta <asp:DropDownList ID="caja_moneda_venta" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                <asp:ListItem>Sin definir</asp:ListItem>
                                <asp:ListItem>Pesos</asp:ListItem>
                                <asp:ListItem>Dólares</asp:ListItem>
                                 </asp:DropDownList>

                                </li>
                           
                             <li><asp:CheckBox ID="limitar_max_factura" runat="server" CssClass="caja_busqueda"></asp:CheckBox> Limitar a un total máximo de factura </li>
                             <li>Límite de pesos <asp:TextBox ID="caja_limite_pesos" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                         </ul>
                  </div>

        <!----------------------------PERSONAL------------------------------------------------------------------------------------------------------------>
                <div id="personal">
                    <div class="mytextdiv"><div class="mytexttitle"><b>Personal autorizado para hacer compras  </b></div><div class="divider"></div></div>
                       <div style="width:100%;">
                          <div style="width:70%; float:left;">
                              <ul class="lista_banco" > 
                             <li>Búsqueda <asp:TextBox ID="caja_busqueda" runat="server" CssClass="caja_busqueda input_form" onfocus="return posicionar_cursor(this.id);"  ontextchanged="caja_busqueda_TextChanged" onKeyUp="up();"></asp:TextBox><br /></li>
                                  <li> <asp:Button ID="buscar" runat="server"  Text="actualizar" onkeydown="buscar();" Visible="True" style="visibility:hidden" onclick="busqueda_personal"/> </li>
                            </ul>
                               <asp:Panel ID="panel_personal" runat="server" Visible="true" style=" min-height:300px;" ScrollBars="Vertical">
                                  <ul class="lista_banco" > 
                                        <li>Nombre <asp:TextBox ID="nombre_personal" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li>Cargo <asp:TextBox ID="cargo_personal" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li>Teléfono <asp:TextBox ID="telefono_personal" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li>Email <asp:TextBox ID="email_personal" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>

                                        <li><asp:LinkButton ID="boton_guardar_personal" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_agregar_personal_sucursales" ><i class="fa fa-plus" ></i> Agregar </asp:LinkButton></li>
                                    </ul>
                                    <asp:GridView ID="tabla_personal" runat="server" AutoGenerateColumns="False"  DataKeyNames="id" DataSource='<%# datos_personal() %>' onrowcommand="tabla_personal_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                        <HeaderStyle CssClass="GridHeader" />
		                                <PagerSettings Visible="False" />
		                                <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Id" DataField="id" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                            <asp:BoundField HeaderText="Puesto" DataField="puesto"></asp:BoundField>
                                            <asp:BoundField HeaderText="Teléfono" DataField="telefono"></asp:BoundField>
                                            <asp:BoundField HeaderText="Email" DataField="email"></asp:BoundField>
                                            <asp:BoundField HeaderText="" DataField="estado" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" ></asp:BoundField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonModify" runat="server" CausesValidation="False" ToolTip="Modificar información" Enabled="true" 
                                                        CommandName="modificar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil-square-o opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonDelete" runat="server" CausesValidation="False" ToolTip="Eliminar" Enabled="true" 
                                                        CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-times opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonBaja" runat="server" CausesValidation="False" ToolTip="Dar de baja" Enabled="true" 
                                                        CommandName="baja" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa  fa-lock opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonAlta" runat="server" CausesValidation="False" ToolTip="Dar de alta" Enabled="true" 
                                                        CommandName="alta" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-unlock opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                        </Columns>
                                   </asp:GridView>
                                </asp:Panel>

                               <asp:Panel ID="panel_editar_personal" runat="server" visible="false" CssClass="modulo-esp1" style="box-shadow: 1px 1px 5px 1px #2471a3; background-color:white; height:260px; width:392px; z-index:999; ">
                                    <asp:HiddenField id="id_personal" runat="server"/>
                                   <ul class="lista_banco" > 
                                        <li>Nombre <asp:TextBox ID="nombre_pe" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li>Cargo <asp:TextBox ID="cargo_pe" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li>Teléfono <asp:TextBox ID="telefono_pe" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li>Email <asp:TextBox ID="email_pe" runat="server" CssClass="caja_busqueda input_form personal" ></asp:TextBox></li>
                                        <li><asp:LinkButton ID="guardar_editar_p" runat="server" ToolTip="Guardar" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_editar_personal" ><i class="fa fa-check" ></i> Guardar </asp:LinkButton></li>
                                       <li><asp:LinkButton ID="cancelar_edicion" runat="server" ToolTip="Guardar" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_cancelar_editar_personal" ><i class="fa fa-close" ></i> Cancelar </asp:LinkButton></li>
                                    </ul>
                            </asp:Panel>


                           </div>

                           <div style="width:28%; float:right; margin-top:1em;">
                                <fieldset>
                                    <legend>Mostrar </legend>
                                        <asp:RadioButton  id="button_activos" runat="server" autopostback="true" OnCheckedChanged="RadioButton_CheckedChanged" Selected="True" GroupName="personal_mostrar" Text="Activos"></asp:RadioButton><br />
                                        <asp:RadioButton  id="button_baja" runat="server" autopostback="true" OnCheckedChanged="RadioButton_CheckedChanged" GroupName="personal_mostrar" Text="Baja"></asp:RadioButton><br />
                                        <asp:RadioButton  id="button_todos" runat="server" autopostback="true" OnCheckedChanged="RadioButton_CheckedChanged" GroupName="personal_mostrar" Text="Todos"></asp:RadioButton>
                                 </fieldset>
                           </div>
                       </div>
                 </div>

        <!----------------------------SUCURSAL------------------------------------------------------------------------------------------------------------>
               <!-- <div id="sucursal">
                     
                  </div>-->

                   <div id="sucursales">
                    <div class="mytextdiv"><div class="mytexttitle"><b>Sucursales</b></div><div class="divider"></div></div>
                       <div style="width:100%;">
                          <div style="width:70%; float:left;">
                              <ul class="lista_banco" > 
                             <li>Búsqueda <asp:TextBox ID="caja_busqueda_suc" runat="server" CssClass="caja_busqueda input_form" onfocus="return posicionar_cursor(this.id);"  ontextchanged="caja_busqueda_suc_TextChanged" onKeyUp="up_suc();"></asp:TextBox><br /></li>
                                  <li> <asp:Button ID="busca_suc" runat="server"  Text="actualizar" onkeydown="buscar_suc();" Visible="True" style="visibility:hidden" onclick="busqueda_suc"/> </li>
                            </ul>
                               <asp:Panel ID="panel_subsucursales" runat="server" Visible="true" style="" >
                                  <ul class="lista_banco" > 
                                        <li>Nombre <asp:TextBox ID="nombre_subsucursal" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li>Contacto <asp:TextBox ID="contacto_subsucursal" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li>Teléfono <asp:TextBox ID="telefono_subsucursal" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                      </ul>
                                   <ul class="lista_banco" >
                                        <li>Dirección <asp:TextBox ID="direccion_subsucursal" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li>Email <asp:TextBox ID="email_subsucursal" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>

                                        <li><asp:LinkButton ID="boton_guardar_subsucursal" runat="server" ToolTip="Guardar sucursal" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_agregar_sucursales" ><i class="fa fa-plus" ></i> Agregar </asp:LinkButton></li>
                                    </ul>
                                    <asp:GridView ID="tabla_subsucursal" runat="server" AutoGenerateColumns="False"  DataKeyNames="id" DataSource='<%# datos_subsucursal() %>' onrowcommand="tabla_subsucursal_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                        <HeaderStyle CssClass="GridHeader" />
		                                <PagerSettings Visible="False" />
		                                <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Id" DataField="id" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                            <asp:BoundField HeaderText="Contacto" DataField="contacto"></asp:BoundField>
                                            <asp:BoundField HeaderText="Teléfono" DataField="telefono"></asp:BoundField>
                                            <asp:BoundField HeaderText="Dirección" DataField="direccion"></asp:BoundField>
                                            <asp:BoundField HeaderText="Email" DataField="email"></asp:BoundField>
                                            <asp:BoundField HeaderText="" DataField="estado" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" ></asp:BoundField>

                                            <asp:BoundField HeaderText="" DataField="estado" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" ></asp:BoundField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonModify_suc" runat="server" CausesValidation="False" ToolTip="Modificar información" Enabled="true" 
                                                        CommandName="modificar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil-square-o opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonDelete_suc" runat="server" CausesValidation="False" ToolTip="Eliminar" Enabled="true" 
                                                        CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-times opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonBaja_suc" runat="server" CausesValidation="False" ToolTip="Dar de baja" Enabled="true" 
                                                        CommandName="baja" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa  fa-lock opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                        <asp:LinkButton ID="botonAlta_suc" runat="server" CausesValidation="False" ToolTip="Dar de alta" Enabled="true" 
                                                        CommandName="alta" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-unlock opcion_tabla controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />                        
                                            </asp:TemplateField>

                                        </Columns>
                                   </asp:GridView>
                                </asp:Panel>

                               <asp:Panel ID="panel_editar_suc" runat="server" visible="false" CssClass="modulo-esp1" style="box-shadow: 1px 1px 5px 1px #2471a3; background-color:white; height:330px; width:392px; z-index:999; ">
                                    <asp:HiddenField id="id_subsucursal_suc" runat="server"/>
                                   <ul class="lista_banco" > 
                                        <li>Nombre <asp:TextBox ID="nombre_su" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li>Contacto <asp:TextBox ID="contacto_su" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li>Teléfono <asp:TextBox ID="telefono_su" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                   </ul>
                                   <ul class="lista_banco" >
                                        <li>Dirección <asp:TextBox ID="direccion_su" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li>Email <asp:TextBox ID="email_su" runat="server" CssClass="caja_busqueda input_form subsucursal" ></asp:TextBox></li>
                                        <li><asp:LinkButton ID="guardar_editar_su" runat="server" ToolTip="Guardar" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_editar_subsucursal" ><i class="fa fa-check" ></i> Guardar </asp:LinkButton></li>
                                       <li><asp:LinkButton ID="cancelar_edicion_su" runat="server" ToolTip="Cancelar" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_cancelar_editar_subsucursal" ><i class="fa fa-close" ></i> Cancelar </asp:LinkButton></li>
                                    </ul>
                            </asp:Panel>


                           </div>

                           <div style="width:28%; float:right; margin-top:1em;">
                                <fieldset>
                                    <legend> Mostrar </legend>
                                        <asp:RadioButton  id="button_activos_suc" runat="server" autopostback="true" OnCheckedChanged="Sucursal_RadioButton_CheckedChanged" Selected="True" GroupName="personal_mostrar" Text="Activos"></asp:RadioButton><br />
                                        <asp:RadioButton  id="button_baja_suc" runat="server" autopostback="true" OnCheckedChanged="Sucursal_RadioButton_CheckedChanged" GroupName="personal_mostrar" Text="Baja"></asp:RadioButton><br />
                                        <asp:RadioButton  id="button_todos_suc" runat="server" autopostback="true" OnCheckedChanged="Sucursal_RadioButton_CheckedChanged" GroupName="personal_mostrar" Text="Todos"></asp:RadioButton>
                                 </fieldset>
                           </div>
                       </div>
                 </div>
        <!----------------------------CONTABLE------------------------------------------------------------------------------------------------------------>
                <div id="contable">
                    <asp:Panel ID="contable_subcuentas" runat="server" Visible="false"> 
                    <div class="mytextdiv"><div class="mytexttitle"><b>Cuentas contables para la generación de póliza de ventas  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>SubCuenta cliente pesos <asp:TextBox ID="caja_clientes_pesos" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>SubCuenta cliente dólares <asp:TextBox ID="caja_clientes_dolares" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>SubCuenta complementaria <asp:TextBox ID="caja_complementaria" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>SubCuenta ventas (crédito) <asp:TextBox ID="caja_ventas_credito" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>SubCuenta ventas (contado) <asp:TextBox ID="caja_ventas_contado" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>SubCuenta IVA x trasladar <asp:TextBox ID="caja_iva_trasladar" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Devolución y desc. crédito <asp:TextBox ID="caja_dev_desc_credito" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Devolución y desc. contado <asp:TextBox ID="caja_dev_desc_contado" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Subcuenta anticipos pesos <asp:TextBox ID="caja_anticipo_pesos" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                            
                             <li>IVA de anticipo  <asp:TextBox ID="caja_iva_anticipo" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>IVA traslado x anticipo<asp:TextBox ID="caja_iva_traslado_anticipo" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                         </ul>
                        </asp:Panel>
                       <div class="mytextdiv"><div class="mytexttitle"><b>Representante legal de la empresa  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>Nombre del representante<asp:TextBox ID="caja_representante_legal" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>RFC  <asp:TextBox ID="caja_rfc_representante" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li>Público en general(sin RFC) <asp:CheckBox ID="representante_sin_rfc" runat="server" CssClass=" "></asp:CheckBox></li>
                             <li>CURP <asp:TextBox ID="caja_curp_representante" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                             <li> Contacto <asp:TextBox ID="caja_contacto" runat="server" CssClass="caja_busqueda input_form needed" ></asp:TextBox></li>
                         </ul>
                    <asp:Panel ID="contable_xml" runat="server" Visible="false">
                       <div class="mytextdiv"><div class="mytexttitle"><b>Método de pago para XML </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" > 
                        <li>Dato a autoasignar en la generación de XML <asp:DropDownList ID="caja_xml" runat="server"  placeholder=""  CssClass="input_form " >
                             <asp:ListItem>Seleccionar</asp:ListItem>
                            <asp:ListItem>Contado=Asignada en Ventas y Crédito=NA</asp:ListItem>
                            <asp:ListItem>Contado=Asignada en Ventas y Crédito=AutoAsignada</asp:ListItem>
                            <asp:ListItem>Contado y Crédito=AutoAsignada Aquí</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                        </ul>
                        <ul class="lista_banco">
                            <li>Método de pago en pesos <asp:DropDownList ID="caja_metodo_pago_pesos" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>                                
                                 </asp:DropDownList>
                            </li>
                            <li>Cuenta <asp:TextBox ID="caja_cuenta_pesos" runat="server" CssClass="input_form" ></asp:TextBox></li>
                            <li>Banco <asp:DropDownList ID="caja_banco_pesos" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>                               
                                 </asp:DropDownList>
                            </li>
                        </ul>
                       
                            <ul class="lista_banco">
                            <li>Método de pago en pesos <asp:DropDownList ID="caja_metodo_pago_pesos2" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>                               
                                 </asp:DropDownList>
                            </li>
                            <li>Cuenta <asp:TextBox ID="caja_cuenta_pesos2" runat="server" CssClass="input_form" ></asp:TextBox></li>
                            <li>Banco <asp:DropDownList ID="caja_banco_pesos2" runat="server"  placeholder=""  CssClass="input_form " >
                                <asp:ListItem>Seleccionar</asp:ListItem>                               
                                 </asp:DropDownList>
                            </li>
                        </ul>

                            
                        <ul class="lista_banco">
                        <li>Método de pago en dlls. <asp:DropDownList ID="caja_metodo_pago_dolares" runat="server"  placeholder=""  CssClass="input_form " >
                             <asp:ListItem>Seleccionar</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>Cuenta <asp:TextBox ID="caja_cuenta_dolares" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                        <li>Banco <asp:TextBox ID="caja_banco_dolares" runat="server"  placeholder=""  CssClass="input_form " ></asp:TextBox>
                        </li>
                      </ul>
                        </asp:Panel>   
                   </div>
       
              </div><!-------------TABS--------------------------------------------------------------------------------------->
           </div><!-------------PRINCIPAL--------------------------------------------------------------------------------------->
        <div id="botones" class="contenido"  style=" position:fixed; background-color:white; height:10%; bottom:0; width:100%;">
             <asp:Label CssClass="tipo_texto" ID="Label1" runat="server">Última modificación hecha por: </asp:Label>
             <asp:TextBox ID="modificacion_vendedor" Enabled="false" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox>
                    <ul class="lista_banco" style="margin:0px; padding:10px;" > 
                        <li><asp:LinkButton ID="boton_aceptar" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" onclick="boton_guardar_cliente" ><i class="fa fa-check" ></i> Aceptar </asp:LinkButton></li>
                        <!--<li><asp:LinkButton ID="boton_cancelar" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" ><i class="fa fa-print"></i> Cancelar </asp:LinkButton></li>-->
                    </ul>
                </div>


    </div>
                      
<!---------------------------------------------------------------------------------------------------->
    <div id='alrt' class="notificacion_div"></div>
    <br/>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    </body>
    </html>