<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/inventario.aspx.cs"
    Inherits="inventario" %>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                var boton = window.opener.document.getElementById('actualizar');
                boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 15000);
    })()
    function convertir_mover() {
        $("#panel_surtir_inventario").draggable();
        $("#panel_cambiar_precios").draggable();
        $("#panel_alta_productos").draggable();
        $("#panel_cambiar_todos_precios").draggable();
        $("#panel_sacar_productos_inventario").draggable();
        $("#panel_subir_fotografia").draggable();
        $("#panel_desactivacion_productos").draggable();
    }
    function subir() {
        var boton = document.getElementById("<%= archivo.ClientID %>" + '_ctl02');
        boton.click();
        return false;
    }
    function abrir_panel_subir_fotografia() {
        document.getElementById("<%= panel_subir_fotografia.ClientID %>").style.display = "inline";
        convertir_mover();
    }
    function cerrar_panel_subir_fotografia() {
        document.getElementById("<%= panel_subir_fotografia.ClientID %>").style.display = "none";
        convertir_mover();
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_transferir_activo_fijo') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_transferir_activo_fijo');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'activacion') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_activacion');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_surtir') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_surtir');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_guardar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_sacar_productos') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_sacar');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_actualizar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_actualizar');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_transferir') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_transferir');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_ingresar_producto') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_ingresar_producto');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_guardar_cambios') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar_cambios');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_buscar');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'boton_back_orders') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_back_orders');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'transferir') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_transferir_inventario');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'sacar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_sacar_inventario');
                boton.click();
            }, 500);
        }
        if (boton.toString() == 'si') {
            setTimeout(function () {
                var boton = document.getElementById('oculto_si');
                boton.click();
            }, 500);
        }
    }
    function uploadError(sender, args) {
        document.getElementById('mensaje_imagen').innerText = args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>";
    }
    function StartUpload(sender, args) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        $('#icono_adjuntar').css('display', 'none');
    }
    function UploadComplete(sender, args) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
        document.getElementById("<%= panel_subir_fotografia.ClientID %>").style.display = "none";
        $('#icono_adjuntar').css('display', 'inline');
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function subir_fotografia(ancho, alto) {
        var posicion_x;
        var posicion_y;
        posicion_x = (screen.width / 2) - (ancho / 2);
        posicion_y = (screen.height / 2) - (alto / 2);
        catalogo = window.open("subir_fotografia_producto.aspx", "Subir Fotgrafia", "width=250, height=200,scrollbars = yes,resizable = false, left = " + posicion_x + ", top = " + posicion_y + "");
    }
    function salir() {
        this.close();
    }
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('boton_buscar');
            boton.click();
        }
    }
    function verificar_enter_dos(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
            var boton = document.getElementById('introducir_codigo');
            boton.click();
        }
    }

    function pageLoad() {
        convertir_mover();
        $('.aumentar').click(function () {
            var i, guiones = 0, cadena = "", identificador_texto = "", recibir_casilla, cantidad;
            var identificador = null;
            identificador = $(this).attr("id");
            for (i = 0; i < identificador.length; i++) {
                if (identificador[i] == '_') {
                    guiones++;
                }
                if (guiones < 4) {
                    cadena = cadena + identificador[i];
                }
                else {
                    break;
                }
            }
            identificador_texto = cadena + "_cantidad";
            recibir_casilla = document.getElementById(identificador_texto);
            cantidad = parseInt(recibir_casilla.value);
            if (cantidad < 999) {
                cantidad = cantidad + 1;
                document.getElementById(identificador_texto).value = cantidad;
            }
            return false;
        });
        $('.disminuir').click(function () {
            var i, guiones = 0, cadena = "", identificador_texto = "", recibir_casilla, cantidad;
            var identificador = null;
            identificador = $(this).attr("id");
            for (i = 0; i < identificador.length; i++) {
                if (identificador[i] == '_') {
                    guiones++;
                }
                if (guiones < 4) {
                    cadena = cadena + identificador[i];
                }
                else {
                    break;
                }
            }
            identificador_texto = cadena + "_cantidad";
            recibir_casilla = document.getElementById(identificador_texto);
            cantidad = parseInt(recibir_casilla.value);
            if (cantidad > 1) {
                cantidad = cantidad - 1;
                document.getElementById(identificador_texto).value = cantidad;
            }
            return false;
        });
        $(function () {
            $("#fecha_desactivacion").datepicker({
                changeMonth: true,
                changeYear: true,
                showOn: "button",
                maxDate: "0D",
                buttonText: "<i class='fa fa-calendar controles_tablas'></i>",
            });
        });
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Inventario - Inklaser</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <script type="text/javascript" src="javascript/mensajes.js"></script>
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizaciones" runat="server">
            <ContentTemplate>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
                </asp:Panel>
                <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                <asp:Panel ID="panel_confirmacion_desicion" runat="server" CssClass="panel_confirmacion">
                    <p class="texto_bloqueo">
                        <asp:Label runat="server" ID="Mensaje_confirmacion" Text=""></asp:Label>&nbsp;<i
                            class="fa fa-question-circle rojo"></i></p>
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
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Inventario</asp:Label>
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
                    <div class="separador_altas">
                    </div>
                    <div class="contenido">
                        <div class="panel_procesar">
                            <asp:Label ID="t_busqueda" runat="server" Text="Buscar por" CssClass="etiquetas_barra_superior"></asp:Label>
                            <asp:DropDownList ID="tipo_busqueda" runat="server" CssClass="caja_chica"
                                AutoPostBack="True" OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged">
                                <asp:ListItem>Codigo de proveedor</asp:ListItem>
                                <asp:ListItem>Codigo de barras</asp:ListItem>
                                <asp:ListItem>Codigo de fabricante</asp:ListItem>
                                <asp:ListItem>Modelo</asp:ListItem>
                                <asp:ListItem>Proveedor</asp:ListItem>
                                <asp:ListItem>Producto</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="caja_busqueda" placeholder="Introduce una busqueda" runat="server" Enabled="True" CssClass="caja_buscar"></asp:TextBox>
                            <asp:LinkButton ID="boton_buscar" CssClass="botones_requisiciones_chicos b_rojo" runat="server" ToolTip="Buscar" Style="text-decoration: none;" OnClick="boton_buscar_Click"><i class="fa fa-search"></i></asp:LinkButton>
                            <div class="panel_procesar_punto_venta">
                                <asp:LinkButton ID="boton_alta_categorias" runat="server" Enabled="True" CssClass="botones_cotizaciones b_azul" ToolTip="Categorias" OnClick="boton_alta_categorias_Click"><i class="fa fa-list"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_subir_todos_tipo" runat="server" CssClass="botones_cotizaciones b_azul" ToolTip="Modificar los precios en general" OnClick="boton_modificar_todos_tipo_Click"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_salidas_inventario" runat="server" CssClass="botones_cotizaciones b_azul" ToolTip="Salidas de producto del inventario" OnClick="boton_salidas_inventario_Click" Enabled="True"><i class="fa fa-share-square-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_pedidos" runat="server" CssClass="botones_cotizaciones b_azul" ToolTip="Pedidos" OnClick="boton_pedidos_Click">
                                    <i class="fa fa-truck"></i>
                                    <asp:Label ID="indicador_pedidos" runat="server" CssClass="indicadores_inventario" Visible="false"></asp:Label>
                                </asp:LinkButton>
                                <asp:LinkButton ID="boton_back_orders" runat="server" CssClass="botones_cotizaciones b_azul" ToolTip="Procesar los backorders" OnClick="boton_back_orders_Click" Enabled="True">
                                    <i class="fa fa-cog fa-spin"></i>
                                    <asp:Label ID="indicador_back_orders" CssClass="indicadores_inventario" runat="server" Visible="false"></asp:Label>
                                </asp:LinkButton>
                                <asp:LinkButton ID="boton_ver_back_orders" runat="server" CssClass="botones_cotizaciones b_azul" ToolTip="Verificar los backorders" OnClick="boton_back_orders_ver_Click" Enabled="True">
                                    <i class="fa fa-retweet"></i>
                                    <asp:Label ID="indicador_back_orders_ver" CssClass="indicadores_inventario" Visible="false" runat="server"></asp:Label>
                                </asp:LinkButton>
                                <asp:LinkButton ID="boton_transferencias" runat="server" OnClick="transferencias_productos_Click" CssClass="botones_cotizaciones b_azul" ToolTip="Transferencias de producto">
                                    <i class="fa fa-exchange"></i>
                                    <asp:Label ID="indicador_transferencias" CssClass="indicadores_inventario" runat="server" Visible="false"></asp:Label>
                                </asp:LinkButton>
                                <asp:LinkButton ID="boton_alta_productos" runat="server" CssClass="botones_cotizaciones b_verde" ToolTip="Alta de productos" OnClick="boton_alta_productos_Click"><i class="fa fa-plus-square"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="boton_desactivar_productos" runat="server" CssClass="botones_cotizaciones b_rojo" OnClick="boton_desactivacion_productos_Click" ToolTip="Desactivar productos"><i class="fa fa-close"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <asp:Panel ID="panel_surtir_inventario" runat="server" CssClass="ui-widget-content panel_sobrepuesto" Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_surtir_inventario" CssClass="titulos_ventanas" runat="server" Text="Surtir inventario"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_surtir_inventario" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_surtir_inventario_Click"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_codigo_producto_surtir" runat="server" CssClass="etiquetas_barra_superior" Text="Codigo Producto"></asp:Label>
                                <asp:TextBox ID="caja_codigo_producto_surtir" runat="server" Enabled="False" CssClass="caja_chica"></asp:TextBox>
                            </div>
                            <div class="limitado_chico">
                                <asp:GridView ID="tabla_cantidades" runat="server" AutoGenerateColumns="False" DataKeyNames="id_sucursal"
                                    OnRowCommand="tabla_cantidades_RowCommand" DataSource='<%# datos_inventario_sucursal() %>'
                                    CssClass="tabla" ShowHeaderWhenEmpty="True">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Id Sucursal" DataField="id_sucursal"></asp:BoundField>
                                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cod. Proveedor" DataField="codigo_proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Surtir" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="surtir_producto" runat="server" CausesValidation="False" ToolTip="Surtir producto"
                                                    CommandName="surtir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus-square controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="transferir_producto" runat="server" CausesValidation="False" ToolTip="Transferir producto a otra sucursal"
                                                    CommandName="transferir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-exchange controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="separador_altas"></div>
                            <asp:Panel ID="panel_surtir" runat="server" CssClass="panel_surtir" Visible="False">
                                <div class="panel_procesar">
                                    <asp:Label ID="etiqueta_cantidad_surtir" runat="server" CssClass="etiquetas_barra_superior" Text="Cantidad"></asp:Label><asp:TextBox
                                        ID="caja_cantidad_surtir" runat="server" CssClass="caja_chica" MaxLength="10"></asp:TextBox>
                                    <asp:LinkButton ID="boton_surtir" runat="server" ToolTip="Surtir" Style="text-decoration: none;"
                                        CssClass="botones_cotizaciones_chicos b_verde"
                                        OnClick="boton_surtir_Click">Surtir</asp:LinkButton>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="panel_transferir" runat="server" CssClass="panel_transferir" Visible="False">
                                <div class="panel_procesar">
                                    <asp:Label ID="etiqueta_sucursal_transferir" runat="server" CssClass="etiquetas_barra_superior" Text="Sucursal"></asp:Label><asp:DropDownList
                                        ID="lista_sucursales_transferir" runat="server" CssClass="caja_chica">
                                    </asp:DropDownList>
                                    <asp:Label ID="etiqueta_cantidad_transferir" CssClass="etiquetas_barra_superior" runat="server" Text="Cantidad"></asp:Label><asp:TextBox
                                        ID="caja_cantidad_transferir" runat="server" CssClass="caja_chica" MaxLength="10"></asp:TextBox>
                                    <asp:LinkButton ID="boton_transferir" runat="server" ToolTip="Transferir" Style="text-decoration: none;"
                                        CssClass="botones_cotizaciones_chicos b_verde" OnClientClick="activar_boton_oculto_dos();"
                                        OnClick="boton_transferir_Click">Mover</asp:LinkButton>
                                </div>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="panel_sacar_productos_inventario" runat="server" CssClass="ui-widget-content panel_sobrepuesto"
                            Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_sacar_productos" CssClass="titulos_ventanas" runat="server" Text="Salida de productos"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_sacar_productos_inventario" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_sacar_productos_inventario_Click"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="central panel_blanco">
                                <div class="central">
                                    <div class="izquierdo_mitad">
                                        <div class="separador_altas"></div>
                                        <ul class="lista_inventario">
                                            <li>
                                                <p>
                                                    <asp:Label ID="etiqueta_codigo_proveedor_sacar" CssClass="etiquetas_lista_inventario" runat="server" Text="Codigo Proveedor"></asp:Label>
                                                </p>
                                                <asp:TextBox ID="caja_codigo_proveedor_sacar" runat="server" Enabled="False" CssClass="caja_lista_inventario"></asp:TextBox>
                                            </li>
                                            <li>
                                                <p>
                                                    <asp:Label ID="etiqueta_producto_sacar" CssClass="etiquetas_lista_inventario" runat="server" Text="Descripcion"></asp:Label>
                                                </p>
                                                <asp:TextBox ID="caja_producto_sacar" runat="server" Enabled="False" CssClass="caja_descripciones" TextMode="MultiLine" MaxLength="1900" Style="text-transform: uppercase"></asp:TextBox>
                                            </li>
                                            <li>
                                                <p>
                                                    <asp:Label ID="etiqueta_cantidad_producto_sacar" CssClass="etiquetas_lista_inventario" runat="server" Text="Cantidad de salida"></asp:Label>
                                                </p>
                                                <asp:TextBox ID="caja_cantidad_producto_sacar" runat="server" Enabled="True" CssClass="caja_lista_inventario"></asp:TextBox>
                                            </li>
                                            <li>
                                                <p>
                                                    <asp:Label ID="etiqueta_comentarios_producto_sacar" CssClass="etiquetas_lista_inventario" runat="server" Text="Comentarios"></asp:Label>
                                                </p>
                                                <asp:TextBox ID="caja_comentarios_producto_sacar" runat="server" Enabled="True" CssClass="caja_descripciones" TextMode="MultiLine" MaxLength="1900" Style="text-transform: uppercase"></asp:TextBox>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="boton_sacar_productos" runat="server" ToolTip="Transferir" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_verde" OnClientClick="activar_boton_oculto_tres();" OnClick="boton_sacar_Click">Procesar</asp:LinkButton>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="derecho_mitad">
                                        <div class="limitado_chico">
                                            <asp:GridView ID="tabla_cantidades_retenidas" runat="server" CssClass="tabla" DataKeyNames="orden_compra" OnRowCommand="tabla_cantidades_retenidas_RowCommand" DataSource='<%# datos_cantidades_retenidas() %>'
                                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" Visible="True" PagerSettings-Visible="false">
                                                <PagerSettings Visible="False" />
                                                <HeaderStyle CssClass="GridHeader" />
                                                <PagerSettings Visible="False" />
                                                <RowStyle CssClass="GridRow" />
                                                <AlternatingRowStyle CssClass="GridRow" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Cantidad retenida" DataField="cantidad" Visible="True"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Cotizacion" DataField="cotizacion"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Orden de compra" DataField="orden_compra"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="C. Solicitar" ShowHeader="True">
                                                        <ItemStyle CssClass="espacio" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="cantidad" Enabled="False" CssClass="cantidad_grande" Text='<%#Eval("cantidad_inicial") %>' MaxLength="10" runat="server"
                                                                Width="80px"></asp:TextBox>
                                                            <asp:LinkButton ID="aumentar" runat="server" CssClass="aumentar"><i class="fa fa-plus"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="disminuir" runat="server" CssClass="disminuir"><i class="fa fa-minus"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="transferir" runat="server" CausesValidation="False" ToolTip="Transferir a inventario"
                                                                CommandName="transferir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-exchange controles_tablas"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="sacar" runat="server" CausesValidation="False" ToolTip="Procesar salida de producto"
                                                                CommandName="sacar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-share controles_tablas"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panel_cambiar_precios" runat="server" CssClass="ui-widget-content panel_sobrepuesto"
                            Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_cambiar_precios" CssClass="titulos_ventanas" runat="server" Text="Edición de producto"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_cambiar_precios" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_cambiar_precios_Click"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="izquierdo_mitad panel_blanco">
                                <div class="separador_altas"></div>
                                <div class="izquierdo_mitad">
                                    <ul class="lista_inventario mover_izquierda_20">
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_proveedor" runat="server" CssClass="etiquetas_lista_inventario" Text="Proveedor"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_proveedores" runat="server" CssClass="caja_lista_inventario" AutoPostBack="False"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_codigo_producto" runat="server" CssClass="etiquetas_lista_inventario" Text="Codigo Proveedor"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_codigo_producto" CssClass="caja_lista_inventario" runat="server" Enabled="True" Style="text-transform: uppercase" MaxLength="25"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_codigo_fabricante" runat="server" CssClass="etiquetas_lista_inventario" Text="Codigo Fabricante"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_codigo_fabricante" CssClass="caja_lista_inventario" runat="server" Enabled="True" Style="text-transform: uppercase" MaxLength="190"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_codigo_barras_producto" CssClass="etiquetas_lista_inventario" runat="server" Text="Codigo Barras"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_codigo_barras_producto" CssClass="caja_lista_inventario" runat="server" Enabled="True" MaxLength="29"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="categoria_editar" runat="server" CssClass="etiquetas_lista_inventario" Text="Categoria"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_categoria_editar" CssClass="caja_lista_inventario" runat="server" OnSelectedIndexChanged="lista_categoria_editar_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_producto" CssClass="etiquetas_lista_inventario" runat="server" Text="Descripcion"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_descripcion" CssClass="caja_descripciones" runat="server" Enabled="False" TextMode="MultiLine" Style="text-transform: uppercase" MaxLength="1800"></asp:TextBox>
                                        </li>
                                    </ul>
                                </div>
                                <div class="derecho_mitad">
                                    <ul class="lista_inventario">
                                        <li>
                                            <p>
                                                <asp:Label ID="sub_categoria_editar" runat="server" CssClass="etiquetas_lista_inventario" Text="Subcategoria"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_subcategoria_editar" CssClass="caja_lista_inventario" runat="server" OnSelectedIndexChanged="lista_subcategoria_editar_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="categoria_a_editar" runat="server" CssClass="etiquetas_lista_inventario" Text="Tipo de producto"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_categoria_a_editar" CssClass="caja_lista_inventario" runat="server"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="marca_editar" runat="server" CssClass="etiquetas_lista_inventario" Text="Marca"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_marcas_editar" runat="server" CssClass="caja_lista_inventario" AutoPostBack="True" OnSelectedIndexChanged="lista_marcas_editar_SelectedIndexChanged"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="otra_marca_editar" CssClass="etiquetas_lista_inventario" runat="server" Text="Nueva Marca" Visible="false"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_nueva_marca_editar" runat="server" Enabled="True" CssClass="caja_lista_inventario" Style="text-transform: uppercase" MaxLength="100" onpaste="return false" Visible="false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="modelo_editar" CssClass="etiquetas_lista_inventario" runat="server" Text="Modelo"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_modelo_editar" runat="server" Enabled="True" CssClass="caja_lista_inventario" Style="text-transform: uppercase" onpaste="return false"></asp:TextBox>
                                        </li>

                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_descripcion_ingles" CssClass="etiquetas_lista_inventario" runat="server" Text="Descripcion Ingles"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_descripcion_ingles" CssClass="caja_descripciones" runat="server" Enabled="True" TextMode="MultiLine" Style="text-transform: uppercase" MaxLength="1800"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="disponible_web_edicion" Style="vertical-align: middle" runat="server" />
                                            <asp:Label ID="etiqueta_disponibilidad_web" CssClass="etiquetas_lista_inventario" runat="server" Text="Modelo">Disponibilidad Web</asp:Label>

                                        </li>
                                        <li>
                                            <asp:CheckBox ID="iva_aplicado_modificar" Style="vertical-align: middle" runat="server" />
                                            <asp:Label ID="etiqueta_iva_aplicado" CssClass="etiquetas_lista_inventario mover_izquierda_20" runat="server" Text="Modelo">Aplicar iva el producto</asp:Label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="panel_procesar superior">
                                    <asp:LinkButton ID="boton_compatibilidad" runat="server" ToolTip="Agregar Compatibilidad" Style="text-decoration: none;"
                                        CssClass="botones_requisiciones_chicos b_azul" OnClick="agregar_compatibilidad_Click"><i class="fa fa-check"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_actualizar" runat="server" ToolTip="Actualizar datos" Style="text-decoration: none;"
                                        CssClass="botones_requisiciones_chicos b_azul" OnClick="boton_actualizar_Click"><i class="fa fa-refresh"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_guardar" runat="server" ToolTip="Guardar nuevo precio"
                                        Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_verde" OnClick="boton_guardar_Click"><i class="fa fa-save"></i></asp:LinkButton>
                                    <asp:LinkButton ID="subir_foto" runat="server" ToolTip="Subir fotografia del producto" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_azul" OnClick="boton_subir_foto_Click"><i class="fa fa-camera"></i></asp:LinkButton>
                                </div>
                            </div>
                            <div class="derecho_mitad panel_blanco">
                                <asp:GridView ID="tabla_precios" runat="server" CssClass="tabla" DataSource='<%# datos_precios_producto() %>'
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false" DataKeyNames="precio"
                                    OnRowCommand="tabla_precios_RowCommand">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Precio" DataField="tipo_precio" Visible="True">
                                            <HeaderStyle CssClass="cabecera_gridview" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Precio Ant." DataField="precio" Visible="True" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:BoundField HeaderText="% Y $ Anterior" DataField="porcentaje"></asp:BoundField>
                                        <asp:TemplateField HeaderText="% Y $ Nuevo" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:TextBox ID="nuevo_porcentaje" CssClass="cantidad" onkeypress="return numeros_punto(event);"
                                                    MaxLength="100" runat="server" Width="80px" Text='<%#Eval("porcentaje") %>'></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="porcentaje_boton" runat="server" CausesValidation="False" ToolTip="Calcular porcentaje automaticamente"
                                                    CommandName="porcentaje" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-percent controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <div class="separador_altas"></div>
                                <div class="separador_altas"></div>
                                <div class="panel_procesar_inventario">
                                    <div class="izquierdo_mitad_chico">
                                        <ul class="lista_inventario">
                                            <li>
                                                <asp:Image ID="imagen_producto" runat="server" CssClass="fotografia_producto" />
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="izquierdo_mitad_chico">
                                        <asp:Panel ID="panel_porcentajes" runat="server"
                                            CssClass="panel_surtir_inventario modulo-esp" Visible="False">
                                            <ul class="lista_inventario">
                                                <li>
                                                    <p>
                                                        <asp:Label ID="etiqueta_precio_deseado" CssClass="etiquetas_barra_superior" runat="server" Text="Precio deseado (pesos sin iva)"></asp:Label>
                                                    </p>
                                                </li>
                                                <div class="separador_altas"></div>
                                                <li>
                                                    <asp:TextBox CssClass="caja_chica_90" ID="caja_precio_deseado" runat="server"></asp:TextBox>
                                                    <asp:LinkButton ID="aplicar_porcentaje" runat="server" ToolTip="Aplicar porcentaje a precio" Style="text-decoration: none;"
                                                        CssClass="botones_precios b_verde" OnClick="boton_aplicar_porcentajes_Click"><i class="fa fa-check"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="boton_cerrar_precio_deseado" runat="server" ToolTip="Cancelar" Style="text-decoration: none;"
                                                        CssClass="botones_precios b_rojo" OnClick="boton_cerrar_precio_deseado_Click"><i class="fa fa-close"></i></asp:LinkButton>
                                                </li>
                                        </asp:Panel>

                                    </div>
                                </div>
                            </div>
                            <div class="separador_altas"></div>
                        </asp:Panel>
                        <asp:Panel ID="panel_alta_productos" runat="server" CssClass="ui-widget-content panel_sobrepuesto_altas"
                            Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_alta_productos" CssClass="titulos_ventanas" runat="server" Text="Alta de productos"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_alta_productos" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_alta_productos_Click"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="central">
                                <div class="izquierdo_mitad">
                                    <ul class="lista_inventario mover_izquierda_20">
                                        <li>
                                            <p>
                                                <asp:Label ID="proveedor" CssClass="etiquetas_lista_inventario" runat="server" Text="Proveedor"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_proveedores_producto" runat="server" CssClass="caja_lista_inventario" AutoPostBack="True" OnSelectedIndexChanged="lista_proveedores_producto_SelectedIndexChanged"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="c_proveedor" CssClass="etiquetas_lista_inventario" runat="server" Text="Codigo de proveedor (Importante)"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="codigo_proveedor_texto" runat="server" Enabled="True" CssClass="caja_lista_inventario" Style="text-transform: uppercase" MaxLength="25" onpaste="return false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="categoria" runat="server" CssClass="etiquetas_lista_inventario" Text="Categoria"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_categoria" runat="server" CssClass="caja_lista_inventario" OnSelectedIndexChanged="lista_categoria_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="subcategoria" CssClass="etiquetas_lista_inventario" runat="server" Text="Subcategoria"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_subcategoria" runat="server" CssClass="caja_lista_inventario" OnSelectedIndexChanged="lista_subcategoria_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="categoria_a" CssClass="etiquetas_lista_inventario" runat="server" Text="Tipo de producto"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_categoria_a" runat="server" CssClass="caja_lista_inventario"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="marca" runat="server" CssClass="etiquetas_lista_inventario" Text="Marca"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_marcas" runat="server" CssClass="caja_lista_inventario" AutoPostBack="True" OnSelectedIndexChanged="lista_marcas_SelectedIndexChanged"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="otra_marca" runat="server" CssClass="etiquetas_lista_inventario" Text="Nueva Marca" Visible="false"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_nueva_marca" runat="server" Enabled="True" CssClass="caja_lista_inventario" Style="text-transform: uppercase" MaxLength="100" onpaste="return false" Visible="false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="modelo" runat="server" CssClass="etiquetas_lista_inventario" Text="Modelo"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="modelo_texto" runat="server" Enabled="True" CssClass="caja_lista_inventario" Style="text-transform: uppercase" onpaste="return false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="descripcion" runat="server" CssClass="etiquetas_lista_inventario" Text="Descripcion en Espanol"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="descripcion_texto" runat="server" CssClass="caja_descripciones" Enabled="True" TextMode="MultiLine" Style="text-transform: uppercase" MaxLength="1800" onpaste="return false"></asp:TextBox>
                                        </li>
                                    </ul>
                                </div>
                                <div class="derecho_mitad">
                                    <ul class="lista_inventario">
                                        <li>
                                            <p>
                                                <asp:Label ID="fabricante" CssClass="etiquetas_lista_inventario" runat="server" Text="C. Fabricante"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="codigo_fabricante_texto" runat="server" Enabled="True" CssClass="caja_lista_inventario" Style="text-transform: uppercase" MaxLength="190" onpaste="return false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="costo" CssClass="etiquetas_lista_inventario" runat="server" Text="Costo"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="costo_texto" runat="server" Enabled="True" CssClass="caja_lista_inventario" MaxLength="10" onpaste="return false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="moneda" CssClass="etiquetas_lista_inventario" runat="server" Text="Moneda"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="tipo_moneda" runat="server" CssClass="caja_lista_inventario" AutoPostBack="True">
                                                <asp:ListItem>Dolares</asp:ListItem>
                                                <asp:ListItem>Pesos</asp:ListItem>
                                            </asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="unidad_medida" CssClass="etiquetas_lista_inventario" runat="server" Text="Unidad de medida"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="caja_unidad_medida" runat="server" CssClass="caja_lista_inventario" AutoPostBack="True" OnSelectedIndexChanged="caja_unidad_medida_SelectedIndexChanged">
 
                                            </asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="codigo_barras" CssClass="etiquetas_lista_inventario" runat="server" Text="Codigo de barras"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="codigo_barras_texto" runat="server" Enabled="True" CssClass="caja_lista_inventario" onpaste="return false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="descripcion_ingles" runat="server" CssClass="etiquetas_lista_inventario" Text="Descripcion en ingles"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="descripcion_ingles_texto" runat="server" CssClass="caja_descripciones" Enabled="True" TextMode="MultiLine" Style="text-transform: uppercase" MaxLength="1800" onpaste="return false"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:CheckBox ID="disponible_web" Style="width: 20px; height: 20px;" runat="server" />
                                            <asp:Label ID="web" CssClass="etiquetas_lista_inventario" runat="server" Text="Modelo">Disponibilidad Web</asp:Label>

                                        </li>
                                        <li>
                                            <asp:CheckBox ID="iva_aplicado" Style="width: 20px; height: 20px;" runat="server" />
                                            <asp:Label ID="iva" CssClass="etiquetas_lista_inventario" runat="server" Text="Modelo">Aplicar iva el producto</asp:Label>
                                        </li>
                                        <li>
                                            <asp:LinkButton ID="boton_ingresar_producto" runat="server" ToolTip="Agregar producto al inventario" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_verde" OnClick="boton_ingresar_producto_Click" OnClientClick="activar_boton_alta_productos_oculto();">Guardar</asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="separador_altas"></div>
                        </asp:Panel>
                        <asp:Panel ID="panel_subir_fotografia" runat="server" CssClass="ui-widget-content panel_sobrepuesto_foto_inventario"
                            Style="text-decoration: none;" Visible="True">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_subir_fotografia" CssClass="titulos_ventanas" runat="server" Text="Subir fotografia"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_subir_fotografia" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_subir_fotografia_Click"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="central">
                                <ul class="lista_inventario mover_izquierda_20">
                                    <li>
                                        <p class="titulo_subir_fotografia">
                                            <asp:Label ID="etiqueta_subir_archivo" CssClass="etiquetas_lista_inventario" runat="server" Text="Subir fotografia del producto"></asp:Label>
                                            <asp:Label ID="icono_adjuntar" runat="server" CssClass="icono_adjuntar_fotografia"><i class="fa fa-cloud-upload"></i></asp:Label>
                                            <asp:Label ID="Throbber" runat="server" Style="display: none" CssClass="adjuntando_fotografia"><i class="fa fa-spinner fa-spin fa-lg"></i></asp:Label>
                                        </p>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="seleccion_archivo" runat="server" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_verde sin_cursor">Seleccionar archivo</asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                            <asp:AsyncFileUpload ID="archivo" runat="server" CssClass=""
                                Visible="True" OnClientUploadError="uploadError" OnClientUploadStarted="StartUpload"
                                OnClientUploadComplete="UploadComplete" CompleteBackColor="Transparent" ErrorBackColor="Red"
                                ThrobberID="Throbber" OnUploadedComplete="archivo_UploadedComplete" UploadingBackColor="Transparent"
                                ToolTip="Subir fotografia del producto asociado" />
                        </asp:Panel>
                        <asp:Panel ID="panel_cambiar_todos_precios" runat="server" CssClass="ui-widget-content panel_sobrepuesto_altas"
                            Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_cambiar_todos_precios" CssClass="titulos_ventanas" runat="server" Text="Cambio de precios generales"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_cambiar_todos_precios" runat="server" OnClick="boton_cerrar_cambiar_precios_tipo_Click" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="central">
                                <div class="izquierdo_mitad">
                                    <ul class="lista_inventario mover_izquierda_20">
                                        <li>
                                            <p>
                                                <asp:Label ID="proveedor_precios" CssClass="etiquetas_lista_inventario" runat="server" Text="Proveedor" Visible="True"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_proveedores_precios" runat="server" CssClass="caja_lista_inventario" AutoPostBack="True" Visible="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="categoria_precios" CssClass="etiquetas_lista_inventario" runat="server" Text="Categoria" Visible="True"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_categoria_precios" Visible="True" runat="server" CssClass="caja_lista_inventario" OnSelectedIndexChanged="lista_categoria_precios_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="subcategoria_precios" CssClass="etiquetas_lista_inventario" runat="server" Text="Subcategoria" Visible="True"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_subcategoria_precios" Visible="True" runat="server" CssClass="caja_lista_inventario" OnSelectedIndexChanged="lista_subcategoria_precios_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="categoria_a_precios" CssClass="etiquetas_lista_inventario" runat="server" Visible="True" Text="Tipo de producto"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_categoria_a_precios" runat="server" CssClass="caja_lista_inventario" Visible="True" OnSelectedIndexChanged="lista_categoria_a_precios_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <asp:LinkButton ID="boton_guardar_cambios" runat="server" ToolTip="Guardar modificacion de precios" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_verde" OnClick="boton_guardar_cambios_Click">Guardar</asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                                <div class="derecho_mitad">
                                    <asp:GridView ID="tabla_precios_todos" runat="server" CssClass="tabla" DataSource='<%# datos_precios_todos() %>'
                                        ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" Visible="True" PagerSettings-Visible="false">
                                        <PagerSettings Visible="False" />
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Precio" DataField="tipo_precio" Visible="True"></asp:BoundField>
                                            <asp:BoundField HeaderText="% Anterior" DataField="porcentaje"></asp:BoundField>
                                            <asp:TemplateField HeaderText="% Nuevo" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="nuevo_porcentaje" CssClass="cantidad"
                                                        MaxLength="10" runat="server" Width="80px" Text='<%#Eval("porcentaje") %>' onkeypress="return numeros_punto(event);"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="separador_altas"></div>
                        </asp:Panel>
                        <asp:Panel ID="panel_desactivacion_productos" runat="server" CssClass="ui-widget-content panel_sobrepuesto_altas"
                            Visible="False">
                            <div class="separador_altas s_azul">
                                <asp:Label ID="titulo_desactivacion_productos" CssClass="titulos_ventanas" runat="server" Text="Desactivar productos"></asp:Label>
                                <asp:LinkButton ID="boton_cerrar_desactivar_productos" runat="server" CssClass="boton_cerrar" OnClick="boton_cerrar_desactivar_productos_Click"><i class="fa fa-close"></i></asp:LinkButton>
                            </div>
                            <div class="panel_procesar">
                                <asp:Label ID="etiqueta_tipo_productos" runat="server" CssClass="etiquetas_barra_superior" Text="Tipos de producto"></asp:Label>
                                <asp:RadioButton ID="con_venta" runat="server" Text="Con ventas" AutoPostBack="True" GroupName="venta" OnCheckedChanged="con_venta_CheckedChanged"/>
                                <asp:RadioButton ID="sin_venta" Text="Sin ventas" runat="server" AutoPostBack="True" GroupName="venta" OnCheckedChanged="sin_venta_CheckedChanged"/>
                                <asp:TextBox type="text" ID="fecha_desactivacion" Enabled="false" runat="server" CssClass="caja_buscar" placeholder="Selecciona una fecha"></asp:TextBox>
                                <asp:LinkButton ID="boton_desactivar" CssClass="controles_tablas b_rojo chico" runat="server" OnClick="desactivar_Click" ToolTip="Desactivar productos para esta selección" Style="text-decoration: none;"><i class="fa fa-power-off"></i></asp:LinkButton>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panel_no_resultados_busqueda" runat="server" CssClass="no_resultados"
                            Visible="False">
                            <asp:Label ID="leyenda" runat="server"
                                CssClass="texto">No se encontraron resultados relacionados con esta busqueda&nbsp;<i class="fa fa-frown-o fa-2x rojo"></i></asp:Label>
                        </asp:Panel>
                        <div class="limitado">
                            <asp:Panel ID="panel_inventario" runat="server" Visible="False">
                                <asp:GridView ID="tabla_inventario" runat="server" AutoGenerateColumns="False" OnRowCommand="tabla_inventario_RowCommand"
                                    DataKeyNames="codigo_proveedor" DataSource='<%# datos_inventario() %>' CssClass="tabla"
                                    ShowHeaderWhenEmpty="True" PageSize="50">
                                    <PagerSettings Visible="False" />
                                    <HeaderStyle CssClass="GridHeader" />
                                    <PagerSettings Visible="False" />
                                    <RowStyle CssClass="GridRow" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                        <asp:BoundField HeaderText="Modelo" DataField="modelo"></asp:BoundField>
                                        <asp:BoundField HeaderText="Proveedor" DataField="proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Costo" DataField="costo" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cant." DataField="cantidad"></asp:BoundField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="modificar" runat="server" CausesValidation="False" ToolTip="Modificar precios y costo del producto"
                                                    CommandName="modificar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="surtir" runat="server" CausesValidation="False" ToolTip="Modificar cantidades del producto"
                                                    CommandName="surtir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-tasks controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="sacar" runat="server" CausesValidation="False" ToolTip="Sacar producto del inventario"
                                                    CommandName="Sacar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-mail-forward controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="activacion" runat="server" CausesValidation="False" ToolTip="Desactivar producto"
                                                    CommandName="activacion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-times controles_tablas"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </div>
                    <asp:Button ID="oculto_si" runat="server" Text="Introducir" Style="visibility: hidden" OnClick="boton_oculto_si_Click" />
                    <asp:Button ID="introducir" runat="server" Text="Introducir" Style="visibility: hidden" OnClick="introducir_Click" />
                    <asp:Button ID="actualizar" runat="server" OnClick="actualizar_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_surtir" runat="server" OnClick="boton_oculto_surtir_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_guardar" runat="server" OnClick="boton_oculto_guardar_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_sacar" runat="server" OnClick="boton_oculto_sacar_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_actualizar" runat="server" OnClick="boton_oculto_actualizar_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_transferir" runat="server" OnClick="boton_oculto_transferir_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_ingresar_producto" runat="server" OnClick="boton_oculto_ingresar_producto_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_guardar_cambios" runat="server" OnClick="boton_oculto_guardar_cambios_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_buscar" runat="server" OnClick="boton_oculto_buscar_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_back_orders" runat="server" OnClick="boton_oculto_back_orders_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_activacion" runat="server" OnClick="boton_oculto_activacion_Click" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_transferir_inventario" runat="server" OnClick="boton_oculto_transferir_inventario_Click" Style="visibility: hidden" />
                    <asp:Button ID="boton_oculto_sacar_inventario" runat="server" OnClick="boton_oculto_sacar_inventario_Click" Style="visibility: hidden" />
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="tabla_inventario" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="tabla_cantidades" EventName="RowCommand" />
                <asp:AsyncPostBackTrigger ControlID="tipo_busqueda" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="lista_proveedores_producto" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="lista_categoria" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="caja_unidad_medida" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="actualizar" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
