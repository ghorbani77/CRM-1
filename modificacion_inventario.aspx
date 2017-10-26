<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/modificacion_inventario.aspx.cs"
    Inherits="modificacion_inventario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <title>Actualizar Inventario</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link rel="stylesheet" href="css/gridview.css" />
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

        function salir() {
            window.close();
        }



        function reset() {
            $('input:checkbox').removeAttr('checked');
        }

        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            });
        });


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
            reset();
            setTimeout(function () {
                //var boton = $j('#cerrar_mensaje');
                //boton.click();
                $('#mensajess').hide();
            }, 1800);
        }

        function cerrar_mensaje() {
            $('#mensajess').hide();
        }

        $(function () {
            $("#seleccionar").click(function () {
                var i;
                var checkboxes = $(this).closest('form').find(':checkbox');

                for (i = 0; i < checkboxes.length; i++) {
                    if ($(checkboxes.eq(i)).is(':checked')) {
                        checkboxes.eq(i).prop('checked', false);
                    } else if (checkboxes.eq(i).is(':visible')) {
                        checkboxes.eq(i).prop('checked', true);
                    }
                }
            });

            $("#reset").click(function () {
                tabla = document.getElementById('tabla_productos');
                tr = tabla.getElementsByTagName('tr');
                for (i = 0; i < tr.length; i++) {
                    tr[i].style.display = "";
                } //fin cliclo
            });

            var $rows = $('#tabla_productos tr[class!="GridHeader"]');
            $('#buscale').click(function () {
                var val = $.trim($("#caja_busqueda").val()).replace(/ +/g, ' ').toLowerCase();

                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });

            $('.boton_azul').click(function () {
                //$(this).find('input[type=checkbox]').prop('checked', true);
                var $row = $(this).closest("tr");
                var checkBoxes = $row.find('input[type=checkbox]')
                $row.find('input[type=checkbox]').prop('checked', !checkBoxes.prop("checked"));
                $row.toggleClass("verde_activado");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="principal">
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
            <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Actualizar Inventario</asp:Label>
            <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" OnClick="salir_Click"
                CssClass="boton_salir"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
            <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
        </div>
        <div class="contenido">
            <div id="div_listas" class=" main">
                <asp:Label ID="t_busqueda" runat="server" Text="Proveedores" CssClass="etiquetas_barra_superior"></asp:Label>
                <asp:DropDownList ID="lista_proveedores" runat="server" CssClass="controles_busqueda"
                    Width="100px" OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Todos</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="t_busqueda_categoria" runat="server" Text="Categorias" CssClass="etiquetas_barra_superior"></asp:Label>
                <asp:DropDownList ID="lista_categoria" runat="server" CssClass="controles_busqueda"
                    Width="100px" OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Label ID="t_busqueda_subcategoria" runat="server" Text="Subcategorias" CssClass="etiquetas_barra_superior"></asp:Label>
                <asp:DropDownList ID="lista_subcategoria" runat="server" CssClass="controles_busqueda"
                    Width="100px" OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <asp:Label ID="t_busqueda_tipo_producto" runat="server" Text="Tipo De Producto" CssClass="etiquetas_barra_superior"></asp:Label>
                <asp:DropDownList ID="lista_tipo_producto" runat="server" CssClass="controles_busqueda"
                    Width="120px" OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <div class="limitado">
                <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla_cotizaciones" OnRowDataBound="llenado_tabla"
                    AutoGenerateColumns="false" DataKeyNames="codigo_proveedor">
                    <HeaderStyle CssClass="GridHeader" />
                    <PagerSettings Visible="False" />
                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                    <AlternatingRowStyle CssClass="GridRow" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="filacheck" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="C.Provedor" DataField="codigo_proveedor" Visible="True">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="C.Interno" DataField="codigo_interno" Visible="True">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="N.Codigo">
                            <ItemTemplate>
                                <asp:TextBox ID="caja_codigo_interno" Text="" runat="server" class="cantidad" Width="100px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Descripcion" DataField="producto" Visible="True"></asp:BoundField>
                        <asp:BoundField HeaderText="Modelo" DataField="modelo" Visible="True"></asp:BoundField>
                        <asp:BoundField HeaderText="Proveedor" DataField="proveedor" Visible="True"></asp:BoundField>
                        <asp:BoundField HeaderText="Costo" DataField="costo" Visible="True" DataFormatString="{0:C}">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad General" DataField="cantidad" Visible="True">
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
            <div style="height: 50px">
            </div>
            <div id="div_filtrado">
                <div class="opciones" id="opciones" runat="server">
                    <ul class="opciones_filtrado">
                        <li>
                            <asp:Label ID="lblBuscar" runat="server" Text="Buscar"></asp:Label>
                        </li>
                        <li>
                            <asp:TextBox type="text" ID="caja_busqueda" runat="server" CssClass="filtro" placeholder="Introduzca busqueda"></asp:TextBox>
                        </li>
                        <li>
                            <asp:LinkButton ID="buscale" runat="server" class="botones_proceso boton_azul" OnClientClick="return false;"><i class="fa fa-search" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="reset" runat="server" class="botones_proceso boton_azul" OnClientClick="return false;"><i class="fa fa-refresh" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="seleccionar" runat="server" class="botones_proceso boton_azul"
                                OnClientClick="return false;"><i class="fa fa-check-square-o" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="boton_actualizar" runat="server" OnClick="actualizar" ToolTip="Actualizar"
                                CssClass="botones_proceso boton_verde"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                            <br>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <asp:Panel ID="mensaje_promo" runat="server" Style="display: none">
        <asp:TextBox ID="caja_comentario_oculta" runat="server" TextMode="MultiLine" lines="30"
            cols="10" Width="200px"></asp:TextBox>
        <asp:TextBox ID="caja_codigo_oculta" runat="server" Width="200px"></asp:TextBox>
    </asp:Panel>
    <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="si_oculto_click" Style="display: none;"></asp:LinkButton>
    </form>
</body>
</html>
