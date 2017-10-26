<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/usr-overview.aspx.cs" Inherits="usr_overview" %>
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script type="text/javascript">
    <%  var serializer = new System.Web.Script.Serialization.JavaScriptSerializer();  %>   
    var notificacion_push_objeto,notificacion_sistema;
    Notification.requestPermission();
    function cerrar_notificacion() {
        setTimeout(function () {
            notificacion_push.close;
        }, 2000);
    }
    function notificacion_push(notificacion_sistema) {
        var opciones = {
            body: "crm.inklaser.mx",
            icon: 'img/inklaser.jpeg'
        };
        if (Notification.permission == "granted") {
            notificacion_push_objeto = new Notification(notificacion_sistema, opciones);
            //cerrar_notificacion();
        }
    }
    //grafica total de ventas por vendedor
    var total_ventas_vendedor =  <%= serializer . Serialize (total_ventas_vendedor)  %>;
    var total_ventas =  <%= serializer . Serialize (total_ventas)  %>;
    var vendedor =  <%= serializer . Serialize ( nombre_vendedor_actual )  %>;
    var datos_ventas_totales = new Array();
    datos_ventas_totales =    [{
        value: total_ventas_vendedor,
        color: "#F39C12",
        highlight: "#F39C12",
        label: vendedor},
           {
               value: total_ventas,
               color: "#BDC3C7",
               highlight: "#BDC3C7",
               label: "Total de ventas"}];
    //graficar total de comisiones_vendedor
    var total_comisiones_vendedor =  <%= serializer . Serialize (total_comisiones_vendedor)  %>;
    var total_ventas_comision =  <%= serializer . Serialize (total_ventas_comision)  %>;
    var vendedor_nombre =  <%= serializer . Serialize ( nombre_vendedor_actual )  %>;
    var datos_comisiones_totales = new Array();
    datos_comisiones_totales =    [
     {
         value: total_ventas_comision,
         color: "#BDC3C7",
         highlight: "#BDC3C7",
         label: "Total de ventas"},
    {
        value: total_comisiones_vendedor,
        color: "#2ECC71",
        highlight: "#2ECC71",
        label: vendedor_nombre}
    ];
    //grafica de ventas anuales
    var ventas_anuales =  <%= serializer . Serialize ( ventas_anuales )  %>;
    var ventas_anuales_espejo =  <%= serializer . Serialize ( ventas_anuales_espejo )  %>;
    var datos_anuales = {
        labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
        datasets: [
                                {
                                    label: "My Second dataset",
                                    fillColor: "rgba(118, 68, 138    ,0.8)",
                                    strokeColor: "rgba(118, 68, 138,1)",
                                    pointColor: "rgba(118, 68, 138,0.5)",
                                    pointStrokeColor: "rgba(118, 68, 138,0.5)",
                                    pointHighlightFill: "rgba(118, 68, 138,0.5)",
                                    pointHighlightStroke: "rgba(118, 68, 138,0.5)",
                                    data: ventas_anuales
                                },
                                 {
                                     label: "My Second dataset",
                                     fillColor: "rgba(26, 82, 118  ,0.8)",
                                     strokeColor: "rgba(26, 82, 118  ,0.8)",
                                     pointColor: "rgba(26, 82, 118  ,0.8)",
                                     pointStrokeColor: "rgba(26, 82, 118  ,0.8)",
                                     pointHighlightFill: "rgba(26, 82, 118  ,0.8)",
                                     pointHighlightStroke: "rgba(26, 82, 118  ,0.8)",
                                     data: ventas_anuales_espejo
                                 }
        ]
    }
    var llamadas_clientes=null,llamadas_prospectos=null,cotizaciones=null,editar_usuario=null,edicion_cliente=null,notificaciones=null,alta_requisiciones=null,autorizar_cotizaciones=null,pedidos=null,chat=null,mensajes=null,ordenes_compra=null,ventas_crm=null,requisiciones=null,servicios=null;
    var categorias =  <%= serializer . Serialize ( categorias_buscar)  %>;
    var contadores =  <%= serializer . Serialize ( contadores_modulos)  %>;
    var n_categorias =  <%= serializer . Serialize (elementos_buscar)  %>;
    var modulos =  <%= serializer . Serialize (modulos)  %>;
    var enlaces =  <%= serializer . Serialize (archivo_modulos)  %>;
    var n_modulos =  <%= serializer . Serialize (contador_modulos_categoria)  %>;
    var modulos_abiertos=[];
    modulos_abiertos= new Array();
    var submenus_abiertos=[];
    submenus_abiertos= new Array();
    var i,j;
    function obtener_posicion_scroll_vertical() {
        document.getElementById('scroll_cotizaciones').value = document.getElementById('p_cotizaciones').scrollTop;
        document.getElementById('scroll_requisiciones').value = document.getElementById('p_requisiciones').scrollTop;
        document.getElementById('scroll_ventas').value = document.getElementById('p_ventas').scrollTop;
        document.getElementById('scroll_clientes').value = document.getElementById('p_clientes').scrollTop;
    }
    function restablecer_posicion_scroll_vertical() {
        document.getElementById('p_cotizaciones').scrollTop = document.getElementById('scroll_cotizaciones').value;
        document.getElementById('p_requisiciones').scrollTop = document.getElementById('scroll_requisiciones').value;
        document.getElementById('p_ventas').scrollTop = document.getElementById('scroll_ventas').value;
        document.getElementById('p_clientes').scrollTop = document.getElementById('scroll_clientes').value;
    }
    function graficar() {
        var ventas_vendedor = document.getElementById("grafica_ventas_vendedor").getContext("2d");
        window.vendedor = new Chart(ventas_vendedor).Doughnut(datos_ventas_totales, {
            responsive: true, tooltipFontColor: "rgba(0, 0, 0, 0.0)", tooltipFillColor: "rgba(0,0,0,0.0)"
        });
        var comisiones_vendedor = document.getElementById("grafica_comisiones_vendedor").getContext("2d");
        window.comision_vendedor = new Chart(comisiones_vendedor).Pie(datos_comisiones_totales, {
            responsive: true, tooltipFontColor: "rgba(0, 0, 0, 0.0)", tooltipFillColor: "rgba(0,0,0,0.0)"
        });
        var ventas_anuales = document.getElementById("grafica_ventas_anuales").getContext("2d");
        window.ventas_anuales_grafica = new Chart(ventas_anuales).Line(datos_anuales, {
            responsive: true
        });
    }
    window.onload = function()
    {
        graficar();
        menu = 0,submenu=0,notificaciones=0;
        for(i=0;i<n_categorias;i++)
        {
            submenus_abiertos[i]=0;
        }
        var size = '<%= Session["size_categorias"] %>';
        var t;
        size = (size * 30);
        t = size.toString() + 'px';
        $('#boton_notificaciones').click(function () {
            switch (notificaciones) {
                case 0:
                    $('#notificaciones').css('visibility', 'visible');
                    $('#notificaciones').css('height', '400px');
                    if (document.getElementById("notificaciones").style.visibility == "visible") {
                        setTimeout(function () {
                            $('#panel_notificaciones').css('display', 'inline-block');
                        }, 200);
                    }
                    notificaciones = 1;
                    break;
                case 1:
                    //  $(window).scrollTop(0);
                    $('#panel_notificaciones').css('display', 'none');
                    $('#notificaciones').css('height', '0px');
                    $('#notificaciones').css('visibility', 'hidden');
                    notificaciones = 0;
                    break;
            }
            return false;
        });
        $('#menu_moviles').click(function () {
            switch (menu) {
                case 0:
                    $('#submenu').css('visibility', 'visible');
                    $('#submenu').css('height', t);
                    if (document.getElementById("submenu").style.visibility == "visible") {
                        setTimeout(function () {
                            $('#elementos').css('display', 'inline');
                        }, 200);
                    }
                    menu = 1;
                    break;
                case 1:
                    //  $(window).scrollTop(0);
                    $('#elementos').css('display', 'none');
                    $('#submenu').css('height', '0px');
                    $('#submenu').css('visibility', 'hidden');
                    menu = 0;
                    break;
            }
            return false;
        });
        $('.elementos_menu_categorias').click(function () {
            var valor, categoria = $(this).attr("id");
            valor = "#" + categoria + "-menu";
            //  $(valor).css('display', 'inline');
            //$("elementos_menu").find(valor).css("display", "inline");
            for(i=0; i<n_categorias; i++)
            {
                var size_categoria = contadores[i];
                size_categoria = (size_categoria * 50);
                var h;
                h = size_categoria.toString() + 'px';
                switch(submenus_abiertos[i])
                {
                    case 0:
                        if(valor == categorias[i])
                        {
                            $(categorias[i]).css('visibility', 'visible');
                            $("#"+i.toString()).attr('class', 'fa fa-caret-square-o-up iconos_botones rojo');
                            $(categorias[i]).css('height', h);
                            submenus_abiertos[i]=1;
                            setTimeout(function () {
                                $(valor+"-contenido").css('display', 'inline');
                            },200);
                        }
                        for(j=0;j<n_categorias;j++)
                        {
                            if(valor != categorias[j])
                            {
                                $("#"+j.toString()).attr('class', 'fa fa-caret-square-o-down iconos_botones');
                                $(categorias[i]+"-contenido").css('display', 'none');
                                $(categorias[j]).css('visibility', 'hidden');
                                $(categorias[j]).css('height', '0px');
                                submenus_abiertos[j]=0;
                            }
                        }

                        break;
                    case 1:
                        for(j=0;j<n_categorias;j++)
                        {
                            $("#"+j.toString()).attr('class', 'fa fa-caret-square-o-down iconos_botones');
                            $(valor+"-contenido").css('display', 'none');
                            $(categorias[j]).css('visibility', 'hidden');
                            $(categorias[j]).css('height', '0px');
                            submenus_abiertos[j]=0;
                                                      
                        }
                        break;
                } 
                                                          
            }
            return false;
        });
        $('.elementos_menu_categorias_modulo').click(function () {
            var valor, modulo = $(this).attr("id");
            valor="#"+modulo;
            for(i=0; i<n_modulos; i++)
            {
                if(valor == "#"+modulos[i])
                {

                    if (!modulos_abiertos[i] || modulos_abiertos[i].closed) 
                    {
                        modulos_abiertos[i] = window.open(enlaces[i],modulos[i], "width=1000, height=800,scrollbars = yes,resizable = false");
                        // modulos_abiertos[i]=window.hide();
                    }
                    else 
                    {
                        modulos_abiertos[i].focus();
                    }
                                       
                }
            }
            for(j=0;j<n_categorias;j++)
            {
                $("#"+j.toString()).attr('class', 'iconos_botones');
                $(valor+"-contenido").css('display', 'none');
                $(categorias[j]).css('visibility', 'hidden');
                $(categorias[j]).css('height', '0px');
                submenus_abiertos[j]=0;
                                                      
            }
            return false;
        });
    }
    function pageLoad() {
        if (document.getElementById("notificaciones").style.visibility == "hidden") {
            notificaciones=0;
        }
        restablecer_posicion_scroll_vertical();
    }
    function abrir_cotizaciones() {
        if (!cotizaciones || cotizaciones.closed) {
            cotizaciones = window.open("editar_cotizacion.aspx", "Cotizaciones", "width=1350, height=700,titlebar=no,toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no");
        }
        else {
            cotizaciones.focus();
        }
    }
    function abrir_editar_usuario() {
        if (!editar_usuario || editar_usuario.closed) {
            editar_usuario = window.open("editar_usuario.aspx", "Editar usuario", "width=1500, height=700,scrollbars = yes,resizable = false");
        }
        else {
            editar_usuario.focus();
        }
    }
    function abrir_notificaciones() {
         
        if (!notificaciones || notificaciones.closed) {
                   
            notificaciones = window.open("notificaciones.aspx", "Notificaciones", "width=100, height=100,scrollbars = yes,resizable = false");
            // notificaciones.close();
        }
        else {
            notificaciones.focus();                    
        }         
    }
    function abrir_llamadas_prospectos() {        
        if (!llamadas_prospectos || llamadas_prospectos.closed) {            
            llamadas_prospectos = window.open("prospectos.aspx", "Llamadas prospectos", "width=1500, height=900,scrollbars = yes,resizable = false");
            // notificaciones.close();
        }
        else {
            llamadas_prospectos.focus();                    
        }         
    }
    function abrir_llamadas_clientes() {        
        if (!llamadas_clientes || llamadas_clientes.closed) {                  
            llamadas_clientes = window.open("editar_cliente.aspx", "Llamadas clientes", "width=1500, height=900,scrollbars = yes,resizable = false");
            // notificaciones.close();
        }
        else {
            llamadas_clientes.focus();                    
        }         
    }
    function abrir_autorizacion_cotizaciones() {
        if (!autorizar_cotizaciones || autorizar_cotizaciones.closed) {
            autorizar_cotizaciones = window.open("autorizar_cotizaciones.aspx", "Autorizar cotizaciones", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            autorizar_cotizaciones.focus();
        }
    }
    function abrir_ordenes_compra() {
        if (!ordenes_compra || ordenes_compra.closed) {
            ordenes_compra = window.open("ordenes_compra.aspx", "Ordenes de compra", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            ordenes_compra.focus();
        }
    }
    function abrir_pedidos() {
        if (!pedidos || pedidos.closed) {
            pedidos = window.open("pedidos.aspx", "Pedidos", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            pedidos.focus();
        }
    }
    function abrir_chat() {
        if (!chat || chat.closed) {
            chat = window.open("chat.aspx", "Chat", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            pedidos.focus();
        }
    }
    function abrir_servicios() {
        if (!servicios || servicios.closed) {
            servicios = window.open("ordenes_servicio.aspx", "Servicios", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            servicios.focus();
        }
    }
    function abrir_mensajes() {
        if (!mensajes || mensajes.closed) {
            mensajes = window.open("mensajes.aspx", "Mensajes", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            mensajes.focus();
        }
    }
    function abrir_requisiciones() {
        if (!requisiciones || requisiciones.closed) {
            requisiciones = window.open("requisiciones.aspx", "Requisiciones", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            requisiciones.focus();
        }
    }
    function abrir_ventas_crm() {
        if (!ventas_crm || ventas_crm.closed) {
            ventas_crm = window.open("ventas_crm.aspx", "Ventas CRM", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            ventas_crm.focus();
        }
    }
    function abrir_alta_requisiciones() {
        if (!alta_requisiciones || alta_requisiciones.closed) {
            alta_requisiciones = window.open("alta_requisiciones.aspx", "Alta requisiciones", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            alta_requisiciones.focus();
        }
    }
    function abrir_editar_clientes() {
        if (!edicion_cliente || edicion_cliente.closed) {
            edicion_cliente = window.open("editar_cliente.aspx", "Editar cliente", "width=1500, height=900,scrollbars = yes,resizable = false");
        }
        else {
            edicion_cliente.focus();
        }
    }
    function cotizacion_agregada() {
        alert('La cotizacion fue agregada con exito');
        catalogo = window.open("about:blank", "Catalogo");
        catalogo.close();
    }
    function cliente_agregado() {
        alert('El cliente fue agregado exitosamente');
        alta_clientes = window.open("about:blank", "Alta de clientes");
        alta_clientes.close();
    }
    function cotizacion_terminada() {
        alert('La cotizacion fue aprobada con exito');
        cotizaciones = window.open("about:blank", "Cotizaciones");
        cotizaciones.close();
    }
    function proveedor_agregado() {
        alert('Proveedor agregado con exito');
        alta_proveedores = window.open("about:blank", "Alta de proveedores");
        alta_proveedores.close();
    }
    function venta_agregada() {
        alert('Venta agregada con exito');
    }       
    var contador = 1;  
    var mouse = false, keyboard = false;
    $(function() 
    { 
            
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };
        setInterval(actualizacion, 1000);
    });
    function actualizacion() 
    {                
        if (!mouse && !keyboard) 
        {            
        }
        else 
        {
            mouse = false;
            keyboard = false;
            document.getElementById('caja_contador').value = '0';
        }
    }              
    function notificacion() {
        var objeto_sonido = null;
        if (objeto_sonido != null) {
            document.body.removeChild(objeto_sonido);
            objeto_sonido.removed = true;
            objeto_sonido = null;
        }
        objeto_sonido = document.createElement("embed");
        objeto_sonido.setAttribute("src", "sonidos/notificacion.wav");
        objeto_sonido.setAttribute("hidden", true);
        objeto_sonido.setAttribute("autostart", true);
        document.body.appendChild(objeto_sonido);
    }
    function alarma() {
        var objeto_sound = null;
        if (objeto_sound != null) {
            document.body.removeChild(objeto_sound);
            objeto_sound.removed = true;
            objeto_sound = null;
        }
        objeto_sound = document.createElement("embed");
        objeto_sound.setAttribute("src", "sonidos/alarma.wav");
        objeto_sound.setAttribute("hidden", true);
        objeto_sound.setAttribute("autostart", true);
    }
    function cerrar_ventanas() {
        for(i=0; i<n_modulos; i++)
        {
            if(modulos_abiertos[i] && !modulos_abiertos[i].closed)
            {
                modulos_abiertos[i]=window.open("about:blank",modulos[i]);
                modulos_abiertos[i].close();
            }
        }
        if (editar_usuario && !editar_usuario.closed) {
            editar_usuario = window.open("about:blank", "Editar usuario");
            editar_usuario.close();
        }
        if (notificaciones && !notificaciones.closed) {
            notificaciones = window.open("about:blank", "Notificaciones");
            notificaciones.close();
        }
        if (edicion_cliente && !edicion_cliente.closed) {
            edicion_cliente = window.open("about:blank", "Editar cliente");
            edicion_cliente.close();
        }
        if (cotizaciones && !cotizaciones.closed) {
            cotizaciones = window.open("about:blank", "Cotizaciones");
            cotizaciones.close();
        }
        if (alta_requisiciones && !alta_requisiciones.closed) {
            alta_requisiciones = window.open("about:blank", "Alta requisiciones");
            alta_requisiciones.close();
        }
        if (requisiciones && !requisiciones.closed) {
            requisiciones = window.open("about:blank", "Requisiciones");
            requisiciones.close();
        }
        if (mensajes && !mensajes.closed) {
            mensajes = window.open("about:blank", "Mensajes");
            mensajes.close();
        }
        if (chat && !chat.closed) {
            chat = window.open("about:blank", "Chat");
            chat.close();
        }
        if (ordenes_compra && !ordenes_compra.closed) {
            ordenes_compra = window.open("about:blank", "Ordenes de compra");
            ordenes_compra.close();
        }
        if (ventas_crm && !ventas_crm.closed) {
            ventas_crm = window.open("about:blank", "Ventas CRM");
            ventas_crm.close();
        }
        if (pedidos && !pedidos.closed) {
            pedidos = window.open("about:blank", "Pedidos");
            pedidos.close();
        }
        if (autorizar_cotizaciones && !autorizar_cotizaciones.closed) {
            autorizar_cotizaciones = window.open("about:blank", "Autorizar cotizaciones");
            autorizar_cotizaciones.close();
        }
        if (servicios && !servicios.closed) {
            servicios = window.open("about:blank", "Servicios");
            servicios.close();
        }
        if (llamadas_clientes && !llamadas_clientes.closed) {
            llamadas_clientes = window.open("about:blank", "Llamadas clientes");
            llamadas_clientes.close();
        }
        if (llamadas_prospectos && !llamadas_prospectos.closed) {
            llamadas_prospectos = window.open("about:blank", "Llamadas prospectos");
            llamadas_prospectos.close();
        }
        document.location.href = "logout.aspx";
    }
    function cotizacion_privada() {
        alert('Error esta cotizacion pertenece a otro grupo imposible acceder a ella');
    }
    function requisicion_privada() {
        alert('Error esta requisicion pertenece a otro grupo imposible acceder a ella');
    }
    function cotizacion_privada_sucursal() {
        alert('Error esta cotizacion pertenece a otra sucursal imposible acceder a ella');
    }
    function requisicion_privada_sucursal() {
        alert('Error esta requisicion pertenece a otra sucursal imposible acceder a ella');
    }
    function cliente_modificado() {
        alert('Cliente modificado exitosamente');
    }
    window.onbeforeunload = salida;
    function salida() {
        var proceso = 0;
        if (proceso == 0) {
            cerrar_ventanas();
            proceso = 1;
        }
        var botonsito = document.getElementById('boton_cerrar_ventana');
        botonsito.click();
    }  
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Relationship Management - Inklaser</title>
    <link rel="stylesheet" href="css/overview.css" />
    <script type="text/javascript" src="js/Chart.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="formulario_principal" runat="server">
        <input type="hidden" id="scroll_cotizaciones" runat="server" />
        <input type="hidden" id="scroll_requisiciones" runat="server" />
        <input type="hidden" id="scroll_ventas" runat="server" />
        <input type="hidden" id="scroll_clientes" runat="server" />
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <div class="estatica-arriba">
            <div class="izquierdo_logo">
                <img alt="" class="logo-crm-modificado" src="img/logo.png" />
                <img alt="" class="logo-crm-modificado-mobile" src="img/inklaser.jpeg" />
            </div>
            <asp:LinkButton ID="menu_moviles" runat="server" ToolTip="Mostrar menu"><i class="fa fa-bars"></i></asp:LinkButton>
            <div class="imagen_user">
                <asp:Image ID="imagen_usuario" runat="server" CssClass="imagen_usuario" />
            </div>
            <asp:Label ID="icono_usuario" runat="server" Text="usuario" CssClass="icono_usuario"><i class="fa fa-user"></i></asp:Label>
            <asp:UpdatePanel ID="panel_actualizacion_cotizar" runat="server" RenderMode="Inline"
                UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:LinkButton ID="usuario" Text="usuario" OnClick="mi_perfil_Click" runat="server"
                        ToolTip="Mi perfil" CssClass="nombre_usuario tipo_texto"></asp:LinkButton>
                    <asp:Panel ID="panel_cotizar" runat="server" CssClass="cotiza-button">
                        <asp:LinkButton ID="boton_cotizacion" runat="server" OnClick="cotizar_Click" ToolTip="Realizar una cotizacion"><i class="fa fa-plus"></i></asp:LinkButton>
                    </asp:Panel>
                    <asp:Panel ID="panel_cerrar_sesion" runat="server" CssClass="cerrar-sesion-button">
                        <asp:LinkButton ID="boton_cerrar_sesion" runat="server" OnClick="cerrar_sesion_Click"
                            ToolTip="Cerrar Sesion"><i class="fa fa-power-off blanco"></i></asp:LinkButton>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="boton_cotizacion" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="boton_cerrar_sesion" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="usuario" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:Panel ID="notificaciones_avisos" CssClass="boton_principal notificacion" runat="server">
                <asp:LinkButton ID="boton_notificaciones" runat="server" ToolTip="Mostrar notificaciones"><i class="fa fa-bell-o negro"></i></asp:LinkButton><div
                    class="globo_notificacion globo_rojo">
                    <asp:Label ID="numero_notificaciones" CssClass="texto_globo" runat="server"></asp:Label>
                </div>
            </asp:Panel>
            <asp:UpdatePanel ID="panel_actualizacion_superior" runat="server" RenderMode="Inline"
                UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Panel ID="boton_9" CssClass="boton_principal notificacion_primera"
                        runat="server">
                        <asp:LinkButton ID="boton_cotizaciones" OnClick="autorizacion_cotizaciones_Click"
                            runat="server" ToolTip="Aprobacion de cotizaciones"><i class="fa fa-check-square-o negro"></i></asp:LinkButton><div
                                class="globo_notificacion globo_verde">
                                <asp:Label ID="numero_cotizaciones_autorizacion" CssClass="texto_globo" runat="server"></asp:Label>
                            </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_25" CssClass="boton_principal notificacion" runat="server">
                        <asp:LinkButton ID="boton_servicios" OnClick="servicios_Click" runat="server" ToolTip="Servicios"><i class="fa fa-wrench negro"></i></asp:LinkButton><div
                            class="globo_notificacion globo_rojo">
                            <asp:Label ID="numero_servicios" CssClass="texto_globo" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_17" CssClass="boton_principal notificacion" runat="server">
                        <asp:LinkButton ID="boton_chat" OnClick="chat_Click" runat="server" ToolTip="Chat"><i class="fa fa-comments-o negro"></i></asp:LinkButton><div
                            class="globo_notificacion globo_rojo">
                            <asp:Label ID="numero_mensajes_chat" CssClass="texto_globo" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_18" CssClass="boton_principal notificacion" runat="server">
                        <asp:LinkButton ID="boton_correo" OnClick="mensajes_Click" runat="server" ToolTip="Mi correo personal"><i class="fa fa-envelope-o negro"></i></asp:LinkButton><div
                            class="globo_notificacion globo_rojo">
                            <asp:Label ID="numero_mensajes" CssClass="texto_globo" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_11" CssClass="boton_principal notificacion"
                        runat="server">
                        <asp:LinkButton ID="boton_entrega_pedidos" OnClick="ventas_crm_Click" runat="server"
                            ToolTip="Entrega de pedidos"><i class="fa fa-truck negro"></i></asp:LinkButton><div
                                class="globo_notificacion globo_verde">
                                <asp:Label ID="nu_ventas_crm" CssClass="texto_globo" runat="server"></asp:Label>
                            </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_8" CssClass="boton_principal notificacion"
                        runat="server">
                        <asp:LinkButton ID="boton_ordenes_compra" runat="server" OnClick="ordenes_compra_Click"
                            ToolTip="Ordenes de compra"><i class="fa fa-shopping-cart negro"></i></asp:LinkButton><div
                                class="globo_notificacion globo_verde">
                                <asp:Label ID="numero_ordenes" CssClass="texto_globo" runat="server"></asp:Label>
                            </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_7" CssClass="boton_principal notificacion"
                        runat="server">
                        <asp:LinkButton ID="boton_requisiciones" runat="server" OnClick="requisiciones_Click"
                            ToolTip="Requisiciones"><i class="fa fa-file-text-o negro"></i></asp:LinkButton><div
                                class="globo_notificacion globo_verde">
                                <asp:Label ID="numero_requisiciones" CssClass="texto_globo" runat="server"></asp:Label>
                            </div>
                    </asp:Panel>
                    <asp:Panel ID="boton_10" CssClass="boton_principal notificacion" runat="server">
                        <asp:LinkButton ID="boton_pedidos" runat="server" OnClick="pedidos_Click" ToolTip="Pedidos"><i class="fa fa-cubes negro"></i></asp:LinkButton><div
                            class="globo_notificacion globo_verde">
                            <asp:Label ID="not_numero_pedidos" CssClass="texto_globo" runat="server"></asp:Label>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="actualizar" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
            <div id="notificaciones" class="notificaciones">
                <div class="cabecera_notificaciones">
                    <asp:Label ID="titulo_notificaciones" CssClass="titulo_notificaciones" runat="server"
                        Text="Notificaciones"></asp:Label>
                </div>
                <div class="limitado_notificaciones">
                    <asp:Panel ID="panel_notificaciones" runat="server">
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="pagina">
            <div id="submenu" class="menu_izquierdo">
                <asp:Panel ID="elementos" runat="server">
                </asp:Panel>
            </div>
            <div id="main">
                <div class="avisos">
                    <asp:Label ID="tipo_cambio" CssClass="tipo_cambio" runat="server"></asp:Label>
                </div>
                <div class="contenido_overview">
                    <div class="derecho">
                        <div class="tabulador fondo_blanco">
                            <div class="separador">
                            </div>
                            <div class="limite">
                                <div class="informacion_grafica">
                                    <asp:Panel ID="indicadores_vendedor" runat="server" CssClass="indicador">
                                    </asp:Panel>
                                    <asp:Panel ID="datos_vendedor" runat="server" CssClass="dato">
                                    </asp:Panel>
                                </div>
                                <div class="grafica">
                                    <canvas id="grafica_ventas_vendedor" class="graficas"></canvas>
                                </div>
                                <div class="separador">
                                </div>
                            </div>
                        </div>
                        <div class="tabulador fondo_blanco">
                            <div class="separador">
                            </div>
                            <div class="limite">
                                <div class="grafica">
                                    <canvas id="grafica_comisiones_vendedor" class="graficas"></canvas>
                                </div>
                                <div class="informacion_grafica">
                                    <asp:Panel ID="indicadores_vendedor_comisiones" runat="server" CssClass="indicador">
                                    </asp:Panel>
                                    <asp:Panel ID="datos_vendedor_comisiones" runat="server" CssClass="dato">
                                    </asp:Panel>
                                </div>
                                <div class="separador">
                                </div>
                            </div>
                        </div>
                        <div class="tabulador fondo_blanco">
                            <div class="separador">
                            </div>
                            <div class="grafica puntos">
                                <canvas id="grafica_ventas_anuales" class="graficas"></canvas>
                            </div>
                            <div class="separador">
                            </div>
                        </div>
                        <asp:UpdatePanel ID="panel_actualizacion_llamadas" runat="server" RenderMode="Inline"
                            UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="widget_prospectos">
                                    <asp:Label ID="prospectos" runat="server" CssClass="llamadas blanco" Enabled="False"><i class="fa fa-phone fa-2x"></i>&nbsp;&nbsp;Mis llamadas pendientes</asp:Label>
                                    <asp:LinkButton ID="a_prospectos" runat="server" CssClass="llamadas_detalles_prospectos negro" OnClick="llamadas_prospectos_Click" ToolTip="Mis llamadas a prospectos"></asp:LinkButton>
                                    <asp:LinkButton ID="a_clientes" runat="server" CssClass="llamadas_detalles_clientes negro" OnClick="llamadas_clientes_Click" ToolTip="Mis llamadas a clientes"></asp:LinkButton>
                                    <div class="panelito">
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="a_clientes" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="a_prospectos" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div class="izquierdo">
                        <asp:UpdatePanel ID="panel_actualizacion_contenido" runat="server" RenderMode="Inline"
                            UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="full">
                                    <div class="izquierdo">
                                        <div class="tabulador">
                                            <div class="cabecera_tabulador">
                                                <p class="texto_tabulador">
                                                    MIS COTIZACIONES
                                                </p>
                                            </div>
                                            <div class="contenido_tabla" onscroll="obtener_posicion_scroll_vertical()" id="p_cotizaciones">
                                                <asp:GridView ID="tabla_cotizaciones" runat="server" CssClass="tablita" DataSource='<%# datos_cotizaciones() %>'
                                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" OnRowCommand="tabla_cotizaciones_RowCommand"
                                                    DataKeyNames="clave_cotizacion,nombre">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                    <AlternatingRowStyle CssClass="GridAlternateRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Cliente" DataField="nombre"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Clave" DataField="clave_cotizacion"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="E." ShowHeader="True">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="ver" runat="server" CausesValidation="False" ToolTip="Ver y editar la cotización"
                                                                    CommandName="editar_cotizacion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye opcion_tabla"></i></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                        <div class="tabulador">
                                            <div class="cabecera_tabulador">
                                                <p class="texto_tabulador">
                                                    MIS CLIENTES
                                                </p>
                                            </div>
                                            <div class="contenido_tabla" onscroll="obtener_posicion_scroll_vertical()" id="p_clientes">
                                                <asp:GridView ID="tabla_clientes" runat="server" CssClass="tablita" DataSource='<%# datos_clientes() %>'
                                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" OnRowCommand="tabla_clientes_RowCommand"
                                                    DataKeyNames="id">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" />
                                                    <AlternatingRowStyle CssClass="GridAlternateRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Id" DataField="id"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Nombre" DataField="nombre"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                                            <HeaderStyle />
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="editar" runat="server" CausesValidation="False" ToolTip="Detalles del cliente"
                                                                    CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil-square-o opcion_tabla"></i></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                        <div class="tabulador">
                                            <div class="cabecera_tabulador">
                                                <p class="texto_tabulador">
                                                    MIS REQUISICIONES
                                                </p>
                                            </div>
                                            <div class="contenido_tabla" onscroll="obtener_posicion_scroll_vertical()" id="p_requisiciones">
                                                <asp:GridView ID="tabla_requisiciones" runat="server" CssClass="tablita" DataSource='<%# datos_requisiciones() %>'
                                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" OnRowCommand="tabla_requisiciones_RowCommand"
                                                    DataKeyNames="clave_requisicion">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                    <AlternatingRowStyle CssClass="GridAlternateRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Cliente" DataField="nombre"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Clave" DataField="clave_requisicion"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="E." ShowHeader="True">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="detalles" runat="server" CausesValidation="False" ToolTip="Detalles de la requisicion"
                                                                    CommandName="detalles_requisicion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-archive opcion_tabla"></i></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="derecho">
                                        <div class="tabulador transparente">
                                            <div class="parametros_chicos">
                                                <asp:Label ID="inactividad" runat="server" CssClass="metas" Enabled="False">INACTIVIDAD (%)</asp:Label>
                                                <div class="barras_dashboard">
                                                    <div class="caja_barra verde" style="<%=Session["contador"]%>">
                                                    </div>
                                                    <asp:TextBox ID="caja_contador" runat="server" CssClass="p-numero-inactividad" Enabled="False"
                                                        Visible="True" />
                                                </div>
                                            </div>
                                            <div class="parametros_chicos_separador">
                                                <asp:Label ID="cotizaciones_mensuales" runat="server" CssClass="metas" Enabled="False">COTIZACIONES DEL MES</asp:Label>
                                                <div class="barras_dashboard">
                                                    <div class="caja_barra morada" style="<%=Session["cotizaciones_mensuales"]%>">
                                                    </div>
                                                    <asp:TextBox ID="caja_cotizaciones" runat="server" CssClass="p-numero-inactividad"
                                                        Enabled="False" Visible="True" />
                                                </div>
                                            </div>
                                            <div class="parametros_chicos_separador">
                                                <asp:Label ID="ventas_mensuales" runat="server" CssClass="metas" Enabled="False">VENTAS DEL MES</asp:Label>
                                                <div class="barras_dashboard">
                                                    <div class="caja_barra roja" style="<%=Session["volumen_ventas_mensuales"]%>">
                                                    </div>
                                                    <asp:TextBox ID="caja_ventas" runat="server" CssClass="p-numero-inactividad" Enabled="False"
                                                        Visible="True" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="widget_reuniones">
                                            <asp:Label ID="numero_reuniones" runat="server" CssClass="reunion blanco" Enabled="False">0</asp:Label>
                                            <asp:Label ID="reunion" runat="server" CssClass="reunion blanco" Enabled="False">Reuniones agendadas</asp:Label>
                                            <i class="fa fa-calendar-check-o fa-2x blanco calendario_reuniones"></i>
                                        </div>
                                        <div class="widget_notas">
                                            <asp:Label ID="numero_notas" runat="server" CssClass="reunion blanco" Enabled="False">0</asp:Label>
                                            <asp:Label ID="notas" runat="server" CssClass="reunion blanco" Enabled="False">Mis notas creadas</asp:Label>
                                            <i class="fa fa-clipboard fa-2x blanco calendario_reuniones"></i>
                                        </div>
                                        <div class="widget_cotizaciones_autorizar">
                                            <asp:Label ID="numero_cotizaciones_por_autorizar" runat="server" CssClass="reunion blanco"
                                                Enabled="False">0</asp:Label>
                                            <asp:Label ID="cotizaciones_auto" runat="server" CssClass="reunion blanco" Enabled="False">Cotizaciones sin autorizar</asp:Label>
                                            <i class="fa fa-check-circle fa-2x blanco calendario_reuniones"></i>
                                        </div>
                                    </div>
                                </div>
                                <div id="mis_ventas" class="full" runat="server">
                                    <div class="tabulador modo_diseño">
                                        <div class="cabecera_tabulador">
                                            <p class="texto_tabulador">
                                                MIS VENTAS
                                            </p>
                                        </div>
                                        <div class="contenido_tabla" onscroll="obtener_posicion_scroll_vertical()" id="p_ventas">
                                            <asp:GridView ID="tabla_ventas" runat="server" CssClass="tablita" DataSource='<%# datos_ventas() %>'
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" OnRowCommand="tabla_requisiciones_RowCommand"
                                                DataKeyNames="clave_venta">
                                                <HeaderStyle CssClass="GridHeader" />
                                                <PagerSettings Visible="False" />
                                                <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
                                                <AlternatingRowStyle CssClass="GridAlternateRow" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Clave" DataField="clave_venta"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Cliente" DataField="nombre"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Total" DataField="total"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="E." ShowHeader="True">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="detalles" runat="server" CausesValidation="False" ToolTip="Detalles de la venta"
                                                                CommandName="detalles_venta" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye opcion_tabla"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <asp:Timer ID="reloj" runat="server" Interval="5000" OnTick="reloj_Tick" Enabled="True">
                                </asp:Timer>
                                <asp:Button ID="actualizar" runat="server" OnClick="actualizar_Click" Text="actualizar"
                                    Visible="True" Style="visibility: hidden" />
                                <asp:Button ID="boton_notificacion" runat="server" OnClick="boton_notificacion_Click"
                                    Text="Reiniciar" Visible="True" Style="visibility: hidden" />
                                <asp:Button ID="boton_cerrar_ventana" runat="server" OnClick="cerrar_ventana_Click"
                                    Text="reiniciar" Visible="True" Style="visibility: hidden" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="actualizar" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="tabla_clientes" EventName="RowCommand" />
                                <asp:AsyncPostBackTrigger ControlID="tabla_cotizaciones" EventName="RowCommand" />
                                <asp:AsyncPostBackTrigger ControlID="tabla_requisiciones" EventName="RowCommand" />
                                <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
