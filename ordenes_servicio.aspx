<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/ordenes_servicio.aspx.cs"
    Inherits="ordenes_servicio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
    function abrir_imprimir_ordenes() {
        imprimir = window.open("imprimir_orden_servicio.aspx", "Imprimir ordenes", "width=1200, height=700,scrollbars = yes,resizable = false");
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
                //window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()
    var $j = jQuery.noConflict();
    function sacalo(divname) {
        var div = document.getElementById(divname);
        var img = document.getElementById('img' + divname);
        if (div.style.display == "none") {
            div.style.display = "inline";
            $j(div).dialog({ width: 'auto' });
            img.src = "png/minus.png";
        } else {
            div.style.display = "none";
            img.src = "png/plus.png";
        }
        $j(div).on('dialogclose', function (event) {
            div.style.display = "none";
            img.src = "png/plus.png";
        });
        $j(divname).parent().appendTo($("form:first"));
    }

    $j(document).ready(function () {
        $j('input[type=radio]').change(function () {
            $j('#div_terminados').toggle();
            $j('#div_tabla_principal').toggle();
        });
    });

    function boton_oculto_imprimir(clave_servicio) {
        document.getElementById("orden_servicio").value = clave_servicio;
        document.getElementById("boton_oculto").click();
    }
    function boton_oculto_guardar(clave_servicio) {

        document.getElementById("orden_servicio").value = clave_servicio;
        document.getElementById("boton_oculto_guardar").click();
    }

    $j(function () {
        $j('.clase_falsa').change(function () {
            //var temporal = document.getElementById("tabla_ordenes_servicio_ctl02_caja_comentario").value
            var temporal = $j(this).val();
            document.getElementById("caja_comentario_oculta").value = temporal;
        });
    });
    function aviso() {
        $j('#mensaje_exito').dialog({ title: "Mensaje" });
    }

    function salir() {
        window.close();
    }

    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        ventana = 0;
        if (boton.toString() == 'si') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_si');
                boton.click();
            }, 600);
        }
    }

    function mensaje() {
        setTimeout(function () {
            //var boton = $j('#cerrar_mensaje');
            //boton.click();
            $j('#mensajess').hide();
        }, 1800);
    }
    function cerrar_mensaje() {
        $j('#mensajess').hide();
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ordenes de servicio</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'
        type='text/css'>
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formulario_ordenes_servicio" runat="server">
    <div class="principal">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panel_actualizar" runat="server" ChildrenAsTriggers="false"
            UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                    display: none">
                    <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                </asp:Panel>
                <asp:Panel ID="panel_bloqueo" runat="server" Visible="false">
                    <asp:Panel ID="panel_confirmacion" runat="server" CssClass="panel_confirmacion">
                        <p class="texto_bloqueo">
                            <asp:Label runat="server" ID="Mensaje_confirmacion" Text=""></asp:Label>&nbsp;<i
                                class="fa fa-question-circle rojo"></i></p>
                        <asp:LinkButton ID="si" runat="server" CssClass="boton_confirmacion boton_si" OnClick="boton_si_Click">Si</asp:LinkButton>
                        <asp:LinkButton ID="no" runat="server" CssClass="boton_confirmacion boton_no" OnClick="boton_no_Click">No</asp:LinkButton>
                        <div class="separador_altas">
                        </div>
                    </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="mensajess" runat="server" CssClass="mensajes_cotizacion" Style="display: none;">
                    <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                        <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                    </asp:Panel>
                    <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                    <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClientClick="javascript:cerrar_mensaje(); return false;"><i class="fa fa-close"></i></asp:LinkButton>
                </asp:Panel>
                <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                    <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Ordenes De Servicio</asp:Label>
                    <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                        OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                    <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                </div>
                <div class="contenido">
                    <asp:RadioButton ID="radio_pendientes" runat="server" GroupName="crico" CssClass=""
                        Checked="true" />&nbsp;<asp:Label ID="radio_pendientes_label" runat="server" Text="Ordenes Pendientes"></asp:Label>
                    <asp:RadioButton ID="radio_terminadas" runat="server" GroupName="crico" CssClass="" />&nbsp;<asp:Label
                        ID="radio_terminados_label" runat="server" Text="Ordenes procesadas"></asp:Label>
                    <div id="div_tabla_principal" class="limitado">
                        <asp:GridView ID="tabla_ordenes_servicio" runat="server" CssClass="tabla" DataKeyNames="clave_orden_servicio,clave_cotizacion"
                            ShowHeaderWhenEmpty="True" OnRowCommand="boton_tabla" AutoGenerateColumns="False"
                            PagerSettings-Visible="false" OnRowDataBound="llenado_tabla_principal">
                            <HeaderStyle CssClass="GridHeader" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                            <AlternatingRowStyle CssClass="GridRow" />
                            <Columns>
                                <asp:BoundField HeaderText="Cliente" DataField="cliente"></asp:BoundField>
                                <asp:BoundField HeaderText="C. Cotizacion" DataField="clave_cotizacion"></asp:BoundField>
                                <asp:BoundField HeaderText="C. Servicio" DataField="clave_orden_servicio"></asp:BoundField>
                                <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                <asp:BoundField HeaderText="Sucursal" DataField="sucursal_sistema"></asp:BoundField>
                                <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                <asp:TemplateField HeaderText="Comentario">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <a href="JavaScript:sacalo('div<%# Eval("clave_orden_servicio") %>');">
                                            <img alt="Promociones" id="imgdiv<%# Eval("clave_orden_servicio") %>" src="png/plus.png" /></a>
                                        <div id="div<%# Eval("clave_orden_servicio") %>" style="display: none" class="panel_promo"
                                            title="Comentario">
                                            <asp:Panel ID="panel_promocion_comentario" runat="server" Visible="true">
                                                <div class="">
                                                    <div class="">
                                                        <asp:TextBox ID="caja_comentario" Text='<%#Eval("comentario") %>' runat="server"
                                                            class="caja_cometario clase_falsa" TextMode="MultiLine" lines="30" cols="10"
                                                            Width="200px" Enabled="false"></asp:TextBox>
                                                    </div>
                                                    <div class="espacio">
                                                        <asp:Panel runat="server" ID="boton_comentario" Visible="false">
                                                            <a href="JavaScript:boton_oculto_guardar('<%# Eval("clave_orden_servicio")%>');"><i
                                                                class="fa fa fa fa-floppy-o controles_tablas"></i></a>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Detalles">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <a href="JavaScript:sacalo('div<%# Eval("clave_orden_servicio")+"lv" %>');">
                                            <img alt="Promociones" id="imgdiv<%# Eval("clave_orden_servicio")+"lv" %>" src="png/plus.png" /></a>
                                        <div id="div<%# Eval("clave_orden_servicio")+"lv" %>" style="display: none" class="limitado_chico"
                                            title="Detalles">
                                            <div class="limitado_chico">
                                                <asp:GridView ID="tabla_productos_servicios" runat="server" AutoGenerateColumns="False"
                                                    CssClass="tabla" ShowHeaderWhenEmpty="True" DataKeyNames="clave">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Clave Servicio" DataField="clave_servicio"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Clave" DataField="clave"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Codigo" DataField="codigo"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Imprimir" ShowHeader="True">
                                    <ItemTemplate>
                                        <a href="JavaScript:boton_oculto_imprimir('<%# Eval("clave_orden_servicio")%>');"><i
                                            class="fa fa-file-pdf-o controles_tablas"></i></a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Procesar" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="procesar_servicio" runat="server" CausesValidation="False" CssClass="confirmacion"
                                            ToolTip="Procesar" CommandName="Procesar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-gear controles_tablas"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cancelar" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cancelar_servicio" runat="server" CausesValidation="False" CssClass="confirmacion"
                                            ToolTip="Procesar" CommandName="Cancelar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-ban controles_tablas"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="div_terminados" class="limitado" runat="server" style="display: none;">
                        <asp:GridView ID="tabla_servicios_terminados" runat="server" CssClass="tabla" DataKeyNames="clave_orden_servicio,clave_cotizacion"
                            ShowHeaderWhenEmpty="True" OnRowCommand="boton_tabla" AutoGenerateColumns="False"
                            PagerSettings-Visible="false" OnRowDataBound="llenado_tabla_terminados">
                            <HeaderStyle CssClass="GridHeader" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                            <AlternatingRowStyle CssClass="GridRow" />
                            <Columns>
                                <asp:BoundField HeaderText="Cliente" DataField="cliente"></asp:BoundField>
                                <asp:BoundField HeaderText="C. Cotizacion" DataField="clave_cotizacion"></asp:BoundField>
                                <asp:BoundField HeaderText="C. Servicio" DataField="clave_orden_servicio"></asp:BoundField>
                                <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                <asp:BoundField HeaderText="Vendedor" DataField="vendedor"></asp:BoundField>
                                <asp:BoundField HeaderText="Sucursal" DataField="sucursal_sistema"></asp:BoundField>
                                <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                <asp:TemplateField HeaderText="Comentario">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <a href="JavaScript:sacalo('div<%# Eval("clave_orden_servicio")+"t" %>');">
                                            <img alt="Promociones" id="imgdiv<%# Eval("clave_orden_servicio")+"t" %>" src="png/plus.png" /></a>
                                        <div id="div<%# Eval("clave_orden_servicio")+"t" %>" style="display: none" class=""
                                            title="Comentario">
                                            <asp:Panel ID="panel_promocion_comentario" runat="server" Visible="true">
                                                <div class="padre">
                                                    <div class="hijo_comentario">
                                                        <asp:TextBox ID="caja_comentario" Text='<%#Eval("comentario") %>' runat="server"
                                                            class="caja_comentario clase_falsa" TextMode="MultiLine" lines="30" cols="10"
                                                            Width="200px" Enabled="false"></asp:TextBox>
                                                    </div>
                                                    <div class="espacio">
                                                        <asp:Panel runat="server" ID="boton_comentario_terminados" Visible="false">
                                                            <a href="JavaScript:boton_oculto_guardar('<%# Eval("clave_orden_servicio")%>');"><i
                                                                class="fa fa fa fa-floppy-o controles_tablas"></i></a>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Detalles">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <a href="JavaScript:sacalo('div<%# Eval("clave_orden_servicio")+"tlv" %>');">
                                            <img alt="Promociones" id="imgdiv<%# Eval("clave_orden_servicio")+"tlv" %>" src="png/plus.png" /></a>
                                        <div id="div<%# Eval("clave_orden_servicio")+"tlv" %>" style="display: none" class="panel_promo"
                                            title="Detalles">
                                            <div class="limitado_chico">
                                                <asp:GridView ID="tabla_productos_servicios_terminados" runat="server" AutoGenerateColumns="False"
                                                    CssClass="tabla" ShowHeaderWhenEmpty="True" DataKeyNames="clave">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Clave Servicio" DataField="clave_servicio"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Clave" DataField="clave"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Codigo" DataField="codigo"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Descripcion" DataField="producto"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Imprimir" ShowHeader="True">
                                    <ItemTemplate>
                                        <a href="JavaScript:boton_oculto_imprimir('<%# Eval("clave_orden_servicio")%>');"><i
                                            class="fa fa-file-pdf-o controles_tablas"></i></a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="controles">
                        <asp:Label ID="etiqueta_numero_pedidos" CssClass="etiquetas_barra_superior" runat="server"
                            Text="No Ordenes De Servicio"></asp:Label>
                        <asp:TextBox ID="caja_numero_servicios" runat="server" CssClass="caja_buscar" Enabled="False"></asp:TextBox>
                    </div>
                </div>
                <!-************************botones ocultos************************************->
                <!-****************************************************Fin de los botones ocultos******************************************************************->
                </div>
                <div id="boton_imprimir" style="display: none;">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <ul>
                                <li>
                                    <asp:LinkButton ID="boton_oculto" runat="server" OnClick="boton_oculto_imprimir">Never clicked</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="boton_oculto_guardar" runat="server" OnClick="guardar">Never clicked</asp:LinkButton></li>
                                <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="si_oculto_click">Never clicked</asp:LinkButton>
                                <asp:TextBox ID="orden_servicio" runat="server" />
                                <asp:TextBox ID="caja_comentario_oculta" runat="server"></asp:TextBox>
                                <asp:Panel ID="mensaje_exito" runat="server" Style="display: none">
                                    <div class="">
                                        <asp:Label ID="mensajes" runat="server" />
                                    </div>
                                </asp:Panel>
                            </ul>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_guardar" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="boton_oculto_si" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="tabla_ordenes_servicio" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
