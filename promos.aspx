<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/promos.aspx.cs" Inherits="promos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <title>Promociones</title>
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
    <script type="text/javascript">
        var $j = jQuery.noConflict();
        function aviso() {
            $j('#mensaje_promo').dialog({ title: "Promocion Valida" });
        }

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
        }

        function sacalo2(divname) {
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
        }
        $j(function () {
            $j('.caja_comentario').change(function () {
                var temporal = $j(this).val();
                document.getElementById("caja_comentario_oculta").value = temporal;
            });
        });
        function checkRadioBtn(id) {
            var gv = document.getElementById('tabla_productos_ctl02_tabla_promociones_ctl03_tabla_productos_regalo');
            //var gv = document.getElementById(id);
            for (var i = 1; i < gv.rows.length; i++) {
                var radioBtn = gv.rows[i].cells[0].getElementsByTagName("input");
                $j('.boton_activar_promocion').show();
                // Check if the id not same
                if (radioBtn[0].id != id.id) {
                    radioBtn[0].checked = false;
                }
                else {
                    var codigo = gv.rows[i].getElementsByTagName('td')[2].textContent;
                    document.getElementById("caja_codigo_oculta").value = codigo;
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="principal">
        <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
            display: none">
            <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
        </asp:Panel>
        <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
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
        <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Visible="False">
            <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
            </asp:Panel>
            <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
            <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server"><i class="fa fa-close"></i></asp:LinkButton>
        </asp:Panel>
        <div class="barra_superior">
            <div class="espacio_logotipo">
                <img class="logotipo" src="img/inklaser.jpeg" />
            </div>
            <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Promociones</asp:Label>
            <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" OnClick="salir_Click"
                CssClass="boton_salir"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
            <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
        </div>
        <div class="contenido">
            <div class="limitado">
                <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla" AutoGenerateColumns="False"
                    DataKeyNames="clave_carrito_cotizacion,codigo,cantidad" OnRowDataBound="llenado_tabla">
                    <HeaderStyle CssClass="GridHeader" />
                    <PagerSettings Visible="False" />
                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                    <AlternatingRowStyle CssClass="GridRow" />
                    <Columns>
                        <asp:BoundField HeaderText="C.Provedor" DataField="codigo" Visible="True"></asp:BoundField>
                        <asp:BoundField HeaderText="C.Carrito" DataField="clave_carrito_cotizacion" Visible="True">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Descripcion" DataField="producto" Visible="True"></asp:BoundField>
                        <asp:BoundField HeaderText="Precio Unidad" DataField="precio" Visible="True" DataFormatString="{0:C}">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" Visible="True"></asp:BoundField>
                        <asp:BoundField HeaderText="Total" DataField="total" Visible="True" DataFormatString="{0:C}">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Promocion">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Panel ID="panel_promocion" runat="server">
                                    <a href="JavaScript:sacalo('div<%# Eval("clave_carrito_cotizacion") %>');">
                                        <img alt="Promociones" id="imgdiv<%# Eval("clave_carrito_cotizacion") %>" src="png/plus.png" /></a>
                                    <div id="div<%# Eval("clave_carrito_cotizacion") %>" style="display: none" title="Clave <%# Eval("clave_carrito_cotizacion")%>">
                                        <div>
                                            <div class="limitado_chico">
                                                <asp:GridView ID="tabla_promociones" class="tabla" runat="server" OnRowDataBound="llenado_tabla_promos"
                                                    OnRowCommand="tabla_promociones_RowCommand" AutoGenerateColumns="false" DataKeyNames="codigo_promocion,codigo_proveedor,descripcion_promocion,clave,tipo">
                                                    <HeaderStyle CssClass="GridHeader" />
                                                    <PagerSettings Visible="False" />
                                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Clave" DataField="clave"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Codigo Promocion" DataField="codigo_promocion"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Descripcion" DataField="descripcion_promocion"></asp:BoundField>
                                                        <asp:BoundField HeaderText="C.Proveedor" DataField="codigo_proveedor"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Inicio" DataField="fecha_inicio"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Finalizacion" DataField="fecha_final"></asp:BoundField>
                                                        <asp:BoundField HeaderText="Tipo" DataField="tipo"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Productos Regalo" Visible="false">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:Panel ID="panel_regalos" runat="server" Visible="false">
                                                                    <a href="JavaScript:sacalo2('div<%# Eval("clave")+ "lv" %>');">
                                                                        <img alt="Promociones" id="imgdiv<%# Eval("clave")+ "lv" %>" src="png/plus.png" /></a>
                                                                    <div id="div<%# Eval("clave")+ "lv" %>" style="display: none" title="Productos Regalo">
                                                                        <div class="limitado_chico">
                                                                            <asp:GridView ID="tabla_productos_regalo" class="tabla" runat="server" AutoGenerateColumns="false"
                                                                                EmptyDataText="No hay registros" DataKeyNames="id_promocion,codigo_proveedor,descripcion_promocion">
                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                <PagerSettings Visible="False" />
                                                                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                <Columns>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:RadioButton ID="RowSelector" runat="server" onclick="checkRadioBtn(this);" />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField HeaderText="ID Promocion" DataField="id_promocion"></asp:BoundField>
                                                                                    <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor"></asp:BoundField>
                                                                                    <asp:BoundField HeaderText="Descripcion" DataField="descripcion_promocion"></asp:BoundField>
                                                                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Comentario" DataField="comentario"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="" ShowHeader="True">
                                                            <HeaderStyle CssClass="" />
                                                            <ItemTemplate>
                                                                <asp:Panel ID="boton_activar_promocion" runat="server" CssClass="boton_activar_promocion">
                                                                    <asp:LinkButton ID="accion" runat="server" CausesValidation="False" ToolTip="Accion"
                                                                        CommandName="accion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-toggle-off rojo "></i></asp:LinkButton>
                                                                </asp:Panel>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Agregar">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <a href="JavaScript:sacalo2('div<%# Eval("codigo_promocion") %>');">
                                                                    <img alt="Promociones" id="imgdiv<%# Eval("codigo_promocion") %>" src="png/plus.png" /></a>
                                                                <div id="div<%# Eval("codigo_promocion") %>" style="display: none" class="limitado_chico"
                                                                    title="Comentario">
                                                                    <asp:Panel ID="panel_promocion_comentario" runat="server" Visible="true">
                                                                        <div class="padre">
                                                                            <div class="hijo_comentario">
                                                                                <asp:TextBox ID="caja_comentario" Text='<%#Eval("comentario") %>' runat="server"
                                                                                    class="cantidad caja_comentario" TextMode="MultiLine" lines="30" cols="10" Width="200px"></asp:TextBox>
                                                                            </div>
                                                                            <div class="hijo_guardar">
                                                                                <asp:LinkButton ID="comentario" runat="server" CausesValidation="False" ToolTip="Comentario"
                                                                                    CommandName="comentario" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="boton_v fa fa fa fa-floppy-o"></i></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:Panel ID="mensaje_promo" runat="server" Style="display: none">
        <asp:TextBox ID="caja_comentario_oculta" runat="server" TextMode="MultiLine" lines="30"
            cols="10" Width="200px"></asp:TextBox>
        <asp:TextBox ID="caja_codigo_oculta" runat="server" Width="200px"></asp:TextBox>
    </asp:Panel>
    </form>
</body>
</html>
