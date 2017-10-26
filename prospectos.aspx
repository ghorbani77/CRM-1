<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/prospectos.aspx.cs" Inherits="prospectos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="jquery-timepicker-1.3.5/jquery.timepicker.js"></script>
<link href="jquery-timepicker-1.3.5/jquery.timepicker.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" language="javascript">
                  
       function nuevo(){
            window.open("alta_prospectos.aspx", "_blank", "toolbar=0,location=0,menubar=0", "scrollbars=yes");
       }
       function editar() {
           window.open("editar_prospectos.aspx", "_blank", "toolbar=0,location=0,menubar=0", "scrollbars=yes");
       }
        function validacion() {
            alert("No se permiten las comas en los comentarios");
        }
        function salir() {
            window.close();
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
        function confirmacion() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Prospecto asignado correctamente</div> ';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
        }
        function campo_vacio() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo Vacío</div> ';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
        }

        function confirmacion_2() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> Prospecto cambiado a cliente correctamente</div>';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
        }
        function no_citas() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> No existen llamadas agendadas</div>';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
        }
        function no_historial() {
            document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"> <i class="fa fa-info-circle"></i> No existe un historial para este prospecto</div>';
            setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 3500);
        }
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

    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Prospectos - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
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
        .iconos{
            font-size:1.2em;    
        }
        .iconos:hover{
            color:#4a7e8e;
        }
        
    </style>
