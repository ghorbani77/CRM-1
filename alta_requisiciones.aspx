<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/alta_requisiciones.aspx.cs"
    Inherits="alta_requisiciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
     var jq = jQuery.noConflict();
        function cargar_clientess() {
            jq(function () {
                var clientess = new Array();
                var lista = document.getElementById('lista_clientes');
                for (i = 0; i < lista.options.length; i++) {
                    clientess[i] = lista.options[i].value;
                }

                jq('#caja_clientes').autocomplete({
                    source: function (request, response) {
                        var results = jq.ui.autocomplete.filter(clientess, request.term);
                        response(results.slice(0, 10));
                    },
                    select: function (evento, objeto) {
                        var a = objeto.item.value;
                        jq("#lista_clientes").val(a);
                        __doPostBack("<% =lista_clientes.UniqueID %>", objeto.item.value);
                    },
                    selectFirst: true,
                    minLength: 1
                });
            });
        }     
        function cargar_cliente_caja() {
            var b = jQuery("#lista_clientes").val();
            if (b != "Seleccionar") {
                jq("#caja_clientes").val(b);
            }
        }
    </script>
<script type="text/javascript" language="javascript">
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
    function pageLoad() {
        cargar_clientess();
        cargar_cliente_caja();
    }
    onload = abrir();
    function activar_boton_fantasma_comentario() {
        document.getElementById("<%= boton_fantasma_guardar_comentario.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_guardar_comentario.ClientID %>").style.display = "none";
    }
    function activar_boton_fantasma_procesar() {
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_procesar.ClientID %>").style.display = "none";
    }
    function comentario_vacio() {
        alert('No se puede guardar un comentario vacio ingrese la informacion');
    }
    function comentario_guardado() {
        alert('El comentario fue guardado con exito');
    }
    function requisicion_vacia() {
        alert('La requisicion se encuentra vacia no es posible procesarla');
    }
    function contenido_eliminado() {
        alert('El contenido fue eliminado exitosamente');
    }
    function Confirmacion_terminar() {
        var seleccion = confirm("Esta seguro que desea procesar la requisicion?");
        if (seleccion) {
            activar_boton_fantasma_procesar();
        }
        return seleccion;
    }
    function Confirmacion_vaciar() {
        var seleccion = confirm("Esta seguro que desea eliminar todo el contenido?");
        if (seleccion) {
            activar_boton_fantasma_vaciar();
        }
        return seleccion;
    }
    function Confirmacion_actualizar() {
        var seleccion = confirm("Esta Seguro Que desea actualizar?");
        if (seleccion) {
            desactivar_boton_actualizar();
        }
        return seleccion;
    }
    function activar_boton_actualizar() {

        document.getElementById("<%= boton_actualizar.ClientID %>").style.display = "Visible"
        document.getElementById("<%= boton_fantasma_actualizar.ClientID %>").style.visibility = "hidden";
    }
    function desactivar_boton_actualizar() {
        document.getElementById("<%= boton_fantasma_actualizar.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_actualizar.ClientID %>").style.display = "none";
    }
    function desactivar_boton_vaciar() {
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= boton_vaciar.ClientID %>").style.display = "none";
    }
    function producto_retirado() {
        alert('El producto fue retirado de la requisicion exitosamente');
    }
    function requisicion_actualizada() {
        alert('La requisicion fue actualizada con exito');
    }
    function requisicion_procesada() {
        alert('La requisicion fue procesada con exito');
    }
    function precio_invalido() {
        alert('Error alguno de los precios no es valido verificar');
    }
    function cliente_no_seleccionado() {
        alert('Error seleccione un cliente para la requisicion');
    }
    function salir() {
        window.close();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Requisiciones - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
   
</head>
<body bgcolor="#e6e6e6">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="large-12 header-proveedores header-cotizaciones header-prom">
                <span class="titulo left">Alta De Requisiciones</span>
            </div>
            <div class="large-12 columns">
                <asp:Panel ID="panel_comentario" runat="server" CssClass="panel_precios modulo-esp"
                    Visible="False">
                    <div class="cerrar-modulo">
                        <asp:LinkButton ID="boton_cerrar_comentario" runat="server" CssClass="boton_cerrar_atender_pedido"
                            OnClick="boton_cerrar_comentario_Click"><i class="fa fa-times"></i>  &nbsp;&nbsp;Cerrar modulo</asp:LinkButton></div>
                    <div class="controles_precios">
                        <ul class="vertical">
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_mensaje" runat="server" Text="Agrega tus comentarios enseguida!!!"></asp:Label></p>
                            </li>
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_comentarios" runat="server" Text="Comentario"></asp:Label></p>
                                <asp:TextBox ID="caja_comentarios" runat="server" CssClass="caja_codigo" TextMode="MultiLine"
                                    onfocus="return posicionar_cursor(this.id);"></asp:TextBox>
                            </li>
                        </ul>
                        <asp:LinkButton ID="boton_guardar_comentario" runat="server" ToolTip="Guardar comentario"
                            OnClick="boton_guardar_comentario_Click" Style="text-decoration: none;" CssClass="boton_guardar button small success"
                            OnClientClick="activar_boton_fantasma_comentario();"><i class="fa fa-envelope-o">&nbsp;&nbsp;Guardar</i></asp:LinkButton>
                        <asp:LinkButton ID="boton_fantasma_guardar_comentario" runat="server" Style="text-decoration: none;
                            visibility: hidden" CssClass="boton_cotizar button small info" Enabled="False"><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;Guardando...</asp:LinkButton>
                    </div>
                </asp:Panel>
                <asp:Panel ID="panel_actividad" runat="server" CssClass="panel_precios modulo-esp tabla_actividad"
                    Visible="False">
                    <div class="controles_atender_pedido">
                        <div class="cerrar-modulo">
                            <asp:LinkButton ID="boton_cerrar_actividad" runat="server" CssClass="boton_cerrar_atender_pedido"
                                OnClick="boton_cerrar_actividad_Click"><i class="fa fa-times"></i>  &nbsp;&nbsp;Cerrar modulo</asp:LinkButton></div>
                        <ul class="vertical">
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_codigo_clave" runat="server" Text="Clave Cotizacion"></asp:Label></p>
                                <asp:TextBox ID="caja_codigo_requisicion" runat="server" Enabled="False" CssClass="caja_codigo_pedido"></asp:TextBox></li>
                            <li>
                                <div class="datos_productos_pedido  tabla_sobrepuesta limitado-estados">
                                    <asp:GridView ID="tabla_actividad" runat="server" AutoGenerateColumns="False" CssClass=""
                                        DataSource='<%# datos_actividad() %>' ShowHeaderWhenEmpty="True">
                                        <HeaderStyle CssClass="cabecera" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridAlternateRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Estado" DataField="status"></asp:BoundField>
                                            <asp:BoundField HeaderText="Descripcion" DataField="descripcion_status"></asp:BoundField>
                                            <asp:BoundField DataField="fecha_status" HeaderText="Fecha" SortExpression="fecha"
                                                DataFormatString="{0:g}" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </li>
                        </ul>
                    </div>
                </asp:Panel>
                <div class="large-3 columns">
                    <div class="large-12 titulo-circulo">
                        <i class="fa fa-user"></i><span>Datos del vendedor</span></div>
                    <ul class="horizontal modulo-nor">
                        <li>
                            <p>
                                <asp:Label ID="cliente" runat="server" Text="Cliente"></asp:Label></p>
                            <asp:DropDownList ID="lista_clientes" runat="server" CssClass="listas" AutoPostBack="True" style="display:none;"
                                OnSelectedIndexChanged="lista_clientes_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:TextBox ID="caja_clientes" runat="server"></asp:TextBox>
                        </li>
                        <li>
                            <p>
                                <asp:Label ID="vendedor" runat="server" Text="Vendedor"></asp:Label></p>
                            <asp:DropDownList ID="lista_vendedores" runat="server" CssClass="listas" AutoPostBack="True"
                                OnSelectedIndexChanged="lista_vendedores_SelectedIndexChanged">
                            </asp:DropDownList>
                        </li>
                        <li>
                            <p>
                                <asp:Label ID="usuario" runat="server" Text="Usuario"></asp:Label></p>
                            <asp:TextBox ID="caja_usuario" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                        <li>
                            <p>
                                <asp:Label ID="sucursal" runat="server" Text="Sucursal"></asp:Label></p>
                            <asp:TextBox ID="caja_sucursal" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                        <li>
                            <p>
                                <asp:Label ID="telefono" runat="server" Text="Telefono"></asp:Label></p>
                            <asp:TextBox ID="caja_telefono" runat="server" CssClass="cajas_grandes" Enabled="False"></asp:TextBox>
                            <li>
                                <p>
                                    <asp:Label ID="departamente" runat="server" Text="Departamento"></asp:Label></p>
                                <asp:TextBox ID="caja_departamento" runat="server" CssClass="cajas_grandes" Enabled="False"></asp:TextBox></li>
                            <li>
                                <p>
                                    <asp:Label ID="fecha" runat="server" Text="Fecha"></asp:Label></p>
                                <asp:TextBox ID="caja_fecha" runat="server" CssClass="cajas_grandes" Enabled="False"></asp:TextBox></li>
                    </ul>
                </div>
                <div class="large-9 columns">
                    <div class="large-12 titulo-circulo ">
                        <i class="fa fa-shopping-cart prod"></i><span>Productos</span></div>
                    <!-- LO)LOLOLOLOLOLOLOL -->
                    <asp:LinkButton ID="boton_requisiciones" runat="server" OnClick="boton_requisiciones_Click"
                        ToolTip="Ir a listado de requisiciones" Style="text-decoration: none" CssClass="boton_volver button small info"><i class="fa fa-reply-all"></i>&nbsp;&nbsp;Lista</asp:LinkButton>
                    <asp:LinkButton ID="boton_volver" runat="server" OnClick="boton_volver_Click" ToolTip="Salir"
                        Style="text-decoration: none" CssClass="boton_volver button small alert"><i class="fa fa-reply"></i>&nbsp;&nbsp;Salir</asp:LinkButton>
                    <asp:LinkButton ID="boton_agregar_producto_temporal" runat="server" ToolTip="Agregar producto no inventariado a la requisicion"
                        Style="text-decoration: none" CssClass="boton_agregar button small boton-sin-inventario"
                        OnClick="boton_agregar_productos_no_inventariados_requisicion_Click"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;Agregar</asp:LinkButton>
                    <asp:LinkButton ID="boton_agregar_productos_requisicion" runat="server" ToolTip="Agregar productos a la requisicion"
                        Style="text-decoration: none" CssClass="boton_agregar button small" OnClick="boton_agregar_productos_requisicion_Click"><i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar</asp:LinkButton>
                    <asp:LinkButton ID="boton_actualizar" runat="server" ToolTip="Actualizar" OnClick="boton_actualizar_Click"
                        Style="text-decoration: none" CssClass="boton_actualizar button small info"><i class="fa fa-refresh"></i>&nbsp;&nbsp;Actualizar</asp:LinkButton>
                    <asp:LinkButton ID="boton_procesar" runat="server" ToolTip="Procesar y enviar requisicion"
                        Style="text-decoration: none" CssClass="boton_pedido button small success" OnClick="boton_procesar_Click"><i class="fa fa-check-square"></i></asp:LinkButton>
                    <asp:LinkButton ID="boton_actividad" runat="server" ToolTip="Historial de actividad de la cotizacion"
                        Style="text-decoration: none" CssClass="boton_cotizar button small success" OnClick="boton_actividad_Click"><i class="fa fa-history"></i>&nbsp;&nbsp;Actividad</asp:LinkButton>
                    <asp:LinkButton ID="boton_vaciar" runat="server" OnClick="boton_vaciar_Click" ToolTip="Salir"
                        Style="text-decoration: none" CssClass="boton_volver button small alert"><i class="fa fa-trash"></i>&nbsp;&nbsp;Vaciar</asp:LinkButton>
                    <asp:LinkButton ID="boton_fantasma" runat="server" Style="text-decoration: none;
                        visibility: hidden" CssClass="boton_cotizar button small" Enabled="False"><i class="fa fa-cog fa-spin"></i></asp:LinkButton>
                    <!-- LO)LOLOLOLOLOLOLOL -->
                    <div class="modulo-nor">
                        <div class="limitado">
                            <asp:GridView ID="tabla_productos" runat="server" CssClass="" DataSource='<%# datos_productos() %>'
                                OnRowCommand="tabla_productos_RowCommand" DataKeyNames="clave_carrito_requisicion"
                                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                <AlternatingRowStyle CssClass="GridAlternateRow" />
                                <Columns>
                                    <asp:BoundField HeaderText="Clave" DataField="clave_carrito_requisicion" Visible="True">
                                        <HeaderStyle CssClass="" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Codigo" DataField="codigo"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Producto" ShowHeader="True">
                                        <HeaderStyle CssClass="" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="descripcion" CssClass="cantidad" onkeypress="return todos_seguridad(event);"
                                                MaxLength="200" Style="text-transform: uppercase" runat="server" Width="500px"
                                                Text='<%#Eval("producto") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Costo Uni." DataField="precio" DataFormatString="{0:C}">
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="N.C" ShowHeader="True">
                                        <HeaderStyle CssClass="" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="precio_modificable" CssClass="cantidad" onkeypress="return numeros_punto(event);"
                                                MaxLength="10" runat="server" Width="80px" Text='<%#Eval("precio_modificable","{0:N2}") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Total" DataField="precio_total" DataFormatString="{0:C}">
                                        <HeaderStyle CssClass="cabecera_columna_clientes columna_precio" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Cantidad" ShowHeader="True">
                                        <HeaderStyle CssClass="" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="cantidad_productos" CssClass="cantidad" onkeypress="return numeros(event);"
                                                MaxLength="3" runat="server" Width="25px" Text='<%#Eval("cantidad") %>'></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <HeaderStyle CssClass="" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Eliminar producto de la requisicion"
                                                OnClientClick="return confirm('Desea eliminar el producto de la requisicion?');"
                                                CommandName="quitar_requisicion" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash opcion_tabla"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                        <HeaderStyle CssClass="" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" ToolTip="Agregar un comentario del producto a la requisicion"
                                                CommandName="comentario" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-comment opcion_tabla"></i></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <br />
                        <br />
                        <ul class="horizontal inline-list inputs-cotizacion">
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_productos" runat="server" Text="No Productos"></asp:Label></p>
                                <asp:TextBox ID="caja_numero_productos" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_subtotal" runat="server" Text="Subtotal"></asp:Label></p>
                                <asp:TextBox ID="caja_subtotal" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_iva" runat="server" Text="Iva"></asp:Label></p>
                                <asp:TextBox ID="caja_iva" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                            <li>
                                <p>
                                    <asp:Label ID="etiqueta_total" runat="server" Text="Total"></asp:Label></p>
                                <asp:TextBox ID="caja_total" runat="server" CssClass="cajas_chicas" Enabled="False"></asp:TextBox></li>
                            <asp:LinkButton ID="boton_fantasma_actualizar" runat="server" Style="text-decoration: none;
                                visibility: hidden" Enabled="false" CssClass="boton_actualizar"><i class="fa fa-cog fa-spin"></i></asp:LinkButton>
                        </ul>
                        <div class="barra_progreso">
                            <div class="<%=Session["estado_cotizacion"]%>">
                            </div>
                        </div>
                        <br />
                        <asp:Label ID="status_cotizacion" runat="server" Text="" CssClass="status_cotizacion"></asp:Label>
                    </div>
                </div>
            </div>
            </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    </form>
    </div>
    <!--#include virtual="footer.aspx"-->
