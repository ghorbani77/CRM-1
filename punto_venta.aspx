<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/punto_venta.aspx.cs" Inherits="punto_venta" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<script src="js/teclas.js" type="text/javascript"></script>
<script src="js/mensajes.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    <%  var serializer2 = new System.Web.Script.Serialization.JavaScriptSerializer();  %> 
    var delay = 10000;
    var progressbar;
    var caja_cliente = $('#caja_clientes');

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
    document.addEventListener("keydown", KeyCheck);  //verifica la tecla pulsada
    function KeyCheck(event) {
        var KeyID = event.keyCode;
        switch (KeyID) {
            case 27:
                var boton = document.getElementById('boton_cerrar');
                boton.click();
                break;
            case 35:
                var boton = document.getElementById('boton_pagar');
                boton.click();
                break;
            case 36:
                var boton = document.getElementById('cobrar');
                boton.click();
                break;
            case 37:
                var boton = document.getElementById('seleccion_pesos');
                boton.click();
                break;
            case 39:
                var boton = document.getElementById('seleccion_dolares');
                boton.click();
                break;
            case 38:
                var boton = document.getElementById('boton_seleccion_arriba');
                boton.click();
                break;
            case 40:
                var boton = document.getElementById('boton_seleccion_abajo');
                boton.click();
                break;
            case 46:
                var boton = document.getElementById('vaciar');
                boton.click();
                break;
            default:
                break;
        }
    }
    
    shortcut.add("F2", function() {
        setTimeout(function () { __doPostBack("boton_busqueda_producto", ""); }, 1);
    });
    shortcut.add("Alt+c", function() {
        sacar_panel();
    });
    shortcut.add("Alt+z", function() {
        setTimeout(function () { __doPostBack("boton_cancelaciones", ""); }, 1);
    });
    shortcut.add("Alt+r", function() {
        abrir_reporte();
    });
    shortcut.add("Alt+i", function() {
        setTimeout(function () { __doPostBack("boton_inventario", ""); }, 1);
    });
    shortcut.add("Alt+g", function() {
        setTimeout(function () { __doPostBack("boton_gastos", ""); }, 1);
    });
    onload = abrir();
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
    }
    function cerrar_mensaje_automatico() {
        setTimeout(function () {
            cerrar_mensaje();
        }, 3000);
    }
    function cerrar_mensaje() {
        $('#cerrar_mensaje').css('display', 'none');
        $('#simbolo_mensaje').css('display', 'none');
        $('#mensaje').css('display', 'none');
        $('#mensajes').css('visibility', 'hidden');
        $('#mensajes').css('height', '0px');
    }
    function abrir_mensaje() {
        convertir_mover();
        $('#mensajes').css('visibility', 'visible');
        $('#mensajes').css('height', '50px');
        if (document.getElementById("mensajes").style.visibility == "visible") {
            setTimeout(function () {
                $('#mensaje').css('display', 'inline-block');
                $('#simbolo_mensaje').css('display', 'inline-block');
            }, 200);
        }
        cerrar_mensaje_automatico();
    }
    function salir() {
        this.close();
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'pagar') {
            setTimeout(function () {
                var boton = document.getElementById('oculto_pagar');
                boton.click();
            }, 600);
        }
    }
    function convertir_mover() {
        $("#panel_busqueda").draggable();
        $("#panel_cantidades").draggable();
        $("#panel_pagar").draggable();
    }
   
    function abrir_reporte() {
        var reporte;
        if (!reporte || reporte.closed) {
            reporte = window.open("reportes_sucursales.aspx", "Historial Ventas", "width=" + screen.availWidth + ", height=" + screen.availHeight + ",scrollbars = yes,resizable = false");
        }
        else {
            reporte.focus();
        }
        return false;
    }
    function convertir_dialogo() {
        $('#panel_inicio_turno').dialog({
            title: "Registro Ventas (Punto Venta)",
            height: 380,
            width: 350,
            modal: true,
            close: function () {
                salir();
            },
            open: function () {
                $(this).parent().appendTo($("form:first"));
            }
        });
    }
    function sacar_panel() {
        $('#panel_cerrar_caja').dialog({
            title: "Cierre Caja",
            height: 800,
            width: 650,
            modal: true,
            close: function () {
                $(this).dialog("destroy");
            },
            open: function () {
                $(this).parent().appendTo($("form:first"));
                verificar();
            }
        });
    }
    function verificar() {
        $('.inactive, .active').toggle();
        if ($('#on').css('display') == 'none') {
            $('#panel_cerrar_caja').find('.cantidad').prop("disabled", true);
            $('#panel_cerrar_caja').find('.caja_chica').removeAttr('disabled');
            $('#panel_cerrar_caja').find('.cantidad').val("");
            $('#check_contar').prop("checked", false);
        }
        else if ($('#off').css('display') == 'none') {
            $('#panel_cerrar_caja').find('.cantidad').prop("disabled", false);
            $('#panel_cerrar_caja').find('.caja_chica').attr('disabled', 'disabled');
            $('#panel_cerrar_caja').find('.caja_chica').val("");
            $('#check_contar').prop("checked", true);
        }
    }

    function calculateSum() {
        var sum = 0;
        $('#panel_cerrar_caja').find('.cantidad').each(function () {
            var id = $(this).attr("id");
            switch (id) {
                case "caja_centavos":
                    sum += parseFloat(this.value / 100) || 0;
                    break
                case "caja_pesos_1":
                    sum += parseFloat(this.value) || 0;
                    break
                case "caja_pesos_2":
                    sum += parseFloat(this.value * 2) || 0;
                    break
                case "caja_pesos_5":
                    sum += parseFloat(this.value * 5) || 0;
                    break
                case "caja_pesos_10":
                    sum += parseFloat(this.value * 10) || 0;
                    break
                case "caja_pesos_20":
                    sum += parseFloat(this.value * 20) || 0;
                    break
                case "caja_billetes_20":
                    sum += parseFloat(this.value * 20) || 0;
                    break
                case "caja_billetes_50":
                    sum += parseFloat(this.value * 50) || 0;
                    break
                case "caja_billetes_100":
                    sum += parseFloat(this.value * 100) || 0;
                    break
                case "caja_billetes_200":
                    sum += parseFloat(this.value * 200) || 0;
                    break
                case "caja_billetes_500":
                    sum += parseFloat(this.value * 500) || 0;
                    break
                case "caja_billetes_1000":
                    sum += parseFloat(this.value * 1000) || 0;
                    break
                default:
            }
        });
        $('#panel_cerrar_caja').find('.caja_chica').val(sum);
        $("#caja_clon_cantidad_total").val(sum);
    }

    pageLoad = function () {
        $('#caja_busqueda_caja').keypress(function (e) {
            if (e.which == 13) {
                setTimeout(function () { __doPostBack("boton_oculto_buscar_caja", ""); }, 1);
            }
        });
        $('#panel_cerrar_caja').find('.cantidad').on('keyup change', calculateSum);
        $("#caja_cantidad_total").on('keyup change', function (){
            var valor = $("#caja_cantidad_total").val();
            $("#caja_clon_cantidad_total").val(valor);
        });
        $(".cantidad,.caja_chica_90").keypress(function (e) {
            if ((e.which != 8 && e.which != 0) && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });
        $(".solo_numeros").keypress(function (e) {
            var control = $(this);
            var tecla = document.all ? tecla = e.keyCode : e.which;
            var expreg = /^[0-9]+(([\.][0-9]+)?|[\.])$/;
            var prueba = $(control).val();
            var nombre = $(control).prop("id"); prueba = prueba + String.fromCharCode(tecla);
            if (expreg.test(prueba)) {
                if (String.fromCharCode(tecla) == '.') {
                    $(control).addClass('error');
                }
                else {
                    $(control).removeClass('error');
                }
                return (true)
            }
            else {
                return (false)
            }
        });
    }
    function dialogo_facturar_cliente() {
        $('#dialogo_clientes').dialog({
            height: 600,
             width: "70em",
            modal: true,
            close: function () {
                $(this).dialog("destroy");
                setTimeout(function () { __doPostBack("boton_oculto_destruir_sesion", ""); }, 1);
            },
            open: function () {
                $(this).parent().appendTo($("form:first"));
                $(function () {
                    $("#tabs").tabs();
                });
            }
        });
        /*********************************SERIALIZADOR PARA AUTOCOMPLETADOR JQUERY*********************************************/
        cargar_controles_jquery();
       
        /***************************BUSCADOR IFRAME BLOQUEA BOTON CERRAR MODULO CLIENTES************************************/
        var boton_cerrar_clientes = $("#mi_iframe").contents().find("#boton_cancelar");
        $(boton_cerrar_clientes).hide();
        $(boton_cerrar_clientes).prop( "disabled", true );
    }
    function cargar_controles_jquery(){
        var clientes_auto =  <%= serializer2 . Serialize ( lista_cliente )  %>;
        $(caja_cliente).autocomplete({
            source: function (request, response) {
                var results = $.ui.autocomplete.filter(clientes_auto, request.term);
                response(results.slice(0, 10));
            },
            select: function (evento, objeto) {
                setTimeout(function () { __doPostBack("boton_oculto_rfc", ""); }, 1);
            },
            minLength: 1
        });
        $('.caja_falsa').keypress(function (e) {
            if (e.which == 13) {
                setTimeout(function () { __doPostBack("boton_oculto_rfc", ""); }, 1);
            }
        });
        
    }
    function boton_oculto_facturar()
    {
        var div_dialogo = $(".ui-dialog");
        $(div_dialogo).hide(); 
        setTimeout(function () { __doPostBack("boton_oculto_facturar", ""); }, 1);
    }
    function iframe_facturacion()
    {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";

        $('<iframe src="facturacion_cfdi.aspx" frameborder="0" scrolling="no" id="iframer_facturacion"></iframe>').appendTo('#iframe_facturacion_oculto');
        verificar_ventana_impresion_factura();
        //var ventas_crm = window.open("facturacion_cfdi.aspx", "Ventas CRM", "width=1500, height=900,scrollbars = yes,resizable = false");
    }

    function verificar_ventana_impresion_factura()
    {
        (function () {
            setInterval(function () {
                var frame = document.getElementById('iframer_facturacion');
                if(frame !== null)
                {
                    if(frame.contentWindow.imprimir_factura_electronica)
                    {
                        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
                        $(frame).remove();  
                        $('#dialogo_clientes').closest('.ui-dialog-content').dialog('close');
                    }
                }
            }, 1000);
        })()
    }
    function dialogo_pago() {
        $('#dialogo_pagos').dialog({
            modal: true,
            open: function () {
                $(this).parent().appendTo($("form:first"));
                $(function () {
                    $("#tabs_pagos").tabs();
                });
            },
            close:function () {
                $(this).dialog('destroy').remove()
            },
            width: '50em' , 
            height: 'auto',
            modal: true,
            fluid: true, 
            resizable: false
        });
        setTimeout(function () { __doPostBack("boton_oculto_llenar_tabla_pagos", ""); }, 1);
    }
    function dialogo_cancelacion() {
        $('#dialogo_cancelaciones').dialog({
            modal: true,
            open: function () {
                $(this).parent().appendTo($("form:first"));
                $(function () {
                    $("#tabs_cancelaciones").tabs();
                });
            },
            close:function () {
                $(this).dialog('destroy');
            },
            width: '50em' , 
            height: 'auto',
            modal: true,
            fluid: true, 
            resizable: false
        });
        setTimeout(function () { __doPostBack("boton_oculto_llenar_tabla_ventas", ""); }, 1);
    }
    function mensaje_exito(){
        setTimeout(function () { __doPostBack("boton_oculto_llenar_tabla_pagos", ""); }, 1);
        $('#formulario_gastos').find('input:text').val('');
        $('#formulario_gastos').find('textarea').html('');
        $('#mensajes_pagos').toggle("slow", function() {
            setTimeout(function () { $('#mensajes_pagos').toggle("slow"); }, 2000);
        });
    }
    function controles_pagos()
    {
        $('#caja_fecha').datepicker({
            changeMonth: true,
            changeYear: true,
            minDate: new Date(2015, 1 - 1, 1),
            maxDate: "0M",
            onSelect: function(dateText) {
                setTimeout(function () { __doPostBack("boton_oculto_buscar_pagos", ""); }, 1);
            }
        });
        
        $('#caja_fecha_fin').datepicker({
            changeMonth: true,
            changeYear: true,
            minDate: new Date(2015, 1 - 1, 1),
            maxDate: "0M",
            onSelect: function(dateText) {
                setTimeout(function () { __doPostBack("boton_oculto_buscar_pagos", ""); }, 1);
            }
        });
    }
    function controles_cancelaciones()
    {
        $('#caja_fecha_cancelacion').datepicker({
            changeMonth: true,
            changeYear: true,
            minDate: new Date(2015, 1 - 1, 1),
            maxDate: "0M",
            onSelect: function(dateText) {
                setTimeout(function () { __doPostBack("boton_oculto_buscar_cancelaciones", ""); }, 1);
            }
        });
        
        $('#caja_fecha_fin_cancelacion').datepicker({
            changeMonth: true,
            changeYear: true,
            minDate: new Date(2015, 1 - 1, 1),
            maxDate: "0M",
            onSelect: function(dateText) {
                setTimeout(function () { __doPostBack("boton_oculto_buscar_cancelaciones", ""); }, 1);
            }
        });
    }
    function dialogo_detalles_venta() {
        $('#dialogo_detalles_ventas').dialog({
            modal: true,
            open: function () {
                $(this).parent().appendTo($("form:first"));
                $(function () {
                    
                });
            },
            close:function () {
                $(this).dialog('destroy').remove()
            },
            width: '30em' , 
            height: 'auto',
            modal: true,
            fluid: true, 
            resizable: false
        });
    }
    function dialogo_cancelacion_venta() {
        $('#dialogo_cancelacion_venta').dialog({
            modal: true,
            open: function () {
                $(this).parent().appendTo($("form:first"));
                $(function () {
                    
                });
            },
            close:function () {
                $(this).dialog('destroy');
            },
            buttons: {
                Aceptar: function () {
                    __doPostBack('boton_cancelacion_venta', '');
                    $(this).dialog("close");
                },
                Cancelar: function () {
                    $(this).dialog("close");
                }
            },
            width: '30em' , 
            height: 'auto',
            modal: true,
            fluid: true, 
            resizable: false
        });       
    }
    function mensaje_cancelacion(){
        setTimeout(function () { __doPostBack("boton_oculto_llenar_tabla_cancelaciones", ""); }, 1);
        $('#mensajes_cancelaciones').toggle("slow", function() {
            setTimeout(function () { $('#mensajes_cancelaciones').toggle("slow"); }, 2000);
        });
    }
    function dialogo_inventario() {
        $('#dialogo_inventario').dialog({
            modal: true,
            open: function () {
                $(this).parent().appendTo($("form:first"));
                $(function () {
                    $("#tabs_inventario").tabs();
                    $("#panel_cargando_inventario").show();
                });
            },
            close:function () {
                $(this).dialog('destroy');
            },
            width: '50em' , 
            height: 'auto',
            modal: true,
            fluid: true, 
            resizable: false
        });
        setTimeout(function () { __doPostBack("boton_oculto_actualizar_tabla_inventario", ""); }, 1);
    }
    function controles_java_inventario(){
        $("#panel_cargando_inventario").hide();
        $("#panel_cargando_inventario_general").hide();
        $('#caja_buscar_inventario').keypress(function (e) {
            if (e.which == 13) {
                $("#panel_cargando_inventario").show();
                setTimeout(function () { __doPostBack("boton_oculto_actualizar_tabla_inventario", ""); }, 1);
            }
        });
        $('#caja_inventario_general').keypress(function (e) {
            if (e.which == 13) {
                $("#panel_cargando_inventario_general").show();
                setTimeout(function () { __doPostBack("boton_oculto_inventario_general", ""); }, 1);
            }
        });
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Punto de venta - Inklaser</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'
        type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="css/efectos_hover/hover.css" rel="stylesheet" media="all" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizable" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
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
                <div class="principal">
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Punto de venta</asp:Label>
                        <asp:Label ID="etiqueta_sucursal" CssClass="titulo_sucursal tipo_texto" Style="text-transform: capitalize;" runat="server" Text=""></asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                            OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="contenido" style="margin-top: 3%;">
                        <asp:Panel ID="mensajes" runat="server" CssClass="mensajes" Visible="True">
                            <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                                <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                            </asp:Panel>
                            <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                        </asp:Panel>
                        <div class="panel_procesar" style="margin-bottom: 0px; top: 2em;">
                            <asp:Label ID="etiqueta_buscar" runat="server" CssClass="etiquetas_barra_superior" Text="Buscar"></asp:Label>
                            <asp:TextBox ID="buscar" CssClass="caja_buscar" runat="server"></asp:TextBox>
                            <asp:Label ID="tipo_busqueda" CssClass="etiquetas_barra_superior" runat="server" Text="Buscar por: "></asp:Label>
                            <asp:DropDownList ID="opcion_busqueda" CssClass=" caja_mediana" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="opcion_busqueda_SelectedIndexChanged">
                                <asp:ListItem>Seleccionar</asp:ListItem>
                                <asp:ListItem>Codigo Barras</asp:ListItem>
                                <asp:ListItem>Productos</asp:ListItem>
                            </asp:DropDownList>
                            <div class="panel_procesar_punto_venta">
                                <asp:LinkButton
                                    ID="boton_bloquear" runat="server"
                                    ToolTip="Bloquea Punto Venta" Style="text-decoration: none; display: none;"
                                    CssClass="botones_cotizaciones b_rojo"><i class="fa fa-power-off"></i></asp:LinkButton>
                                <asp:LinkButton
                                    ID="boton_corte" runat="server"
                                    ToolTip="Cerrar" Style="text-decoration: none"
                                    OnClientClick="javascript:sacar_panel(); return false;"
                                    CssClass="botones_cotizaciones b_rojo"><i class="fa fa-power-off"></i></asp:LinkButton>
                                <asp:LinkButton
                                    ID="boton_cancelaciones" runat="server"
                                    ToolTip="Cancelaciones" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_azul" OnClick="boton_cancelaciones_Click"><i class="fa fa-ban"></i></asp:LinkButton>
                                <asp:LinkButton
                                    ID="boton_reporte" runat="server"
                                    OnClientClick="abrir_reporte();"
                                    ToolTip="DashBoard Ventas"
                                    CssClass="botones_cotizaciones b_azul"
                                    Style="text-decoration: none;">
                                    <i class="fa fa-tachometer"></i></asp:LinkButton>
                                <asp:LinkButton
                                    ID="boton_gastos" runat="server"
                                    ToolTip="Gastos" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_azul" OnClick="boton_gastos_Click"><i class="fa fa-money"></i></asp:LinkButton>
                                <asp:LinkButton
                                    ID="boton_inventario" runat="server"
                                    ToolTip="Inventario" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_azul" OnClick="boton_inventario_Click"><i class="fa fa-cubes"></i></asp:LinkButton>
                            </div>
                        </div>
                        <asp:Panel ID="panel_pagar" runat="server"
                            CssClass="ui-widget-content panel_sobrepuesto_enviar" Visible="false">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="boton_cerrar_pagar" OnClick="boton_cerrar_pagar_Click" runat="server" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div style="margin-left: 5%">
                                <p class="texto_titulos">
                                    <asp:Label ID="Label1" CssClass="tipo_texto" runat="server" Text="Metodo Pago"></asp:Label>
                                </p>
                                <asp:DropDownList ID="drop_metodo_pago" runat="server" CssClass="caja_lista" AutoPostBack="True" OnSelectedIndexChanged="drop_metodo_pago_SelectedIndexChanged">
                                    <asp:ListItem Text="EFECTIVO" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="TARJETA" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="CHEQUE" Value="2"></asp:ListItem>
                                </asp:DropDownList>

                                <p class="texto_titulos">
                                    <asp:Label ID="etiqueta_cuenta" CssClass="tipo_texto" runat="server" Text="Cuenta" Visible="false"></asp:Label>
                                    
                                </p>
                                <asp:TextBox ID="caja_cuenta" MaxLength="4" Text="N/A" runat="server" CssClass="caja_lista" Visible="false"></asp:TextBox>
                                <p class="texto_titulos">
                                    <asp:Label ID="Label2" CssClass="tipo_texto" runat="server" Text="Factura"></asp:Label>
                                    <asp:CheckBox ID="check_factura" runat="server" CssClass="separador_izquierdo_5"/>
                                    <asp:RadioButton ID="pesos" Text="Pesos" runat="server" GroupName="moneda" OnCheckedChanged="pesos_CheckedChanged" AutoPostBack="True" />
                                    <asp:RadioButton ID="dolares" Text="Dolares" runat="server" GroupName="moneda" OnCheckedChanged="dolares_CheckedChanged" AutoPostBack="True" />
                                </p>
                                <p class="texto_titulos">
                                    <asp:Label ID="etiqueta_cantidad_pagar" CssClass="tipo_texto" runat="server" Text="Pago"></asp:Label>
                                </p>
                                <asp:TextBox ID="caja_cantidad_pagar" runat="server" Enabled="True" CssClass="caja_lista"></asp:TextBox>
                            </div>
                            <div style="margin-left: 35%">
                                <asp:LinkButton ID="boton_pagar" runat="server"
                                    ToolTip="Pagar la cuenta" Style="text-decoration: none;" OnClick="pagar_Click"
                                    CssClass="botones_requisiciones_chicos b_verde" OnClientClick="activar_boton_pagar();">Pagar</asp:LinkButton>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panel_busqueda" runat="server"
                            CssClass="ui-widget-content panel_sobrepuesto" Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="boton_cerrar_buscar" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_busqueda_Click"><i class="fa fa-close"></i>
                                </asp:LinkButton>
                            </div>
                            <asp:Panel ID="panel_cantidades" runat="server"
                                CssClass="ui-widget-content panel_sobrepuesto_enviar" Visible="False">
                                <div class="separador_altas s_azul">
                                    <asp:LinkButton ID="boton_cerrar_cantidades" runat="server"
                                        CssClass="boton_cerrar"
                                        OnClick="boton_cerrar_cantidades_Click">
                                        <i class="fa fa-close"></i>
                                    </asp:LinkButton>
                                </div>
                                <asp:GridView ID="tabla_cantidades" runat="server" AutoGenerateColumns="False" CssClass="tabla"
                                    ShowHeaderWhenEmpty="True" DataSource='<%# datos_inventario_sucursal() %>'>
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Id Sucursal" DataField="id_sucursal"></asp:BoundField>
                                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                <div class="separador"></div>
                            </asp:Panel>
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_cantidad" runat="server" CssClass="etiquetas_barra_superior" Text="Cantidad"></asp:Label>
                                <asp:TextBox
                                    ID="caja_cantidad" runat="server" Enabled="True"
                                    CssClass="caja_buscar"></asp:TextBox>
                                <asp:Label ID="Label4" runat="server" CssClass="etiquetas_barra_superior" Text="Buscar"></asp:Label>
                                <asp:TextBox
                                    ID="caja_busqueda_caja" runat="server" Enabled="True"
                                    CssClass="caja_buscar"></asp:TextBox>
                                <asp:LinkButton ID="boton_oculto_buscar_caja" runat="server" OnClick="boton_oculto_buscar_caja_Click"></asp:LinkButton>
                            </div>
                            <div class="limitado_chico">
                                <asp:GridView ID="tabla_busqueda" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_busqueda() %>' CssClass="tabla"
                                    DataKeyNames="id"
                                    OnRowCommand="tabla_busqueda_RowCommand"
                                    ShowHeaderWhenEmpty="True">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id"></asp:BoundField>
                                        <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                        <asp:BoundField HeaderText="Precio Uni." DataField="precio" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Cantidad" ShowHeader="True">
                                            <HeaderStyle CssClass="" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="cantidad_productos" CssClass="" onkeypress="return numeros(event);" MaxLength="3" runat="server" Width="25px" Text='<%#Eval("cantidad") %>' CommandName="ver_cantidades" CommandArgument="<%#((GridViewRow)Container).RowIndex%>" ToolTip="Ver cantidad de producto por sucursales"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <HeaderStyle CssClass="" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="agregar" runat="server" CausesValidation="False" ToolTip="Agregar producto a la venta"
                                                    CommandName="agregar_venta" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-shopping-cart controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="separador_altas"></div>
                        </asp:Panel>
                        <div class="contenido">
                            <div class="izquierdo" style="width: 30%;margin-left: 1%;">
                                <div class="separador_altas s_azul" style="text-align: center !important">
                                    <asp:Label ID="etiqueta_detalles" runat="server" class="negro_grande">Detalles</asp:Label>
                                </div>
                                <div class="separador_chico"></div>
                                <div id="controles_busqueda" class="limitado" style="height: 36em;">
                                    <ul class="lista_cotizacion" style="position: relative;">
                                        <li>
                                            <p class="texto_titulos">
                                                <asp:Label ID="etiqueta_productos" runat="server" CssClass="tipo_texto" Text="No Productos"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_numero_productos" runat="server" CssClass=" caja_lista" Enabled="False" />
                                        </li>
                                        <li>
                                            <p class="texto_titulos">
                                                <asp:Label ID="etiqueta_subtotal" CssClass="tipo_texto" runat="server" Text="Subtotal"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_subtotal" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p class="texto_titulos">
                                                <asp:Label ID="etiqueta_iva" CssClass="tipo_texto " runat="server" Text="Iva"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_iva" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p class="texto_titulos">
                                                <asp:Label ID="etiqueta_total" CssClass="tipo_texto" runat="server" Text="Total"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_total" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p class="texto_titulos">
                                                <asp:Label ID="etiqueta_tipo_cambio" CssClass="tipo_texto" runat="server" Text="Tipo de cambio"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_tipo_cambio" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p class="texto_titulos">
                                                <asp:Label ID="etiqueta_tota_dolares" CssClass="tipo_texto" runat="server" Text="Total en dolares"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_total_dolares" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                        </li>
                                    </ul>
                                </div>
                                <div class="separador_chico"></div>
                                <div style="width: 75%;margin-left: 9%;display: block;">
                                    <asp:LinkButton
                                        ID="vaciar" runat="server"
                                        ToolTip="Vaciar compra" Style="text-decoration: none"
                                        CssClass="botones_cotizaciones b_rojo" OnClick="vaciar_Click"><i class="fa fa-trash"></i>&nbsp;&nbsp;Vaciar</asp:LinkButton>
                                    <asp:LinkButton
                                        ID="cobrar" runat="server"
                                        ToolTip="Iniciar cobro de productos" Style="text-decoration: none"
                                        CssClass="botones_cotizaciones b_azul" OnClick="cobrar_Click"><i class="fa fa-calculator"></i>&nbsp;&nbsp;Cobrar</asp:LinkButton>
                                </div>
                            </div>
                            <div class="derecho" style="width: 65%;">
                                <div class="limitado" style="height: 45em;">
                                    <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla" DataSource='<%# datos_productos() %>'
                                        DataKeyNames="clave_carrito"
                                        OnRowCommand="tabla_productos_RowCommand"
                                        OnRowDataBound="tabla_productos_RowDataBound"
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                                        PagerSettings-Visible="false">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Clave" DataField="clave_carrito" Visible="True">
                                                <HeaderStyle CssClass="" />
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                            <asp:BoundField HeaderText="Precio Uni." DataField="precio" DataFormatString="{0:C}"></asp:BoundField>
                                            <asp:BoundField HeaderText="Cant" DataField="cantidad"></asp:BoundField>
                                            <asp:BoundField HeaderText="Total" DataField="precio_total" DataFormatString="{0:C}"></asp:BoundField>
                                            <asp:TemplateField>
                                                <HeaderStyle CssClass="" />
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_caja_cantidad" runat="server" Visible="false">
                                                        <asp:TextBox ID="caja_cantidad_servicios" runat="server" CssClass="cantidad"></asp:TextBox>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <HeaderStyle CssClass="" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="restar" runat="server" CausesValidation="False" ToolTip="Eliminar una existencia del producto"
                                                        CommandName="restar_existencia" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-minus controles_tablas"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="sumar" runat="server" CausesValidation="False" ToolTip="Agregar una existencia del producto"
                                                        CommandName="sumar_existencia" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus controles_tablas"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="quitar" runat="server" CausesValidation="False" ToolTip="Eliminar producto del carrito de venta" OnClientClick="return confirm('Desea eliminar el producto del carrito de venta?');"
                                                        CommandName="quitar_carrito" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash controles_tablas"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="actualizar_cantidad" runat="server" CausesValidation="False" ToolTip="Actualizar" 
                                                        CommandName="actualizar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>" Visible ="false"><i class="fa fa-refresh controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton ID="boton_buscar" runat="server" Style="text-decoration: none; display: none;" OnClick="boton_buscar_Click"><i class="fa fa-gear"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_seleccion_arriba" runat="server" Style="text-decoration: none; display: none;" OnClick="boton_seleccion_arriba_Click"><i class="fa fa-gear"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_seleccion_abajo" runat="server" Style="text-decoration: none; display: none;" OnClick="boton_seleccion_abajo_Click"><i class="fa fa-gear"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_cerrar" runat="server" Style="text-decoration: none; display: none;" OnClick="boton_cerrar_Click"><i class="fa fa-gear"></i></asp:LinkButton>
                        <asp:LinkButton ID="seleccion_pesos" runat="server" Style="text-decoration: none; display: none;" OnClick="seleccion_pesos_Click"><i class="fa fa-gear"></i></asp:LinkButton>
                        <asp:LinkButton ID="seleccion_dolares" runat="server" Style="text-decoration: none; display: none;" OnClick="seleccion_dolares_Click"><i class="fa fa-gear"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_busqueda_producto" runat="server" Style="display: none;" OnClick="boton_busqueda_producto_Click"></asp:LinkButton>
                        <div class="separador_totales"></div>
                    </div>

                </div>
                <asp:Panel ID="panel_inicio_turno" runat="server" Visible="false" Height="400" Width="600">
                    <asp:Panel ID="panel_inicio_sucursal" runat="server" Visible="true">
                        <div id="contenedor" class="limitado_chico" style="height: 300px">
                            <div id="div_titulo">
                                <i class="texto_titulos tipo_texto">Sucursal</i>
                            </div>
                            <div id="cuerpo">
                                <asp:TextBox Visible="false" ID="caja_sucursal" runat="server" ToolTip="Ingresa Nombre Sucursal" CssClass="caja_chica_90" Style="width: 15em;"></asp:TextBox>
                                <asp:DropDownList runat="server" ID="list_sucursales" ToolTip="Ingresa Nombre Sucursal" CssClass="caja_chica_90" Style="width: 15em;">
                                    <asp:ListItem>Inklaser Cortez</asp:ListItem>
                                    <asp:ListItem>Inklaser Cuarta</asp:ListItem>
                                    <asp:ListItem>Inklaser CBTIS</asp:ListItem>
                                    <asp:ListItem>Inklaser Matriz</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="panel_ayuda tipo_texto">
                                <asp:Label ID="etiqueta_notificacion" runat="server">
                                Para Iniciar Ingresa El Nombre De Tu Sucursal Y Selecciona Alguna De La Lista
                                Si Tu Sucursal No Aparece Contacta A Tu Administrador.  
                                </asp:Label>
                            </div>
                            <div id="boton" class="boton_inicio">
                                <asp:LinkButton ID="boton_iniciar_caja" runat="server" Font-Underline="false" class="botones_cotizaciones b_gris hvr-fade" OnClick="boton_iniciar_caja_Click">Aceptar</asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panel_apertura" runat="server" Visible="false">
                        <div id="div_titulo_2">
                            <i class="texto_titulos tipo_texto">Fondo Inicial</i>
                        </div>
                        <div id="cuerpo_">
                            <asp:TextBox ID="caja_fondo" runat="server" ToolTip="Ingresa Nombre Sucursal" CssClass="caja_chica_90" Style="width: 15em;"></asp:TextBox>
                        </div>
                        <div class="panel_ayuda tipo_texto">
                            <asp:Label ID="etiqueta_ayuda_fondo" runat="server">
                               Ingresa La Cantidad De Fondo Al Inicio Del Turno.
                               Una Ves Registrado El Fondo Podras Acceder Ala Caja
                               Recuerda Pedir Cierre De Turno!  
                            </asp:Label>
                        </div>
                        <div id="boton_" class="boton_inicio">
                            <asp:LinkButton ID="boton_inicio" runat="server" Font-Underline="false" class="botones_cotizaciones b_gris hvr-fade" Text="Aceptar" OnClick="boton_inicio_Click"></asp:LinkButton>
                        </div>
                    </asp:Panel>
                </asp:Panel>
                <asp:LinkButton ID="boton_oculto_buscar" OnClick="boton_oculto_buscar_Click"
                    runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_si" OnClick="boton_oculto_si_Click"
                    runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="oculto_pagar" OnClick="oculto_pagar_Click"
                    runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                <div style="display: none;">
                    <div id="panel_cerrar_caja" class="limitado_chico">
                        <div class="separador" style="height: 3em;">
                            <i class="etiqueta_togle tipo_texto texto_titulos">Contar</i>
                            <div class="middle">
                                <a href="javascript:verificar();">
                                    <i class="fa fa-toggle-on fa-2x active" id="on" style="display: none;"></i>
                                    <i class="fa fa-toggle-on fa-2x fa-rotate-180 inactive" id="off"></i>
                                </a>
                            </div>
                        </div>
                        <div>
                            <div class=" izquierdo_mitad">
                                <ul style="list-style: none;">
                                    <li>
                                        <p class="tipo_texto">
                                            Centavos
                                        </p>
                                        <asp:TextBox ID="caja_centavos" runat="server" MaxLength="2" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Moneda: 1
                                        </p>
                                        <asp:TextBox ID="caja_pesos_1" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Moneda: 2
                                        </p>
                                        <asp:TextBox ID="caja_pesos_2" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>

                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Moneda : 5
                                        </p>
                                        <asp:TextBox ID="caja_pesos_5" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Moneda : 10
                                        </p>
                                        <asp:TextBox ID="caja_pesos_10" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>

                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Moneda : 20
                                        </p>
                                        <asp:TextBox ID="caja_pesos_20" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                </ul>
                            </div>
                            <div class=" derecho_mitad">
                                <ul style="list-style: none;">
                                    <li>
                                        <p class="tipo_texto">
                                            Billetes : 20
                                        </p>
                                        <asp:TextBox ID="caja_billetes_20" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Billetes: 50
                                        </p>
                                        <asp:TextBox ID="caja_billetes_50" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>

                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Billetes: 100
                                        </p>
                                        <asp:TextBox ID="caja_billetes_100" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Billetes : 200
                                        </p>
                                        <asp:TextBox ID="caja_billetes_200" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>

                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Billetes : 500
                                        </p>
                                        <asp:TextBox ID="caja_billetes_500" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Billetes : 1000
                                        </p>
                                        <asp:TextBox ID="caja_billetes_1000" runat="server" CssClass="cantidad" Style="width: 80%;"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="tipo_texto">
                                            Comentarios:
                                        </p>
                                        <asp:TextBox ID="caja_comentarios_cierre" runat="server" CssClass="caja_lista" Style="height: 4em;" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    </li>
                                </ul>
                            </div>
                            <asp:CheckBox ID="check_contar" runat="server" Style="display: none;" />
                        </div>
                        <div>
                            <p class="tipo_texto">
                                Cantidad Total
                            </p>
                            <asp:TextBox ID="caja_cantidad_total" runat="server" CssClass="caja_chica solo_numeros" Style="width: 30%;"></asp:TextBox>
                            <asp:TextBox ID="caja_clon_cantidad_total" runat="server" Style="display: none;"></asp:TextBox>
                        </div>
                        <div class="panel_procesar_punto_venta" style="margin-left: 30%; margin-top: 0em;">
                            <div>
                                <asp:LinkButton
                                    ID="boton_cerrar_turno" runat="server"
                                    ToolTip="Cerrar Turno" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_azul" OnClick="boton_cerrar_turno_Click"><i class="fa fa-calculator"></i>&nbsp;&nbsp;Cerrar Turno</asp:LinkButton>
                                <asp:LinkButton
                                    ID="boton_cerrar_caja" runat="server"
                                    ToolTip="Cerrar Caja" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_verde" OnClick="boton_cerrar_caja_Click"><i class="fa fa-calculator"></i>&nbsp;&nbsp;Cerrar Caja</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="dialogo_clientes" title="Datos Facturacion" style="display: none;">
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Buscar Cliente</a></li>
                    <li><a href="#tabs-2">Agregar Cliente</a></li>
                </ul>
                <div id="tabs-1">
                    <asp:UpdatePanel ID="panel_actualizable_clientes" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="">
                                <div class="">
                                    <fieldset>
                                        <legend class=" tipo_texto titulo_campo">Buscar</legend>
                                        <div class="controlgroup">
                                            <asp:Label ID="etiqueta_caja_clientes" runat="server" CssClass="tipo_texto_campo" Text="Nombre"></asp:Label>
                                            <asp:TextBox ID="caja_clientes" runat="server" CssClass="text ui-widget-content ui-corner-all caja_falsa"></asp:TextBox>
                                            <div class="separador_1em"></div>
                                            <asp:Label ID="etiqueta_caja_rfc" CssClass="tipo_texto_campo" Text="RFC" Style="float: left; margin-right: 1em;" runat="server"></asp:Label>
                                            <asp:DropDownList ID="lista_rfc_clientes" AutoPostBack="true" runat="server" OnSelectedIndexChanged="lista_rfc_clientes_SelectedIndexChanged" CssClass="text ui-widget-content ui-corner-all">
                                                <asp:ListItem>Seleccionar</asp:ListItem>
                                            </asp:DropDownList>
                                            <div style="float: right; position: relative;">
                                                <asp:LinkButton ID="boton_actualizar" runat="server" OnClick="boton_actualizar_Click"><i class="fa fa-refresh"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <br />
                                    <asp:Panel ID="panel_data_fields" runat="server" Visible="false">
                                        <fieldset>
                                            <legend class="tipo_texto  titulo_campo">Datos Factura</legend>
                                            <div class="controlgroup">
                                                <asp:Label ID="etiqueta_uso_factura" runat="server" CssClass="tipo_texto_campo" Text="Uso Factura"></asp:Label>
                                                <div class="separador_1em"></div>
                                                <asp:DropDownList ID="lista_usos_factura" runat="server" CssClass="text ui-widget-content ui-corner-all">
                                                    <asp:ListItem>Selecciona</asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="separador_1em"></div>
                                                <asp:Label ID="etiqueta_pago" runat="server" CssClass="tipo_texto_campo" Text="Metodo Pago"></asp:Label>
                                                <div class="separador_1em"></div>
                                                <asp:DropDownList ID="lista_metos_pago" AutoPostBack="true" OnSelectedIndexChanged="lista_metos_pago_SelectedIndexChanged" runat="server" CssClass="text ui-widget-content ui-corner-all">
                                                    <asp:ListItem>Selecciona</asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="separador_1em"></div>
                                                <asp:Label ID="etiqueta_bancos" runat="server" CssClass="tipo_texto_campo" Text="Banco" Visible="false"></asp:Label>
                                                <div class="separador_1em"></div>
                                                <asp:DropDownList ID="lista_bancos" Visible="false" runat="server"  CssClass="text ui-widget-content ui-corner-all">
                                                    <asp:ListItem>Selecciona</asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="separador_1em"></div>
                                            </div>
                                        </fieldset>
                                        <br />
                                        <fieldset>
                                            <legend class="tipo_texto  titulo_campo">Datos Cliente</legend>
                                            <div class="controlgroup">
                                                <div class="derecho_mitad">
                                                    <asp:Label ID="etiqueta_datos_nombre" runat="server" CssClass="tipo_texto_campo" Text="Nombre"></asp:Label>
                                                    <asp:TextBox ID="caja_nombre_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_nombre_comercial" runat="server" CssClass="tipo_texto_campo" Text="Nombre Comercial"></asp:Label>
                                                    <asp:TextBox ID="caja_nombre_comercial_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_telefono" runat="server" CssClass="tipo_texto_campo" Text="Telefono"></asp:Label>
                                                    <asp:TextBox ID="caja_telefono_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_correo" runat="server" CssClass="tipo_texto_campo" Text="Correo"></asp:Label>
                                                    <asp:TextBox ID="caja_correo_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_rfc" runat="server" CssClass="tipo_texto_campo" Text="RFC"></asp:Label>
                                                    <asp:TextBox ID="caja_rfc_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                </div>
                                                <div class="izquierdo_mitad">
                                                    <asp:Label ID="etiqueta_datos_calle" runat="server" CssClass="tipo_texto_campo" Text="Calle"></asp:Label>
                                                    <asp:TextBox ID="caja_calle_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_colonia" runat="server" CssClass="tipo_texto_campo" Text="Colonia"></asp:Label>
                                                    <asp:TextBox ID="caja_colonia_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_estado" runat="server" CssClass="tipo_texto_campo" Text="Estado"></asp:Label>
                                                    <asp:TextBox ID="caja_estado_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_municipio" runat="server" CssClass="tipo_texto_campo" Text="Municipio"></asp:Label>
                                                    <asp:TextBox ID="caja_municipio_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_pais" runat="server" CssClass="tipo_texto_campo" Text="Pais"></asp:Label>
                                                    <asp:TextBox ID="caja_pais_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_datos_codigo_postal" runat="server" CssClass="tipo_texto_campo" Text="Codigo Postal"></asp:Label>
                                                    <asp:TextBox ID="caja_codigo_postal_cliente" runat="server" CssClass="text ui-widget-content ui-corner-all" Enabled="false"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                    <asp:Label ID="etiqueta_comentario" runat="server" CssClass="tipo_texto_campo" Text="Comentarios"></asp:Label>
                                                    <asp:TextBox ID="caja_comentarios_factura" runat="server" CssClass="text ui-widget-content ui-corner-all"></asp:TextBox>
                                                    <div class="separador_1em"></div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="footer_facturas">
                                            <asp:LinkButton ID="boton_facturar" runat="server" OnClick="boton_facturar_Click" Text="Facturar" CssClass=" botones_cotizaciones b_rojo"></asp:LinkButton>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <asp:LinkButton ID="boton_oculto_rfc" runat="server" OnClick="boton_oculto_rfc_Click" Style="display: none"></asp:LinkButton>
                            <asp:LinkButton ID="boton_oculto_destruir_sesion" runat="server" OnClick="boton_oculto_destruir_sesion_Click" Style="display: none"></asp:LinkButton>
                            <asp:LinkButton ID="boton_oculto_facturar" runat="server" OnClick="boton_oculto_facturar_Click" Style="display: none"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_rfc" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_actualizar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lista_rfc_clientes" />
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_facturar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="lista_metos_pago" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div id="tabs-2">
                    <asp:UpdatePanel ID="panel_actualizable_nuevos_clientes" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="limitado_mamalon">
                                <iframe id="mi_iframe" src="alta_clientes.aspx" style="height: 100%; width: 100%;"></iframe>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                        </Triggers>
                    </asp:UpdatePanel>
                    <div id="iframe_facturacion_oculto" style="visibility: hidden;">
                    </div>
                    <div id="dialogo_cargando" title="Cargando..." style="display: none;">
                        <div id="progressbar">
                            <div class="progress-label">
                                <asp:Label ID="etiqueta_cargando" runat="server" Text="Cargando..."></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="dialogo_pagos" title="Gastos" style="display: none;">
            <div id="tabs_pagos">
                <ul>
                    <li><a href="#tab_pagar">Ingresar Gasto</a></li>
                    <li><a href="#tab_pagos">Registro</a></li>
                </ul>
                <div id="tab_pagar" style="height: 20em;">
                    <asp:UpdatePanel ID="actualizable_pagar" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="mensajes_pagos" class="mensajes_arriba" style="display: none;">
                                <div class="izquierdo_mitad_chico">
                                    <div class="">
                                        <i class="fa fa-check-square" style="font-size: xx-large; margin-left: 4%;"></i>
                                        <label style="margin-left: 3%;" class="tipo_texto">Gasto ingresado correctamente.</label>
                                    </div>
                                </div>
                            </div>
                            <div id="formulario_gastos" class="">
                                <p class="tipo_texto">Tipo Pago</p>
                                <asp:DropDownList ID="lista_tipo_pago" runat="server" CssClass="caja_lista">
                                    <asp:ListItem Text="Proveedor" />
                                    <asp:ListItem Text="Consumo" />
                                </asp:DropDownList>
                                <p class="tipo_texto">Monto($)</p>
                                <asp:TextBox ID="caja_monto_pago" runat="server" CssClass="caja_lista" />
                                <p class="tipo_texto">Comentario</p>
                                <asp:TextBox ID="caja_comentario_pago" runat="server" CssClass="caja_lista" Style="height: 4em;" TextMode="MultiLine" Rows="5" />
                                <div class="botones_dialogo">
                                    <asp:LinkButton ID="boton_pago" runat="server" Text="Ingresar" CssClass=" botones_cotizaciones b_rojo" OnClick="boton_pago_Click" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_pago" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div id="tab_pagos" style="height: 20em;">
                    <asp:UpdatePanel ID="actualizable_pagados" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="barra_buscar_pagos" style="margin-bottom: 1%;">
                                <div class="">
                                    <div class="">
                                        <label class="texto_titulos">
                                            De:
                                        </label>
                                        <asp:TextBox ID="caja_fecha" CssClass="caja_fecha" runat="server"></asp:TextBox>


                                        <label class="texto_titulos">
                                            A:
                                        </label>
                                        <asp:TextBox ID="caja_fecha_fin" CssClass="caja_fecha" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="separador s_azul" style="height: 2em;">
                                <asp:Label ID="etiqueta_periodo" runat="server" Text="" CssClass="negro_grande"></asp:Label>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="contenedor_tabla_ventana">
                                <asp:GridView ID="tabla_pagos" runat="server" AutoGenerateColumns="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_registro_venta" />
                                        <asp:BoundField HeaderText="ID Caja" DataField="id_registro_caja" />
                                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor" />
                                        <asp:BoundField HeaderText="Tipo" DataField="tipo" />
                                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal" />
                                        <asp:BoundField HeaderText="Monto" DataField="monto" />
                                        <asp:BoundField HeaderText="Comentario" DataField="comentario" />
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <asp:LinkButton ID="boton_oculto_llenar_tabla_pagos" runat="server" Style="display: none;" OnClick="boton_oculto_llenar_tabla_pagos_Click"></asp:LinkButton>
                            <asp:LinkButton ID="boton_oculto_buscar_pagos" runat="server" Style="display: none;" OnClick="boton_oculto_buscar_pagos_Click"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_llenar_tabla_pagos" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_buscar_pagos" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div id="dialogo_cancelaciones" title="Ventas" style="display: none;">
            <div id="tabs_cancelaciones">
                <ul>
                    <li><a href="#tab_ventas">Cancelar Ventas</a></li>
                    <li><a href="#tab_registros">Registro Cancelaciones</a></li>
                </ul>
                <div id="tab_ventas" style="height: 20em;">
                    <asp:UpdatePanel ID="actualizable_ventas" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="mensajes_cancelaciones" class="mensajes_arriba" style="display: none;">
                                <div class="izquierdo_mitad_chico">
                                    <div class="">
                                        <i class="fa fa-check-square" style="font-size: xx-large; margin-left: 4%;"></i>
                                        <label style="margin-left: 3%;" class="tipo_texto">Cancelacion Realizada.</label>
                                    </div>
                                </div>
                            </div>
                            <div id="formulario_cancelaciones" class="contenedor_tabla_ventana">
                                <asp:GridView ID="tabla_ventas_punto" runat="server" AutoGenerateColumns="False" CssClass="tabla" DataKeyNames="clave_venta"
                                    OnRowCommand="tabla_ventas_punto_RowCommand">
                                    <HeaderStyle CssClass="GridHeader" HorizontalAlign="Center" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="CLV" DataField="clave_venta"></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" SortExpression="fecha" DataFormatString="{0:dd/MMMM/yyyy - hh:mm tt}"></asp:BoundField>
                                        <asp:BoundField HeaderText="Total" DataField="total" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F}" HtmlEncode="false">
                                            <ItemStyle CssClass="total" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemStyle CssClass="centro" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ver" runat="server" CausesValidation="False" ToolTip="Ver Detalles"
                                                    CommandName="detalles" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye opcion_tabla"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <ItemStyle CssClass="centro" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="cancelar" runat="server" CausesValidation="False" ToolTip="Cancelar"
                                                    CommandName="cancelar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-ban opcion_tabla"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <asp:LinkButton ID="boton_oculto_llenar_tabla_ventas" runat="server" OnClick="boton_oculto_llenar_tabla_ventas_Click" Style="display: none;"></asp:LinkButton>
                            <div id="dialogo_detalles_ventas" style="display: none;" title="Detalles Venta">
                                <div class="contenedor_tabla_ventana">
                                    <asp:GridView ID="tabla_detalles_ventas" class="tabla" runat="server" AutoGenerateColumns="false">
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
                            <div id="dialogo_cancelacion_venta" style="display: none;" title="Motivo Cancelacion">
                                <div class="contenedor_tabla_ventana" style="height: 6em;">
                                    <asp:HiddenField ID="campo_clave_venta_punto" runat="server" />
                                    <asp:Label runat="server" ID="etiqueta_comentario_cancelacion" Text="Comentario" CssClass="tipo_texto"></asp:Label>
                                    <div class="separador_chico"></div>
                                    <asp:TextBox ID="caja_comentario_cancelacion" runat="server" TextMode="MultiLine" Columns="4" CssClass="caja_lista" Style="height: 2em;"></asp:TextBox>
                                    <div class="separador_chico"></div>
                                    <asp:LinkButton ID="boton_cancelacion_venta" runat="server" OnClick="boton_cancelacion_venta_Click" Style="display: none;"></asp:LinkButton>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_llenar_tabla_ventas" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_cancelacion_venta" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="tabla_ventas_punto" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div id="tab_registros" style="height: 20em;">
                    <asp:UpdatePanel ID="actualizable_cancelaciones" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="barra_buscar_cancelaciones" style="margin-bottom: 1%;">
                                <div class="">
                                    <div class="">
                                        <label class="texto_titulos">
                                            De:
                                        </label>
                                        <asp:TextBox ID="caja_fecha1_cancelaciones" CssClass="caja_fecha" runat="server"></asp:TextBox>


                                        <label class="texto_titulos">
                                            A:
                                        </label>
                                        <asp:TextBox ID="caja_fecha2_cancelaciones" CssClass="caja_fecha" runat="server"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="separador s_azul" style="height: 2em;">
                                <asp:Label ID="etiqueta_periodo_cancelacion" runat="server" Text="" CssClass="negro_grande"></asp:Label>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="contenedor_tabla_ventana">
                                <asp:GridView ID="tabla_cancelaciones" runat="server" AutoGenerateColumns="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_cancelacion" />
                                        <asp:BoundField HeaderText="Clave" DataField="clave_documento" />
                                        <asp:BoundField HeaderText="Vendedor" DataField="vendedor" />
                                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal" />
                                        <asp:BoundField HeaderText="Comentario" DataField="comentario" />
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <asp:LinkButton ID="boton_oculto_llenar_tabla_cancelaciones" runat="server" Style="display: none;" OnClick="boton_oculto_llenar_tabla_cancelaciones_Click"></asp:LinkButton>
                            <asp:LinkButton ID="boton_oculto_buscar_cancelaciones" runat="server" Style="display: none;" OnClick="boton_oculto_buscar_cancelaciones_Click"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_llenar_tabla_cancelaciones" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_buscar_cancelaciones" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div id="dialogo_inventario" title="Inventario" style="display: none;">
            <div id="tabs_inventario">
                <ul>
                    <li><a href="#tab_inventario">Inventario Sucursal</a></li>
                    <li><a href="#tab_salidas">Inventario General</a></li>
                </ul>
                <div id="tab_inventario" style="height: 20em;">
                    <asp:UpdatePanel ID="actualizable_inventario" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div id="barra_inventario" style="margin-bottom: 1%;">
                                <div class="">
                                    <div class="">
                                        <label class="texto_titulos">
                                            Buscar:
                                        </label>
                                        <asp:TextBox ID="caja_buscar_inventario" CssClass="caja_fecha" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="contenedor_tabla_ventana" style="width: 45em;">
                                <asp:GridView ID="tabla_inventario" runat="server" AutoGenerateColumns="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="C.Prov." DataField="codigo_proveedor" />
                                        <asp:BoundField HeaderText="Desc." DataField="descripcion" />
                                        <asp:BoundField HeaderText="Cat." DataField="categoria" />
                                        <asp:BoundField HeaderText="Precio" DataField="precio" />
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" />
                                    </Columns>
                                </asp:GridView>
                                <div id="panel_cargando_inventario" class="panel_cargando">
                                    <asp:Label ID="Label3" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                                </div>
                            </div>
                            <asp:LinkButton ID="boton_oculto_actualizar_tabla_inventario" runat="server" OnClick="boton_oculto_actualizar_tabla_inventario_Click" Style="display: none;"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_actualizar_tabla_inventario" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div id="tab_salidas" style="height: 20em;">
                    <asp:UpdatePanel ID="actualizable_salidas" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                             <div id="barra_inventario_general" style="margin-bottom: 1%;">
                                <div class="">
                                    <div class="">
                                        <label class="texto_titulos">
                                            Buscar:
                                        </label>
                                        <asp:TextBox ID="caja_inventario_general" CssClass="caja_fecha" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="contenedor_tabla_ventana" style="width: 45em;">
                                <asp:GridView ID="tabla_inventario_general" runat="server" AutoGenerateColumns="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="C.Prov." DataField="codigo_proveedor" />
                                        <asp:BoundField HeaderText="Desc." DataField="descripcion" />
                                        <asp:BoundField HeaderText="Cat." DataField="categoria" />
                                        <asp:BoundField HeaderText="Precio" DataField="precio" />
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" />
                                    </Columns>
                                </asp:GridView>
                                <div id="panel_cargando_inventario_general" class="panel_cargando">
                                    <asp:Label ID="Label5" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                                </div>
                            </div>
                            <asp:LinkButton ID="boton_oculto_inventario_general" runat="server" style="display:none" OnClick="boton_oculto_inventario_general_Click"></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_inventario_general" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<style>
    .panel_cargando {
        position: absolute;
        left: 50%;
        width: 90%;
        top: 50%;
        z-index: 100000;
    }

    .contenedor_tabla_ventana {
        height: 15em;
        overflow: auto;
    }

    .limitado_mamalon {
        width: 100%;
        height: 25em;
    }

    .panel_ayuda {
        position: relative;
        display: inline-block;
        margin-top: 13%;
        background: rgba(255, 203, 124, 0.8);
    }

    .separador_1em {
        margin-bottom: 1em;
    }

    .boton_inicio {
        top: 1em;
        left: 7em;
        position: relative;
        width: 50%;
    }

    .b_gris {
        background: #d2d3d3;
    }

    .hvr-fade:hover {
    }

    .hvr-icon-grow:before {
        content: "\f138";
        right: 5%;
        top: 41%;
    }

    .ul_sin_estilo {
        list-style: none;
    }

    .separador_izquierdo_5 {
        margin-left: 3%;
    }

    .separador_totales {
        height: 30px;
        width: 80%;
        margin-left: 10%;
        margin-top: 0.5%;
        margin-bottom: 0.5%;
        border-radius: 4px;
    }

    .titulo_sucursal {
        position: relative;
        top: 30px;
        color: #2C3E50;
        float: left;
        text-decoration: none;
        display: inline-block;
        margin-left: 20px;
        font-weight: bolder;
        font-size: larger;
    }

    .middle {
        text-align: center;
        margin: 0 auto;
        padding: 2rem;
    }

    .active {
        color: green;
    }

    .etiqueta_togle {
        position: absolute;
        top: 1.3em;
        left: 18.5em;
    }

    .error {
        border-color: red;
    }

    .mensajes_arriba {
        position: relative;
        display: flex;
        border-style: solid;
        border-color: #b4ffb4;
    }
    .titulo_campo {
        color: #2C3E50;
        /* float: left; */
        text-decoration: none;
        display: inline-block;
        /* margin-left: 20px; */
        font-weight: bolder;
        font-size: large;
    }
    .tipo_texto_campo {
        font-family: 'Montserrat', sans-serif;
        display: block;
    }
    .footer_facturas {
        width: 50%;
        margin-left: 5%;
        margin-top: 1%;
    }
</style>
