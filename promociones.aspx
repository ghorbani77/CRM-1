<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/promociones.aspx.cs"
    Inherits="promociones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Promociones</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'
        type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
        rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
        rel="stylesheet">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/mario.css" />
    <script src="validacion/lib/jquery.js"></script>
    <script src="validacion/dist/jquery.validate.js"></script>
    <script type="text/javascript">
        $(function () {
            jQuery('#form1').validate();

            $("#boton_productos").click(function () {
                $("#boton_productos").toggleClass("desactivado");

            });
            $('#form1').on('keyup keypress', function (e) {
                var keyCode = e.keyCode || e.which;
                if (keyCode === 13) {
                    e.preventDefault();
                    return false;
                }
            });
        });

        function salir() {
            window.close();
        }
    </script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">

        $(function () {
            $("#caja_periodo_inicio").datepicker({ dateFormat: 'mm/dd/yy', minDate: "0D" }).val();
            $(".fecha").datepicker({ dateFormat: 'mm/dd/yy', minDate: "0D" }).val();
            $("#caja_periodo_final").datepicker({ dateFormat: 'mm/dd/yy', minDate: "0D" }).val();
            $("#caja_periodo_pedidos_inicial").datepicker({ dateFormat: 'mm/dd/yy', minDate: "0D" }).val();
            $("#caja_periodo_pedidos_final").datepicker({ dateFormat: 'mm/dd/yy', minDate: "0D" }).val();

            ////////////////////***************************************//////////////////////////////
            $('input[name="box_vigencia"]').on('click', function () {
                if ($(this).is(':checked')) {
                    $('#div_vigencia').show();
                    $("#caja_periodo_inicio").val('');
                    $("#caja_periodo_final").val('');
                    $("#caja_periodo_final").addClass("required");
                    $("#caja_periodo_inicio").addClass("required");

                }
                else {
                    $('#div_vigencia').hide();
                    $("#caja_periodo_inicio").val('05/01/2049');
                    $("#caja_periodo_final").val('05/01/2049');
                    $("#caja_periodo_final").removeClass("required");
                    $("#caja_periodo_inicio").removeClass("required");
                }
            });
            //////////////////////*****************************//////////////////////////////

            $('input[name="box_pedido"]').on('click', function () {
                if ($(this).is(':checked')) {
                    $('#vigencia_pedido').show();
                    $("#caja_periodo_pedidos_inicial").val('');
                    $("#caja_periodo_pedidos_final").val('');
                    $("#caja_periodo_pedidos_inicial").addClass("required");
                    $("#caja_periodo_pedidos_final").addClass("required");
                }
                else {
                    $('#vigencia_pedido').hide();
                    $("#caja_periodo_pedidos_inicial").val('05/01/2049');
                    $("#caja_periodo_pedidos_final").val('05/01/2049');
                    $("#caja_periodo_pedidos_inicial").removeClass("required");
                    $("#caja_periodo_pedidos_final").removeClass("required");
                }
            });
            ////////////////////****************************/////////////////////////////
            $(function () {
                $("#lista_configuracion").change(function () {
                    if ($(this).val() == "Producto") {
                        $('#lista_provee').show();
                    }
                    else {
                        $('#lista_provee').hide();
                        $("#lista_proveedores").val("ILC");
                    }
                });
                $("#lista_tipo_descuento").change(function () {
                    if ($(this).val() == "Descuento Compra") {
                        $('#porcentaje').show();
                        $('#descuento').val("");
                    }
                    else {
                        $('#porcentaje').hide();
                        $('#descuento').val("100");
                    }
                });
            });

            ////////////**********************************//////////////////
            var $rows = $('#tabla_productos tr[class!="cabecera_tabla"]');
            $('#buscale').click(function () {
                var val = $.trim($("#caja_busqueda").val()).replace(/ +/g, ' ').toLowerCase();

                $rows.show().filter(function () {
                    var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                    return ! ~text.indexOf(val);
                }).hide();
            });


            ////////////************************************///////////////////////////////////
            $("#reset").click(function () {
                tabla = document.getElementById('tabla_productos');
                tr = tabla.getElementsByTagName('tr');
                for (i = 0; i < tr.length; i++) {
                    tr[i].style.display = "";
                } //fin cliclo
            });

            //////////////////////////////*******************************************/////////////////////
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
            //////////////////////////////****************************//////////////////////////////////
        });
        function reset() {


            $('input:checkbox').removeAttr('checked');
        }

        function aviso() {
            $('#mensaje_exito').dialog({ title: "Mensaje" });
        }

    </script>
    <script type="text/javascript">
        ////////***************MUESTRA GRIDVIEW ANIDADOS Y LOS PASA A .DIALOG JQUERY********///////////////
        function sacalo(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline";
                $(div).dialog({ bgiframe: true, maxWidth: 600, maxHeight: 500, width: 600, height: 500 });
                img.src = "png/minus.png";
            } else {
                div.style.display = "none";
                img.src = "png/plus.png";
            }
            $(div).on('dialogclose', function (event) {
                div.style.display = "none";
                img.src = "png/plus.png";
            });
        }    
    </script>
