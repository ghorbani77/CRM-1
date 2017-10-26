<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/alta_usuarios.aspx.cs" Inherits="alta_usuarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
       <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!---http://jonthornton.github.io/jquery-timepicker/-->
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
 
    <script type="text/javascript" src="js/jquery.timepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery.timepicker.css" />
    <script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
    
<script type="text/javascript">


    function change() {
    var radio1 = document.getElementById('r_m');
    var radio2 = document.getElementById('r_o');
  
  

    if (radio1.checked == true && radio2.checked==false) 
    {
        document.getElementById("<%= txt_nacionalidad.ClientID %>").style.visibility = "hidden";
        document.getElementById("<%= txt_nacionalidad.ClientID %>").value = "mexicana";
        document.getElementById("<%= txt_ine.ClientID %>").style.visibility = "visible";
        document.getElementById("<%= txt_ine.ClientID %>").value = "";
        document.getElementById("<%= lbl_ine.ClientID %>").style.visibility = "visible";
   }
   else 
   {
       if (radio2.checked == true && radio1.checked == false) 
       {
           document.getElementById("<%= txt_nacionalidad.ClientID %>").style.visibility = "visible";
           document.getElementById("<%= txt_nacionalidad.ClientID %>").value = "";
           document.getElementById("<%= txt_ine.ClientID %>").style.visibility = "hidden";
           document.getElementById("<%= txt_ine.ClientID %>").value = "N/A";
           document.getElementById("<%= lbl_ine.ClientID %>").style.visibility = "hidden";
       }
   }

  }




  function licencia() {
      var radio3 = document.getElementById('r_l_s');
      var radio4 = document.getElementById('r_l_n');

      if (radio3.checked == true && radio4.checked == false) {
          document.getElementById("<%= txt_licencia.ClientID %>").style.visibility = "visible";
          document.getElementById("<%= txt_licencia.ClientID %>").value = "";
      }
      else {
          if (radio4.checked == true && radio3.checked == false) {
              document.getElementById("<%= txt_licencia.ClientID %>").style.visibility = "hidden";
              document.getElementById("<%= txt_licencia.ClientID %>").value = "N/A";
          }

      }
  }

