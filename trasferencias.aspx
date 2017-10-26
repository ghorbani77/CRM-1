<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/trasferencias.aspx.cs" Inherits="trasferencias" %>

<!DOCTYPE html>

<style>
    .panel_izquierdo {
        float: left;
        overflow: auto;
        max-height: 200px;
        display: inline-block;
    }

    .panel_derecho {
        float: right;
        overflow: auto;
        max-width: 600px;
        max-height: 400px;
        position: absolute;
        display: inline-block;
    }

    .capitalizar {
        text-transform: capitalize;
    }

    .lista {
        width: 20%;
        margin-top: 1%;
        margin-left: 1%;
        height: 30px;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
    }

    .opciones {
        display: inline-block;
        height: 53px;
        width: 61%;
        left: 20%;
        background: #2483c5;
        position: absolute;
        margin-top: 1%;
    }

    .opciones_filtrado {
        list-style-type: none;
        position: absolute;
        display: inline-block;
        width: 90%;
    }

    .separador_5 {
        margin-right: 5px;
        font-family: 'Montserrat', sans-serif;
    }

    #header-fixed {
        overflow-x: auto;
        overflow-y: auto;
        width: 95.5%;
        display: none;
        z-index: 1;
        position: fixed;
        border-width: 1px;
        margin-left: 1.5%;
    }

    .botones_proceso {
        padding-top: 0.875rem;
        padding-right: 1.75rem;
        padding-bottom: 0.9375rem;
        padding-left: 1.75rem;
        font-size: 0.8125rem;
        color: white;
        margin-left: 2%;
    }

    .gris {
        background: #9E9E9E;
    }

    .gris_plata {
        background: #16487f;
    }

    .lis_custom {
        display: inline-block;
        position: absolute;
        left: 40%;
        width: 50%;
    }

    .filtro {
        display: inline-block;
        position: absolute;
    }

    .botones_proceso:hover {
        background: #17a05e;
    }

    caja_medina {
        margin-top: 15px;
        width: 70%;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
        border-radius: 4px;
    }

    .li_procesar {
        position: absolute;
        display: inline-block;
        left: 90%;
        width: 50%;
        top: 4px;
    }

    .li_procesar_anidado {
        position: absolute;
        display: inline-block;
        width: 50%;
        left: 25%;
    }

    .centro {
        width: 100%;
        left: 5%;
        right: 5%;
    }

    .flota_derecho {
        float: right;
    }

    .turqueza {
        background: #009688;
    }

    ul.sub-menu {
        display: none;
    }

    nav {
        background-color: #2483c5;
        padding: 10px 0;
    }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

            nav ul li {
                display: inline-block;
                position: relative;
            }

        nav li ul {
            background-color: #2483c5;
            position: absolute;
            left: 0;
            /* make this equal to the line-height of the links (specified below) */
            width: 200px;
            z-index: 2;
        }

        nav li li {
            position: relative;
            margin: 0;
            display: block;
        }

            nav li li ul {
                position: absolute;
                top: 0;
                left: 200px; /* make this equal to the width of the sub nav above */
                margin: 0;
            }

        nav a {
            line-height: 40px;
            padding: 0 12px;
            margin: 0 12px;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

            nav a:hover,
            nav a:focus,
            nav a:active {
                color: rgb(50,50,50);
            }

        /* style sub level links */
        nav li li a {
            border-bottom: solid 1px #cffaff;
            margin: 0 10px;
            padding: 0;
        }

        nav li li:last-child a {
            border-bottom: none;
        }

        /* show arrows for dropdowns */
        nav li.dropdown > a {
            /*background-image: url('../img/arrow-down.png');*/
            content: "\f107";
            font-family: FontAwesome;
            background-position: right 20px;
            background-repeat: no-repeat;
        }

        nav li li.dropdown > a {
            background-image: url('../img/arrow-right.png');
            background-position: right 16px;
            background-repeat: no-repeat;
        }

    .pequeno {
        right: 5%;
        position: absolute;
        display: inline-block;
        bottom: 9%;
        font-size: x-small !important;
    }

    .etiqueta_titulo_dinamica {
        display: inline-block;
        color: white;
        font-size: x-large;
        font-family: 'Montserrat', sans-serif;
        width: 100%;
        margin-left: 45%;
    }

    .limitado_custom {
        width: 100%;
        height: 40em;
        overflow: auto;
    }

    .grafica_anidada {
        position: absolute;
        display: inline-block;
        top: 10em;
        left: 15%;
        width: 70%;
        height: auto;
    }

    .caja_custom {
        width: 10%;
        display: inline-block;
        font-size: small;
        color: Black;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
    }

    .panel_dialogo {
        width: 800px;
        height: 400px;
    }

    .titulo_barra_peticion {
        position: absolute;
        display: inline-block;
        bottom: 70%;
        text-align: center;
    }

    .boton_mamalon {
        color: white;
        font-size: large;
        text-decoration: none;
        margin-left: 5%;
    }

    .botones_barra_peticion {
        margin-left: 50%;
        margin-top: 1%;
        width: 50%;
    }

    .blanco_opacidad {
        background: rgba(255, 255, 255, 0.75);
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Trasferencias</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css" />
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/efectos_hover/hover.css" rel="stylesheet" media="all" />
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/Chart.js"></script>
    <script type="text/javascript">
        var panel = 0;
        var etiqueta;
        function pageLoad(sender, arg) {
            if (!arg.get_isPartialLoad()) {
                $(document).tooltip();
            }
            else {
                if ($(document).data('ui-tooltip')) {
                    $(document).tooltip('destroy');
                    $(document).tooltip();
                }
            }
            funciones_jquery();
        }
        function salir() {
            window.close();
        }
        function reset() {
            $('input:checkbox').removeAttr('checked');
        }
        console.log("Desarrollado Por InkLaser");
        console.log("v.1.0.jamb");
        console.log("CRM");
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
                $('#mensajes').hide();
            }, 1800);
        }
        function cerrar_mensaje() {
            $('#mensajes').hide();
            return false;
        }
        function funciones_jquery() {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            });
            $(".cantidad").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $(".cantidad").bind("keydown", function (event) {
                event.preventDefault();
            });
            $("input:checkbox").change(function () {
                if ($(this).prop("checked")) {
                    var fila = $(this).closest("tr");
                    var calor;
                    var cantidad_pendiente = parseInt(fila.find("td:eq(5)").text());
                    var cantidad_sucursal = parseInt(fila.find("td:eq(8) > .cantidad").val());
                    if (cantidad_pendiente > cantidad_sucursal) {
                        valor = cantidad_sucursal;
                    }
                    else {
                        valor = cantidad_pendiente;
                    }
                    var caja_cantidad = fila.find(".cantidad").attr("id");
                    aplicar_spiner(caja_cantidad, valor);
                    $('#' + caja_cantidad).val(valor);
                    $('#' + caja_cantidad).show();
                }
                else {
                    var fila = $(this).closest("tr");
                    var caja_cantidad = fila.find(".cantidad").attr("id");
                    $('#' + caja_cantidad).val("");
                    if ($('#' + caja_cantidad).spinner("instance")) {
                        $('#' + caja_cantidad).spinner("destroy");
                        $('#' + caja_cantidad).hide();
                    } else {
                        $('#' + caja_cantidad).spinner();
                        $('#' + caja_cantidad).show();
                    }
                }
            });
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
                    tabla = $('table[class!=GridHeader]');
                    tr = tabla.find('tr');
                    for (i = 0; i < tr.length; i++) {
                        tr[i].style.display = "";
                    } //fin cliclo
                });
                var $rows = $('table[class!=GridHeader] tr[class!="GridHeader"]');
                $('#buscale').click(function () {
                    var val = $.trim($("#caja_busqueda").val()).replace(/ +/g, ' ').toLowerCase();

                    $rows.show().filter(function () {
                        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                        return ! ~text.indexOf(val);
                    }).hide();
                });
                $('.boton_azul').click(function () {
                    var $row = $(this).closest("tr");
                    var checkBoxes = $row.find('input[type=checkbox]')
                    $row.find('input[type=checkbox]').prop('checked', !checkBoxes.prop("checked"));
                    $row.toggleClass("verde_activado");
                });
                $(function () {
                    if ($('#div_panel_reorden').offset()) {
                        var tableOffset = $('#div_panel_reorden').offset().top;
                        var $header = $('#tabla_inventario_reorden > tbody > .GridHeader').clone();
                        var $fixedHeader = $('#header-fixed').append($header);

                        $('#div_panel_reorden').scroll(function () {
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
                    }
                });
            });
        }
        function dialogo() {
            $('#panel_procesar_trasferencia').dialog({
                width: 'auto',
                open: function () {
                    {
                        $(this).parent().appendTo($("form:first"));
                    }
                },
                close: function () {
                }
            });
        }
        function aplicar_spiner(caja, valor) {
            $('#' + caja).spinner({
                max: valor, min: 1
            });
        }
    </script>
