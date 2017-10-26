<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/editar_cliente.aspx.cs" Inherits="editar_cliente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="jquery-timepicker-1.3.5/jquery.timepicker.js"></script>
<link href="jquery-timepicker-1.3.5/jquery.timepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

    /*(function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };
        setInterval(function () {
            if (!mouse && !keyboard) {
               // var boton = document.getElementById('actualizar');
               // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 15000);
    })()*/
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();

    function posicionar_cursor(textControlID) {
        var texto = document.getElementById(textControlID);
        if (texto != null && texto.value.length > 0) {
            if (texto.createTextRange) {
                var rango_campo_texto = texto.createTextRange();
                rango_campo_texto.moveStart('character', texto.value.length);
                rango_campo_texto.collapse();
                rango_campo_texto.select();
            } else if (texto.setSelectionRange) {
                var size = texto.value.length;
                texto.setSelectionRange(size, size);
            }
        }
    }

    function up() {
        posicionar_cursor();     
        var boton = document.getElementById('buscar');
        boton.click();
    }
    function salir() {
        window.close();
    }

    function validacion() {
        alert("No se permiten las comas en los comentarios");
    }
    function confirmacion() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Guardado correctamente</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    function no_historial() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> No existen registros para este cliente</div>';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    function campo_vacio() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo Vacío</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }
    function pageLoad() {
        $(function () {
            $("#date").datepicker({ dateFormat: 'yy/mm/dd', disableTextInput: true, minDate: "0D" }).val();
        });
        $(function () {
            $("#caja_fecha_reagendar").datepicker({ dateFormat: 'yy/mm/dd', disableTextInput: true, minDate: "0D" }).val();
        });
        $(function () {
            $("#fecha_inicio").datepicker({ dateFormat: 'yy/mm/dd' }).val();
        });
        $(function () {
            $("#fecha_final").datepicker({ dateFormat: 'yy/mm/dd' }).val();
        });
        $(document).ready(function () {
            $('input.timepicker').timepicker({
                timeFormat: 'h:mm p',
                interval: 30,
                minTime: '7:00am',
                maxTime: '7:00pm',
                defaultTime: '8',
                startTime: '8',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        });

        $('#btn_llamada').click(function () {
            var error = 0;
            $(".llamada").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', '#e03f3f');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (error == 0) {
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });



    }
    function no_citas() {
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> No existen llamadas agendadas</div>';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editar clientes - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script src="js/vendor/modernizr.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
     <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
     <link rel="stylesheet" href="css/material-design-font.css">
     <link rel="stylesheet" href="css/melissa.css" />
     <style type="text/css">

       .modulo-esp1 {
            background: #ffffff;
            box-shadow: 1px 1px 5px 1px #e3e3e6;
            left: 58%;
            padding: 15px;
            position: fixed;
            top: 400px;
            transform: translate(-50%, -50%);
            /*z-index: 60;*/
        }
        .boton-cerrar {
            color:white;
            border-radius: 20px;
        }
        .boton-cerrar:hover {
            color:white;
        }
        .cerrar-modulo2 {
            background: #364347;
            height: 30px;
            padding: 3px 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: 400;
            font-size: .9rem;
            text-align: center;
            border-radius: 20px;
        }
        button.success, .button.success {
            background-color: #254048;
            border-color: #254048;
            color: white;
            border-radius: 20px;
        }
  
        button.success, .button.success:hover {
            background-color: #4a7e8e;
            border-color: #4a7e8e;
            color: white;
        }
        button.success, .button.success:active {
            background-color: #4a7e8e;
            border-color: #4a7e8e;
            color: white;
        }
        button.success, .button.success:focus {
            background-color: #4a7e8e;
            border-color: #4a7e8e;
            color: white;
            border-radius: 20px;
        }
        #buscar {
            width: 68px !important;
            height: 40px !important;
            margin-right: 5px !important;
        }
        .notificacion_div{
            left:40%; 
            position:absolute;
            z-index:99;
            
        }
        .notificacion_mensaje{
            background: #e81414;
            height: 30px;
            padding: 3px 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 1.1em;
            text-align: center;
            color: #ffffff;
            opacity: 0.8;  
            border-radius: 20px;
            font-weight: bold;
        }
       
        
        
    </style>
</head>

<body bgcolor="#0080c0">
    <form id="form1" runat="server">
        <div class="large-12 ">            
            <div class="large-12 header-inventario header-prom">
                <span class="titulo left">BÚSQUEDA DE CLIENTES</span>
                <ul class="inline-list right ul-prom">
                    <li>
                        <asp:LinkButton ID="boton_salir" runat="server" onClick="boton_salir_Click" CssClass="boton_salir"  ToolTip="Salir"><i class="fa fa-sign-out"></i><span>Salir</span></asp:LinkButton>
                    </li>
                </ul>   
            </div>
        </div>

      <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     
     <asp:Panel ID="panel_busqueda" runat="server"  Visible="true"  >
        <div class="large-12 columns borde-punteado-bottom separador-top" style="height:80px;">
            <ul class="inline-list">
                <li>
                    <asp:Label ID="t_busqueda" runat="server" Text="Buscar: " CssClass="medio"></asp:Label>
                </li>            
                <li>
                    <div class="cuadro_busqueda">
                        <asp:TextBox ID="caja_busqueda" placeholder="Introduce un nombre" onfocus="return posicionar_cursor(this.id);" runat="server" Enabled="True" CssClass="caja_busqueda" 
                            ontextchanged="caja_busqueda_TextChanged" onKeyUp="up();" ></asp:TextBox> <i class="fa fa-search"></i>                        
                    </div> 
                </li>
                <li><asp:LinkButton ID="boton_administrar_llamadas" runat="server" ToolTip="" OnClick="abrir_panel_administracion" Visible="false" style="text-decoration:none;" CssClass="button small success ">Ver registros de llamadas</asp:LinkButton></li> 
                 <li><asp:Label CssClass="medio" ID="numero_llamadas_pendientes" runat="server"> Llamadas pendientes: </asp:Label></li>
             <li><asp:LinkButton ID="boton_llamadas_pendientes_reporte" runat="server" ToolTip="" onclick="ver_llamadas_pendientes" style="text-decoration:none;" CssClass="button small success ">Ver llamadas pendientes</asp:LinkButton></li>  
             </ul> 
           <asp:Button ID="buscar" runat="server"  Text="actualizar" onkeydown="buscar();" Visible="True" style="visibility:hidden" onclick="buscar_Click"/>                  
        </div>
         <div>         
            
                                    
         </div>
        </asp:Panel>



                        <!-- ADMIN -->   
                    <asp:Panel ID="panel_admon" runat="server" CssClass="modulo-esp1" Visible="false" style="height:70%; width:80%; z-index:100; " ScrollBars="Vertical"> 
                        <asp:LinkButton ID="btn_cerrar_admon" runat="server" CssClass="boton-cerrar" OnClick="cerrar_panel_admon" >
                                        <div class="cerrar-modulo2"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>
                           <asp:Panel ID="panel_admin" runat="server" CssClass="" Visible="true" >
                            <div  class="large-12 columns borde-punteado-bottom separador-top" style="">
                                <ul class="lista_banco">
                                     <li><asp:Label ID="vendedor" runat="server">Vendedor</asp:Label></li>
                                     <li><asp:DropDownList ID="lista_vendedores" runat="server" CssClass="caja_mini micha" ></asp:DropDownList></li>
                                     <li><p class="texto">Fechas</p></li>
                                     <li><asp:TextBox ID="fecha_inicio" placeholder="Fecha Inicio" runat="server"  CssClass="caja_mini micha"></asp:TextBox></li>
                                     <li><asp:TextBox ID="fecha_final" placeholder="Fecha Final" runat="server"  CssClass="caja_mini micha"></asp:TextBox></li>  
                                     <li><asp:LinkButton ID="boton_datos_vendendores" runat="server" ToolTip="" onclick="boton_vendedores" style="text-decoration:none;" CssClass="button small success ">Ver datos</asp:LinkButton></li> 
                                </ul>
                             </div>
                             </asp:Panel>
                              
                             <asp:Panel ID="panel_llamadas_historial" runat="server" CssClass="" Visible="false"  > 
                                <div  class="large-12 columns  separador-top" style="">                                    
                               
                                    <asp:GridView ID="tabla_llamadas_historial" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_llamadas() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Comentarios" DataField="comentario" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha agendada" DataField="fecha"></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha Registro" DataField="fecha_registro"></asp:BoundField>
                                         <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                 </div>  
                             </asp:Panel> 
                </asp:Panel> 
                       
                        <asp:Panel ID="panel_llamadas_pendientes" runat="server" CssClass="modulo-esp1" Visible="false" style="min-height:500px; min-width:700px; z-index:60;  "  > 
                                 <asp:LinkButton ID="LinkButton4" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_llamadas_pendientes" >
                                        <div class="cerrar-modulo"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>                               
                                 <asp:GridView ID="tabla_llamadas_pendientes" runat="server" DataKeyNames="id" onrowcommand="tabla_pendientes_RowCommand" AutoGenerateColumns="False" DataSource='<%# datos_llamadas_pendientes() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Id" DataField="id" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                        <asp:BoundField HeaderText="Teléfono" DataField="contacto" ></asp:BoundField>

                                         <asp:TemplateField HeaderText="" ShowHeader="True">
                                            <ItemTemplate>
                                                    <asp:LinkButton ID="boton_llamar_pendiente" runat="server" CausesValidation="False" ToolTip="Llamar" Enabled="True" 
                                                    CommandName="llamada_pendientes" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-phone iconos "></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="control" />                                            
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                                 </div>  
                             </asp:Panel> 
                       

                    <asp:Panel ID="panel_llamada" runat="server" CssClass="modulo-esp1" Visible="false" style="min-height:500px; min-width:500px; z-index:70; ">
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_llamada" >
                                        <div class="cerrar-modulo"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>
                                <asp:HiddenField id="caja_id" runat="server"/>
                                    <center class="texto"><b>Registrar llamada</b></center>
                                    <ul>
                                        <li><asp:Label ID="Label_nombre_cliente" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li><asp:Label ID="Label_contacto" runat="server" Text=" " CssClass="medio"></asp:Label></li> 
                                        <li><asp:Label ID="Label_telefono" runat="server" Text=" " CssClass="medio"></asp:Label></li> 
                                        <li>Comentario anterior: <asp:Label ID="label_comentarios" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li>Fecha de último contacto: <asp:Label ID="label_fecha_ultimo_contacto" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li><asp:TextBox ID="caja_comentarios_llamadas" placeholder="" runat="server"  CssClass="controles_chicos llamada"></asp:TextBox></li>
                                        <li><center class="texto"><b>Datos para próxima llamada</b></center></li>
                                        <li><p class="texto">Fecha</p></li>
                                        <li><asp:TextBox ID="caja_fecha_reagendar" placeholder="Fecha para reagendar" runat="server"  CssClass="controles_chicos llamada"></asp:TextBox></li>
                                        <li><p class="texto">Hora</p></li>
                                        <li><asp:TextBox  ID="caja_hora_reagendar" placeholder="Hora para reagendar" runat="server" class="timepicker llamada"></asp:TextBox>
                                        <li><asp:LinkButton ID="btn_llamada" runat="server" ToolTip="" onclick="boton_llamada" style="text-decoration:none;" CssClass="button small success">Guardar</asp:LinkButton> 
                                    </ul>                                         
                            </asp:Panel>


       <asp:Panel ID="panel_historial" runat="server" CssClass="modulo-esp1" Visible="false" style="height:600px; width:600px; z-index:60;"  ScrollBars="Vertical" >
           <asp:LinkButton ID="LinkButton2" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_historial" >
           <div class="cerrar-modulo"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
           </asp:LinkButton>
           <asp:GridView ID="tabla_historial" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_historial() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
               <HeaderStyle CssClass="GridHeader" />
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                <Columns>
                <asp:BoundField HeaderText="Fecha de llamada" DataField="fecha" ></asp:BoundField>
                <asp:BoundField HeaderText="Comentarios" DataField="comentarios" ></asp:BoundField>
                </Columns>
            </asp:GridView>                                      
        </asp:Panel>


       <div id='alrt' class="notificacion_div"></div><br/>

        <asp:Panel ID="panel_tabla" runat="server"  Visible="true"  >
        <div class="large-12 columns borde-punteado-bottom separador-top">
            <asp:GridView ID="tabla_clientes" runat="server" AutoGenerateColumns="False" DataKeyNames="id"  DataSource='<%# datos_clientes() %>' onrowcommand="tabla_clientes_RowCommand" CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="id" Visible="false" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Nombre" DataField="nombre" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                <asp:BoundField HeaderText="RFC" DataField="rfc" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Dirección" DataField="direccion" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Teléfono" DataField="telefono" >
                 <HeaderStyle CssClass="cabecera_gridview" />
                </asp:BoundField>
                
                 <asp:TemplateField HeaderText="" ShowHeader="True">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" ToolTip="Editar Cliente" CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil opcion_tabla"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="control" />
                    <HeaderStyle CssClass="cabecera_gridview" />
                 </asp:TemplateField>


                <asp:TemplateField HeaderText="" ShowHeader="True">
                    <ItemTemplate>
                            <asp:LinkButton ID="boton_llamada" runat="server" CausesValidation="False" ToolTip="Llamar" Enabled="True" 
                            CommandName="llamada" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-phone iconos "></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="control" />
                    <HeaderStyle CssClass="cabecera_gridview" />
                </asp:TemplateField>

                               


                <asp:TemplateField HeaderText="" ShowHeader="True">
                    <ItemTemplate>
                            <asp:LinkButton ID="boton_historial" runat="server" CausesValidation="False" ToolTip="Historial de llamadas" Enabled="True" 
                            CommandName="historial" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-address-book iconos"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="control" />
                    <HeaderStyle CssClass="cabecera_gridview" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="" ShowHeader="True">
                    <ItemTemplate>
                            <asp:LinkButton ID="boton_cotizar" runat="server" CausesValidation="False" ToolTip="Cotizar Sucursal" Enabled="False" 
                            CommandName="cotizar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-plus-square-o opcion_tabla"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="control" />
                    <HeaderStyle CssClass="cabecera_gridview" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="" ShowHeader="True">
                    <ItemTemplate>
                            <asp:LinkButton ID="boton_bloquear" runat="server" CausesValidation="False" ToolTip="Bloquear Cliente" 
                            CommandName="bloqueo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-lock opcion_tabla"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="control" />
                    <HeaderStyle CssClass="cabecera_gridview" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="" ShowHeader="True">
                    <ItemTemplate>
                            <asp:LinkButton ID="boton_desbloquear" runat="server" CausesValidation="False" ToolTip="Desbloquear Cliente" 
                            CommandName="desbloqueo" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-unlock opcion_tabla"></i></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="control" />
                    <HeaderStyle CssClass="cabecera_gridview" />
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        </div>
        </asp:Panel>


        </ContentTemplate>

       
    </asp:UpdatePanel>
    </form>

