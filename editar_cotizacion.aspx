<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/editar_cotizacion.aspx.cs"
    Inherits="editar_cotizacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script type="text/javascript">
    var imprimir = null, imprimir_distribuidor = null, imprimir_requisicion = null, imprimir_ordenes = null, imprimir_pedidos = null, imprimir_ventas = null;

    function abrir_imprimir_pedidos() {
        if (!imprimir_pedidos || imprimir_pedidos.closed) {
            imprimir_pedidos = window.open("imprimir_pedidos.aspx", "Imprimir pedidos", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_pedidos.focus();
        }
        convertir_mover();
    }
    function cerrar_mensaje_automatico() {
        setTimeout(function () {
            cerrar_mensaje();
        }, 3000);
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
        $('#icono_adjuntar').css('display', 'inline');
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
    //genera pdf requisicion
    function abrir_imprimir_ordenes() {


        if (!imprimir_ordenes || imprimir_ordenes.closed) {
            imprimir = window.open("imprimir_ordenes.aspx", "Imprimir ordenes", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_ordenes.focus();
        }
        convertir_mover();
    }

    function abrir_imprimir_ventas() {
        if (!imprimir_ventas || imprimir_ventas.closed) {
            imprimir = window.open("imprimir_ventas.aspx", "Imprimir ventas", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_ventas.focus();
        }
        convertir_mover();
    }

    function abrir_imprimir_requisicion() {
        if (!imprimir_requisicion || imprimir_requisicion.closed) {
            imprimir_requisicion = window.open("imprimir_requisicion.aspx", "Imprimir Requisicion", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_requisicion.focus();
        }
        convertir_mover();
    }

    function abrir_imprimir() {
        if (!imprimir || imprimir.closed) {
            imprimir = window.open("imprimir_cotizacion.aspx", "Imprimir", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir.focus();
        }
        convertir_mover();
    }

    function abrir_imprimir_distribuidor() {
        if (!imprimir_distribuidor || imprimir_distribuidor.closed) {
            imprimir_distribuidor = window.open("imprimir_cotizacion_distribuidor.aspx", "Imprimir Distribuidor", "width=1200, height=700,scrollbars = yes,resizable = false");
        }
        else {
            imprimir_distribuidor.focus();
        }
        convertir_mover();
    }

    function cerrar_ventanas() {
        if (imprimir && !imprimir.closed) {
            imprimir = window.open("about:blank", "Imprimir");
            imprimir.close();
        }
        if (imprimir_distribuidor && !imprimir_distribuidor.closed) {
            imprimir_distribuidor = window.open("about:blank", "Imprimir Distribuidor");
            imprimir_distribuidor.close();
        }
        //cerrar requisicion
        if (imprimir_requisicion && !imprimir_requisicion.closed) {
            imprimir_requisicion = window.open("about:blank", "Imprimir requisicion");
            imprimir_requisicion.close();
        }
        //cerrar requisicion
        if (imprimir_ordenes && !imprimir_ordenes.closed) {
            imprimir_ordenes = window.open("about:blank", "Imprimir ordenes");
            imprimir_ordenes.close();
        }
        if (imprimir_pedidos && !imprimir_pedidos.closed) {
            imprimir_pedidos = window.open("about:blank", "Imprimir pedidos");
            imprimir_pedidos.close();
        }
        if (imprimir_ventas && !imprimir_ventas.closed) {
            imprimir_ventas = window.open("about:blank", "Imprimir ventas");
            imprimir_ventas.close();
        }
    }

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
    onload = abrir();
    function contenido_eliminado() {
        alert('El contenido fue eliminado exitosamente');
    }
    function carrito_vacio() {
        alert('El carrito de compra se encuentra vacio no es posible realizar cotizacion');
    }
    function convertir_mover() {
        $("#panel_actividad").draggable();
        $("#panel_seguimiento").draggable();
        $("#panel_confirmacion").draggable();
        $("#panel_comentario").draggable();
        $("#panel_confirmacion_pedido").draggable();
    }
    function cotizacion_vacia() {
        alert('La cotizacion se encuentra vacia no es posible realizar autorizacion');
    }
    function articulos_excedidos() {
        alert('Error el numero de articulos permitidos ah sido alcanzado');
    }
    function cargar(boton) {
        //  $(".ui-dialog").hide();
        //  $('#panel_atender_requisicion').css('display', 'none');
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_actualizar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_actualizar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_cotizar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_cotizar');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_procesar_pedido') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
            }, 600);
        }
        if (boton.toString() == 'boton_si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_enviar_si');
                boton.click();
            }, 600);
        }
    }
    function salir() {
        cerrar_ventanas();
        window.close();
    }
    function pagos() {
        window.open("metodo_pago.aspx", "_blank", "toolbar=0,location=0,menubar=0", "scrollbars=yes");
    }
    function panel_sobrepuesto_actividad() {
        $("#panel_actividad").dialog({
            width: 'auto',
            title: "Actividad de la cotización"
        });
    }
    function panel_sobrepuesto_enviar() {
        $("#panel_confirmacion").dialog({
            width: "auto",
            title: "Enviar cotización"
        });
    }
    function panel_sobrepuesto_seguimiento() {
        $("#panel_seguimiento").dialog({
            width: "auto",
            title: "Seguimiento de cotización"
        });
    }

    function cargar_clientes() {
        var clientes = new Array();
        var lista = document.getElementById('lista_clientes');
        for (i = 0; i < lista.options.length; i++) {
            clientes[i] = lista.options[i].value;
        }
        $('#caja_clientes').autocomplete({
            source: function (request, response) {
                var results = $.ui.autocomplete.filter(clientes, request.term);
                response(results.slice(0, 10));
            },
            select: function (evento, objeto) {
                var a = objeto.item.value;
                $("#lista_clientes").val(a);
                setTimeout(function () { __doPostBack("<% =lista_clientes.UniqueID %>", objeto.item.value); }, 1);
            },
            selectFirst: true,
            minLength: 1
        });
    }
    function pageLoad() {
        convertir_mover();
        cargar_clientes();
        cargar_cliente_caja();
    }
    function cargar_cliente_caja() {
        var b = $("#lista_clientes").val();
        if (b != "Seleccionar") {
            $("#caja_clientes").val(b);
        }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cotizaciones - Inklaser</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formulario" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizacion" runat="server">
            <ContentTemplate>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>
                <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                    <asp:Panel ID="panel_confirmacion_desicion" runat="server" CssClass="panel_confirmacion">
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
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Cotizacion</asp:Label>
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
                    <asp:Panel ID="panel_confirmacion_pedido" runat="server" CssClass="ui-widget-content panel_sobrepuesto_enviar" Style="visibility: hidden"
                        Visible="True">
                        <div class="separador_altas s_azul">
                            <asp:Label ID="titulo_confirmar_pedido" CssClass="titulos_ventanas" runat="server" Text="Confirmacion de pedido"></asp:Label>
                            <asp:LinkButton ID="boton_cerrar_confirmacion_pedido" runat="server" CausesValidation="False" OnClick="cerrar_panel_confirmacion_pedido_Click"
                                ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="panel_procesar">
                            <div class="central">
                                <ul class="lista_inventario">
                                    <li>
                                        <p>
                                            <asp:Label ID="e_tipo_venta" CssClass="etiquetas_lista_inventario" runat="server" Text="Tipo de venta"></asp:Label>
                                        </p>
                                        <asp:DropDownList ID="lista_tipos_venta" runat="server" CssClass="caja_lista_inventario_90" AutoPostBack="True"></asp:DropDownList>
                                    </li>
                                    <li>
                                        <p>
                                            <asp:Label ID="e_metodo_pago" CssClass="etiquetas_lista_inventario" runat="server" Text="Metodo de pago"></asp:Label>
                                        </p>
                                        <asp:DropDownList ID="lista_metodos_pago" runat="server" CssClass="caja_lista_inventario_90" AutoPostBack="True"></asp:DropDownList>
                                    </li>
                                    <li>
                                        <p>
                                            <asp:Label ID="e_orden_compra" runat="server" CssClass="etiquetas_lista_inventario" Text="Incluir orden de compra"></asp:Label><asp:CheckBox ID="incluir_orden_compra" AutoPostBack="true" Checked="False" runat="server" OnCheckedChanged="incluir_orden_compra_CheckedChanged" />
                                            <asp:LinkButton ID="boton_procesar_pedido" OnClick="procesar_pedido_Click" runat="server" ToolTip="Procesar pedido" Style="text-decoration: none;" CssClass="botones_cotizacion_chicos_separado b_verde"><i class="fa fa-check-circle-o"></i></asp:LinkButton>
                                        </p>
                                        <asp:TextBox ID="caja_clave_orden_compra" MaxLength="100" Style="text-transform: uppercase" Enabled="false"  runat="server" CssClass="caja_lista_inventario_90"></asp:TextBox>
                                        
                                    </li>
                                </ul>

                            </div>
                            <div class="central" id="panel_subir_orden_compra" runat="server" Style="visibility: hidden">
                                <ul class="lista_inventario mover_izquierda_20">
                                    <li>
                                        <p class="titulo_subir_fotografia">
                                            <asp:Label ID="etiqueta_subir_archivo" CssClass="etiquetas_lista_inventario" runat="server" Text="Subir orden de compra"></asp:Label>
                                            <asp:Label ID="icono_adjuntar" runat="server" CssClass="icono_adjuntar_fotografia"><i class="fa fa-cloud-upload"></i></asp:Label>
                                            <asp:Label ID="Throbber" runat="server" Style="display: none" CssClass="adjuntando_fotografia"><i class="fa fa-spinner fa-spin fa-lg"></i></asp:Label>
                                        </p>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="seleccion_archivo" runat="server" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_morado sin_cursor">Seleccionar archivo</asp:LinkButton>                                    
                                    </li>
                                </ul>
                                <asp:AsyncFileUpload ID="archivo" runat="server" CssClass=""
                                Visible="True" OnClientUploadError="uploadError" OnClientUploadStarted="StartUpload"
                                OnClientUploadComplete="UploadComplete" CompleteBackColor="Transparent" ErrorBackColor="Red"
                                ThrobberID="Throbber" OnUploadedComplete="archivo_UploadedComplete" UploadingBackColor="Transparent"
                                ToolTip="Subir orden de compra" />
                            </div>                          
                        </div>
                        <div class="separador_altas"></div>
                    </asp:Panel>
                    <asp:Panel ID="panel_confirmacion" runat="server" CssClass="ui-widget-content panel_sobrepuesto_enviar"
                        Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:LinkButton ID="cerrar_panel_envio" runat="server" CausesValidation="False" OnClick="cerrar_panel_envio_Click"
                                ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="panel_procesar">
                            <asp:Label ID="etiqueta_comentarios" runat="server" Text="Comentarios" CssClass="comentarios_cotizacion"></asp:Label>
                            <asp:TextBox ID="caja_comentarios" runat="server" CssClass="caja_comentarios" TextMode="MultiLine"></asp:TextBox>

                            <asp:Label ID="label_correo" runat="server" Text="Enviar a:" CssClass="etiquetas_barra_superior " Style="margin-bottom: 25px;"></asp:Label>
                            <asp:DropDownList ID="correo_dropdown" runat="server" CssClass="caja_lista"></asp:DropDownList>

                        </div>
                        <div class="separador_altas">
                        </div>
                        <asp:LinkButton ID="boton_si" runat="server" ToolTip="Enviar cotizacion" OnClick="boton_si_enviar_Click"
                            Style="text-decoration: none;" CssClass="botones_cotizaciones_chicos aprobar"><i class="fa fa-envelope-o"></i></asp:LinkButton>
                        <div class="separador_altas">
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panel_comentario" runat="server" CssClass="ui-widget-content panel_sobrepuesto_enviar"
                        Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:LinkButton ID="boton_cerrar_comentario" runat="server" CausesValidation="False" OnClick="cerrar_panel_comentario_Click"
                                ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="panel_procesar">
                            <asp:Label ID="etiqueta_observaciones" runat="server" Text="Comentarios" CssClass="comentarios_cotizacion"></asp:Label>
                            <asp:TextBox ID="caja_observaciones" runat="server" CssClass="caja_comentarios" Width="300px" MaxLength="80" TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <div class="separador_altas">
                        </div>
                        <asp:LinkButton ID="boton_guardar_observacion" runat="server" ToolTip="Guardar" OnClick="boton_observacion_guardar_Click"
                            Style="text-decoration: none;" CssClass="botones_cotizaciones_chicos aprobar"><i class="fa fa-floppy-o"></i></asp:LinkButton>
                        <div class="separador_altas">
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panel_actividad" runat="server" CssClass="ui-widget-content panel_sobrepuesto"
                        Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:LinkButton ID="cerrar_panel_sobrepuesto" runat="server" CausesValidation="False"
                                OnClick="cerrar_panel_Click" ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="panel_procesar">
                            <div class="separador_altas">
                            </div>
                            <asp:Label ID="etiqueta_codigo_clave" CssClass="etiquetas_barra_superior" runat="server"
                                Text="Clave Cotizacion"></asp:Label>
                            <asp:TextBox ID="caja_codigo_cotizacion" runat="server" Enabled="False" CssClass="caja_buscar"></asp:TextBox>
                        </div>
                        <div class="limitado_chico">
                            <asp:GridView ID="tabla_actividad" runat="server" AutoGenerateColumns="False" CssClass="tabla"
                                DataSource='<%# datos_actividad() %>' ShowHeaderWhenEmpty="True">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Estado" DataField="status"></asp:BoundField>
                                    <asp:BoundField HeaderText="Descripcion" DataField="descripcion_status"></asp:BoundField>
                                    <asp:BoundField DataField="fecha_status" HeaderText="Fecha" SortExpression="fecha"
                                        DataFormatString="{0:g}" />
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="separador_altas">
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="panel_seguimiento" runat="server" CssClass="ui-widget-content panel_sobrepuesto"
                        Visible="False">
                        <div class="separador_altas s_azul">
                            <asp:LinkButton ID="boton_cerrar_panel_seguimiento" runat="server" CausesValidation="False"
                                OnClick="cerrar_panel_seguimiento_Click" ToolTip="Cerrar" CssClass="boton_cerrar"><i class="fa fa-close"></i></asp:LinkButton>
                        </div>
                        <div class="limitado_chico">
                            <asp:GridView ID="tabla_seguimiento" runat="server" AutoGenerateColumns="false" CssClass="tabla"
                                DataSource='<%# datos_documentos() %>' ShowHeaderWhenEmpty="false" DataKeyNames="documentos"
                                OnRowCommand="tabla_abrir_pdf_seguimiento_rowcomand">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="true" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="clave" DataField="documentos"></asp:BoundField>
                                    <asp:BoundField DataField="fecha_documentos" HeaderText="fecha" SortExpression="fecha"
                                        DataFormatString="{0:g}" />
                                    <asp:TemplateField HeaderText="PDF" ShowHeader="True">
                                        <HeaderStyle CssClass="" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="boton_pdf" runat="server" ToolTip="mostrar pdf" CommandName="abripdf"
                                                CommandArgument="<%#((GridViewRow)Container).RowIndex%>" Style="text-decoration: none"
                                                CssClass="btn btn-link"><i class="fa fa-book"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>
                    <div class="contenido">
                        <div class="separador_altas">
                        </div>
                        <div class="izquierdo">
                            <ul class="lista_cotizacion">
                                <li>
                                    <p class="texto_titulos">
                                        Vendedor
                                    </p>
                                    <asp:DropDownList ID="lista_vendedores" runat="server" CssClass="caja_lista" AutoPostBack="True"
                                        OnSelectedIndexChanged="lista_vendedores_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <p class="texto_titulos">
                                        Cliente
                                    </p>
                                    <asp:DropDownList ID="lista_clientes" runat="server" CssClass="caja_lista" AutoPostBack="True" Style="display: none;"
                                        OnSelectedIndexChanged="lista_clientes_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="caja_clientes" runat="server" CssClass="caja_lista" ToolTip="Buscar Cliente"></asp:TextBox>
                                </li>
                                <li>
                                    <p class="texto_titulos">
                                        Cliente RFC
                                    </p>
                                    <asp:TextBox ID="caja_rfc" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                </li>
                                <li>
                                    <p class="texto_titulos">
                                        Telefono
                                    </p>
                                    <asp:TextBox ID="caja_telefono" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                </li>
                                <li>
                                    <p class="texto_titulos">
                                        Correo
                                    </p>
                                    <asp:TextBox ID="caja_correo" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                </li>
                                <li>
                                    <p class="texto_titulos">
                                        Fecha
                                    </p>
                                    <asp:TextBox ID="caja_fecha" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                </li>
                                <li>
                                    <p class="texto_titulos">
                                        Dirección
                                    </p>
                                    <asp:TextBox ID="caja_direccion" runat="server" CssClass="caja_lista" Enabled="False"></asp:TextBox>
                                </li>
                            </ul>
                        </div>
                        <div class="derecho">
                            <div class="panel_procesar_cotizacion">
                                <asp:LinkButton ID="boton_cotizaciones" runat="server" OnClick="boton_cotizaciones_Click"
                                    ToolTip="Ir a las cotizaciones" Style="text-decoration: none" CssClass="botones_cotizaciones b_azul primero"><i class="fa fa-reply-all"></i></asp:LinkButton>
                                <asp:LinkButton ID="volver" runat="server" OnClick="volver_Click" ToolTip="Ir a autorizar cotizaciones"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul"><i class="fa fa-sign-out fa-rotate-left"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_agregar_producto_temporal" runat="server" ToolTip="Agregar producto no inventariado a la cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_agregar_productos_no_inventariados_cotizacion_Click"><i class="fa fa-plus-circle"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_agregar_productos_cotizacion" runat="server" ToolTip="Agregar productos a la cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_agregar_productos_cotizacion_Click"><i class="fa fa-plus"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_imprimir" runat="server" ToolTip="Imprimir cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_imprimir_Click"><i class="fa fa-print"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_enviar_cotizacion" runat="server" ToolTip="Enviar cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_enviar_Click"
                                    OnClientClick="activar_boton_fantasma_envio();"><i class="fa fa-envelope-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_editar_cotizacion" runat="server" ToolTip="Editar cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_editar_Click"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_actualizar" runat="server" ToolTip="Actualizar" OnClick="boton_actualizar_Click"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul"><i class="fa fa-refresh"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_enviar_revision" runat="server" ToolTip="Enviar a autorizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_revision_Click"><i class="fa fa-check-square-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_pedido" runat="server" ToolTip="Aprobar cotizacion y realizar pedido"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_verde" OnClick="boton_pedido_Click"><i class="fa fa-check-square"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_autorizar" runat="server" ToolTip="Autorizar cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_autorizar_Click"><i class="fa fa-check-square"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_rechazar" runat="server" ToolTip="Rechazar cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_rojo" OnClick="boton_rechazar_Click"><i class="fa fa-times"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_cotizar" runat="server" ToolTip="Cotizar" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_azul" OnClick="boton_cotizar_Click"><i class="fa fa-calculator"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_actividad" runat="server" ToolTip="Historial de actividad de la cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_actividad_Click"><i class="fa fa-history"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_factura" runat="server" ToolTip="Solicitar factura" Style="text-decoration: none"
                                    CssClass="botones_cotizaciones b_azul" OnClick="boton_factura_Click"><i class="fa fa-bars"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_seguimiento" runat="server" ToolTip="Seguimiento de cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_seguimiento_Click"
                                    Visible="False"><i class="fa fa-newspaper-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_vaciar" runat="server" OnClick="boton_vaciar_Click" ToolTip="Vaciar cotizacion"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_rojo"><i class="fa fa-trash"></i></asp:LinkButton>
                                <asp:Label CssClass="nombre_usuario tipo_texto documento" ID="documento" runat="server"></asp:Label>
                                <asp:LinkButton ID="boton_promociones" runat="server" ToolTip="Promociones" Visible="false"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_promos_Click"><i class="fa fa-gift"></i></asp:LinkButton>
                                <asp:LinkButton ID="boton_comentario" runat="server" ToolTip="Comentario" Visible="false"
                                    Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_observacion_Click"><i class="fa fa-font"></i></asp:LinkButton>
                            </div>
                            <div class="limitado">
                                <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla_cotizaciones" DataSource='<%# datos_productos() %>'
                                    OnRowCommand="tabla_productos_RowCommand" DataKeyNames="clave_carrito_cotizacion,codigo,cantidad"
                                    ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                    <HeaderStyle CssClass="GridHeader" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridRow" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Clave" DataField="clave_carrito_cotizacion" Visible="True"></asp:BoundField>
                                        <asp:BoundField HeaderText="Codigo" DataField="codigo"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Producto" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:TextBox ID="descripcion" CssClass="cantidad" onkeypress="return todos_seguridad(event);"
                                                    MaxLength="200" Style="text-transform: uppercase" runat="server" Width="500px"
                                                    Text='<%#Eval("producto") %>'></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Costo" DataField="costo" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:BoundField HeaderText="Precio Uni." DataField="precio" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="N.P" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:TextBox ID="precio_modificable" CssClass="cantidad" onkeypress="return numeros_punto(event);"
                                                    MaxLength="10" runat="server" Width="80px" Text='<%#Eval("precio_modificable","{0:N2}") %>'></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Total" DataField="precio_total" DataFormatString="{0:C}"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Cantidad" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:TextBox ID="cantidad_productos" CssClass="cantidad" onkeypress="return numeros(event);"
                                                    MaxLength="4" runat="server" Width="25px" Text='<%#Eval("cantidad") %>'></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                <asp:Panel ID="panel_eliminar" runat="server">
                                                    <asp:LinkButton ID="eliminar" runat="server" CausesValidation="False" ToolTip="Eliminar producto de la cotizacion"
                                                        CommandName="quitar_cotizacion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash controles_tablas"></i></asp:LinkButton>
                                                </asp:Panel>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="controles_cotizacion">
                                <asp:Label ID="etiqueta_productos" runat="server" CssClass="etiquetas_barra_superior"
                                    Text="No Productos"></asp:Label>
                                <asp:TextBox ID="caja_numero_productos" runat="server" CssClass="caja_chica" Enabled="False"></asp:TextBox>
                                <asp:Label ID="etiqueta_subtotal" CssClass="etiquetas_barra_superior" runat="server"
                                    Text="Subtotal"></asp:Label>
                                <asp:TextBox ID="caja_subtotal" runat="server" CssClass="caja_chica" Enabled="False"></asp:TextBox>
                                <asp:Label ID="etiqueta_iva" CssClass="etiquetas_barra_superior" runat="server" Text="Iva"></asp:Label>
                                <asp:TextBox ID="caja_iva" runat="server" CssClass="caja_chica" Enabled="False"></asp:TextBox>
                                <asp:Label ID="etiqueta_total" CssClass="etiquetas_barra_superior" runat="server"
                                    Text="Total"></asp:Label>
                                <asp:TextBox ID="caja_total" runat="server" CssClass="caja_chica" Enabled="False"></asp:TextBox>
                                <asp:LinkButton ID="boton_fantasma_actualizar" runat="server" Style="text-decoration: none; visibility: hidden"
                                    Enabled="false" CssClass="boton_actualizar"><i class="fa fa-cog fa-spin"></i></asp:LinkButton>
                            </div>
                            <div class="controles_barra">
                                <div class="barra_progreso">
                                    <div class="<%=Session["estado_cotizacion"]%>">
                                    </div>
                                </div>
                                <asp:Label ID="status_cotizacion" runat="server" Text="" CssClass="status_cotizacion"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <asp:LinkButton ID="boton_oculto_actualizar" OnClick="boton_oculto_actualizar_Click"
                        runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_cotizar" OnClick="boton_oculto_cotizar_Click" runat="server"
                        Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_si" OnClick="boton_oculto_si_Click" runat="server"
                        Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_enviar_si" OnClick="boton_oculto_enviar_si_Click"
                        runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                    <asp:LinkButton ID="boton_oculto_clientes" OnClick="lista_clientes_SelectedIndexChanged"
                        runat="server" Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lista_clientes" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="boton_oculto_clientes" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
