<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/detalles_producto.aspx.cs" Inherits="detalles_producto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script type="text/javascript">
    function carrito_vacio() {
        alert('El carrito de compra esta vacio');
    }
    function busqueda_vacia() {
        alert('Introduce un criterio de busqueda');
    }
    function pulsar_mas_relacionado(boton) {
        var recibir_casilla, cantidad, recibir_casilla;
        recibir_casilla = document.getElementById("cantidad_producto_detalle");
        cantidad = parseInt(recibir_casilla.value);
        if (cantidad < 999) {
            cantidad = cantidad + 1;
            document.getElementById("cantidad_producto_detalle").value = cantidad;
        }
        return false;
    }
    function pulsar_menos_relacionado(boton) {
        var recibir_casilla, cantidad, recibir_casilla;
        recibir_casilla = document.getElementById("cantidad_producto_detalle");
        cantidad = parseInt(recibir_casilla.value);
        if (cantidad > 1) {
            cantidad = cantidad - 1;
            document.getElementById("cantidad_producto_detalle").value = cantidad;
        }
        return false;
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'carrito') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_carrito');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'perfil') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_configuracion_perfil');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'cambiar_password') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_cambiar_password');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'cambiar_metodo_pago') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_cambiar_metodo_pago');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_login') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_iniciar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'mi_cuenta') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_mi_cuenta');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'direcciones') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_direcciones_envio');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'historial_ordenes') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_historial');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_volver_ordenes') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_volver_ordenes');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_agregar_producto') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_agregar_producto_carrito');
                boton.click();
            }, 600);
        }
        if (boton.toString().match(/boton_detalles/g)) {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_detalles_orden_online');
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
    function producto_agregado_carrito() {
        alert('El producto fue agregado al carrito exitosamente');
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
            return false;
        });
        $('#categorias_cerrar').click(function () {
            $('#menu').css('display', 'none');
            $('#panel_categorias').css('visibility', 'hidden');
            $('#panel_categorias').css('width', '0%');
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
            return false;
        });
        $('#menu_cerrar').click(function () {
            $('#menu').css('display', 'none');
            $('#panel_categorias').css('visibility', 'hidden');
            $('#panel_categorias').css('width', '0%');
            $('#panel_categorias').css('height', '800px');
            $('#pagina').css('display', 'inline');
            $(window).scrollTop(0);
            return false;
        });
        $('#adelante').click(function () {
            $(".panel_compatibles").scrollLeft($(".panel_compatibles").scrollLeft() + 200);
            return false;
        });
        $('#atras').click(function () {
            $(".panel_compatibles").scrollLeft($(".panel_compatibles").scrollLeft() - 200);
            return false;
        });
        $('#adelante').mousedown(function () {
            click_presionado = true;
            identificador = $(this).attr("id");
            if (click_presionado) {
                timeout = setInterval(function () {
                    $(".panel_compatibles").scrollLeft($(".panel_compatibles").scrollLeft() + 200);
                }, 100);
            }
            return false;
        });
        $('#adelante').mouseup(function () {
            click_presionado = false;
            clearInterval(timeout);
            return false;
        });
        $('#atras').mousedown(function () {
            click_presionado = true;
            identificador = $(this).attr("id");
            if (click_presionado) {
                timeout = setInterval(function () {
                    $(".panel_compatibles").scrollLeft($(".panel_compatibles").scrollLeft() - 200);
                }, 100);
            }
            return false;
        });
        $('#atras').mouseup(function () {
            click_presionado = false;
            clearInterval(timeout);
            return false;
        });
    }
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
    }
    function scroll() {
        $(window).scrollTop(0);
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head" runat="server">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title></title>
    <link href="css/detalles_producto.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <script src="js/jquery-1.11.3.js" type="text/javascript"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
</head>
<body>
    <form id="formulario_ventas" runat="server" class="formulario">
        <asp:ScriptManager ID="ScriptManager" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <!--SECCION BARRA SUPERIOR DE SISTEMA-->
                <div class="menu">
                    <a href="ventas.aspx">
                        <img id="logotipo" class="logo_grande" src="img/logo.png"></a>
                    <a href="ventas.aspx">
                        <img id="logo-chico" class="logo_chico" src="img/logo-ink.png"></a>
                    <asp:TextBox ID="buscar" placeholder="Qué producto necesito el dia de hoy?" runat="server" CssClass="buscar"></asp:TextBox>
                    <asp:LinkButton ID="boton_buscar" runat="server" CssClass="boton_buscar" OnClick="boton_busqueda_Click" ToolTip="Haz click para realizar tu busqueda...">Buscar</asp:LinkButton>
                    <asp:LinkButton ID="boton_menu" runat="server" CssClass="boton_menu" ToolTip="Haz click aqui para ver las categorias de busqueda" Visible="True"><i class="fa fa-navicon fa-2x"></i></asp:LinkButton>
                    <asp:LinkButton ID="mi_cuenta" runat="server" CssClass="cuenta" ToolTip="Ingresa a tu cuenta" OnClick="boton_mi_cuenta_Click">Mi cuenta</asp:LinkButton>


                    <asp:LinkButton ID="cerrar_sesion" runat="server" CssClass="cerrar_sesion" ToolTip="Cerrar Sesion" OnClick="boton_cerrar_sesion_Click"><i class="fa fa-lock"></i></asp:LinkButton>

                    <asp:LinkButton ID="carrito" runat="server" CssClass="carrito" ToolTip="Ingresar a tu carrito de compra" OnClick="boton_carrito_Click"><i class="fa fa-shopping-cart fa-2x"></i></asp:LinkButton>

                    <div id="carrito_espacio">
                        <asp:Label ID="cantidad_articulos" runat="server" Text="0" Visible="false" CssClass="cantidad_articulos mostrar_cantidad"></asp:Label>

                    </div>
                    <asp:Label ID="cantidad" CssClass="cantidad" Visible="false" runat="server" Text="0 Productos - "></asp:Label>
                    <asp:Label ID="precio" CssClass="precio" Visible="false" runat="server" Text=" $0.00"></asp:Label>
                </div>
                <div class="menu_falso">
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

                <div class="panel_titulo_producto">
                    <div class="titulos_producto">
                        <ul class="titulos">
                            <li>
                                <asp:Label ID="descripcion_detalle_producto" CssClass="titulo_producto" runat="server" Text=""></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="modelo" CssClass="modelo" runat="server" Text="">T34S32000</asp:Label>
                            </li>
                        </ul>
                    </div>
                    <div class="titulos_oferta">
                        <div class="oferta">
                            <div class="a">
                                <asp:Label ID="a_texto" CssClass="a_texto" runat="server" Text="">Tiempo de Oferta</asp:Label>

                            </div>
                            <div class="b">
                                <asp:Label ID="b_texto" CssClass="b_texto" runat="server" Text="">DIAS</asp:Label>
                                <asp:Label ID="b_valor" CssClass="b_valor" runat="server" Text="">10</asp:Label>
                            </div>
                            <div class="c">
                                <asp:Label ID="c_texto" CssClass="b_texto" runat="server" Text="">HRS</asp:Label>
                                <asp:Label ID="c_valor" CssClass="b_valor" runat="server" Text="">12</asp:Label>
                            </div>
                            <div class="d">
                                <asp:Label ID="d_texto" CssClass="b_texto" runat="server" Text="">MIN</asp:Label>
                                <asp:Label ID="d_valor" CssClass="b_valor" runat="server" Text="">08</asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel_datos_producto">
                    <div class="izquierdo">
                        <asp:Image ID="fotografia_detalle_producto" CssClass="fotografia_producto" runat="server" />
                    </div>
                    <div class="central">
                        <div class="titulo_descripciones">
                            <asp:Label ID="t_descripciones" CssClass="titulo_producto_descripcion" runat="server" Text="">Descripción breve</asp:Label>
                        </div>
                        <div class="descripciones">
                            <div class="descripcion_a">
                                <ul class="descripcion_breve_lista">
                                    <li>
                                        <asp:Label ID="spec_1" CssClass="spec_texto" runat="server" Text="">Color</asp:Label></li>
                                    <li>
                                        <asp:Label ID="spec_2" CssClass="spec_texto" runat="server" Text="">Producción</asp:Label></li>
                                    <li>
                                        <asp:Label ID="spec_3" CssClass="spec_texto" runat="server" Text="">Cantidad</asp:Label></li>
                                    <li>
                                        <asp:Label ID="spec_4" CssClass="spec_texto" runat="server" Text="">Producto</asp:Label></li>
                                </ul>
                            </div>
                            <div class="descripcion_b">
                                <ul class="descripcion_breve_lista">
                                    <li class="bullet">
                                        <asp:Label ID="Label1" CssClass="spec_texto" runat="server" Text="">Negro</asp:Label></li>
                                    <li class="bullet">
                                        <asp:Label ID="Label2" CssClass="spec_texto" runat="server" Text="">1600 paginas</asp:Label></li>
                                    <li class="bullet">
                                        <asp:Label ID="Label3" CssClass="spec_texto" runat="server" Text="">1</asp:Label></li>
                                    <li class="bullet">
                                        <asp:Label ID="Label4" CssClass="spec_texto" runat="server" Text="">LaserJet Pro M1132, LaserJet Pro M1212nf,LaserJet Pro M1212nfw,LaserJet Pro P1102</asp:Label></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="derecho">
                        <div class="panel_precio_producto">
                            <asp:Label ID="precio_producto" runat="server" CssClass="precio_producto" Text="0.00"></asp:Label>
                            <div class="panel_iva">
                                <asp:Label ID="x" CssClass="titulo_producto x" runat="server" Text="">incluye</asp:Label>
                                <asp:Label ID="y" CssClass="titulo_producto y" runat="server" Text="">IVA</asp:Label>
                            </div>
                        </div>
                        <div class="panel_envio">
                            <asp:Label ID="envio" CssClass="titulo_producto_descripcion" runat="server" Text="">Costo de envío $99.00</asp:Label>
                        </div>
                        <div class="panel_cantidad">
                            <asp:TextBox ID="cantidad_producto_detalle" Text="1" runat="server" CssClass="cantidad" MaxLength="3" ReadOnly="False" Enabled="False"></asp:TextBox>
                            <asp:LinkButton ID="boton_aumentar_cantidad" runat="server" CssClass="aumentar" ToolTip="Aumentar cantidad de producto"><i class="fa fa-plus"></i></asp:LinkButton>
                            <asp:LinkButton ID="boton_disminuir_cantidad" runat="server" CssClass="disminuir" ToolTip="Disminuir cantidad de producto"><i class="fa fa-minus"></i></asp:LinkButton>
                            <asp:LinkButton ID="boton_agregar_producto" runat="server" CssClass="agregar" ToolTip="Agregar producto al carrito de compra" OnClick="boton_agregar_producto_carrito_Click">Agregar a carrito</asp:LinkButton>
                        </div>
                        <div class="panel_envio">
                            <asp:Label ID="entrega" CssClass="titulo_producto_descripcion" runat="server" Text="">Tiempo de entrega&nbsp;<i class="fa fa-question-circle"></i></asp:Label>
                        </div>
                        <div class="panel_disponibilidad">
                            <asp:Label ID="disponibilidad" CssClass="titulo_disponibilidad" runat="server" Text="">Disponibilidad: 120</asp:Label>
                        </div>
                    </div>
                </div>

                <div class="panel_compatibilidad">
                    <div class="panel_titulo_compatibles">
                        <asp:Label ID="e_compatibles" CssClass="titulo_compatibles" runat="server" Text="">Compatibles</asp:Label>
                    </div>
                    <asp:LinkButton ID="atras" runat="server" CssClass="atras"><i class="fa fa-chevron-left"></i></asp:LinkButton>
                    <asp:LinkButton ID="adelante" runat="server" CssClass="adelante"><i class="fa fa-chevron-right"></i></asp:LinkButton>
                    <div runat="server" id="panel_compatibles" class="panel_compatibles">
                    </div>
                </div>

                <div class="panel_descripcion_producto">
                    <div class="panel_titulo_informacion">
                        <asp:Label ID="titulo_informacion" CssClass="titulo_informacion" runat="server">Información del producto</asp:Label>
                    </div>
                    <div id="panel_informacion" class="panel_informacion">
                        <asp:Label ID="informacion" runat="server" CssClass="informacion">Imprima más y ahorre más. Los cartuchos de Tinta Canon 145XL originales ofrecen calidad de la impresión profesional brindando un mejor valor que los cartuchos compatibles o genericos. Manténgase productivo y reduzca el tiempo de impresión</asp:Label>
                    </div>
                </div>




                <asp:Panel ID="panel_controles_producto" runat="server" Visible="True">


                    <asp:LinkButton ID="boton_fantasma_agregar_producto_carrito" runat="server" Style="text-decoration: none; visibility: hidden"><i class="fa fa-circle-o-notch"></i></asp:LinkButton>

                </asp:Panel>

                <asp:Panel ID="panel_relaciones_compatibilidades" runat="server" Visible="True">
                    <asp:Panel ID="panel_articulos_relacionados" runat="server" Visible="True">
                    </asp:Panel>
                </asp:Panel>



                <asp:LinkButton ID="boton_oculto_buscar" runat="server" OnClick="boton_oculto_buscar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_carrito" runat="server" OnClick="boton_oculto_carrito_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_mi_cuenta" runat="server" OnClick="boton_oculto_mi_cuenta_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_volver_ordenes" runat="server" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_detalles_producto" runat="server" OnClick="boton_oculto_detalles_producto_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_direcciones_envio" runat="server" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_agregar_producto_carrito" runat="server" OnClick="boton_oculto_agregar_producto_carrito_Click" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_historial" runat="server" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_configuracion_perfil" runat="server" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_cambiar_password" runat="server" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_cambiar_metodo_pago" runat="server" Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>

            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
