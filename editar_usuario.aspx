<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/editar_usuario.aspx.cs" Inherits="editar_usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp"%>
       <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
       <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!---http://jonthornton.github.io/jquery-timepicker/-->
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
 
    <script type="text/javascript" src="js/jquery.timepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css" />
    <script type="text/javascript" src="js/jquery.timepicker.min.js"></script>

<script type="text/javascript">
    function main() { picker(); }
    function picker() {
        $("#buscarFecha").datepicker({ dateFormat: 'yy/mm/dd', maxDate: "0D", changeMonth: true, changeYear: true, defaultDate: "2000/12/31" }).val();
        $("#fecha_inicio").datepicker({ dateFormat: 'yy/mm/dd', maxDate: "0D", changeMonth: true, changeYear: true }).val();
        $('#L_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] }).val();
        $('#L_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#M_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#M_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#MI_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#MI_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#J_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#J_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#V_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#V_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#S_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#S_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#D_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#D_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });



    }


    //si el usuario envio algo que no sea formato de imagen saldra un error
    function uploadError(sender, args) {
        document.getElementById("<%= panel_cargando_general.ClientID %>").style.display = "none";
        document.getElementById('mensaje_imagen').innerText = args.get_fileName(), "<span style='color:red;'>" + args.get_errorMessage() + "</span>";
    }

    function StartUpload(sender, args) {
        cargar("archivo");
        document.getElementById("<%= icono_adjuntar.ClientID %>").style.display = "none";
        //document.getElementById('mensaje_imagen').innerText = 'Adjuntando archivo...';
    }

    function UploadComplete(sender, args) {
        document.getElementById("<%= panel_cargando_general.ClientID %>").style.display = "none";
        window.location.reload()
    }

    function mensaje() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje_mostrar');
            boton.click();
        }, 1800);
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
                // var boton = document.getElementById('actualizar');
                // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 15000);
    })()
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();

    function cargar(boton) {
        document.getElementById("<%= panel_cargando_general.ClientID %>").style.display = "inline";
        if (boton.toString() == 'archivo') {
            setTimeout(function () {
                document.getElementById('boton_oculto_foto');
                boton.click();
            }, 300);
        }

        if (boton.toString() == 'boton_guardar_usuario') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_guardar');
                boton.click();
            }, 300);
        }
        if (boton.toString() == 'boton_promociones') {
            setTimeout(function () {
                var boton = document.getElementById('boton_oculto_promociones');
                boton.click();
            }, 300);
        }
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

    function salir() {
        window.close();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8"/>
    <title>Control de usuario - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css"/>
    <link rel="stylesheet" href="css/custom.css"/>
    <link rel="stylesheet" href="css/mario.css"/>
    <script src="js/vendor/modernizr.js"></script>
    <script src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
    <style> </style>
</head>

<body  Style=" background:#ecf0f1 !important">
    <form id="form1" runat="server" >
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <div class="large-12"> 
         <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
                <asp:Panel ID="panel_cargando_general" runat="server" Visible="True" Style="text-decoration: none; display: none">
                <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-circle-o-notch fa-spin fa-3x"></i></asp:Label></asp:Panel>   
                
               

            <!--Titulo-->
            <div class="large-12 header-cotizaciones header-alta header-prom" runat="server">
                 <div class="controles">
                    <span class="titulo left"><asp:Label ID="titulo" runat="server"> Perfil de usuario</asp:Label></span>
                 </div>
            
                 <ul class="inline-list right ul-prom">
                     <li><asp:LinkButton ID="boton_salir" runat="server" onClick="boton_salir_Click" CssClass="boton_salir"  ToolTip="Salir"><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton><span>Salir</span></li>
                 </ul>
   
            </div>

            <div id="formulario" runat="server">
             <asp:Panel ID="mensajes_generales" runat="server" CssClass="mensajes_grises" Visible="False">
                    <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                        <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                    </asp:Panel>
                    <asp:Label ID="mensaje_mostrar" CssClass="mensaje" runat="server" Text="Error"></asp:Label>
                    <asp:LinkButton ID="cerrar_mensaje_mostrar" CssClass="cerrar_mensajes_correo" runat="server" onclick="cerrar_mensajes_mostrar_Click"><i class="fa fa-close"></i></asp:LinkButton>
                </asp:Panel>

         <div  runat="server" id="datos_usuario" class="large-12 columns">
        
         <div id="t_datos"class="large-12 titulo-circulo">
        <i class="fa fa-user titulo_clientes"></i>
            <span> Datos del usuario</span></div>

        <div id="primera_parte" class="large-6 columns " runat="server">
       
        
        <div id="Div1"  runat="server" class="modulo-nor" >
        <ul class="">
            <li><p><asp:Label ID="nombre" runat="server">Nombre</asp:Label></p><asp:TextBox ID="caja_nombre" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
            <li>
                            <p><asp:Label ID="Label6" runat="server">SEXO</asp:Label></p>
                            <asp:DropDownList id="drop_sexo" runat="server">
                                 <asp:ListItem Selected="True" Value="hombre">Hombre</asp:ListItem>
                                 <asp:ListItem Value="mujer">Mujer</asp:ListItem>
                            </asp:DropDownList> 
                         </li>
                 <p><asp:Label ID="lb_civil" runat="server">Estado Civil</asp:Label></p>
                 <asp:DropDownList id="drop_estado" runat="server">
                     <asp:ListItem Selected="True" Value="soltero(a)">Soltero/a</asp:ListItem>
                    <asp:ListItem Value="casado(a)">Casado/a</asp:ListItem>
                 </asp:DropDownList> 
           </li>
           <li>
                 <p><asp:Label ID="Label789" runat="server">Fecha de Nacimiento</asp:Label></p>
                 <asp:TextBox type="text" id="buscarFecha" runat="server" CssClass="filtro"  placeholder="Seleccione Fecha"></asp:TextBox>
           </li>
           <li><p><asp:Label ID="telefono" runat="server">Telefono</asp:Label></p><asp:TextBox ID="caja_telefono" runat="server" CssClass="caja_mediana" MaxLength="30"></asp:TextBox></li>
           <li><p><asp:Label ID="Label2" runat="server">Correo</asp:Label></p><asp:TextBox ID="txt_correo" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
           <li><p><asp:Label ID="Label3" runat="server">RFC</asp:Label></p><asp:TextBox ID="txt_RFC" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
           <li><p><asp:Label ID="Label4" runat="server">Seguro Social</asp:Label></p><asp:TextBox ID="txt_seguro" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
           <li><p><asp:Label ID="Label16" runat="server">Ciudad</asp:Label></p><asp:TextBox ID="txt_ciudad" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
           <li><p><asp:Label ID="Label17" runat="server">Colonia</asp:Label></p><asp:TextBox ID="txt_colonia" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
           <li><p><asp:Label ID="Label18" runat="server">Calle</asp:Label></p><asp:TextBox ID="txt_calle" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
           <li><p><asp:Label ID="Label19" runat="server">Numero</asp:Label></p><asp:TextBox ID="txt_numero" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                          
            
            </ul> 
            </div> <!-- termina modulo especial -->
            
            </div>
             <div id="segunda_parte" class="large-6 columns " runat="server">
               <div id="Div2" class="modulo-nor" runat="server">
                     <ul class="">
                          <li> 
                               
                                  
                                         <div class="fotito"    >
                                             <asp:Image ID="foto" runat="server" CssClass="foto"   />
                                         </div>
                                         <div class="controles_foto">
                                                <asp:Label ID="icono_adjuntar" runat="server" CssClass="icono_adjuntar_fot"><i class="fa fa-cloud-upload"></i></asp:Label>
                                                <asp:Label ID="Throbber" runat="server" Style="display: none" CssClass="adjuntando_fot"><i class="fa fa-spinner fa-spin fa-lg"></i></asp:Label>
                                                <asp:AsyncFileUpload ID="archivo" runat="server" CssClass="subir_archivo_fot" Visible="True" OnClientUploadError="uploadError" OnClientUploadStarted="StartUpload" OnClientUploadComplete="UploadComplete" CompleteBackColor="Transparent" ErrorBackColor="Red" ThrobberID="Throbber" OnUploadedComplete="archivo_UploadedComplete" UploadingBackColor="Transparent" ToolTip="Subir fotografia del usuario" />
                                                <br />
                                                <asp:LinkButton ID="boton_subir_foto" runat="server">Fotografia</asp:LinkButton>
                                         </div>
                                    
                                
                          </li>
                          <li><p><asp:Label ID="usuario" runat="server">Usuario</asp:Label></p><asp:TextBox Enabled="false" ID="caja_usuario" runat="server" CssClass="caja_mediana" MaxLength="50"></asp:TextBox></li>
                          <li><p><asp:Label ID="password" runat="server">Password</asp:Label></p>
                              <asp:TextBox ID="caja_password" runat="server" CssClass="caja_mediana" 
                                 MaxLength="50" ></asp:TextBox></li>
                           <li><p><asp:Label ID="confirmar_password" runat="server">Confirmar Password</asp:Label></p>
                                <asp:TextBox ID="caja_verificar" runat="server" 
                                        CssClass="caja_mediana" MaxLength="50" 
                                        ></asp:TextBox>
                           </li>
                           
                          <li><p><asp:Label ID="Label7" runat="server">Salario</asp:Label></p><asp:TextBox Enabled="false" ID="txt_salario" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                           <li><p><asp:Label ID="Label8" runat="server">Fecha de Inicio</asp:Label></p><asp:TextBox Enabled="false" type="text" id="fecha_inicio" runat="server" CssClass="filtro"  placeholder="Seleccione Fecha"></asp:TextBox></li>
                    </ul>
               </div>
             </div>

        </div>
        <div id="horario" class="large-12 columns" runat="server" >
           <div id="t_horario" class="large-12 titulo-circulo" >
                 <i class="fa fa-calendar" ></i>
                 <span>Horario</span>
          </div>

             <div id="horario_form" class="modulo-nor" runat="server" >
                 <ul id="dias" runat="server">
                               <li id="Li1" class="li-inline juntos" runat="server">
                                    <label id="Label1" runat="server">   Lunes</label>
                                    <label>Entrada</label><asp:TextBox Enabled="false" value="08:00" type="text" id="L_E" runat="server"  CssClass="menos"   placeholder="Hora Entrada"></asp:TextBox> 
                                    <label>Salida</label><asp:TextBox Enabled="false" value="18:00" type="text" id="L_S" runat="server"  CssClass="menos" placeholder="Hora Salida"></asp:TextBox>
                              
                                </li>
                            
                               <li id="Li2" class="li-inline juntos" runat="server">
                                    <label id="Label9" runat="server">   Martes</label>
                                    <label>Entrada</label><asp:TextBox Enabled="false" value="08:00" type="text" id="M_E" runat="server"  CssClass="menos" placeholder="Hora Entrada"></asp:TextBox>
                                    <label>Salida</label><asp:TextBox Enabled="false" value="18:00" type="text" id="M_S" runat="server"   CssClass="menos" placeholder="Hora Salida"></asp:TextBox>
                                </li>
                               <li id="Li3" class="li-inline juntos" runat="server">
                                    <label id="Label10" runat="server">    Miercoles</label>
                                    <label>Entrada</label><asp:TextBox Enabled="false" value="08:00" type="text" id="MI_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox> 
                                    <label>Salida</label><asp:TextBox Enabled="false" value="18:00" type="text" id="MI_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox>
                                </li>
                                <li id="Li4" class="li-inline juntos" runat="server">
                                    <label id="Label11" runat="server">    Jueves</label>
                                    <label>Entrada</label><asp:TextBox Enabled="false" value="08:00" type="text" id="J_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox> 
                                    <label>Salida</label><asp:TextBox Enabled="false" value="18:00" type="text" id="J_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox>
                                </li>
                                <li id="Li5" class="li-inline juntos" runat="server">
                                    <label id="Label12" runat="server">    Viernes</label>
                                    <label>Entrada</label><asp:TextBox Enabled="false" value="08:00" type="text" id="V_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox> 
                                    <label>Salida</label><asp:TextBox Enabled="false" value="18:00" type="text" id="V_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox>
                                </li>
                               <li id="Li6" class="li-inline juntos" runat="server">
                                    <label id="Label13" runat="server">    Sabado</label>
                                   <label>Entrada</label><asp:TextBox Enabled="false" value="08:00" type="text" id="S_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox> 
                                    <label>Salida</label><asp:TextBox Enabled="false" value="18:00" id="S_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox>
                                </li>
                               <li id="Li7" class="li-inline juntos" runat="server">
                                    <label id="Label14" runat="server">    Domingo</label>
                                    <label>Entrada</label><asp:TextBox Enabled="false" value="Descansa" type="text" id="D_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox> 
                                    <label>Salida</label><asp:TextBox Enabled="false" value="Descansa" id="D_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox>
                               </li>
                               <li id="Li8" class="li-inline juntos" runat="server">
                                    <Label id="Label15">   Tiempo de</Label>
                                    <Label id="Label5">Comida</Label>
                                    <asp:DropDownList Enabled="false" id="drop_comida" runat="server" CssClass="centrado menos">
                                        <asp:ListItem Selected="True" Value="1:00">1:00</asp:ListItem>
                                        <asp:ListItem  Value="1:15">1:15</asp:ListItem>
                                        <asp:ListItem  Value="1:30">1:30</asp:ListItem>
                                        <asp:ListItem  Value="1:45">1:45</asp:ListItem>
                                        <asp:ListItem  Value="2:00">2:00</asp:ListItem>
                                    </asp:DropDownList> 
                            </li>
                       
                            
                            
                </ul>
                  
             </div>
        </div>
        
    <div id="caracteristicas"  class="large-12 columns" >
        
        
         
           <div class="large-12 titulo-circulo">
        <i class="fa fa-asterisk"></i>
            <span>Caracteristicas</span></div>
         
            
            
            
   
    
   
       
        <div class="modulo-nor">
    <ul class="inline-list">
        
         <li class="li-inline"><p><asp:Label ID="departamento" runat="server">Departamento</asp:Label></p><asp:DropDownList Enabled="false" ID="lista_departamentos" runat="server" CssClass="lista micha">
          </asp:DropDownList>
      </li>

        <li><p><asp:Label ID="grupo" runat="server">Grupo</asp:Label></p><asp:DropDownList Enabled="false" ID="lista_grupos" runat="server" CssClass="lista micha">
          </asp:DropDownList>
    </li>

    <li><p><asp:Label ID="sucursal" runat="server">Sucursal</asp:Label></p><asp:DropDownList Enabled="false" ID="lista_sucursales" runat="server" CssClass="lista micha">
          </asp:DropDownList>
    </li>
        </ul>
 
   
            </div> <!-- termina modulo especial -->
            
        </div>
         
     </div>
     
                   
            </ContentTemplate><Triggers></Triggers>
        </asp:UpdatePanel>
       
          <div class="modulo-nor">
        <asp:LinkButton ID="boton_guardar_usuario" Enabled="True" runat="server" ToolTip="Guardar datos del usuario"
                Style="text-decoration: none; position: relative !important;"  onclick="boton_guardar_Click" CssClass="boton_guardar button small success">Guardar</asp:LinkButton>
                <asp:LinkButton ID="boton_promociones" onclick="boton_promociones_Click" Enabled="False" runat="server" ToolTip="Mandar nuevas promociones"
                Style="text-decoration: none;position: relative !important; left:50px !important;" CssClass="boton_guardar button small success">Promociones</asp:LinkButton>
        
        </div>
        </div>
        
        

                <asp:LinkButton ID="boton_oculto_promociones" runat="server" 
                Style="text-decoration: none; display: none" onclick="boton_oculto_promociones_Click"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_guardar" runat="server" 
                Style="text-decoration: none; display: none" onclick="boton_oculto_guardar_Click"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
                <asp:LinkButton ID="boton_oculto_foto" runat="server" 
                Style="text-decoration: none; display: none" onclick="boton_oculto_foto_Click"><i class="fa fa-gear fa-spin"></i></asp:LinkButton>
    </form>
</body>
</html>