<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/alta_cliente.cs" Inherits="alta_cliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="jquery-timepicker-1.3.5/jquery.timepicker.js"></script>
<link href="jquery-timepicker-1.3.5/jquery.timepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    
    
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
                defaultTime: '8',
                startTime: '8',
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

                $(".needed").each(function () {
                    var id = $(this).attr('id');
                    if ($(this).val() == '') {
                        $("#" + id).css('border-width', '2px');
                        $("#" + id).css('border-color', '#e03f3f');
                        error++;
                    } else {
                        $("#" + id).css('border-width', '1px');
                        $("#" + id).css('border-color', '#cccccc');
                    }
                });
                $(".dropdown").each(function () {
                    var id = $(this).attr('id');
                    if ($(this).val() == 'Seleccionar' || $(this).val() == 'PAIS' || $(this).val() == 'ESTADO' || $(this).val() == 'CP') {
                        $("#" + id).css('border-width', '2px');
                        $("#" + id).css('border-color', '#e03f3f');
                        error++;
                    } else {
                        $("#" + id).css('border-width', '1px');
                        $("#" + id).css('border-color', '#cccccc');
                    }
                });
            
            if (error == 0) {
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });
        var departamento = $("#caja_departamento").val();
        
        $("#ocho").css("visibility", "hidden");
        //$("#cuatro").css("display", "none");
        $("#ocho").css("display", "none");
        $("#nueve").css("visibility", "hidden");
        $("#nueve").css("display", "none");

        
    
    }/**Final pageLoad**/
    
    function nada(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        return false;
    }
    function cliente_existente() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Este cliente ya existe, verifique la información</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
    }
     
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Alta de clientes - Inklaser</title>  
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
        .next {
        width:80px;
        
        }
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
           font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            margin-top: -9em; 
            margin-left: -15em; 
            position:fixed;
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
        /*outline: 0;*/
        -webkit-box-shadow:inset 0px 1px 6px #ECF3F5 !important;
        box-shadow: inset 0px 1px 6px #ECF3F5 !important;
        font: 200 12px/25px Arial, Helvetica, sans-serif;
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
            <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Alta de clientes</asp:Label>
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
                    
                    <li id="siete"><a href="#contable">Contable</a></li>
                  </ul>

                <div id="identificacion" style="">
                    
                  <asp:Panel ID="identificacion_datos_identificacion" runat="server">
                      <div class="mytextdiv"><div class="mytexttitle"><b>Datos de identificación </b></div></div>
                       <ul class="lista_banco" > 
                       
                        <li>Nombre (Paterno/Materno/Nombre) o Razón Social</li><li> <asp:TextBox ID="caja_nombre_razon" runat="server" CssClass=" input_form needed" ></asp:TextBox></li>
                        <li>Nombre comercial <asp:TextBox ID="caja_nombre_comercial" runat="server" CssClass=" input_form needed" ></asp:TextBox></li>
                        <li>RFC <asp:TextBox ID="caja_rfc" runat="server" CssClass=" input_form rfc" ></asp:TextBox></li>
                           <li>Público en general(sin RFC) <asp:CheckBox ID="sin_rfc" runat="server" CssClass=" "></asp:CheckBox></li>
                        <li>CURP <asp:TextBox ID="caja_curp" runat="server" CssClass=" input_form " ></asp:TextBox></li>
                        <li>Nacionalidad <asp:TextBox ID="caja_nacionalidad" runat="server"  placeholder=""  CssClass="input_form  " ></asp:TextBox>
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
                        <li>Zona <asp:TextBox ID="caja_zona" runat="server" CssClass=" input_form " ></asp:TextBox></li>
                        <li>Ruta <asp:TextBox ID="caja_ruta" runat="server" CssClass=" input_form " ></asp:TextBox></li>
                    </ul>
                    </asp:Panel>

                    <asp:Panel ID="identificacion_configuracion" runat="server" Visible="false">
                    <div class="mytextdiv"><div class="mytexttitle"><b>Configuración </b></div><div class="divider"></div></div>
                    <ul class="lista_banco" > 
                        <li><asp:CheckBox ID="caja_baja" runat="server" CssClass="caja_busqueda "></asp:CheckBox> Dar de baja</li>
                        <li>Tipo de venta <asp:DropDownList ID="caja_tipo_pago" runat="server"  placeholder=""  CssClass="input_form " >
                            <asp:ListItem>Seleccionar</asp:ListItem>
                            
                             </asp:DropDownList>
                        </li>
                        <li>Descuento <asp:TextBox ID="caja_descuento" runat="server" CssClass=" input_form " ></asp:TextBox></li>
                        <li>Precio a dar <asp:DropDownList ID="caja_precio_dar" runat="server"  placeholder=""  CssClass="input_form " >
                            <asp:ListItem>Seleccionar</asp:ListItem>
                             <asp:ListItem>Definido</asp:ListItem>
                            <asp:ListItem>Base</asp:ListItem>
                             </asp:DropDownList>
                        </li>
                        <li>Tipo precio <asp:DropDownList ID="caja_tipo_precio" runat="server"  placeholder=""  CssClass="input_form " >
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
                     </ul>   
                      
                     <ul class="lista_banco" >
                         <li>País <asp:DropDownList ID="caja_pais" runat="server"  placeholder=""  AutoPostBack="True" Enabled="True" 
                            onselectedindexchanged="lista_paises_SelectedIndexChanged" CssClass="input_form dropdown" >
                             
                             </asp:DropDownList>
                        </li>
                         <li>Estado <asp:DropDownList ID="caja_estado" runat="server"  placeholder=""  CssClass="input_form dropdown" 
                            AutoPostBack="True" Enabled="True" onselectedindexchanged="lista_estados_SelectedIndexChanged"  >
                            
                             </asp:DropDownList>
                        </li>
                        <li>Código postal <asp:DropDownList ID="caja_codigo_postal" runat="server"  placeholder=""  CssClass="input_form dropdown"
                            AutoPostBack="True" Enabled="True"  onselectedindexchanged="caja_codigo_postal_SelectedIndexChanged" >
                            
                             </asp:DropDownList>
                        </li>
                        <li>Colonia <asp:DropDownList ID="caja_colonia" runat="server"  placeholder=""  CssClass="input_form dropdown" >
                             
                             </asp:DropDownList>
                        </li>
                        <li>Ciudad <asp:TextBox ID="caja_ciudad" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
                     </ul>   
                     <ul class="lista_banco" >
                        <li>Referencia ubicación <asp:TextBox ID="caja_referencia_ubicacion" runat="server" CssClass="caja_busqueda input_form" ></asp:TextBox></li>
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

                    <asp:Panel ID="configuracion_comisiones" runat="server" Visible="false">
                    
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
                             <li>Moneda de venta<asp:DropDownList ID="caja_moneda_venta" runat="server"  placeholder=""  CssClass="input_form " >
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
              <!--  <div id="personal">
                   
                 </div>-->

        <!----------------------------SUCURSAL------------------------------------------------------------------------------------------------------------>
               <!-- <div id="sucursal">
                    
                  </div>
        <!----------------------------CONTABLE------------------------------------------------------------------------------------------------------------>
                <div id="contable">
                    <asp:Panel ID="contable_subcuentas" runat="server" Visible="false"> 
                    
                        </asp:Panel>
                       <div class="mytextdiv"><div class="mytexttitle"><b>Representante legal de la empresa  </b></div><div class="divider"></div></div>
                         <ul class="lista_banco" > 
                             <li>Nombre del representante<asp:TextBox ID="caja_representante_legal" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                             <li>RFC  <asp:TextBox ID="caja_rfc_representante" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                             <li>Público en general(sin RFC) <asp:CheckBox ID="representante_sin_rfc" runat="server" CssClass=" "></asp:CheckBox></li>
                             <li>CURP <asp:TextBox ID="caja_curp_representante" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
                             <li> Contacto <asp:TextBox ID="caja_contacto" runat="server" CssClass="caja_busqueda input_form " ></asp:TextBox></li>
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
                        <li>Banco <asp:TextBox ID="caja_banco_dolares" runat="server"  placeholder=""  CssClass="input_form " ></asp:TextBox></li>
                      </ul>
                        
                        </asp:Panel>   
                   </div>
      
     
              </div><!-------------TABS--------------------------------------------------------------------------------------->
           </div><!-------------PRINCIPAL--------------------------------------------------------------------------------------->
        <div id="botones" class="contenido"  style=" position:fixed; background-color:white; height:10%; bottom:0; width:100%;">             
                    <ul class="lista_banco" style="margin:0px; padding:10px;" > 
                       <li><asp:LinkButton ID="boton_aceptar" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="boton_guardar_cliente" ><i class="fa fa-check "></i> Guardar </asp:LinkButton></li>
                        
                      <!--  <li><asp:LinkButton ID="boton_cancelar" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" ><i class="fa fa-close"></i> Cancelar </asp:LinkButton></li>-->
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