</head>
<body onload="reset()">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div id="menu" class="large-12 header-cotizaciones header-proveedores header-prom">
        <div class="controles">
            <span class="titulo left">Promociones</span>
        </div>
        <!----- esto es un comentario ----->
        <ul class="inline-list right ul-prom">
            <li>
                <asp:LinkButton ID="alta_promocion" runat="server" CssClass="boton" ToolTip="Alta Promocion"
                    OnClick="alta_promociones_Click"><i class="fa fa-gift icono_boton"></i>
                <span>Registrar Promo</span>
                </asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="editar_promociones" runat="server" CssClass="boton" ToolTip="Editar Promos"
                    OnClick="editar_promociones_Click"><i class="fa fa-pencil-square icono_boton"></i>
                <span>Editar Promos</span>
                </asp:LinkButton>
            </li>
            <li>
                <asp:LinkButton ID="boton_cancelar" runat="server" CssClass="boton" ToolTip="Salir"
                    OnClick="boton_salir_Click"><i class="fa fa-sign-out icono_boton"></i>
                <span>Salir</span>
                </asp:LinkButton>
            </li>
        </ul>
    </div>
    <div class="contenedor_principal">
        <div class="paneles_graficas">
            <div class="contenido">
                <!----- Formulario ----->
                <asp:Panel ID="formulario" runat="server">
                    <div class="large-5 columns ">
                        <div class="large-12 titulo-circulo">
                            <i class="fa fa-share-alt-square titulo_clientes"></i><span>Datos Promocion</span>
                        </div>
                        <div class="modulo-nor">
                            <ul class="">
                                <li>
                                    <label for="lista_configuracion" class="label_caja">
                                        Configuracion:
                                    </label>
                                    <asp:DropDownList ID="lista_configuracion" CssClass="caja_mediana" runat="server"
                                        Width="200px">
                                        <asp:ListItem>Seleccionar</asp:ListItem>
                                        <asp:ListItem>Producto</asp:ListItem>
                                        <asp:ListItem>Cliente</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li id="lista_provee" style="display: none;">
                                    <label for="lista_proveedores" class="label_caja">
                                        Proveedor
                                    </label>
                                    <asp:DropDownList ID="lista_proveedores" runat="server" CssClass="caja_mediana" Width="200px">
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label for="lista_tipo_descuento" class="label_caja">
                                        Configuracion:
                                    </label>
                                    <asp:DropDownList ID="lista_tipo_descuento" CssClass="cajas_redondas" runat="server"
                                        Width="200px">
                                        <asp:ListItem>Seleccionar</asp:ListItem>
                                        <asp:ListItem>Descuento Compra</asp:ListItem>
                                        <asp:ListItem>Producto De Regalo</asp:ListItem>
                                        <asp:ListItem>Mas Producto</asp:ListItem>
                                    </asp:DropDownList>
                                </li>
                                <li>
                                    <label for="condicion" class="label_caja">
                                        Condicion
                                    </label>
                                    <asp:TextBox ID="condicion" runat="server" placeholder="Numero De Productos" class="required caja_chica"></asp:TextBox></li>
                                <li id="porcentaje" style="display: none;">
                                    <label for="descuento" class="label_caja">
                                        Descuento %
                                    </label>
                                    <asp:TextBox ID="descuento" runat="server" placeholder="% De Descuento" class="required number caja_chica"></asp:TextBox></li>
                                <li>
                                    <label for="caja_descripcion" class="label_caja">
                                        Descripcion
                                    </label>
                                    <asp:TextBox ID="caja_descripcion" runat="server" class="required caja_larga" TextMode="MultiLine"
                                        lines="10" cols="10"></asp:TextBox></li>
                            </ul>
                        </div>
                    </div>
                    <div class="large-6 columns">
                        <div class="large-12 titulo-circulo">
                            <i class="fa fa-asterisk"></i><span>Validaciones</span>
                        </div>
                        <div class="modulo-nor">
                            <div class="">
                                <ul class="">
                                    <li>
                                        <label for="box_vigencia" class="label_caja boton_guardar button small">
                                            Vigencia</label>
                                        <asp:CheckBox ID="box_vigencia" runat="server" CssClass="box" Style="display: none;" /></li>
                                    <li>
                                        <label for="box_pedido" class="label_caja boton_guardar button small">
                                            Fecha Limite Pedidos</label>
                                        <asp:CheckBox ID="box_pedido" runat="server" CssClass="box" Style="display: none;" /></li>
                                </ul>
                            </div>
                            <div id="div_vigencia" class="formulario_izquierda " style="display: none;">
                                <ul>
                                    <li>
                                        <label for="caja_periodo_inicio" class="label_caja">
                                            Inicio
                                        </label>
                                        <asp:TextBox ID="caja_periodo_inicio" value="05/01/2049" runat="server" class="date caja_mediana"></asp:TextBox></li>
                                    <li>
                                        <label for="caja_periodo_final" class="label_caja">
                                            Final
                                        </label>
                                        <asp:TextBox ID="caja_periodo_final" runat="server" value="05/01/2049" class="date  caja_mediana"></asp:TextBox></li>
                                </ul>
                            </div>
                            <div id="vigencia_pedido" class="formulario_izquierda " style="display: none;">
                                <ul>
                                    <li>
                                        <label for="caja_periodo_pedidos_inicial" class="label_caja">
                                            Pedidos Inicio
                                        </label>
                                        <asp:TextBox ID="caja_periodo_pedidos_inicial" value="05/01/2049" runat="server"
                                            class=" date caja_mediana"></asp:TextBox></li>
                                    <li>
                                        <label for="caja_periodo_pedidos_final" class="label_caja">
                                            Pedidos Final
                                        </label>
                                        <asp:TextBox ID="caja_periodo_pedidos_final" value="05/01/2049" runat="server" class="date caja_mediana"></asp:TextBox></li>
                                </ul>
                            </div>
                            <div class="boton_centro">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="boton_guardar button small success"
                                    Text="Registrar" OnClick="boton_guardar_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <!----- Fin Formulario ----->
                <!-----  Formulario ----->
                <div id="div_producto" class="productos row" runat="server" visible="false">
                    <div style="display: none;">
                        <asp:Label ID="Label1" runat="server" Text="Buscar" class="texto_caja margen_izquierdo"></asp:Label>
                        <asp:TextBox ID="r" runat="server" class="textbox"></asp:TextBox>
                        <input id="a" type="button" runat="server" class="boton_select" value="Buscar" />
                        <input id="b" type="button" runat="server" class="boton_select" value="Reset" />
                        <input id="c" type="button" runat="server" class="boton_select" value="Seleccionar Todo" />
                    </div>
                    <div class="inventario large-12 columns separador-top2 ajustador-tablas">
                        <div class="datos_pedidos">
                            <div class="large titulo-circulo">
                                <i class="fa fa-book titulo_clientes"></i>
                                <asp:Label ID="encabezado" runat="server"></asp:Label>
                            </div>
                            <div class="cricopanel" style="height: 4em;">
                                <ul class="cricolista">
                                    <li>
                                        <p>
                                            <asp:TextBox ID="caja_busqueda" runat="server" class="textbox Cricoradio"></asp:TextBox></p>
                                    </li>
                                    <li>
                                        <p>
                                            <input id="buscale" type="button" runat="server" class="boton_select Cricoradio button small "
                                                value="Buscar" /></p>
                                    </li>
                                    <li>
                                        <p>
                                            <input id="seleccionar" type="button" runat="server" class="boton_select Cricoradio button small "
                                                value="Seleccionar" /></p>
                                    </li>
                                    <li>
                                        <p>
                                            <input id="reset" type="button" runat="server" class="boton_select Cricoradio button small "
                                                value="Reset" /></p>
                                    </li>
                                </ul>
                            </div>
                            <div id="Div2" class="crico_information margen-abajo" runat="server">
                                <asp:GridView ID="tabla_productos" CssClass="tabla_pedidos" runat="server" DataSource='<%# productos_proveedor() %>'
                                    AutoGenerateColumns="false">
                                    <HeaderStyle CssClass="cabecera_tabla GridHeader" />
                                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <AlternatingRowStyle CssClass="GridAlternateRow" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="filacheck" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor"></asp:BoundField>
                                        <asp:BoundField HeaderText="Producto" DataField="producto"></asp:BoundField>
                                        <asp:BoundField HeaderText="Modelo" DataField="modelo"></asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Costo">
                                            <ItemTemplate>
                                                <asp:TextBox ID="caja_costo" runat="server" Enabled="false" DataFormatString="{0:D2}"
                                                    Text='<%# Eval("costo") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="pie_tabla_pedidos large-2">
                        <ul class="horizontal">
                            <li>
                                <asp:Button ID="boton_seleccionar" runat="server" CssClass="boton_select button small success"
                                    Text="Guardar" OnClick="agregar_productos" />
                                <asp:Button ID="boton_regalo" runat="server" CssClass="boton_select button small success"
                                    Text="Guardar" OnClick="agregar_productos_regalo" Visible="false" />
                            </li>
                        </ul>
                    </div>
                </div>
                <!----- Fin SELECCION DE PRODUCTOS ----->
                <div id="div_modificar" runat="server" visible="false" class="display row">
                    <div class="inventario large-12 columns separador-top2 ajustador-tablas">
                        <div class="datos_pedidos">
                            <div id="divGrid">
                                <div class="large titulo-circulo">
                                    <i class="fa fa-book titulo_clientes"></i><span>Datos Promocion</span>
                                </div>
                                <div class="cricopanel">
                                </div>
                                <div id="Div1" class="crico_information" runat="server">
                                    <asp:GridView ID="tabla_promociones" CssClass="tabla_pedidos" runat="server" DataSource='<%# llenar_promociones() %>'
                                        AutoGenerateColumns="false" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                                        OnRowDataBound="llenado_tabla" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting"
                                        EmptyDataText="No hay registros" DataKeyNames="id_promocion">
                                        <HeaderStyle CssClass="cabecera_tabla GridHeader" />
                                        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridAlternateRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" DataField="id_promocion" ReadOnly="true"></asp:BoundField>
                                            <asp:BoundField HeaderText="Config." DataField="configuracion" ReadOnly="true"></asp:BoundField>
                                            <asp:BoundField HeaderText="Proveedor" DataField="proveedor" ReadOnly="true"></asp:BoundField>
                                            <asp:BoundField HeaderText="Tipo De Promocion" DataField="tipo_promocion" ReadOnly="true">
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Descripcion">
                                                <ItemTemplate>
                                                    <asp:Label ID="label_descripcion" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="caja_descripcion_" runat="server" Text='<%# Eval("descripcion") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Condicion">
                                                <ItemTemplate>
                                                    <asp:Label ID="label_condicion" runat="server" Text='<%# Eval("condicion") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="caja_condicion_" runat="server" Text='<%# Eval("condicion") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Porcentaje Descuento">
                                                <ItemTemplate>
                                                    <asp:Label ID="label_descu" runat="server" Text='<%# Eval("descuento") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="caja_descu_" runat="server" Text='<%# Eval("descuento") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Inicio">
                                                <ItemTemplate>
                                                    <asp:Label ID="label_fecha_inicio" runat="server" Text='<%# Eval("fecha_inicio") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="caja_fecha_inicio_" CssClass="fecha" runat="server" Text='<%# Eval("fecha_inicio") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Final">
                                                <ItemTemplate>
                                                    <asp:Label ID="label_fecha_final" runat="server" Text='<%# Eval("fecha_final") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="caja_fecha_final" CssClass="fecha" runat="server" Text='<%# Eval("fecha_final") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Inicio Pedidos" DataField="fecha_pedido_inicio"></asp:BoundField>
                                            <asp:BoundField HeaderText="Final Pedidos" DataField="fecha_pedido_final"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Productos">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_productos" runat="server" Visible="false">
                                                        <a href="JavaScript:sacalo('div<%# Eval("id_promocion") %>');">
                                                            <img alt="Promociones" id="imgdiv<%# Eval("id_promocion") %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("id_promocion") %>" style="display: none;" class="display" title="Clave <%# Eval("id_promocion")%>">
                                                            <div id="contenedor_productos_promocion" class="limitado">
                                                                <asp:GridView ID="tabla_productos_promocion" class="display" runat="server" AutoGenerateColumns="false"
                                                                    OnRowEditing="OnRowEditing_p" OnRowDeleting="OnRowDeleting_p" EmptyDataText="No hay registros"
                                                                    DataKeyNames="id_promocion,codigo_proveedor,descripcion_promocion">
                                                                    <RowStyle CssClass="orales" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="ID Promocion" DataField="id_promocion"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Descripcion" DataField="descripcion_promocion"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="DeleteButton_p" CssClass="fa fa-trash-o negro" CommandName="Delete"
                                                                                    runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Productos Regalo">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_regalos" runat="server" Visible="false">
                                                        <a href="JavaScript:sacalo('div<%# Eval("id_promocion")+ "lv" %>');">
                                                            <img alt="Promociones" id="imgdiv<%# Eval("id_promocion")+ "lv" %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("id_promocion")+ "lv" %>" style="display: none" title="Clave <%# Eval("id_promocion")%>">
                                                            <div id="contenedor_regalos" class="limitado">
                                                                <asp:GridView ID="tabla_productos_regalo" class="display" runat="server" AutoGenerateColumns="false"
                                                                    OnRowEditing="OnRowEditing_r" OnRowDeleting="OnRowDeleting_r" EmptyDataText="No hay registros"
                                                                    DataKeyNames="id_promocion,codigo_proveedor,descripcion_promocion">
                                                                    <RowStyle CssClass="orales" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="ID Promocion" DataField="id_promocion"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Descripcion" DataField="descripcion_promocion"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="DeleteButton_r" CssClass="fa fa-trash-o negro" CommandName="Delete"
                                                                                    runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="EditButton" runat="server" CssClass="fa fa-pencil fa-2x negro"
                                                        CommandName="Edit" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="UpdateButton" runat="server" CssClass="fa fa-magic fa-2x negro"
                                                        CommandName="Update" />&nbsp;
                                                    <asp:LinkButton ID="Cancel" runat="server" CssClass="fa fa-ban fa-2x negro" CommandName="Cancel" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="DeleteButton" CssClass="fa fa-trash-o fa-2x negro" CommandName="Delete"
                                                        runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="mensaje_exito" runat="server" Style="display: none">
                <div class="">
                    <asp:Label ID="mensajes" runat="server" />
                </div>
            </asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
