<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/seguimiento_cotizacion.aspx.cs"
    Inherits="seguimiento_cotizacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<style>
    .ui-autocomplete {
        max-height: 200px;
        overflow-y: auto; /* prevent horizontal scrollbar */
        overflow-x: hidden; /* add padding to account for vertical scrollbar */
        padding-right: 20px;
    }
    /* IE 6 doesn't support max-height
 * we use height instead, but this forces the menu to always be this tall
 */
    * html .ui-autocomplete {
        height: 200px;
    }

    body .ui-autocomplete {
        /* font-family to all */
    }

        body .ui-autocomplete .ui-menu-item .ui-corner-all {
            /* all <a> */
        }

        body .ui-autocomplete .ui-menu-item .ui-state-focus {
            /* selected <a> */
        }

    .ui-menu-item a.ui-state-focus {
        background: #faa;
    }

    .ui-datepicker-calendar {
        display: none;
    }

    .ui-datepicker-trigger {
        border: none;
        background: none;
    }

    .posicion_calendario {
        top: 2em;
        cursor: pointer;
        cursor: hand;
    }

    .boton_cristo {
        background: #607d8b;
    }

    .control_calendario {
        position: inherit;
        background: #2471A3;
        color: white;
        padding: 6px 7px 6px 7px;
        border-radius: 35px;
    }

    .caja_fecha {
        width: 60%;
        height: 30px;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
    }

    #header-fixed {
        overflow-x: auto;
        overflow-y: auto;
        width: 73.5%;
        display: none;
        z-index: 1;
        position: fixed;
        border-width: 1px;
        margin-left: 1.5%;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seguimiento Cotizacion</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'type='text/css'/>
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css"/>
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <link href="css/efectos_hover/hover.css" rel="stylesheet" media="all" />
    <script type="text/javascript">
        var ventana;
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
                }
                else {
                    mouse = false;
                    keyboard = false;
                }
            }, 1000);
        })()
        function abrir() {
            window.moveTo(0, 0);
            window.resizeTo(screen.availWidth, screen.availHeight);
        }
        onload = abrir();
        function salir() {

            window.close();
        }
        function pageLoad() {

            $(function (){
                $('#lista_estados_cotizacion').change(function (){
                    var $rows = $('#tabla_principal tr[class!="GridHeader"][class!="GridRow anidado"]');
                    var val = $.trim($("#lista_estados_cotizacion").val()).replace(/ +/g, ' ').toLowerCase();
                    $rows.show().filter(function () {
                        var text = $(this).find('td:eq(2)').text().replace(/\s+/g, ' ').toLowerCase();
                        return ! ~text.indexOf(val);
                    }).hide();
                });
            });

            $(function () {
                var r = $('#busqueda_cliente').val();
                if(r == "")
                {
                    $('#li_fecha_fin').hide();
                }
                else
                {
                    $('#li_fecha_fin').show();
                }
                $('#busqueda_cliente').keyup(function (){
                    var r = $('#busqueda_cliente').val();
                    if(r == "")
                    {
                        $('#li_fecha_fin').hide(500);
                    }
                    else
                    {
                        $('#li_fecha_fin').show(500);
                    }
                });
            });

            $(function () {
                $('#boton_cotizaciones').click(function () {
                    $('#caja_opcion').val("Facturadas");
                    $('#controles_busqueda').show();
                });
                $('#boton_cotizaciones_terminadas').click(function () {
                    $('#caja_opcion').val("Terminadas");
                    $('#controles_busqueda').show();
                });
                $('#boton_todas').click(function () {
                    $('#caja_opcion').val("Todo");
                    $('#controles_busqueda').show();
                });
                $('#boton_pendientes').click(function () {
                    $('#caja_opcion').val("Pendientes");
                    $('#controles_busqueda').show();
                });
                $('#boton_sin_facturar').click(function () {
                    $('#caja_opcion').val("Pendientes Facturar");
                    $('#controles_busqueda').show();
                });

                $('#fecha').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'MM yy',
                    minDate: new Date(2015, 1 - 1, 1),
                    maxDate: "0M",
                    showOn: "both", 
                    buttonText: "<i class='fa fa-calendar posicion_calendario control_calendario'></i>",
                    onClose: function () {
                        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                    },

                    beforeShow: function () {
                        if ((selDate = $(this).val()).length > 0) {
                            iYear = selDate.substring(selDate.length - 4, selDate.length);
                            iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
                            $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
                            $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                        }
                    }
                });
                $('#fecha_fin').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'MM yy',
                    minDate: new Date(2015, 1 - 1, 1),
                    maxDate: "0M",
                    showOn: "both", 
                    buttonText: "<i class='fa fa-calendar posicion_calendario control_calendario'></i>",
                    onClose: function () {
                        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                    },

                    beforeShow: function () {
                        if ((selDate = $(this).val()).length > 0) {
                            iYear = selDate.substring(selDate.length - 4, selDate.length);
                            iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
                            $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
                            $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
                        }
                    }
                });
            });

            <%  var serializer2 = new System.Web.Script.Serialization.JavaScriptSerializer();  %>   
            var clientes_auto =  <%= serializer2 . Serialize ( lista_cliente )  %>;
            $("#busqueda_cliente").autocomplete({
                source: clientes_auto ,minLength: 2 
            });
            function aviso() {
                $('#mensaje_exito').dialog({ title: "Mensaje" });
            } 
            
            $(function () {
                var tableOffset = $('#div_tabla_principal_limitado').offset().top;
                var $header = $('#tabla_principal > tbody > .GridHeader').clone();
                var $fixedHeader = $('#header-fixed').append($header);

                $('#div_tabla_principal_limitado').scroll(function () {
                    var offset = $(this).scrollTop();

                    if (offset => tableOffset && $fixedHeader.is(":hidden")) {
                        $fixedHeader.show();
                    }
                    else if (offset < tableOffset) {
                        $fixedHeader.hide();
                    }
                    if (offset == 0) {
                        $fixedHeader.hide();
                    }
                });
            });
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
                $('#mensajes').hide();
            }, 1800);
        }
        function cerrar_mensaje() {
            $('#mensajes').hide();
        } 
        function abrir_cotizacion(clave_cotizacion){
            $('#oculto_clave_cotizacion').val(clave_cotizacion);
            var boton = document.getElementById('boton_oculto_abrir_cotizacion');
            boton.click();
        }
        function abrir_cotizacion_visualizacion(){
            if (!ventana || ventana.closed) {
                ventana = window.open("visualizar_cotizaciones.aspx", "Cotizacion", "width=1200, height=700,scrollbars = yes,resizable = false");
            }
            else {
                ventana.focus();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="principal">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="panel_actualizacion_padre" runat="server" ChildrenAsTriggers="True"
                UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:HiddenField ID="oculto_clave_cotizacion" runat="server" />
                    <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none; display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-spin fa-3x"></i></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                        <asp:Panel ID="panel_confirmacion" runat="server" CssClass="panel_confirmacion">
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
                    <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                        </asp:Panel>
                        <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClick="cerrar_mensaje_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
                    <div class="barra_superior">
                        <div class="espacio_logotipo">
                            <img class="logotipo" src="img/inklaser.jpeg" />
                        </div>
                        <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Visualizador</asp:Label>
                        <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                            OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                    </div>
                    <div class="contenido">
                        <div class="separador_altas">
                        </div>
                        <div class="izquierdo">
                            <div id="controles_busqueda">
                                <ul class="lista_cotizacion">
                                    <li>
                                        <p class="texto_titulos">
                                            De:
                                        </p>
                                        <asp:TextBox ID="fecha" CssClass="caja_fecha" runat="server" Enabled="false"></asp:TextBox>
                                    </li>
                                    <li id="li_fecha_fin">
                                        <p class="texto_titulos">
                                            A:
                                        </p>
                                        <asp:TextBox ID="fecha_fin" CssClass="caja_fecha" runat="server" Enabled="false"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="texto_titulos">
                                            Buscar Cliente
                                        </p>
                                        <asp:TextBox ID="busqueda_cliente" CssClass="caja_lista" runat="server"></asp:TextBox>
                                    </li>
                                    <li>
                                        <p class="texto_titulos">
                                            Buscar Producto
                                        </p>
                                        <asp:TextBox ID="caja_producto" CssClass="caja_lista" runat="server"></asp:TextBox>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="boton_buscar" runat="server" ToolTip="Buscar Cotizaciones" Style="text-decoration: none;"
                                            CssClass="botones_controles aprobar" OnClick="boton_buscar_Click">Buscar</asp:LinkButton>
                                    </li>
                                    <asp:Panel ID="buscar_vendedor" runat="server" Visible="false">
                                        <li>
                                            <p class="texto_titulos">
                                                Buscar Vendedor
                                            </p>
                                            <asp:TextBox ID="caja_buscar_vendedor" CssClass="caja_lista" runat="server"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:LinkButton ID="boton_buscar_vendedor" runat="server" ToolTip="Buscar Vendedor"
                                                Style="text-decoration: none;" CssClass="botones_controles aprobar" OnClick="boton_buscar_vendedor_Click">Buscar</asp:LinkButton>
                                        </li>
                                    </asp:Panel>
                                </ul>
                            </div>
                        </div>
                        <div class="derecho">
                            <div class="panel_procesar_cotizacion">
                                <asp:Panel ID="panel_oculto" runat="server" Visible="false">
                                    <asp:LinkButton ID="boton_cotizaciones" runat="server" ToolTip="Mis Cotizaciones Facturadas"
                                        Style="text-decoration: none" CssClass="botones_cotizaciones b_azul primero"
                                        OnClientClick="return false;"><i class="fa fa-file-text-o"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_cotizaciones_terminadas" runat="server" ToolTip="Mis Cotizaciones Terminadas"
                                        Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClientClick="return false;"><i class="fa fa-wpforms"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_todas" runat="server" ToolTip="Todas Mis Cotizaciones"
                                        Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClientClick="return false;"><i class="fa fa-bolt"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_pendientes" runat="server" ToolTip="Mis Cotizaciones Pendientes De Surtir"
                                        Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClientClick="return false;"><i class="fa fa-calendar-times-o"></i></asp:LinkButton>
                                    <asp:LinkButton ID="boton_sin_facturar" runat="server" ToolTip="Mis Cotizaciones Pendientes De Facturar"
                                        Style="text-decoration: none" CssClass="botones_cotizaciones b_azul" OnClientClick="return false;"><i class="fa fa-chain-broken"></i></asp:LinkButton>
                                </asp:Panel>
                                <asp:DropDownList ID="lista_estados_cotizacion" runat="server" CssClass="caja_buscar">
                                    <asp:ListItem>Selecciona</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="separador_altas">
                            </div>
                            <table id="header-fixed" class="GridHeader"></table>
                            <div id="div_derecho_inventario">
                                <div id="div_tabla_principal_limitado" class="limitado" style="text-transform: capitalize">
                                    <asp:GridView ID="tabla_principal" runat="server" CssClass="tabla tabla_principal" AutoGenerateColumns="false"
                                        DataKeyNames="clave_cotizacion" OnRowDataBound="llenado_tabla_principal">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Left" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Cotizacion" DataField="clave_cotizacion" ItemStyle-HorizontalAlign="Center" Visible="true"></asp:BoundField>
                                            <asp:BoundField HeaderText="Cliente" DataField="cliente" ItemStyle-HorizontalAlign="Center" Visible="True"></asp:BoundField>
                                            <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center" Visible="True"></asp:BoundField>
                                            <asp:BoundField HeaderText="Fecha" DataField="fecha" Visible="True" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Vendedor" DataField="vendedor" ItemStyle-HorizontalAlign="Center" Visible="True"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ir Cotizacion" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_detalles" runat="server" Visible="false" style="display:none">
                                                        <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion") + "-detalles" %>');">
                                                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "-detalles" %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("clave_cotizacion")+ "-detalles" %>" style="display: none" title="Productos <%# Eval("clave_cotizacion")%>">
                                                            <div class=" limitado_chico">
                                                                <asp:GridView ID="tabla_detalles_cotizacion" class="tabla detalles_cotizacion anidado"
                                                                    runat="server" AutoGenerateColumns="false">
                                                                    <HeaderStyle CssClass="GridHeader" />
                                                                    <PagerSettings Visible="False" />
                                                                    <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Codigo Prov." DataField="codigo_proveedor"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Precio" DataField="precio" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Prec.Mod" DataField="precio_modificable" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Total" DataField="total" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}"></asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                    <a href="JavaScript:abrir_cotizacion('<%# Eval("clave_cotizacion")%>');" class="controles_tablas"><i class="fa fa-share-square-o" aria-hidden="true"></i></a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Req." ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_requisicion" runat="server" Visible="false">
                                                        <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion") + "-req" %>');">
                                                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "-req" %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("clave_cotizacion")+ "-req" %>" style="display: none" title="Requisicion <%# Eval("clave_cotizacion")%>">
                                                            <div class="limitado_chico">
                                                                <asp:GridView ID="tabla_requisiciones" class="tabla anidado" runat="server" AutoGenerateColumns="false"
                                                                    OnRowDataBound="llenado_tabla_requisiciones" DataKeyNames="clave_requisicion">
                                                                    <HeaderStyle CssClass="GridHeader" />
                                                                    <PagerSettings Visible="False" />
                                                                    <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Clave" DataField="clave_requisicion" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Detalles" ShowHeader="True">
                                                                            <ItemTemplate>
                                                                                <asp:Panel ID="panel_detalles_requisicion" runat="server" Visible="true">
                                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_requisicion") + "-detalles" %>');">
                                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_requisicion")+ "-detalles" %>" src="png/plus.png" /></a>
                                                                                    <div id="div<%# Eval("clave_requisicion")+ "-detalles" %>" style="display: none"
                                                                                        title="Productos <%# Eval("clave_requisicion")%>">
                                                                                        <div class="limitado_chico">
                                                                                            <asp:GridView ID="tabla_detalles_requisicion" class="tabla anidado" runat="server"
                                                                                                AutoGenerateColumns="false">
                                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                                <PagerSettings Visible="False" />
                                                                                                <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField HeaderText="Codigo Prov." DataField="codigo_proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Proveedor" DataField="proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Aprobacion" DataField="aprobacion" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Precio" DataField="precio" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Total" DataField="total" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Comentario" DataField="comentario" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Factura" DataField="factura" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Compra" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_ordenes_compra" runat="server" Visible="false">
                                                        <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion") + "-compra" %>');">
                                                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "-compra" %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("clave_cotizacion")+ "-compra" %>" style="display: none" title="Orden Compra <%# Eval("clave_cotizacion")%>">
                                                            <div class="limitado_chico">
                                                                <asp:GridView ID="tabla_ordenes_compra" class="tabla anidado" runat="server" AutoGenerateColumns="false"
                                                                    DataKeyNames="clave_orden" OnRowDataBound="llenado_tabla_ordenes_compra">
                                                                    <HeaderStyle CssClass="GridHeader" />
                                                                    <PagerSettings Visible="False" />
                                                                    <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Clave" DataField="clave_orden"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Listo" DataField="listo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Almacen" DataField="almacen" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Detalles" ShowHeader="True">
                                                                            <ItemTemplate>
                                                                                <asp:Panel ID="panel_detalles_compra" runat="server" Visible="true">
                                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_orden") + "-detalles" %>');">
                                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_orden")+ "-detalles" %>" src="png/plus.png" /></a>
                                                                                    <div id="div<%# Eval("clave_orden")+ "-detalles" %>" style="display: none" title="Productos <%# Eval("clave_orden")%>">
                                                                                        <div class="limitado_chico">
                                                                                            <asp:GridView ID="tabla_detalles_compra" class="tabla anidado" runat="server" AutoGenerateColumns="false">
                                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                                <PagerSettings Visible="False" />
                                                                                                <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField HeaderText="Codigo Prov." DataField="codigo" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Estado" DataField="aprobacion" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad" ItemStyle-HorizontalAlign="Center" DataField="cantidad"></asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pedido" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_pedidos" runat="server" Visible="false">
                                                        <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion") + "-pedido" %>');">
                                                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "-pedido" %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("clave_cotizacion")+ "-pedido" %>" style="display: none" title="Pedido <%# Eval("clave_cotizacion")%>">
                                                            <div class="limitado_chico">
                                                                <asp:GridView ID="tabla_pedidos" class="tabla anidado" runat="server" AutoGenerateColumns="false"
                                                                    DataKeyNames="clave_pedido" OnRowDataBound="llenado_tabla_pedidos">
                                                                    <HeaderStyle CssClass="GridHeader" />
                                                                    <PagerSettings Visible="False" />
                                                                    <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Clave" DataField="clave_pedido" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Detalles" ShowHeader="True">
                                                                            <ItemTemplate>
                                                                                <asp:Panel ID="panel_detalles_pedido" runat="server" Visible="true">
                                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_pedido") + "-detalles" %>');">
                                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_pedido")+ "-detalles" %>" src="png/plus.png" /></a>
                                                                                    <div id="div<%# Eval("clave_pedido")+ "-detalles" %>" style="display: none" title="Productos <%# Eval("clave_pedido")%>">
                                                                                        <div class="limitado_chico">
                                                                                            <asp:GridView ID="tabla_detalles_pedido" class="tabla anidado" runat="server" AutoGenerateColumns="false">
                                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                                <PagerSettings Visible="False" />
                                                                                                <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField HeaderText="Codigo Prov." DataField="codigo_proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad" ItemStyle-HorizontalAlign="Center" DataField="cantidad"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad Surtida" ItemStyle-HorizontalAlign="Center" DataField="cantidad_surtida"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad Backorder" ItemStyle-HorizontalAlign="Center" DataField="cantidad_backorder"></asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Trasferencia" ShowHeader="True">
                                                                            <ItemTemplate>
                                                                                <asp:Panel ID="panel_trasferencia" runat="server" Visible="false">
                                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_pedido") + "-trasferencia" %>');">
                                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_pedido")+ "-trasferencia" %>" src="png/plus.png" /></a>
                                                                                    <div id="div<%# Eval("clave_pedido")+ "-trasferencia" %>" style="display: none" title="Trasferencias <%# Eval("clave_pedido")%>">
                                                                                        <div class="limitado_chico">
                                                                                            <asp:GridView ID="tabla_trasferencias" class="tabla anidado" runat="server" AutoGenerateColumns="false">
                                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                                <PagerSettings Visible="False" />
                                                                                                <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField HeaderText="Clave Trasfe." DataField="clave_trasferencia" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Codigo Prov." DataField="codigo_proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad" ItemStyle-HorizontalAlign="Center" DataField="cantidad"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Sucursal" DataField="sucursal" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Sucursal Requiere" DataField="sucursal_requiere" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Venta " ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:Panel ID="panel_detalles_venta" runat="server" Visible="false">
                                                        <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion") + "-venta" %>');">
                                                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "-venta" %>" src="png/plus.png" /></a>
                                                        <div id="div<%# Eval("clave_cotizacion")+ "-venta" %>" style="display: none" title="Venta <%# Eval("clave_cotizacion")%>">
                                                            <div class="limitado_chico">
                                                                <asp:GridView ID="tabla_ventas" class="tabla anidado" runat="server" AutoGenerateColumns="false"
                                                                    DataKeyNames="clave_venta" OnRowDataBound="llenado_tabla_ventas">
                                                                    <HeaderStyle CssClass="GridHeader" />
                                                                    <PagerSettings Visible="False" />
                                                                    <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                    <AlternatingRowStyle CssClass="GridRow" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Clave" DataField="clave_venta" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Sub.Total" DataField="subtotal" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Total" DataField="total" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Com.Vendedor" DataField="comision_vendedor" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Com.negocio" DataField="comision_negocio" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:BoundField HeaderText="Clave Pedido" DataField="clave_pedido" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Detalles" ShowHeader="True">
                                                                            <ItemTemplate>
                                                                                <asp:Panel ID="panel_detalles_venta" runat="server" Visible="true">
                                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_venta") + "-detalles" %>');">
                                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_venta")+ "-detalles" %>" src="png/plus.png" /></a>
                                                                                    <div id="div<%# Eval("clave_venta")+ "-detalles" %>" style="display: none" title="Productos <%# Eval("clave_venta")%>">
                                                                                        <div class="limitado_chico">
                                                                                            <asp:GridView ID="tabla_detalles_venta" class="tabla anidado" runat="server" AutoGenerateColumns="false">
                                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                                <PagerSettings Visible="False" />
                                                                                                <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField HeaderText="Codigo Prov." DataField="codigo_proveedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Producto" DataField="producto" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cantidad" ItemStyle-HorizontalAlign="Center" DataField="cantidad"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Total" ItemStyle-HorizontalAlign="Center" DataField="total" DataFormatString="{0:C}"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Com.Vendedor" DataField="comicion_vendedor" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Com.Negocio" DataField="comicion_negocio" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:C}"></asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Factura/Entrega" ShowHeader="True">
                                                                            <ItemTemplate>
                                                                                <asp:Panel ID="panel_detalles_factura" runat="server" Visible="false">
                                                                                    <a href="JavaScript:sacalo('div<%# Eval("clave_venta") + "-detalles_factura" %>');">
                                                                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_venta")+ "-detalles_factura" %>" src="png/plus.png" /></a>
                                                                                    <div id="div<%# Eval("clave_venta")+ "-detalles_factura" %>" style="display: none"
                                                                                        title="Factura/Entrega <%# Eval("clave_venta")%>">
                                                                                        <div class="limitado_chico">
                                                                                            <asp:GridView ID="tabla_movimientos_venta" class="tabla anidado" runat="server" AutoGenerateColumns="false">
                                                                                                <HeaderStyle CssClass="GridHeader" />
                                                                                                <PagerSettings Visible="False" />
                                                                                                <RowStyle CssClass="GridRow anidado" HorizontalAlign="Left" />
                                                                                                <AlternatingRowStyle CssClass="GridRow" />
                                                                                                <Columns>
                                                                                                    <asp:BoundField HeaderText="Descripcion" DataField="descripcion_movimiento" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Fecha" DataField="fecha_movimiento" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Cotizacion" DataField="cotizacion_movimiento" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                    <asp:BoundField HeaderText="Usuario" DataField="vendedor_movimiento" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                                                                                </Columns>
                                                                                            </asp:GridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="controles_cotizacion">
                                    <asp:Label ID="etiqueta_buscar" runat="server" CssClass="etiquetas_barra_superior"
                                        Text="Buscar"></asp:Label>
                                    <asp:TextBox ID="caja_buscar" runat="server" CssClass="caja_chica"></asp:TextBox>
                                    <asp:LinkButton ID="buscar" Style="text-decoration: none;" runat="server" Text="Buscar"
                                        CssClass="botones_controles boton_cristo" OnClientClick="buscar_producto(); return false;" />
                                    <asp:HiddenField ID="caja_opcion" runat="server" value="Terminadas"></asp:HiddenField>
                                </div>
                            </div>
                        </div>
                        <asp:LinkButton ID="boton_oculto_procesar" runat="server" Enabled="true"
                            Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_aprobar" runat="server" Enabled="true"
                            Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_rechazar" runat="server" Enabled="true"
                            Style="text-decoration: none; visibility: hidden"></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="boton_oculto_si_Click"
                            Style="display: none;"></asp:LinkButton>
                        <asp:LinkButton ID="boton_oculto_abrir_cotizacion" runat="server" OnClick="boton_oculto_abrir_cotizacion_Click"
                            Style="display: none;"></asp:LinkButton>
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
<script type="text/javascript">
    ////////***************MUESTRA GRIDVIEW ANIDADOS Y LOS PASA A .DIALOG JQUERY*** *****///////////////
    function sacalo(divname) {
        var div = document.getElementById(divname);
        var img = document.getElementById('img' + divname);
        if (div.style.display == "none") {
            div.style.display = "inline";
            $(div).dialog({ width: 'auto', open: function () {

                {
                    $(this).parent().appendTo($("form:first"));
                }
            }
            });
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
<script type="text/javascript">
    ///////////***********BUSCADOR DE LA TABLA  PRINCIPAL**************///////////////////
    function buscar_producto() {
        var $rows = $('#tabla_principal tr[class!="GridHeader"][class!="GridRow anidado"]');
        var val = $.trim($("#caja_buscar").val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function () {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return ! ~text.indexOf(val);
        }).hide();
    } //fin funcion

</script>
</html>
<style>
    .link {
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-decoration: none;
    }
</style>