function contrato() {
    var contrato = document.getElementById('drop_contrato');

    if (contrato.value == "indeterminado") {
        document.getElementById("<%= lbl_fc.ClientID %>").style.visibility = "hidden";
        document.getElementById("<%= f_contrato.ClientID %>").style.visibility = "hidden";
        document.getElementById("<%= f_contrato.ClientID %>").value = "N/A";


    }
    else {
        document.getElementById("<%= lbl_fc.ClientID %>").style.visibility = "visible";
        document.getElementById("<%= f_contrato.ClientID %>").style.visibility = "visible";
        document.getElementById("<%= f_contrato.ClientID %>").value = "";

    } 
}

    function main() {picker();}
    function picker () {
        $("#buscarFecha").datepicker({ dateFormat: 'yy/mm/dd', maxDate: "0D", changeMonth: true, changeYear: true, defaultDate: "2000/12/31" }).val();
        $("#fecha_inicio").datepicker({ dateFormat: 'yy/mm/dd', maxDate: "0D", changeMonth: true, changeYear: true }).val();
        $("#i_contrato").datepicker({ dateFormat: 'yy/mm/dd', maxDate: "0D", changeMonth: true, changeYear: true, defaultDate: "2000/12/31" }).val();
        $("#f_contrato").datepicker({ dateFormat: 'yy/mm/dd', maxDate: "0D", changeMonth: true, changeYear: true, defaultDate: "2000/12/31" }).val();
        $('#L_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] }).val();
        $('#L_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#M_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#M_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#MI_E').timepicker({'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#MI_S').timepicker({'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#J_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#J_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#V_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#V_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#S_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#S_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#D_E').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });
        $('#D_S').timepicker({ 'minTime': '6:00am', 'maxTime': '9:30pm', 'disableTextInput': true, 'noneOption': [{ 'label': 'Descansa', 'value': 'Descansa'}] });

             

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
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()
    function abrir() 
    {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function activar_boton() 
    {
        document.getElementById("<%= boton_guardar.ClientID %>").style.display = "Visible";
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "hidden";
    }
    function salir() 
    {
        window.close();
    }
    function desactivar_boton() 
    {
        document.getElementById("<%= boton_fantasma.ClientID %>").style.visibility = "visible";
        document.getElementById("<%= boton_guardar.ClientID %>").style.display = "none"
    }
    function usuario_invalido() {
        
        alert('Error el usuario no es valido verificar que sea una direccion de correo valida');
        
    }
    function password_diferente() 
    {   
        alert('Error los password no coinciden verificar');
        
    }
    function listo() 
    {
        alert('El usuario ha sido creado con exito');
        
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
       
    }
    function usuario_existente() 
    {
        alert('Error usuario existente verifique elija un usuario distinto');

    }
   
    
    document.onkeypress = stopRKey;
	</script>
    
    
       
   

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <title>Alta de Usuarios</title>
   
  
    
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">
      
</head>

<body bgcolor="#0080c0">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="large-12"> 
             <asp:UpdatePanel ID="panel_form" runat="server">
                 <ContentTemplate>      
                 <div  class="large-12 header-cotizaciones header-alta header-prom" runat="server">
                    <div class="controles">
                         <span class="titulo left">Alta de Usuarios</span>
                    </div>            
                    <ul class="inline-list right ul-prom">
                        <li><asp:LinkButton ID="boton_cancelar" runat="server" CssClass="boton" ToolTip="Cancelar" onclick="boton_cancelar_Click"><i class="fa fa-sign-out icono_boton"></i></asp:LinkButton><span>Salir</span></li>
                    </ul>
                </div>
                 <div id="formulario" runat="server">
                    <div  runat="server" id="datos_personales" class="large-12 columns">
                        <div id="t_datos"class="large-12 titulo-circulo">
                            <i class="fa fa-user titulo_clientes"></i>
                            <span> Datos Personales</span>
                         </div>
                        <div id="primera_parte" class="large-6 columns " runat="server">
                            <div  runat="server" class="modulo-nor" >
                                <ul class="lista_altas">
                                    <li><p><asp:Label ID="nombre" runat="server">Nombre</asp:Label></p><asp:TextBox ID="caja_nombre" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label6" runat="server">SEXO</asp:Label></p><asp:DropDownList id="drop_sexo" runat="server"><asp:ListItem Selected="True" Value="hombre">Hombre</asp:ListItem><asp:ListItem Value="mujer">Mujer</asp:ListItem></asp:DropDownList></li>
                                    <li><p><asp:Label ID="lb_civil" runat="server">Estado Civil</asp:Label></p><asp:DropDownList id="drop_estado" runat="server"><asp:ListItem Selected="True" Value="soltero(a)">Soltero/a</asp:ListItem><asp:ListItem Value="casado(a)">Casado/a</asp:ListItem></asp:DropDownList></li>
                                    <li><p><asp:Label ID="Label789" runat="server">Fecha de Nacimiento</asp:Label></p><asp:TextBox type="text" id="buscarFecha" runat="server" CssClass="filtro"  placeholder="Seleccione Fecha"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label24" runat="server">Nacionalidad</asp:Label></p><asp:RadioButton ID="r_m" runat="server" Text="Mexicana" GroupName="nacionalidad" Checked="true" onclick="change();" CssClass=""/><asp:RadioButton ID="r_o" runat="server" onclick="change();" Text="Otra" GroupName="nacionalidad"/><asp:TextBox ID="txt_nacionalidad" runat="server" Style="text-transform: uppercase; visibility:visible; width: 67% !important;"  MaxLength="100" Text="mexicana" CssClass="separacion"></asp:TextBox></li>             
                                    <li><p><asp:Label ID="Label25" runat="server">Licencia de Manejar</asp:Label></p><asp:RadioButton ID="r_l_n" onclick="licencia();" runat="server" Text="NO" GroupName="licencia" Checked="true" /><asp:RadioButton ID="r_l_s" runat="server" Text="SI" onclick="licencia();" GroupName="licencia" /><asp:TextBox ID="txt_licencia" runat="server" Style="text-transform: uppercase; visibility:visible; width: 78% !important;"  MaxLength="100" Text="N/A" CssClass="separacion"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label3" runat="server">RFC</asp:Label></p><asp:TextBox ID="txt_RFC" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label4" runat="server">Seguro Social</asp:Label></p><asp:TextBox ID="txt_seguro" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label27" runat="server">CURP</asp:Label></p><asp:TextBox ID="txt_curp" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li> 
                                    <li><p><asp:Label ID="lbl_ine" runat="server">INE</asp:Label></p><asp:TextBox ID="txt_ine" runat="server" CssClass="caja_mediana" MaxLength="30"></asp:TextBox></li>
                                </ul> 
                            </div> <!-- termina modulo especial -->
            
                        </div>
                        <div id="segunda_parte" class="large-6 columns " runat="server">
                        <div class="modulo-nor" runat="server">
                            <ul class="lista_altas">
                                <li><p><asp:Label ID="Label28" runat="server">Infonavit</asp:Label></p><asp:TextBox ID="txt_infonavit" runat="server" CssClass="caja_mediana " MaxLength="30"></asp:TextBox></li>
                                <li><p><asp:Label ID="Label16" runat="server">Ciudad</asp:Label></p><asp:TextBox ID="txt_ciudad" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                <li><p><asp:Label ID="Label17" runat="server">Colonia</asp:Label></p><asp:TextBox ID="txt_colonia" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                <li><p><asp:Label ID="Label18" runat="server">Calle</asp:Label></p><asp:TextBox ID="txt_calle" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                <li><p><asp:Label ID="Label19" runat="server">Numero</asp:Label></p><asp:TextBox ID="txt_numero" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                <li><p><asp:Label ID="Label2" runat="server">Correo</asp:Label></p><asp:TextBox ID="txt_correo" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                <li><p><asp:Label ID="telefono" runat="server">Telefono</asp:Label></p><asp:TextBox ID="caja_telefono" runat="server" CssClass="caja_mediana" MaxLength="30" Text="N/A"></asp:TextBox></li> 
                                <li><p><asp:Label ID="Label30" runat="server">CED. PROF. FED.</asp:Label></p><asp:TextBox ID="txt_ced_fed" runat="server" CssClass="caja_mediana" MaxLength="30" Text="N/A"></asp:TextBox></li>
                                <li><p><asp:Label ID="Label31" runat="server">CED. PROF. EDO.</asp:Label></p><asp:TextBox ID="txt_ced_edo" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100" Text="N/A"></asp:TextBox></li>
                            </ul>
                        </div>
                    </div>
                    </div>
                    <div id="horario" class="large-12 columns" runat="server" >
                        <div id="horario_form" class="modulo-nor" runat="server" >
                            <div id="t_horario" class="large-12 titulo-circulo" >
                                <i class="fa fa-calendar" ></i>
                                <span>Horario</span>
                            </div>
                            <ul id="dias" runat="server">
                               <li id="Li1" class="li-inline juntos" runat="server"><label id="Label1" runat="server">Lunes</label><label>Entrada</label><asp:TextBox value="08:00" type="text" id="L_E" runat="server"  CssClass="menos"   placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="18:00" type="text" id="L_S" runat="server"  CssClass="menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li2" class="li-inline juntos" runat="server"><label id="Label9" runat="server">Martes</label><label>Entrada</label><asp:TextBox value="08:00" type="text" id="M_E" runat="server"  CssClass="menos" placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="18:00" type="text" id="M_S" runat="server"   CssClass="menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li3" class="li-inline juntos" runat="server"><label id="Label10" runat="server">Miercoles</label><label>Entrada</label><asp:TextBox value="08:00" type="text" id="MI_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="18:00" type="text" id="MI_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li4" class="li-inline juntos" runat="server"><label id="Label11" runat="server">Jueves</label><label>Entrada</label><asp:TextBox value="08:00" type="text" id="J_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="18:00" type="text" id="J_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li5" class="li-inline juntos" runat="server"><label id="Label12" runat="server">Viernes</label><label>Entrada</label><asp:TextBox value="08:00" type="text" id="V_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="18:00" type="text" id="V_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li6" class="li-inline juntos" runat="server"><label id="Label13" runat="server">Sabado</label><label>Entrada</label><asp:TextBox value="08:00" type="text" id="S_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="18:00" id="S_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li7" class="li-inline juntos" runat="server"><label id="Label14" runat="server">Domingo</label><label>Entrada</label><asp:TextBox value="Descansa" type="text" id="D_E" runat="server"  CssClass=" menos"  placeholder="Hora Entrada"></asp:TextBox><label>Salida</label><asp:TextBox value="Descansa" id="D_S" runat="server"   CssClass=" menos" placeholder="Hora Salida"></asp:TextBox></li>
                               <li id="Li8" class="li-inline juntos" runat="server"><Label id="Label15">Tiempo de</Label><Label id="Label5">Comida</Label><asp:DropDownList id="drop_comida" runat="server" CssClass="centrado menos"><asp:ListItem Selected="True" Value="1:00">1:00</asp:ListItem><asp:ListItem  Value="1:15">1:15</asp:ListItem><asp:ListItem  Value="1:30">1:30</asp:ListItem><asp:ListItem  Value="1:45">1:45</asp:ListItem><asp:ListItem  Value="2:00">2:00</asp:ListItem></asp:DropDownList></li>
                            </ul>
                       </div>
                    </div>
                    <div id="caracteristicas" runat="server"  class="large-12 columns" >
                        <div id="caracteristicas_user" runat="server" class="large-6 column">
                            <div  class="modulo-nor" runat="server">
                                <div class="large-12 titulo-circulo">
                                    <i class="fa fa-asterisk"></i>
                                    <span>Caracteristicas</span>
                                </div>
                                <ul>
                                    <li><p><asp:Label ID="departamento" runat="server">Departamento</asp:Label></p><asp:DropDownList ID="lista_departamentos" runat="server" ></asp:DropDownList></li>
                                    <li><p><asp:Label ID="Label23" runat="server">Puesto</asp:Label></p><asp:DropDownList id="drop_puesto" runat="server"><asp:ListItem Selected="True" Value="jefe">Jefe</asp:ListItem><asp:ListItem Value="subjefe">Subjefe</asp:ListItem><asp:ListItem Value="subordinado">Subordinado</asp:ListItem></asp:DropDownList></asp:DropDownList></li>
                                    <li><p><asp:Label ID="grupo" runat="server">Grupo</asp:Label></p><asp:DropDownList ID="lista_grupos" runat="server" ></asp:DropDownList></li>
                                    <li><p><asp:Label ID="sucursal" runat="server">Sucursal</asp:Label></p><asp:DropDownList ID="lista_sucursales" runat="server"></asp:DropDownList></li>
                                    <li><p><asp:Label ID="Label7" runat="server">Salario</asp:Label></p><asp:TextBox ID="txt_salario" runat="server" CssClass="caja_mediana" Style="text-transform: uppercase" MaxLength="100"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label20" runat="server">Tipo de Contrato</asp:Label></p><asp:DropDownList  id="drop_contrato" runat="server" onclick="contrato();" ><asp:ListItem Selected="True" Value="determinado">Determinado</asp:ListItem><asp:ListItem Value="indeterminado">Indeterminado</asp:ListItem></asp:DropDownList></li>
                                    <li class="li-inline juntos"><p><asp:Label ID="lbl_ic" runat="server">Inicio de contrato</asp:Label></p><asp:TextBox type="text" id="i_contrato" runat="server"  Style=" width: 129px !important;" placeholder="Seleccione Fecha"></asp:TextBox> </li>
                                    <li  class="li-inline juntos"><p><asp:Label ID="lbl_fc" runat="server">Fin de contrato</asp:Label></p><asp:TextBox type="text" id="f_contrato" runat="server" Style=" width: 129px !important;"  placeholder="Seleccione Fecha"></asp:TextBox> </li>
                                </ul>
                            </div> <!-- termina modulo especial -->
                       `</div>
                        <div id="datos_user" runat="server" class="large-6 column"> 
                            <div id="datos" runat ="server" class="modulo-nor">
                                <div id="Div1"class="large-12 titulo-circulo">
                                    <i class="fa fa-id-card-o titulo_clientes"></i>
                                    <span> Datos del Usuario</span>
                                </div>
                                <ul id="lista_datos" runat ="server" >
                                    <li><p><asp:Label ID="usuario" runat="server">Usuario</asp:Label></p><asp:TextBox ID="caja_usuario" runat="server" CssClass="caja_mediana" MaxLength="50"></asp:TextBox></li>
                                    <li><p><asp:Label ID="password" runat="server">Password</asp:Label></p><asp:TextBox ID="caja_password" runat="server" CssClass="caja_mediana" MaxLength="50" TextMode="Password"></asp:TextBox></li>
                                    <li><p><asp:Label ID="confirmar_password" runat="server">Confirmar Password</asp:Label></p><asp:TextBox ID="caja_confirmar_password" runat="server" CssClass="caja_mediana" MaxLength="50" TextMode="Password"></asp:TextBox></li>
                                    <li><p><asp:Label ID="Label8" runat="server">Fecha de Inicio</asp:Label></p><asp:TextBox type="text" id="fecha_inicio" runat="server" CssClass="filtro"  placeholder="Seleccione Fecha"></asp:TextBox></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
             </ContentTemplate>
             </asp:UpdatePanel>
             <div class="large-12 columns">
                 <div class="modulo-nor">
                     <asp:LinkButton ID="boton_guardar" runat="server" ToolTip="Guardar registro del nuevo usuario" style="text-decoration:none; left:18px ; " CssClass="boton_guardar button small success" onclick="boton_guardar_Click" OnClientClick="return confirm('Desea Registrar al usuario?'); desactivar_boton();">Rigistrar</asp:LinkButton>
                     <asp:LinkButton ID="boton_fantasma" runat="server" style="text-decoration:none; visibility:hidden;" CssClass="boton_guardar button small success" ><i class="fa fa-cog fa-spin"></i>&nbsp;&nbsp;Procesando</asp:LinkButton>
                 </div>
             </div>
        </div>
    </form>
</body>
</html>
        <!--#include virtual="footer.aspx"--> 