</head>
<body bgcolor="#f0f0f0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate> 
                  <!--SECCION MENU-->
                   
                    <!--FIN--><!--MENU-->    
                    <div class="large-12 header-prospectos header-prom">
                        <span class="titulo left">PROSPECTOS</span>
                        <ul class="inline-list right ul-prom">
                            <li>
                                <asp:LinkButton ID="boton_salir" runat="server" CssClass="boton_salir"  ToolTip="Salir" onclick="boton_salir_Click">
                                    <i class="fa fa-sign-out"></i>
                                    <span>Salir</span>
                                </asp:LinkButton>
                            </li>  
                        </ul>
                    </div>
                    <div class="large-12 ">        
                        <!-- LOLOLOLOLOLOLOLOOLOLLOLOL -->  
                        <asp:Panel ID="panel_busqueda" runat="server" CssClass="" Visible="" >
                            <div  class="large-12 columns borde-punteado-bottom separador-top" style="">
                                <ul class="inline-list">
                                    <li><asp:Label ID="t_busqueda" runat="server" Text="Buscar: " CssClass="medio"><b>Buscar</b></asp:Label></li>            
                                    <li><div class="cuadro_busqueda">
                                        <asp:TextBox ID="caja_busqueda" placeholder="Introduce un nombre" onfocus="return posicionar_cursor(this.id);" onKeyUp="up();" runat="server" Enabled="True" CssClass="caja_busqueda"  > </asp:TextBox>                       
                                        </div></li>
                                    <li><asp:LinkButton ID="buscar" runat="server" ToolTip="" onkeydown="buscar();" onclick="boton_buscar_prospecto" style="text-decoration:none;" CssClass="button small success"> <i class="fa fa-search"></i> </asp:LinkButton></li>                                    
                                    <li><asp:LinkButton ID="agregar_prospecto" runat="server" ToolTip="" onclick="boton_agregar_prospecto" style="text-decoration:none;" CssClass="button small success"><i class="fa fa-plus"></i> Agregar nuevo prospecto</asp:LinkButton></li>                 
                                    <li><asp:Label CssClass="medio" ID="numero_llamadas_pendientes" runat="server"> Llamadas pendientes: </asp:Label></li>
             <li><asp:LinkButton ID="boton_llamadas_pendientes_prospectos" runat="server" ToolTip="" onclick="ver_llamadas_pendientes" style="text-decoration:none;" CssClass="button small success ">Ver llamadas pendientes</asp:LinkButton></li>  
            
                               </ul>
                             </div> 
                        </asp:Panel>
                        
                           <!-- ADMIN -->    
                           <asp:Panel ID="panel_admin" runat="server" CssClass="" Visible="false" style=" z-index:60;"  >
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

                              

                              <!-- TABLA LLAMADAS --> 
                             <asp:Panel ID="panel_llamadas_vendedores" runat="server" CssClass="" Visible="false"  style=" z-index:60;" >   
                                 <div  class="large-12 columns separador-top" style="">
                                    <asp:Label ID="Label2" runat="server" Text=" " CssClass="medio"><b>Historial de Llamadas</b></asp:Label>
                                    <asp:GridView ID="tabla_llamadas" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_llamadas() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <Columns>
                                        
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha agendada" DataField="fecha" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha registro" DataField="fecha_registro"></asp:BoundField>
                                        <asp:BoundField HeaderText="Comentarios" DataField="comentario"></asp:BoundField>
                                        <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                        
                                    </Columns>
                                </asp:GridView>
                                 </div>  
                             </asp:Panel> 



                             <!-- DATOS POR VENDEDOR --> 
                             <asp:Panel ID="panel_vendedor" runat="server" CssClass=""  >   
                             <div  class="large-12 columns borde-punteado-bottom separador-top" style="">
                                <ul class="inline-list">
                                    <li><asp:Label ID="total" runat="server" Text="" CssClass="medio"></asp:Label></li>                                                
                                    <li><asp:Label ID="prospectos_nuevos_semana" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                    <li><asp:Label ID="prospectos_nuevos_mes" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                </ul>
                                <ul class="inline-list">
                                    <li><asp:Label ID="llamadas_semana" runat="server" Text=" " CssClass="medio"></asp:Label></li>                                                
                                    <li><asp:Label ID="llamadas_mes" runat="server" Text="" CssClass="medio"></asp:Label></li>
                                </ul>
                             </div>  
                             </asp:Panel> 
                               
                               
                               
                                                     
                         <asp:Panel ID="panel_prospectos" runat="server" CssClass="" Visible="" >  
                                  
                        <div  class="inventario large-12 columns separador-top2 ajustador-tablas">
                            
                            <asp:Panel ID="panel_llamadas_pendientes" runat="server" CssClass="modulo-esp1" Visible="false" style="height:500px; width:943px;  z-index:60; "  ScrollBars="Vertical"> 
                                 <asp:LinkButton ID="LinkButton4" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_llamadas_pendientes" >
                                        <div class="cerrar-modulo"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>                               
                                 <asp:GridView ID="tabla_llamadas_pendientes" runat="server" AutoGenerateColumns="False"  DataKeyNames="id" onrowcommand="tabla_pendientes_RowCommand" DataSource='<%# datos_llamadas_pendientes() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
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
                        

                        <!-- HISTORIAL -->    
                            <asp:Panel ID="panel_historial" runat="server" CssClass="modulo-esp1" Visible="false" style="min-height:600px; min-width:600px;  z-index:60;">
                                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_historial" >
                                        <div class="cerrar-modulo"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>
                                    <asp:GridView ID="tabla_historial" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_historial() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                        <HeaderStyle CssClass="GridHeader" />
		                                <PagerSettings Visible="False" />
		                                <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Fecha de cita" DataField="fecha" ></asp:BoundField>
                                            <asp:BoundField HeaderText="Comentarios" DataField="comentarios" ></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>                                      
                            </asp:Panel>


                            <!-- LLAMADA -->    
                            <asp:Panel ID="panel_llamada" runat="server" CssClass="modulo-esp1" Visible="false" style="min-height:500px; min-width:500px;  z-index:70;">
                                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="boton_cerrar_precios boton-cerrar" OnClick="cerrar_panel_llamada" >
                                        <div class="cerrar-modulo"><i class="fa fa-times"></i>&nbsp;Cerrar Módulo</div>    
                                </asp:LinkButton>
                                <center class="texto"><b>Registrar llamada</b></center>
                                    <ul>
                                        <li><asp:Label ID="label_cliente" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li><asp:Label ID="Label_telefono" runat="server" Text=" " CssClass="medio"></asp:Label></li> 
                                        <li>Comentario anterior: <asp:Label ID="label_comentarios" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li>Fecha de último contacto: <asp:Label ID="label_fecha_ultimo_contacto" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                        <li>Comentarios:</li>
                                        <li><asp:TextBox ID="caja_comentarios_llamadas" placeholder="" runat="server"  CssClass="controles_chicos llamada"></asp:TextBox></li>
                                        <li><center class="texto"><b>Datos para próxima llamada</b></center></li>
                                        <li><p class="texto">Fecha</p></li>
                                        <li><asp:TextBox ID="caja_fecha_reagendar" placeholder="Fecha para reagendar" runat="server"  CssClass="controles_chicos llamada"></asp:TextBox></li>
                                        <li><p class="texto">Hora</p></li>
                                        <li><asp:TextBox  ID="caja_hora_reagendar" placeholder="Hora para reagendar" runat="server" class="timepicker llamada"></asp:TextBox>
                                        <li><asp:LinkButton ID="btn_llamada" runat="server" ToolTip="" onclick="boton_llamada" style="text-decoration:none;" CssClass="button small success">Guardar</asp:LinkButton> 
                                     </ul>                                         
                            </asp:Panel>

                        <!-- TABLA PROSPECTOS NUEVOS --> 
                             <asp:Panel ID="panel_prospectos_nuevos" runat="server" CssClass="" Visible="false" style=" z-index:60;" > 
                                <div  class="large-12 columns  separador-top" style="">
                                    
                                    <ul class="inline-list">
                                        <li><asp:Label ID="total_prospectos_nuevos" runat="server" Text=" " CssClass="medio"></asp:Label></li>                                                
                                        <li><asp:Label ID="total_llamadas_prospectos" runat="server" Text=" " CssClass="medio"></asp:Label></li>
                                    </ul> 
                                    <asp:Label ID="Label1" runat="server" Text=" " CssClass="medio"><b>Prospectos Nuevos</b></asp:Label>
                                    <asp:GridView ID="tabla_prospectos_nuevos" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_prospectos_nuevos() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                                    <HeaderStyle CssClass="GridHeader" />
		                            <PagerSettings Visible="False" />
		                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Correo" DataField="correo" ></asp:BoundField>
                                        <asp:BoundField HeaderText="Teléfono" DataField="telefono"></asp:BoundField>
                                        <asp:BoundField HeaderText="Fecha de alta" DataField="fecha"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                 </div>  
                             </asp:Panel> 
                    <div id='alrt' class="notificacion_div"></div><br/>

                    <!-- LOLOLOLOLOLOLOLOOLOLLOLOL -->    
                    <asp:Panel ID="panel_prospectos_tablas" runat="server" Visible="True">
                        <asp:GridView ID="tabla_prospectos" runat="server" AutoGenerateColumns="False" onrowcommand="tabla_prospectos_RowCommand" DataSource='<%# datos_prospectos() %>' DataKeyNames="id"  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
                            <HeaderStyle CssClass="GridHeader" />
		                    <PagerSettings Visible="False" />
		                    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                            <Columns>
                                <asp:BoundField HeaderText="Id" DataField="id" Visible="false"  ></asp:BoundField>
                                <asp:BoundField HeaderText="Nombre" DataField="nombre" ></asp:BoundField>
                                <asp:BoundField HeaderText="Correo" DataField="correo" ></asp:BoundField>
                                <asp:BoundField HeaderText="Teléfono" DataField="telefono"></asp:BoundField>
                                <asp:BoundField HeaderText="Celular" DataField="celular"></asp:BoundField>
                                <asp:BoundField HeaderText="Última fecha de contacto" DataField="fecha"></asp:BoundField>                                
                                <asp:TemplateField HeaderText="" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="boton_asignar" runat="server" CausesValidation="False" ToolTip="Asignar a vendedor" 
                                            CommandName="asignar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-user-plus iconos"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="control" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="boton_editar_p" runat="server" CausesValidation="False" ToolTip="Editar prospecto" 
                                            CommandName="editar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-pencil iconos"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="control" />
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="boton_llamada" runat="server" CausesValidation="False" ToolTip="Registrar llamada" 
                                            CommandName="llamada" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-phone iconos"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="control" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="boton_historial" runat="server" CausesValidation="False" ToolTip="Ver historial" 
                                            CommandName="historial" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-address-book iconos"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="control" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" ShowHeader="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="boton_cambio" runat="server" CausesValidation="False" ToolTip="Cambiar a cliente" 
                                            CommandName="clientes" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-sign-in iconos"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="control" />
                                </asp:TemplateField>

                                

                               

                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    
                </div>   
                </asp:Panel>
            <!--'botones ocultos' -->
          
            </ContentTemplate>            
        </asp:UpdatePanel>
    </form>

