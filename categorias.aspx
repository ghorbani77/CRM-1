<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/categorias.aspx.cs" Inherits="categorias" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript">
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
    function convertir_mover() {
        $("#panel_editar_categorias").draggable();
        $("#panel_editar_sub_categorias").draggable();
        $("#panel_editar_categorias_a").draggable();
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    function salir() {
        this.close();
    }
    onload = abrir();
    function cerrar_mensaje_automatico() {
        setTimeout(function () {
            cerrar_mensaje();
        }, 3000);
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
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
    }
    function cerrar_mensaje() {
        $('#cerrar_mensaje').css('display', 'none');
        $('#simbolo_mensaje').css('display', 'none');
        $('#mensaje').css('display', 'none');
        $('#mensajes').css('visibility', 'hidden');
        $('#mensajes').css('height', '0px');
    }
    function obtener_posicion_scroll_categorias() {
        document.getElementById('scroll_categorias').value = document.getElementById('limitado_categorias').scrollTop;
    }
    function restablecer_posicion_scroll_categorias() {
        document.getElementById('limitado_categorias').scrollTop = document.getElementById('scroll_categorias').value;
    }
    function obtener_posicion_scroll_categorias_a() {
        document.getElementById('scroll_categorias_a').value = document.getElementById('limitado_categorias_a').scrollTop;
    }
    function restablecer_posicion_scroll_categorias_a() {
        document.getElementById('limitado_categorias_a').scrollTop = document.getElementById('scroll_categorias_a').value;
    }
    function obtener_posicion_scroll_sub_categorias() {
        document.getElementById('scroll_sub_categorias').value = document.getElementById('limitado_sub_categorias').scrollTop;
    }
    function restablecer_posicion_scroll_sub_categorias() {
        document.getElementById('limitado_sub_categorias').scrollTop = document.getElementById('scroll_sub_categorias').value;
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_mover_subcategoria') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_mover_sub_categoria');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'boton_mover_categoria_a') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_mover_categoria_a');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'guardar_categoria') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar_categoria');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'guardar_sub_categoria') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar_sub_categoria');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'guardar_categoria_a') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar_categoria_a');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'actualizar_categoria') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_actualizar_categoria');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'actualizar_sub_categoria') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_actualizar_sub_categoria');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'actualizar_categoria_a') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_actualizar_categoria_a');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'agregar_clave_producto_servicio') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_agregar_clave_producto_servicio');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'boton_si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
            }, 1000);
        }
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 1000);
        }
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
    var seccion_alta_categorias = 0, seccion_alta_sub_categorias = 0, seccion_alta_categorias_a = 0;
    function pageLoad() {
        restablecer_posicion_scroll_categorias_a();
        restablecer_posicion_scroll_sub_categorias();
        restablecer_posicion_scroll_categorias();
        verificar_desplegables();
        function verificar_desplegables() {
            switch (seccion_alta_categorias) {
                case 1:
                    abrir_alta_categoria();
                    break;
                case 0:
                    cerrar_alta_categoria();
                    break;
            }
            switch (seccion_alta_sub_categorias) {
                case 1:
                    abrir_alta_sub_categoria();
                    break;
                case 0:
                    cerrar_alta_sub_categoria();
                    break;
            }
            switch (seccion_alta_categorias_a) {
                case 1:
                    abrir_alta_categoria_a();
                    break;
                case 0:
                    cerrar_alta_categoria_a();
                    break;
            }
        }
        function abrir_alta_categoria() {
            $("#limitado_categorias").scrollTop(0);
            $("#boton_agregar_categoria").html('<i class=\"fa fa-times \"></i>');
            $('#alta_categorias').css('visibility', 'visible');
            $('#alta_categorias').css('height', '100px');
            seccion_alta_categorias = 1;
        }
        function cerrar_alta_categoria() {
            $("#boton_agregar_categoria").html('<i class=\"fa fa-plus \"></i>');
            $('#alta_categorias').css('visibility', 'hidden');
            $('#alta_categorias').css('height', '0px');
            seccion_alta_categorias = 0;
        }
        function abrir_alta_sub_categoria() {
            $("#limitado_sub_categorias").scrollTop(0);
            $("#boton_agregar_subcategoria").html('<i class=\"fa fa-close \"></i>');
            $('#alta_sub_categorias').css('visibility', 'visible');
            $('#alta_sub_categorias').css('height', '100px');
            seccion_alta_sub_categorias = 1;
        }
        function cerrar_alta_sub_categoria() {
            $("#boton_agregar_subcategoria").html('<i class=\"fa fa-plus \"></i>');
            $('#alta_sub_categorias').css('visibility', 'hidden');
            $('#alta_sub_categorias').css('height', '0px');
            seccion_alta_sub_categorias = 0;
        }
        function abrir_alta_categoria_a() {
            $("#limitado_categorias_a").scrollTop(0);
            $("#boton_agregar_categoria_a").html('<i class=\"fa fa-close \"></i>');
            $('#alta_categorias_a').css('visibility', 'visible');
            $('#alta_categorias_a').css('height', '100px');
            seccion_alta_categorias_a = 1;
        }
        function cerrar_alta_categoria_a() {
            $("#boton_agregar_categoria_a").html('<i class=\"fa fa-plus \"></i>');
            $('#alta_categorias_a').css('visibility', 'hidden');
            $('#alta_categorias_a').css('height', '0px');
            seccion_alta_categorias_a = 0;
        }
        $('#boton_agregar_categoria').click(function () {
            switch (seccion_alta_categorias) {
                case 0:
                    abrir_alta_categoria();
                    cerrar_alta_sub_categoria();
                    cerrar_alta_categoria_a();
                    break;
                case 1:
                    cerrar_alta_categoria();
                    break;
            }
            return false;
        });
        $('#boton_agregar_subcategoria').click(function () {
            switch (seccion_alta_sub_categorias) {
                case 0:
                    abrir_alta_sub_categoria();
                    cerrar_alta_categoria();
                    cerrar_alta_categoria_a();
                    break;
                case 1:
                    cerrar_alta_sub_categoria();
                    break;
            }
            return false;
        });
        $('#boton_agregar_categoria_a').click(function () {
            switch (seccion_alta_categorias_a) {
                case 0:
                    abrir_alta_categoria_a();
                    cerrar_alta_categoria();
                    cerrar_alta_sub_categoria();
                    break;
                case 1:
                    cerrar_alta_categoria_a();
                    break;
            }
            return false;
        });
    }
