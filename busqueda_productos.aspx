<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/busqueda_productos.aspx.cs" Inherits="busqueda_productos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    function carrito_vacio() {
        alert('El carrito de compra esta vacio');
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'carrito') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_carrito');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'mi_cuenta') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_mi_cuenta');
                boton.click();
            }, 600);
        }
        if (boton.toString().match(/descripcion_producto-/g)) {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_detalles_producto');
                boton.click();
            }, 600);
        }
    }
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
    }
    function producto_agregado_carrito() {
        alert('El producto fue agregado al carrito exitosamente');
    }
    function pulsar_mas(boton) {
        var numero_caracteres, i, codigo_proveedor = '', casilla_cantidad, recibir_casilla, cantidad;
        numero_caracteres = boton.length;
        for (i = numero_caracteres - 1; i >= 0; i--) {
            if (boton[i] != '+') {
                codigo_proveedor = boton[i] + codigo_proveedor;
            }
            else {
                break;
            }
        }
        casilla_cantidad = 'cantidades' + codigo_proveedor;
        recibir_casilla = document.getElementById(casilla_cantidad);
        cantidad = parseInt(recibir_casilla.value);
        if (cantidad < 999) {
            cantidad = cantidad + 1;
            document.getElementById(casilla_cantidad).value = cantidad;
        }
        return false;
    }
    function pulsar_menos(boton) {
        var numero_caracteres, i, codigo_proveedor = '', casilla_cantidad, recibir_casilla, cantidad;
        numero_caracteres = boton.length;
        for (i = numero_caracteres - 1; i >= 0; i--) {
            if (boton[i] != '*') {
                codigo_proveedor = boton[i] + codigo_proveedor;
            }
            else {
                break;
            }
        }
        casilla_cantidad = 'cantidades' + codigo_proveedor;
        recibir_casilla = document.getElementById(casilla_cantidad);
        cantidad = parseInt(recibir_casilla.value);
        if (cantidad > 1) {
            cantidad = cantidad - 1;
            document.getElementById(casilla_cantidad).value = cantidad;
        }
        return false;
    }
    function pulsar(boton) {
        var pulsar_uno, pulsar_dos;
        pulsar_uno = boton;
        pulsar_dos = 'fantasma-' + boton;
        document.getElementById(pulsar_uno).style.visibility = "hidden";
        document.getElementById(pulsar_dos).style.visibility = "Visible";
    }
    function pageLoad() {
        $('#categorias').click(function () {
            $('#panel_categorias').css('visibility', 'visible');
            $('#panel_categorias').css('width', '100%');
            if (document.getElementById("panel_categorias").style.visibility == "visible") {
                setTimeout(function () {
                    $('#menu').css('display', 'inline');
                }, 500);
            }
            document.getElementById("<%= categorias_cerrar.ClientID %>").style.display = "inline";
            document.getElementById("<%= categorias.ClientID %>").style.display = "none";
            return false;
        });
        $('#categorias_cerrar').click(function () {
            $('#menu').css('display', 'none');
            $('#panel_categorias').css('visibility', 'hidden');
            $('#panel_categorias').css('width', '0%');
            document.getElementById("<%= categorias.ClientID %>").style.display = "inline";
            document.getElementById("<%= categorias_cerrar.ClientID %>").style.display = "none";
            return false;
        });
        $('#menu_opciones').click(function () {
            $(window).scrollTop(0);
            $('#panel_categorias').css('visibility', 'visible');
            $('#panel_categorias').css('width', '100%');
            $('#panel_categorias').css('height', '800px');
            if (document.getElementById("panel_categorias").style.visibility == "visible") {
                setTimeout(function () {
                    $('#menu').css('display', 'inline');
                    $('#pagina').css('display', 'none');
                }, 500);
            }
            document.getElementById("<%= menu_cerrar.ClientID %>").style.display = "inline";
            document.getElementById("<%= menu_opciones.ClientID %>").style.display = "none";
            return false;
        });
        $('#menu_cerrar').click(function () {
            $('#menu').css('display', 'none');
            $('#panel_categorias').css('visibility', 'hidden');
            $('#panel_categorias').css('width', '0%');
            $('#panel_categorias').css('height', '800px');
            $('#pagina').css('display', 'inline');
            $(window).scrollTop(0);
            document.getElementById("<%= menu_opciones.ClientID %>").style.display = "inline";
            document.getElementById("<%= menu_cerrar.ClientID %>").style.display = "none";
            return false;
        });
        $('#boton_filtros').click(function () {
            $('#filtros_busqueda').css('visibility', 'visible');
            $('#filtros_busqueda').css('width', '100%');
            $('#boton_filtros').css('padding', '12px 8px 9px 8px');
            $('#boton_filtros_cerrar').css('padding', '12px 8px 9px 8px');
            if (document.getElementById("filtros_busqueda").style.visibility == "visible") {
                setTimeout(function () {
                    $('#elementos_busqueda').css('display', 'none');
                    $('#marcas').css('display', 'inline');
                    $('#opciones_precios').css('display', 'inline');
                    $('#recojer').css('display', 'inline');

                }, 500);

            }
            document.getElementById("<%= boton_filtros_cerrar.ClientID %>").style.display = "inline";
            document.getElementById("<%= boton_filtros.ClientID %>").style.display = "none";
            return false;
        });
        $('#boton_filtros_cerrar').click(function () {
            $('#marcas').css('display', 'none');
            $('#opciones_precios').css('display', 'none');
            $('#recojer').css('display', 'none');
            $('#filtros_busqueda').css('visibility', 'hidden');
            $('#filtros_busqueda').css('width', '0%');
            $('#elementos_busqueda').css('display', 'inline');
            document.getElementById("<%= boton_filtros.ClientID %>").style.display = "inline";
            document.getElementById("<%= boton_filtros_cerrar.ClientID %>").style.display = "none";
            return false;
        });
    }
    document.onkeypress = stopRKey;    
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title></title>
    <link href="css/ventas.css" rel="stylesheet" type="text/css" />
    
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.css" rel="stylesheet">
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="imgSlider/bjqs.min.js"></script>
	<script src="imgSlider/script.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="imgSlider/ventas.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#ffffff">
    <form id="formulario_ventas" runat="server" class="formulario">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!--SECCION BARRA SUPERIOR DE SISTEMA-->
            <div class="barra_arriba_principal">
                <div id="izquierdo">
                    <a href="ventas.aspx">
                        <img id="logotipo" src="img/logo-inklaser.png"></a>
                </div>
                <div id="centro">
                    <div id="contenedor-logo">
                        <a href="ventas.aspx">
                            <img id="logo-chico" src="img/logo-ink.png"></a></div>
                    <asp:LinkButton ID="boton_filtros" runat="server" ToolTip="Mostrar filtros para busqueda"
                        Visible="True"><i class="fa fa-filter"></i></asp:LinkButton>
                    <asp:LinkButton ID="boton_filtros_cerrar" runat="server" ToolTip="Mostrar filtros para busqueda"
                        Visible="True"><i class="fa fa-filter"></i></asp:LinkButton>
                    <asp:TextBox ID="buscar" runat="server" CssClass="buscar"></asp:TextBox>
                    <asp:LinkButton ID="boton_buscar" runat="server" OnClick="boton_busqueda_Click" ToolTip="Haz click para realizar tu busqueda..."><i class="fa fa-search"></i></asp:LinkButton>
                    <asp:LinkButton ID="menu_opciones" runat="server" ToolTip="Haz click aqui para ver las categorias de busqueda"
                        Visible="True"><i class="fa fa-navicon fa-2x"></i></asp:LinkButton>
                    <asp:LinkButton ID="menu_cerrar" runat="server" ToolTip="Cerrar categorias" Visible="True"><i class="fa fa-navicon fa-2x"></i></asp:LinkButton>
                </div>
                <div id="derecho">
                    <asp:LinkButton ID="mi_cuenta" runat="server" CssClass="cuenta" ToolTip="Ingresa a tu cuenta"
                        OnClick="boton_mi_cuenta_Click"><i class="fa fa-user monito"></i>&nbsp;&nbsp;Mi cuenta&nbsp;&nbsp;</asp:LinkButton>
                    <asp:LinkButton ID="cerrar_sesion" runat="server" CssClass="cerrar-sesion" ToolTip="Cerrar Sesion"
                        OnClick="boton_cerrar_sesion_Click"><i class="fa fa-lock"></i></asp:LinkButton>
                    <div id="carrito_espacio">
                        <asp:Label ID="cantidad_articulos" runat="server" Text="0" CssClass="cantidad_articulos mostrar_cantidad"></asp:Label>
                        <asp:LinkButton ID="carrito" runat="server" CssClass="carrito" ToolTip="Ingresar a tu carrito de compra"
                            OnClick="boton_carrito_Click"><i class="fa fa-shopping-cart fa-2x"></i></asp:LinkButton>
                    </div>
                    <asp:Label ID="cantidad" CssClass="cantidad" runat="server" Text="0 Productos - "></asp:Label>
                    <asp:Label ID="precio" CssClass="precio" runat="server" Text=" $0.00"></asp:Label>
                    <asp:LinkButton ID="categorias" runat="server" ToolTip="Haz click aqui para ver las categorias de busqueda"
                        Visible="True"><i class="fa fa-navicon fa-2x"></i></asp:LinkButton>
                    <asp:LinkButton ID="categorias_cerrar" runat="server" ToolTip="Cerrar categorias"
                        Visible="True"><i class="fa fa-navicon fa-2x"></i></asp:LinkButton>
                    <asp:Label ID="mobile" CssClass="dispositivo" runat="server"><i class="fa fa-mobile fa-2x"></i></asp:Label>
                    <asp:Label ID="tablet" CssClass="dispositivo" runat="server"><i class="fa fa-tablet fa-2x"></i></asp:Label>
                    <asp:Label ID="pc" CssClass="dispositivo" runat="server"><i class="fa fa-desktop"></i></asp:Label>
                </div>
            </div>
            <div id="sombra">
            </div>
            <!--MENU DE FILTRADO POR CATEGORIAS-->
            <asp:Panel ID="panel_categorias" runat="server" CssClass="panel_categorias">
                <div id="menu">
                    <ul class="listado">
                        <li class="anuncios anuncio categoria"><i class="fa fa-headphones simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="accesorios_computadora" runat="server" CssClass="categoria">Accesorios de computadora</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-fax simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="componentes_impresoras" runat="server" CssClass="categoria">Componentes de impresora</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-laptop simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="computadoras" runat="server" CssClass="categoria">Computadoras</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-desktop simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="computadoras_armadas" runat="server" CssClass="categoria">Computadoras Armadas</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-gift simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="computadoras_outtlet" runat="server" CssClass="categoria">Computadoras Outlet</asp:LinkButton></li>
                    </ul>
                    <ul class="listado">
                        <li class="anuncios anuncio categoria"><i class="fa fa-pencil simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="consumibles" runat="server" CssClass="categoria">Consumibles</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-print simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="impresoras" runat="server" CssClass="categoria">Impresoras</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-camera-retro simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="proyectores" runat="server" CssClass="categoria">Proyectores</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-wifi simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="redes" runat="server" CssClass="categoria">Redes y Comunicaciones</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-copy simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="scanners" runat="server" CssClass="categoria">Scanners</asp:LinkButton></li>
                    </ul>
                    <ul class="listado">
                        <li class="anuncios anuncio categoria"><i class="fa fa-windows simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="software" runat="server" CssClass="categoria">Software</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-tablet simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="tablets" runat="server" CssClass="categoria">Tablets</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-tint simbolo"></i>&nbsp;&nbsp;&nbsp;<asp:LinkButton
                            ID="tinta" runat="server" CssClass="categoria">Tinta</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-cube simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="toner" runat="server" CssClass="categoria">Toner</asp:LinkButton></li>
                        <li class="anuncios anuncio categoria"><i class="fa fa-video-camera simbolo"></i>&nbsp;&nbsp;<asp:LinkButton
                            ID="videovigilancia" runat="server" CssClass="categoria">Videovigilancia</asp:LinkButton></li>
                    </ul>
                </div>
            </asp:Panel>






            <!--SECCION PAGINA PRINCIPAL INCLUYE TODAS LAS OPCIONES-------------------------------------------------------------------------//////////////////////////////////////////-->
            <asp:Panel ID="pagina" runat="server" CssClass="contenido_sin_busqueda" Visible="True">
            <!--SECCION BUSQUEDA DE PRODUCTOS-->
            <asp:Panel ID="panel_busqueda" runat="server" CssClass="contenido_con_busqueda" Visible="True">
                    <asp:LinkButton ID="boton_regresar" runat="server" ToolTip="Regresar a la pagina principal"
                        Style="text-decoration: none" OnClick="boton_regresar_Click" CssClass="boton-regresar"
                        Visible="True"><i class="fa fa-reply"></i>
                    </asp:LinkButton>
                    <div class="espacio-small">
                    </div>
                    <asp:Panel ID="filtros_busqueda" runat="server" Visible="False">
                        <asp:Panel ID="marcas" runat="server" Visible="True">
                            <p class="negritas">
                                Marca</p>
                        </asp:Panel>
                        <div class="linea">
                        </div>
                        <asp:Panel ID="opciones_precios" runat="server" Visible="True">
                            <ul class="opcion-filtrado">
                                <li class="negritas">Precio</li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_a" runat="server" Text="$50-$100" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_b" runat="server" Text="$100-$200" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_c" runat="server" Text="$200-$250" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_d" runat="server" Text="$250-$500" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_e" runat="server" Text="$500-$600" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_f" runat="server" Text="$600-$800" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_g" runat="server" Text="$800-$1200" GroupName="opciones" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="precio_h" runat="server" Text="Todos" GroupName="opciones" /></li>
                            </ul>
                        </asp:Panel>
                        <asp:Panel ID="recojer" runat="server" Visible="True">
                            <div class="linea">
                            </div>
                            <ul class="opcion-filtrado">
                                <li class="negritas">Disponibilidad</li>
                                <li class="opciones">
                                    <asp:RadioButton ID="tienda" runat="server" Text="Tienda" GroupName="opciones-2" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="online" runat="server" Text="Online" GroupName="opciones-2" /></li>
                                <li class="opciones">
                                    <asp:RadioButton ID="ambos" runat="server" Text="Todos" GroupName="opciones-2" /></li>
                            </ul>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="elementos_busqueda" runat="server" Visible="False">
                    </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="panel_no_resultados" runat="server" Visible="False">
                <img id="imagen_no_resultados" src="img/no_resultados.png">
                <p id="texto_sin_resultados">No hay resultados</p>
                </asp:Panel>
                <asp:LinkButton ID="boton_oculto_buscar" runat="server" OnClick="boton_oculto_buscar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_carrito" runat="server" OnClick="boton_oculto_carrito_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_mi_cuenta" runat="server" OnClick="boton_oculto_mi_cuenta_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_detalles_producto" runat="server" OnClick="boton_oculto_detalles_producto_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                    display: none">
                    <asp:Label ID="loading" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>