</head>
<body>
    <form id="formulario_trasferencias" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="principal capitalizar">
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
            <asp:Panel ID="mensajes" runat="server" CssClass="mensajes_cotizacion" Style="display: none">
                <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                    <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                </asp:Panel>
                <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClientClick="cerrar_mensaje();return false;"><i class="fa fa-close"></i></asp:LinkButton>
            </asp:Panel>
            <div class="barra_superior">
                <div class="espacio_logotipo">
                    <img class="logotipo" src="img/inklaser.jpeg" />
                </div>
                <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Trasferencias Sistema</asp:Label>
                <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                    OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
            </div>
        </div>
        <div class="contenido">
            <div class="panel_procesar_cotizacion" style="background: #007acc;">
                <div class="titulo_barra_peticion">
                    <asp:Label CssClass="titulo tipo_texto" Style="color: white;" ID="titulo_barra" runat="server"></asp:Label>
                </div>
                <div class="botones_barra_peticion">
                    <asp:LinkButton ID="boton_ver_todas" Text="Todas Las Peticiones" runat="server" OnClick="boton_ver_todas_Click" CssClass="tipo_texto boton_mamalon hvr-float-shadow" />
                    <asp:LinkButton ID="boton_peticiones" Text="Peticiones Activas" runat="server" OnClick="boton_peticiones_Click" CssClass="tipo_texto boton_mamalon hvr-float-shadow" />
                    <asp:LinkButton ID="boton_ver_mis_peticiones" Text="Mis Peticiones" runat="server" OnClick="boton_ver_mis_peticiones_Click" CssClass="tipo_texto boton_mamalon hvr-float-shadow" />
                </div>
            </div>
            <div class="separador_altas">
            </div>
            <div id="div_derecho" class="centro capitalizar" style="background: white;">
                <asp:Panel ID="panel_surtir_peticiones_trasferencia" runat="server">
                    <div id="div_panel_reorden" class="limitado">
                        <div>
                            <asp:UpdatePanel ID="actualizacion_trasferencias" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>
                                    <asp:GridView ID="tabla_trasferencias" runat="server" CssClass="tabla" AutoGenerateColumns="false"
                                        DataKeyNames="clave_trasferencia,sucursal_r" OnRowCommand="tabla_trasferencias_RowCommand">
                                        <HeaderStyle CssClass="GridHeader" />
                                        <PagerSettings Visible="False" />
                                        <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Center" />
                                        <AlternatingRowStyle CssClass="GridRow" />
                                        <Columns>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="filacheck" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Clave Trasferencia" DataField="clave_trasferencia" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Estado" DataField="estado" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Sucursal Solicita" DataField="sucursal" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Sucursal Respuesta" DataField="sucursal_r" ItemStyle-HorizontalAlign="Center" Visible="false"></asp:BoundField>
                                            <asp:BoundField HeaderText="Solicita" DataField="vendedor" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Proceso" DataField="vendedor_p" ItemStyle-HorizontalAlign="Center" Visible="false"></asp:BoundField>
                                            <asp:BoundField HeaderText="Fecha" DataField="fecha" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                            <asp:BoundField HeaderText="Finalizacion" DataField="fecha_finalizacion" ItemStyle-HorizontalAlign="Center" Visible="false"></asp:BoundField>
                                            <asp:BoundField HeaderText="Comentario" DataField="comentario" ItemStyle-HorizontalAlign="Left" Visible="false"></asp:BoundField>
                                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="boton_detalles" runat="server" CausesValidation="False" ToolTip="Ver detalles de la trasferencia"
                                                        CommandName="Ver" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-eye controles_tablas"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tabla_trasferencias" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div id="div_filtrado">
                <div class="opciones" id="opciones" runat="server">
                    <ul class="opciones_filtrado">
                        <li class="filtro">
                            <asp:Label ID="Label1" runat="server" Text="Buscar" CssClass="separador_5"></asp:Label>
                            <asp:TextBox type="text" ID="caja_busqueda" runat="server" CssClass=" caja_medina" placeholder="Introduzca busqueda"></asp:TextBox>
                        </li>
                        <li class="lis_custom">
                            <asp:LinkButton ID="buscale" ToolTip="Busca en la tabla principal" runat="server" class="botones_proceso gris_plata" OnClientClick="return false;"><i class="fa fa-search" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="reset" runat="server" ToolTip="Reinicia la busqueda" class="botones_proceso gris_plata" OnClientClick="return false;"><i class="fa fa-refresh" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton ID="seleccionar" ToolTip="Selecciona todos los productos visibles" runat="server" class="botones_proceso gris_plata"
                                OnClientClick="return false;"><i class="fa fa-check-square-o" aria-hidden="true"></i></asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <asp:LinkButton ID="boton_oculto_si" runat="server" OnClick="boton_oculto_si_Click"
            Style="display: none;"></asp:LinkButton>
        <asp:HiddenField ID="campo_bandera" runat="server" />
        <asp:UpdatePanel ID="actualizacion_panel_sobrepuesto" runat="server">
            <ContentTemplate>
                <asp:Panel ID="panel_procesar_trasferencia" runat="server" Style="display: none;">
                    <div class="panel_dialogo">
                        <div class="limitado_chico">
                            <asp:GridView ID="tabla_productos" runat="server" CssClass="tabla" AutoGenerateColumns="false" OnRowDataBound="tabla_productos_RowDataBound" DataKeyNames="codigo,aprobacion">
                                <HeaderStyle CssClass="GridHeader" />
                                <PagerSettings Visible="False" />
                                <RowStyle CssClass="GridRow tabla_principal" HorizontalAlign="Center" />
                                <AlternatingRowStyle CssClass="GridRow" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="fila_check_box" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Clave" DataField="clave_carrito"></asp:BoundField>
                                    <asp:BoundField HeaderText="Codigo" DataField="codigo"></asp:BoundField>
                                    <asp:BoundField HeaderText="Producto" DataField="producto" />
                                    <asp:BoundField HeaderText="Cantidad Solicitada" DataField="cantidad" />
                                    <asp:BoundField HeaderText="Cantidad Pendiente" DataField="cantidad_pendiente" />
                                    <asp:TemplateField HeaderText="Cantidad A Surtir">
                                        <ItemTemplate>
                                            <asp:TextBox ID="caja_cantidad" runat="server" CssClass="cantidad" Style="display: none;"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Estado" DataField="aprobacion" />
                                    <asp:TemplateField HeaderText="Cantidad Actual">
                                        <ItemTemplate>
                                            <asp:TextBox ID="caja_cantidad_inventario" runat="server" Enabled="false" CssClass="cantidad"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="panel_controles_trasferencias" runat="server">
                            <div class="opciones" style="background: rgba(60, 92, 113, 0.78); width: 55%; left: 21%;">
                                <ul class="opciones_filtrado" style="bottom: 60%;">
                                    <li class="li_procesar_anidado">
                                        <asp:LinkButton ID="bonton_procesar_trasferencia" ToolTip="Procesar El Surtido De Productos" runat="server" class="botones_proceso blanco_opacidad hvr-grow-shadow" OnClick="bonton_procesar_trasferencia_Click"><i class="fa fa-check" aria-hidden="true"></i></asp:LinkButton>
                                        <asp:LinkButton ID="bonton_cancelar_trasferencia" runat="server" ToolTip="Cancelar Trasferencia De Productos" class="botones_proceso blanco_opacidad hvr-grow-shadow" OnClick="bonton_cancelar_trasferencia_Click"><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
                                        <asp:LinkButton ID="boton_procesar_trasferencia_requisicion" runat="server" ToolTip="Procesar Los Productos En Existencia Y Generar Una Requisicion Por Los Restantes" class="botones_proceso blanco_opacidad hvr-grow-shadow" OnClick="boton_procesar_trasferencia_requisicion_Click"><i class="fa fa-address-book" aria-hidden="true"></i></asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </asp:Panel>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
