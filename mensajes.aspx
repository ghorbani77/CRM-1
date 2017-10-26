<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/mensajes.aspx.cs" Inherits="mensajes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    function convertir_mover() {
        $("#panel_redactar").draggable();
        $("#panel_mensaje").draggable();
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje_mostrar');
            boton.click();
        }, 1800);
    }
    function seleccion() {
        var boton = document.getElementById('boton_oculto_seleccion');
        boton.click();
    }
    function carpetas() {
        var boton = document.getElementById('boton_oculto_carpetas');
        boton.click();
    }
    function abrir_correo() {
        var boton = document.getElementById('boton_oculto_mensaje');
        boton.click();
    }
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_enviar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_enviar');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_responder') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_responder');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_mover_recibidos') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_mover_recibidos');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_eliminar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_eliminar');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_eliminar_definitivamente') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_eliminar_definitivamente');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_spam') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_spam');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_archivar') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_archivar');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
            }, 300);
        }
    }
    (function () {
        var mouse = false, teclado = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            teclado = true;
        };
        setInterval(function () {
            if (!mouse && !teclado) {

            }
            else {
                mouse = false;
                teclado = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 3000);
    })()
    function abrir() {
    }
    onload = abrir();
    function descargar() {
        var boton = document.getElementById('boton_download');
        boton.click();
    }
    function descargar_all() {
        var boton = document.getElementById('boton_download_all');
        boton.click();
    }
    function salir() {
        window.close();
    }
    function deshabilitar_controles() {

        form = document.forms['formulario_mensajes'];
        for (i = 0; elemento = form.elements[i]; i++) {
            elemento.disabled = true;
        }
    }
    function adjuntar() {
        var boton = document.getElementById('boton_adjuntar');
        boton.click();
    }
    function uploadError(sender, args) {
        document.getElementById('mensaje_imagen').innerText = args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>";
    }
    function StartUpload(sender, args) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        actualizar = 0;
    }
    function UploadComplete(sender, args) {
        setTimeout(function () {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
        }, 1000);
        adjuntar();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Correo</title>
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
    <form id="formulario_mensajes" runat="server" enctype="multipart/form-data" method="post">
        <asp:ScriptManager ID="manejador_scripts" runat="server">
        </asp:ScriptManager>
        <div class="principal">
            <div class="barra_superior">
                <div class="espacio_logotipo">
                    <img class="logotipo" src="img/inklaser.jpeg" />
                </div>
                <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Correo</asp:Label>
                <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                    OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
            </div>
            <div class="contenido">
                <asp:Panel ID="mensajes_correo" runat="server" CssClass="mensajes_cotizacion" Visible="False">
                    <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                        <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                    </asp:Panel>
                    <asp:Label ID="mensaje_mostrar" CssClass="mensaje" runat="server" Text="Error"></asp:Label>
                    <asp:LinkButton ID="cerrar_mensaje_mostrar" CssClass="cerrar_mensajes" runat="server" OnClick="cerrar_mensajes_mostrar_Click"><i class="fa fa-close"></i></asp:LinkButton>
                </asp:Panel>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>




                <div class="izquierdo_correo">
                    <asp:UpdatePanel ID="panel_actualizacion_indicadores" runat="server">
                        <ContentTemplate>
                            <div class="separador_altas"></div>
                            <div class="separador_altas"></div>
                            <asp:LinkButton ID="boton_recibidos" runat="server" CssClass="botones_correo"
                                ToolTip="Mensajes Recibidos" OnClick="boton_recibidos_Click">
                                Recibidos<asp:Label ID="numero_recibidos" CssClass="indicadores_correo" runat="server" Text="1"></asp:Label>
                            </asp:LinkButton>
                            <asp:LinkButton ID="boton_importantes" runat="server" Text="Importante"
                                ToolTip="Mensajes Importantes" CssClass="botones_correo"
                                OnClick="boton_importantes_Click">
                                Importantes<asp:Label ID="numero_importantes" CssClass="indicadores_correo" runat="server" Text="1"></asp:Label>
                            </asp:LinkButton>
                            <asp:LinkButton ID="boton_enviados" runat="server" Text="Enviados"
                                ToolTip="Mensajes Enviados" CssClass="botones_correo"
                                OnClick="boton_enviados_Click">
                                Enviados<asp:Label ID="numero_enviados" CssClass="indicadores_correo" runat="server" Text="1"></asp:Label>
                            </asp:LinkButton>
                            <asp:LinkButton ID="boton_no_deseados" runat="server" Text="Separar"
                                ToolTip="Mensajes agrupados" CssClass="botones_correo"
                                OnClick="boton_no_deseados_Click">
                                Archivados<asp:Label ID="numero_separados" CssClass="indicadores_correo" runat="server" Text="1"></asp:Label>
                            </asp:LinkButton>
                            <asp:LinkButton ID="boton_papelera" runat="server" Text="Papelera"
                                ToolTip="Papelera" CssClass="botones_correo"
                                OnClick="boton_papelera_Click">
                                Papelera<asp:Label ID="numero_papelera" CssClass="indicadores_correo" runat="server" Text="1"></asp:Label>
                            </asp:LinkButton>


                            <asp:Panel ID="panel_botones_bandeja_entrada" runat="server" CssClass="botones_menu_mensajes_recibidos" Visible="true">
                                <asp:LinkButton ID="boton_adjuntar" runat="server" Style="text-decoration: none; visibility: hidden" CssClass="botones_bandeja_entrada" OnClick="boton_adjuntar_Click"><i class="fa fa-refresh"></i></asp:LinkButton>
                            </asp:Panel>
                            <asp:LinkButton ID="boton_oculto_carpetas" runat="server" OnClick="boton_oculto_carpetas_Click"
                                Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <div class="derecho_correo">
                    <asp:UpdatePanel ID="panel_actualizaciones_botones" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                                <asp:Panel ID="panel_confirmar" runat="server" CssClass="panel_confirmacion">
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
                            <div class="panel_procesar_cotizacion borde">
                                <div class="panel_procesar desplazar_izquierda">
                                    <asp:LinkButton ID="boton_redactar" runat="server" ToolTip="Redactar un nuevo mensaje" Style="text-decoration: none" CssClass="botones_cotizaciones b_turqueza" OnClick="boton_redactar_Click"><i class="fa fa-pencil-square-o"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_seleccion" runat="server" ToolTip="Seleccionar todos" CssClass="botones_cotizaciones b_azul" OnClick="boton_seleccion_Click"><i class="fa fa-check-square-o fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_eliminar" runat="server" ToolTip="Reciclar" Style="text-decoration: none" CssClass="botones_cotizaciones b_rojo" OnClick="boton_eliminar_Click"><i class="fa fa-recycle fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_eliminar_definitivamente" runat="server" ToolTip="Eliminar mensajes definitivamente" Style="text-decoration: none" CssClass="botones_cotizaciones b_rojo" OnClick="boton_eliminar_definitivamente_Click"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_mover_recibidos" runat="server" ToolTip="Mover a recibidos" Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_mover_recibidos_Click"><i class="fa fa-inbox"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_archivar" runat="server" ToolTip="Archivar" Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_archivar_Click"><i class="fa fa-archive fa-lg"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_spam" runat="server" ToolTip="Agrupar mensajes" Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClick="boton_spam_Click"><i class="fa fa-cubes"></i></asp:LinkButton>
                                </div>
                            </div>
                            <asp:Panel ID="panel_redactar" runat="server" Visible="False" CssClass="ui-widget-content panel_sobrepuesto_enviar">
                                <div class="separador_altas s_azul">
                                    <asp:LinkButton ID="cerrar_redactar" ToolTip="Cerrar" runat="server" CssClass="boton_cerrar" OnClick="cerrar_redactar_Click"><i class="fa fa-close"></i></asp:LinkButton>
                                </div>
                                <div class="central">
                                    <div>
                                        <asp:RadioButton ID="opcion_contacto" runat="server" AutoPostBack="True" GroupName="opciones"
                                            OnCheckedChanged="opcion_contacto_CheckedChanged" />
                                        <asp:Label ID="contacto" runat="server" CssClass="etiquetas_lista_inventario" Text="Contacto" Visible="True"></asp:Label>
                                        <asp:RadioButton
                                            ID="opcion_grupos" runat="server" AutoPostBack="True" GroupName="opciones"
                                            OnCheckedChanged="opcion_grupos_CheckedChanged" />
                                        <asp:Label ID="grupo" runat="server" CssClass="etiquetas_lista_inventario" Text="Grupo" Visible="True"></asp:Label>
                                    </div>
                                    <ul class="lista_inventario">
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_enviar_a" runat="server" CssClass="etiquetas_lista_inventario" Text="Enviar a" Visible="True"></asp:Label>
                                            </p>
                                            <asp:DropDownList ID="lista_vendedores" runat="server" CssClass="caja_lista_inventario"></asp:DropDownList>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_asunto" runat="server" CssClass="etiquetas_lista_inventario" Text="Asunto" Visible="True"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_asunto" runat="server" CssClass="caja_lista_inventario" MaxLength="100" onfocus="return posicionar_cursor(this.id)"></asp:TextBox>
                                        </li>
                                        <li>
                                            <p>
                                                <asp:Label ID="etiqueta_mensaje" runat="server" CssClass="etiquetas_lista_inventario" Text="Mensaje" Visible="True"></asp:Label>
                                            </p>
                                            <asp:TextBox ID="caja_mensaje" runat="server" CssClass="caja_descripciones"
                                                MaxLength="4000" TextMode="MultiLine" onfocus="return posicionar_cursor(this.id)"></asp:TextBox>
                                        </li>



                                        <li>
                                            <asp:ListBox ID="caja_adjuntos" runat="server" CssClass="caja_descripciones" Height="150px"
                                                SelectionMode="Single"></asp:ListBox>
                                        </li>
                                    </ul>
                                    <ul class="lista_inventario">
                                        <li>
                                            <asp:LinkButton ID="seleccion_archivo" runat="server" Style="text-decoration: none;" CssClass="botones_requisiciones_chicos b_verde"><i class="fa fa-cloud-upload"></i></asp:LinkButton>
                                            <asp:LinkButton ID="boton_enviar" runat="server" ToolTip="Enviar mensaje" Style="text-decoration: none" CssClass=" botones_requisiciones_chicos b_verde sobre" OnClientClick="activar_boton_fantasmita();" OnClick="boton_enviar_Click"><i class="fa fa-send"></i></asp:LinkButton>
                                            <asp:LinkButton ID="eliminar_adjunto" runat="server" ToolTip="Eliminar archivo adjunto" Visible="True"
                                                Style="text-decoration: none" OnClick="boton_eliminar_adjunto_Click" CssClass="botones_requisiciones_chicos b_rojo sobre"><i class="fa fa-trash"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                    <asp:AsyncFileUpload ID="archivo" runat="server" CssClass="" Visible="True"
                                        onfocus="seguridad();"
                                        OnClientUploadError="uploadError"
                                        OnClientUploadStarted="StartUpload"
                                        OnClientUploadComplete="UploadComplete"
                                        CompleteBackColor="Transparent"
                                        ErrorBackColor="Red"
                                        ThrobberID="Throbber"
                                        OnUploadedComplete="archivo_UploadedComplete"
                                        UploadingBackColor="Transparent" ToolTip="Adjuntar archivos al correo" />
                                </div>
                            </asp:Panel>


                            <asp:Panel ID="panel_mensaje" runat="server" Visible="false" CssClass="ui-widget-content panel_sobrepuesto_enviar">
                                <div class="separador_altas s_azul">
                                    <asp:LinkButton ID="boton_cerrar_mensajes" ToolTip="Cerrar" runat="server" CssClass="boton_cerrar" OnClick="cerrar_mensajes_Click"><i class="fa fa-close"></i></asp:LinkButton>
                                </div>
                                <div class="central">
                                    <ul class="lista_inventario">
                                        <li>
                                            <p>
                                                <asp:Label ID="asunto" runat="server" CssClass="etiquetas_lista_inventario negro_chico"><i class="fa fa-comment-o"></i></asp:Label>
                                            </p>
                                        </li>
                                        <li>
                                            <asp:Label ID="remitente" runat="server" CssClass="etiquetas_lista_inventario" Text="De:"></asp:Label>
                                            <asp:Label ID="caja_remitente" CssClass="etiquetas_lista_inventario" runat="server" Text=""></asp:Label>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="contenido_mensaje" runat="server"
                                                CssClass="caja_descripciones" Enabled="False" TextMode="MultiLine"
                                                onfocus="return posicionar_cursor(this.id);" Height="200px"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:TextBox ID="caja_mensaje_responder" runat="server"
                                                CssClass="caja_descripciones" Enabled="True" TextMode="MultiLine"
                                                MaxLength="4000" onfocus="return posicionar_cursor(this.id);"></asp:TextBox>
                                        </li>
                                        <p>
                                            <asp:Label ID="etiqueta_adjuntos" CssClass="etiquetas_lista_inventario" runat="server">Archivos adjuntos</asp:Label>
                                        </p>
                                        <li>
                                            <asp:ListBox ID="archivos_adjuntos_correo" runat="server" CssClass="caja_descripciones" Height="150px"
                                                SelectionMode="Single" Enabled="True"></asp:ListBox>
                                        </li>
                                    </ul>
                                    <asp:LinkButton ID="boton_responder" runat="server" ToolTip="Responder"
                                        Style="text-decoration: none" CssClass="botones_requisiciones_chicos b_verde"
                                        OnClick="boton_responder_Click"><i class="fa fa-reply"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_descargar_adjuntos" runat="server" ToolTip="Descargar archivo adjunto seleccionado" OnClick="descargar_adjunto_Click"
                                        Style="text-decoration: none" CssClass="botones_requisiciones_chicos b_azul"><i class="fa fa-cloud-download"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_descargar_todos_adjuntos" runat="server" ToolTip="Descargar todos los archivos adjuntos" OnClick="descargar_adjuntos_Click"
                                        Style="text-decoration: none" CssClass="botones_requisiciones_chicos b_morado"><i class="fa fa-download"></i></asp:LinkButton>
                                </div>
                            </asp:Panel>

                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="archivo" EventName="UploadedComplete" />
                            <asp:AsyncPostBackTrigger ControlID="boton_adjuntar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_mover_recibidos" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_archivar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="panel_actualizacion_bandeja_entrada" runat="server">
                        <ContentTemplate>

                            <div class="limitado">
                                <asp:Panel ID="panel_sin_mensajes" runat="server" CssClass="no_resultados bajar" Visible="false">
                                    <asp:Label ID="leyenda" runat="server"
                                        CssClass="texto">Carpeta vacia&nbsp;&nbsp;<i class="fa fa-envelope fa-2x rojo"></i></asp:Label>
                                </asp:Panel>
                                <asp:Panel ID="panel_bandeja" runat="server" CssClass="mail correo" Visible="true">
                                    <asp:GridView ID="bandeja" runat="server" CssClass="tabla"
                                        DataSource='<%# datos_mensajes() %>' AutoGenerateColumns="False"
                                        DataKeyNames="id_mensaje"
                                        OnRowCommand="bandeja_RowCommand"
                                        PagerSettings-Visible="false" ShowHeader="True">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="true" />
                                        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <HeaderStyle CssClass="cabecera_columna_clientes columna_boton" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="checar" runat="server" CssClass="checado-mensaje" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="" DataField="id_mensaje"></asp:BoundField>
                                            <asp:BoundField HeaderText="Envia" DataField="usuario_envia"></asp:BoundField>
                                            <asp:BoundField HeaderText="Mensaje" DataField="mensaje"></asp:BoundField>
                                            <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:Label ID="indicador" runat="server" Text='<%#Eval("indicador") %>' CssClass="indicador"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemStyle CssClass="renglon" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="leer" runat="server" CausesValidation="False" ToolTip="Leer mensaje" CommandName="leer" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <asp:Timer ID="reloj" runat="server" Interval="3000" OnTick="reloj_Tick">
                            </asp:Timer>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="reloj" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <asp:LinkButton ID="boton_oculto_mensaje" runat="server" OnClick="boton_oculto_mensaje_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_spam" runat="server" OnClick="boton_oculto_spam_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_archivar" runat="server" OnClick="boton_oculto_archivar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_eliminar" runat="server" OnClick="boton_oculto_eliminar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_responder" runat="server" OnClick="boton_oculto_responder_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_mover_recibidos" runat="server" OnClick="boton_oculto_mover_recibidos_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_enviar" runat="server" OnClick="boton_oculto_enviar_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_seleccion" runat="server" OnClick="boton_oculto_seleccion_Click"
                    Style="text-decoration: none; display: none"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_si" OnClick="boton_oculto_si_Click" runat="server"
                    Enabled="true" CssClass="boton_procesar button small" Style="text-decoration: none;
                    visibility: hidden"></asp:LinkButton>
            </div>
        </div>
        <asp:LinkButton ID="boton_download" runat="server" Style="text-decoration: none; visibility: hidden" CssClass="botones_bandeja_entrada" OnClick="boton_download_Click"><i class="fa fa-refresh"></i></asp:LinkButton>
        <asp:LinkButton ID="boton_download_all" runat="server" Style="text-decoration: none; visibility: hidden" CssClass="botones_bandeja_entrada" OnClick="boton_download_all_Click"><i class="fa fa-refresh"></i></asp:LinkButton>
    </form>
</body>
</html>
