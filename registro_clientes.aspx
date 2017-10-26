<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/registro_clientes.aspx.cs" Inherits="registro_clientes" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    function carrito_vacio() 
    {
        alert('El carrito de compra esta vacio');
    }
    function password_no_coinciden() 
    {
        alert('Los password no coinciden verificar su informacion');
    }
    function correo_invalido() 
    {
        alert('Error el correo no es valido verificar');
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
    }
    function usuario_existente()
    {
        alert('Error cliente existente verifique el usuario ingresado');
    }
    function cliente_registrado() 
    {
        alert('El Cliente fue registrado exitosamente');
    }
    function cliente_existente() 
    {
        alert('Error cliente existente en sistema');
    }
    function busqueda_vacia() 
    {
        alert('Introduce un criterio de busqueda');
    }
    function cargar(boton) 
    {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'carrito') 
        {
            setTimeout(function () 
            {
                var boton = document.getElementById('boton_oculto_carrito');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_buscar') 
        {
            setTimeout(function () 
            {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_login') 
        {
            setTimeout(function () 
            {
                var boton = document.getElementById('boton_oculto_iniciar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'mi_cuenta') 
        {
            setTimeout(function () 
            {
                var boton = document.getElementById('boton_oculto_mi_cuenta');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_guardar') 
        {
            setTimeout(function () 
            {
                var boton = document.getElementById('boton_oculto_guardar');
                boton.click();
            }, 1000);
        }
    }
    function pageLoad() {
        $('#categorias').click(function () 
        {
            $('#panel_categorias').css('visibility', 'visible');
            $('#panel_categorias').css('width', '100%');
            if (document.getElementById("panel_categorias").style.visibility == "visible") 
            {
                setTimeout(function () 
                {
                    $('#menu').css('display', 'inline');
                }, 500);
            }
            document.getElementById("<%= categorias_cerrar.ClientID %>").style.display = "inline";
            document.getElementById("<%= categorias.ClientID %>").style.display = "none";
            return false;
        });
        $('#categorias_cerrar').click(function () 
        {
            $('#menu').css('display', 'none');
            $('#panel_categorias').css('visibility', 'hidden');
            $('#panel_categorias').css('width', '0%');
            document.getElementById("<%= categorias.ClientID %>").style.display = "inline";
            document.getElementById("<%= categorias_cerrar.ClientID %>").style.display = "none";
            return false;
        });
        $('#menu_opciones').click(function () 
        {
            $(window).scrollTop(0);
            $('#panel_categorias').css('visibility', 'visible');
            $('#panel_categorias').css('width', '100%');
            $('#panel_categorias').css('height', '800px');
            if (document.getElementById("panel_categorias").style.visibility == "visible") 
            {
                setTimeout(function () 
                {
                    $('#menu').css('display', 'inline');
                    $('#pagina').css('display', 'none');
                }, 500);
            }
            document.getElementById("<%= menu_cerrar.ClientID %>").style.display = "inline";
            document.getElementById("<%= menu_opciones.ClientID %>").style.display = "none";
            return false;
        });
        $('#menu_cerrar').click(function () 
        {
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
    }
    function verificar_enter(e) 
    {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) 
        {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
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
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
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

                <!--SECCION REGISTRO DE NUEVO CLIENTE-->
                <asp:Panel ID="registro" runat="server" Visible="True">
                    <ul class="registrando">
                        <li class="centro">
                            <div class="circulo mi-cuenta">
                                <i class="fa fa-pencil fa-3x abajo"></i>
                            </div>
                        </li>
                        <li class="centro"><a class="texto-small mejorado">Porfavor completa la siguiente informacion:</a></li>
                    </ul>
                    <div class="espacio-small">
                    </div>
                    <div id="j">
                        <p>
                            <asp:Label ID="nombre" runat="server">Nombre</asp:Label></p>
                        <asp:TextBox ID="caja_nombre" runat="server" CssClass="cajas-registro" Style="text-transform: uppercase"
                            MaxLength="200"></asp:TextBox>
                        <p>
                            <asp:Label ID="telefono" runat="server">Telefono</asp:Label></p>
                        <asp:TextBox ID="caja_telefono" runat="server" CssClass="cajas-registro" MaxLength="30"></asp:TextBox>
                        <p>
                            <asp:Label ID="calle" runat="server">Calle</asp:Label></p>
                        <asp:TextBox ID="caja_calle" runat="server" CssClass="cajas-registro" Style="text-transform: uppercase"
                            MaxLength="400"></asp:TextBox>
                        <p>
                            <asp:Label ID="numero_exterior" runat="server" CssClass="texto">Numero exterior</asp:Label></p>
                        <asp:TextBox ID="caja_numero_exterior" runat="server" CssClass="cajas-registro" MaxLength="6"></asp:TextBox>
                        <p>
                            Numero interior</p>
                        <asp:TextBox ID="caja_numero_interior" runat="server" CssClass="cajas-registro" MaxLength="6"
                            Style="text-transform: uppercase"></asp:TextBox>
                        <p>
                            <asp:Label ID="pais" runat="server">Pais</asp:Label></p>
                        <asp:DropDownList ID="lista_paises" runat="server" CssClass="cajas-registro" AutoPostBack="True"
                            OnSelectedIndexChanged="lista_paises_SelectedIndexChanged">
                        </asp:DropDownList>
                        <p>
                            <asp:Label ID="estado" runat="server">Estado</asp:Label></p>
                        <asp:DropDownList ID="lista_estados" runat="server" CssClass="cajas-registro" AutoPostBack="True"
                            Enabled="False" OnSelectedIndexChanged="lista_estados_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div id="k">
                        <p>
                            <asp:Label ID="codigo_postal" runat="server">Codigo postal</asp:Label></p>
                        <asp:DropDownList ID="caja_codigo_postal" runat="server" CssClass="cajas-registro"
                            AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="caja_codigo_postal_SelectedIndexChanged">
                        </asp:DropDownList>
                        <p>
                            <asp:Label ID="municipio" runat="server">Municipio</asp:Label></p>
                        <asp:TextBox ID="caja_municipio" runat="server" CssClass="cajas-registro" Style="text-transform: uppercase"
                            MaxLength="300" Enabled="False"></asp:TextBox>
                        <p>
                            <asp:Label ID="colonia" runat="server">Colonia</asp:Label></p>
                        <asp:DropDownList ID="lista_colonias" runat="server" CssClass="cajas-registro" AutoPostBack="True"
                            Enabled="False" OnSelectedIndexChanged="lista_colonias_SelectedIndexChanged">
                        </asp:DropDownList>
                        <p>
                            <asp:Label ID="correo" runat="server">Usuario (Correo Electronico)</asp:Label></p>
                        <asp:TextBox ID="caja_correo" runat="server" CssClass="cajas-registro" MaxLength="100"></asp:TextBox>
                        <p>
                            <asp:Label ID="password" runat="server">Password</asp:Label></p>
                        <asp:TextBox ID="caja_password" runat="server" CssClass="cajas-registro" Style="text-transform: uppercase"
                            MaxLength="100" TextMode="Password"></asp:TextBox>
                        <p>
                            <asp:Label ID="confirmar_password" runat="server">Confirmar</asp:Label></p>
                        <asp:TextBox ID="caja_confirmar_password" runat="server" CssClass="cajas-registro"
                            Style="text-transform: uppercase" MaxLength="100" TextMode="Password"></asp:TextBox>
                        <div class="espacio">
                        </div>
                        <asp:LinkButton ID="boton_guardar" runat="server" ToolTip="Guardar registro del nuevo cliente"
                            Style="text-decoration: none" OnClick="boton_guardar_Click" CssClass="boton-guardar"
                            OnClientClick="desactivar_boton_guardar();" Enabled="True">Registrar
                        </asp:LinkButton>
                        <asp:LinkButton ID="boton_guardar_fantasma" runat="server" Style="text-decoration: none;
                            display: none" CssClass="boton-guardar" Visible="True">Proceso <i class="fa fa-circle-o-notch fa-spin"></i></asp:LinkButton>
                        <asp:LinkButton ID="boton_cancelar" runat="server" ToolTip="Cancelar el registro"
                            Style="text-decoration: none" OnClick="boton_cancelar_Click" CssClass="boton-cancelar"
                            Visible="True">Cancelar
                        </asp:LinkButton>
                    </div>
                </asp:Panel>
               <asp:LinkButton ID="boton_oculto_guardar" runat="server" OnClick="boton_oculto_guardar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_buscar" runat="server" OnClick="boton_oculto_buscar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_carrito" runat="server" OnClick="boton_oculto_carrito_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_mi_cuenta" runat="server" OnClick="boton_oculto_mi_cuenta_Click"
                    Style="text-decoration: none; display: none"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_iniciar" runat="server" OnClick="boton_oculto_iniciar_Click"
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