</script>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Categorias</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizacion" runat="server">
            <ContentTemplate>
                <input type="hidden" id="scroll_categorias" runat="server" />
                <input type="hidden" id="scroll_sub_categorias" runat="server" />
                <input type="hidden" id="scroll_categorias_a" runat="server" />
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>
                <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img alt="" class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                    <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Categorias</asp:Label>
                    <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                        OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                    <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                </div>
                <asp:Panel ID="mensajes" runat="server" CssClass="mensajes" Visible="True">
                    <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                        <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                    </asp:Panel>
                    <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                    <asp:Panel ID="panel_confirmacion" runat="server" CssClass="panel_confirmacion">
                        <p class="texto_bloqueo">
                            <asp:Label runat="server" ID="Mensaje_confirmacion" Text=""></asp:Label>&nbsp;<i class="fa fa-question-circle rojo"></i>
                        </p>
                        <asp:LinkButton ID="si" runat="server" CssClass="boton_confirmacion boton_si" OnClick="boton_si_Click">Si</asp:LinkButton>
                        <asp:LinkButton ID="no" runat="server" CssClass="boton_confirmacion boton_no" OnClick="boton_no_Click">No</asp:LinkButton>
                        <div class="separador_altas">
                        </div>
                    </asp:Panel>
                </asp:Panel>
                <div id="contenido">
                    <asp:Panel ID="panel_editar_categorias" runat="server" CssClass="ui-widget-content panel_sobrepuesto_foto_inventario"
                        Style="text-decoration: none;" Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:Label ID="titulo_panel_editar_categorias" CssClass="titulos_ventanas" runat="server" Text="Editar categoria"></asp:Label>
                            <asp:LinkButton ID="boton_cerrar_editar_categorias" runat="server" CssClass="boton_cerrar" OnClick="cerrar_editar_categorias_Click"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="central">
                            <div class="controles">
                                <div class="panel_procesar">
                                    <asp:TextBox ID="c_nueva_categoria" Style="text-transform: uppercase" runat="server" CssClass="caja_categoria" placeholder="Nuevo nombre categoria"></asp:TextBox>
                                    <asp:LinkButton ID="actualizar_categoria" OnClick="actualizar_categoria_Click" runat="server" ToolTip="Actualizar categoria" Style="text-decoration: none" CssClass="botones_categorias_chicos aprobar">Actualizar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panel_editar_sub_categorias" runat="server" CssClass="ui-widget-content panel_sobrepuesto_foto_inventario"
                        Style="text-decoration: none;" Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:Label ID="titulo_panel_editar_sub_categorias" CssClass="titulos_ventanas" runat="server" Text="Editar subcategoria"></asp:Label>
                            <asp:LinkButton ID="boton_cerrar_editar_sub_categoria" runat="server" CssClass="boton_cerrar" OnClick="cerrar_editar_sub_categorias_Click"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="central">
                            <div class="controles">
                                <div class="panel_procesar">
                                    <asp:TextBox ID="c_nueva_subcategoria" Style="text-transform: uppercase" runat="server" CssClass="caja_categoria" placeholder="Nuevo nombre subcategoria"></asp:TextBox>
                                    <asp:LinkButton ID="actualizar_sub_categoria" OnClick="actualizar_sub_categoria_Click" runat="server" ToolTip="Actualizar subcategoria" Style="text-decoration: none" CssClass="botones_categorias_chicos aprobar">Actualizar</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panel_editar_categorias_a" runat="server" CssClass="ui-widget-content panel_sobrepuesto"
                        Style="text-decoration: none;" Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:Label ID="titulo_panel_editar_categorias_a" CssClass="titulos_ventanas" runat="server" Text="Editar tipo de producto"></asp:Label>
                            <asp:LinkButton ID="boton_cerrar_editar_categoria_a" runat="server" CssClass="boton_cerrar" OnClick="cerrar_editar_categorias_a_Click"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="izquierdo_mitad">
                            <div class="controles_categorias">
                                <div class="panel_procesar">
                                    <asp:TextBox ID="c_nueva_categoria_a" Style="text-transform: uppercase" runat="server" CssClass="caja_categoria" placeholder="Nuevo tipo de producto"></asp:TextBox>
                                    <asp:LinkButton ID="actualizar_categoria_a" OnClick="actualizar_categoria_a_Click" runat="server" ToolTip="Actualizar tipo de producto" Style="text-decoration: none" CssClass="botones_categorias_chicos aprobar">Actualizar</asp:LinkButton>
                                </div>
                                <div class="controles_titulos">
                                    <asp:Label ID="etiqueta_codigos" CssClass="titulos_ventanas negro_chico mover_izquierda_40" runat="server" Text="Codigo de servicio asociado"></asp:Label>
                                </div>
                                <asp:GridView ID="tabla_codigos_categoria_a" runat="server" CssClass="tabla mover_izquierda_20" DataSource="<%# datos_codigos_categorias_a() %>"
                                    DataKeyNames="id_clave_producto_servicio" OnRowCommand="tabla_codigos_categorias_a_RowCommand"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_clave_producto_servicio" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Producto" DataField="descripcion"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="quitar" runat="server" CausesValidation="False" ToolTip="Remover codigo del tipo de producto" CommandName="quitar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="derecho_mitad">
                            <div class="separador_chico"></div>
                            <div class="controles_titulos">
                                <asp:Label ID="e_servicios" CssClass="titulos_ventanas negro_chico" runat="server" Text="Claves productos servicio"></asp:Label>
                                 <asp:LinkButton ID="claves_recomendadas" OnClick="claves_recomendadas_Click" runat="server" ToolTip="Claves de producto recomendadas" Style="text-decoration: none" CssClass="botones_controles_categorias b_azul"><i class="fa fa-star"></i></asp:LinkButton>
                                    <asp:LinkButton ID="busqueda_claves" OnClick="buscar_claves_producto_Click" runat="server" ToolTip="Buscar claves de producto" Style="text-decoration: none" CssClass="botones_controles_categorias b_morado"><i class="fa fa-search"></i></asp:LinkButton>
                            </div>
                            <div class="controles_titulos" id="panel_busqueda" runat="server">
                                <div class="panel_procesar">
                                    <asp:Label ID="etiqueta_buscar" runat="server" CssClass="etiquetas_barra_superior" Text="Buscar por: "></asp:Label>
                                    <asp:TextBox ID="buscar_texto" runat="server" CssClass="caja_buscar" placeholder="Introduzca busqueda"></asp:TextBox>
                                    <asp:LinkButton ID="boton_buscar" runat="server" CssClass="botones_requisiciones_chicos b_rojo" ToolTip="Buscar" OnClick="boton_buscar_Click"><i class="fa fa-search"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="separador_chico"></div>
                            <div class="separador_chico"></div>
                            <div class="separador_chico"></div>
                            <div class="limitado_chico">
                                <asp:GridView ID="tabla_claves_productos_servicio" runat="server" CssClass="tabla" DataSource="<%# datos_claves_productos_servicio() %>"
                                    DataKeyNames="id_clave_producto_servicio" OnRowCommand="tabla_claves_productos_servicio_RowCommand"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_clave_producto_servicio" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Producto" DataField="descripcion"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="agregar" runat="server" CausesValidation="False" ToolTip="Agregar clave de servicio a producto" CommandName="agregar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus-circle controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="tabla_claves_producto_servicio_general" runat="server" CssClass="tabla" DataSource="<%# datos_claves_productos_servicio_general() %>"
                                    DataKeyNames="id_clave_producto_servicio" OnRowCommand="tabla_claves_productos_servicio_RowCommand"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_clave_producto_servicio" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Producto" DataField="descripcion"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="agregar" runat="server" CausesValidation="False" ToolTip="Agregar clave de servicio a producto" CommandName="agregar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus-circle controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </asp:Panel>
                    <div class="separador"></div>
                    <div>
                        <div class="izquierdo_categorias">
                            <div class="separador_altas s_azul">
                                <p class="negro_grande">Categorias</p>
                                <asp:LinkButton ID="boton_agregar_categoria" runat="server" ToolTip="Agregar nueva categoria" Style="text-decoration: none;" CssClass="boton_agregar_categorias"><i class="fa fa-plus"></i></asp:LinkButton>
                            </div>
                            <div id="limitado_categorias" class="limitado" onscroll="obtener_posicion_scroll_categorias()">
                                <div id="alta_categorias" class="altas_categorias">
                                    <div class="controles">
                                        <div class="panel_procesar">
                                            <asp:TextBox ID="c_categoria" Style="text-transform: uppercase" runat="server" CssClass="caja_categoria" placeholder="Nueva categoria"></asp:TextBox>
                                            <asp:LinkButton ID="guardar_categoria" OnClick="guardar_categoria_Click" runat="server" ToolTip="Guardar la nueva categoria" Style="text-decoration: none" CssClass="botones_categorias_chicos aprobar">Guardar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="tabla_categorias" runat="server" CssClass="tabla" DataSource="<%# datos_categorias() %>"
                                    DataKeyNames="id_categoria" OnRowCommand="tabla_categorias_RowCommand" OnSelectedIndexChanged="tabla_categorias_OnSelectedIndexChanged" OnRowDataBound="tabla_categorias_OnRowDataBound"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader oculto" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_categoria" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Categoria" DataField="categoria"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="editar" runat="server" CausesValidation="False" ToolTip="Editar categoria" CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-edit controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>


                        <div class="central_categorias">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="boton_agregar_subcategoria" runat="server" ToolTip="Agregar nueva Subcategoria" Style="text-decoration: none;" CssClass="boton_agregar_categorias"><i class="fa fa-plus"></i></asp:LinkButton>
                                <p class="negro_grande">Subcategorias</p>
                            </div>
                            <div id="limitado_sub_categorias" class="limitado" onscroll="obtener_posicion_scroll_sub_categorias()">
                                <div id="alta_sub_categorias" class="altas_categorias">
                                    <div class="controles">
                                        <div class="panel_procesar">
                                            <asp:TextBox ID="c_subcategoria" Style="text-transform: uppercase" runat="server" CssClass="caja_categoria" placeholder="Nueva Subcategoria"></asp:TextBox>
                                            <asp:LinkButton ID="guardar_subcategoria" OnClick="guardar_sub_categoria_Click" runat="server" ToolTip="Guardar la nueva subcategoria" Style="text-decoration: none" CssClass="botones_categorias_chicos aprobar">Guardar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="tabla_sub_categorias" runat="server" CssClass="tabla" DataSource="<%# datos_sub_categorias() %>"
                                    DataKeyNames="id_sub_categoria" OnRowCommand="tabla_sub_categorias_RowCommand" OnSelectedIndexChanged="tabla_sub_categorias_OnSelectedIndexChanged" OnRowDataBound="tabla_sub_categorias_OnRowDataBound"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader oculto" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_sub_categoria" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Sub categoria" DataField="sub_categoria"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="editar" runat="server" CausesValidation="False" ToolTip="Editar Subcategoria"
                                                    CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-edit controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="mover" runat="server" CausesValidation="False" ToolTip="Mover hacia la categoria"
                                                    CommandName="mover" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-exchange controles_tablas b_verde"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="derecho_categorias">
                            <div class="separador_altas s_azul">
                                <asp:LinkButton ID="boton_agregar_categoria_a" runat="server" ToolTip="Agregar nuevo tipo de producto" Style="text-decoration: none;" CssClass="boton_agregar_categorias"><i class="fa fa-plus"></i></asp:LinkButton>
                                <p class="negro_grande">Tipos de producto</p>
                            </div>
                            <div id="limitado_categorias_a" class="limitado" onscroll="obtener_posicion_scroll_categorias_a()">
                                <div id="alta_categorias_a" class="altas_categorias">
                                    <div class="controles">
                                        <div class="panel_procesar">
                                            <asp:TextBox ID="c_categoria_a" Style="text-transform: uppercase" runat="server" CssClass="caja_categoria" placeholder="Nuevo tipo de producto"></asp:TextBox>
                                            <asp:LinkButton ID="guardar_categoria_a" runat="server" OnClick="guardar_categoria_a_Click" ToolTip="Guardar el nuevo tipo de producto" Style="text-decoration: none" CssClass="botones_categorias_chicos aprobar">Guardar</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="tabla_categorias_a" runat="server" CssClass="tabla" DataSource="<%# datos_categorias_a() %>"
                                    DataKeyNames="id_categoria_a" OnRowCommand="tabla_categorias_a_RowCommand"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader oculto" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="id_categoria_a" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Tipo de producto" DataField="categoria_a"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="editar" runat="server" CausesValidation="False" ToolTip="Editar tipo de producto"
                                                    CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-edit controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="mover" runat="server" CausesValidation="False" ToolTip="Mover hacia la Subcategoria"
                                                    CommandName="mover" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-exchange controles_tablas b_verde"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="controles">
                        <asp:LinkButton ID="volver" runat="server" ToolTip="Volver a inventario" Style="text-decoration: none" Visible="True" OnClick="volver_Click" CssClass="botones_requisiciones_chicos rechazar">Volver</asp:LinkButton>
                    </div>
                </div>
                <asp:LinkButton ID="boton_oculto_buscar" OnClick="boton_oculto_buscar_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_si" OnClick="boton_oculto_si_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_agregar_clave_producto_servicio" OnClick="boton_oculto_agregar_clave_producto_servicio_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_actualizar_categoria_a" OnClick="boton_oculto_actualizar_categoria_a_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_actualizar_sub_categoria" OnClick="boton_oculto_actualizar_sub_categoria_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_actualizar_categoria" OnClick="boton_oculto_actualizar_categoria_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_mover_sub_categoria" OnClick="boton_oculto_mover_sub_categoria_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_guardar_categoria" OnClick="boton_oculto_guardar_categoria_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_guardar_sub_categoria" OnClick="boton_oculto_guardar_sub_categoria_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_guardar_categoria_a" OnClick="boton_oculto_guardar_categoria_a_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_mover_categoria_a" OnClick="boton_oculto_mover_categoria_a_Click" runat="server" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
