<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript">
         var languages;
         function PageLoad()
         {
             languages = $('#<%=language.ClientID%>').val();
             if (languages == "English") {
                 var text = "Kindly enter below details for user verification for update password, and press controll to go back";
                 speak(text);
             }
             else if (languages == "Hindi") {
                 var text = "kripaya details fill kare taaki aapka user verification ho sakey update password ke liye,  back jaaney ke liye control press karey ";
                 speak(text);
             }
             else if (languages == "Kannada") {
                 var text = "Dayaviṭṭu namūdisi below details phar user verification phar update password, Mattu hintirugalu niyantraṇavannu ottiri ";
                 speak(text);
             }
         }
        

         $(document).keydown(function (event) {
             var user_keycode = (event.keyCode ? event.keyCode : event.which);
             switch (user_keycode) {
                 case 17:
                     window.location.href = "UserLogin.aspx?type=login";
                     break;
                 default:
                     //window.location.href = "showcat.aspx?category=" + category + "&uid=" + uid + "&type=" + type + "&status=errorKey";
             }
         });

         $(function () {
             if ('speechSynthesis' in window) {
                 $('.uname').hover
                 (
                     function () {
                         languages = $('#<%=language.ClientID%>').val();
                         if (languages == "English") {
                             id = this.id;
                             console.log(id);
                             placeholder = document.getElementById(id).getAttribute("placeholder");
                             console.log(placeholder);
                             value = document.getElementById(id).value;
                             console.log(value);
                             if ((value == "Verify") || (value == "Submit")) {
                                 var text = "Kindly Click on" + value + "Button";
                             }
                             else if (value == "") {
                                 console.log('1');
                                 var text = "Please Enter " + placeholder;
                             }
                             else {
                                 var text = "you have already entered " + placeholder;
                             }
                             console.log(text);
                             speak(text);
                         }
                         else if (languages == "Hindi") {
                             id = this.id;
                             console.log(id);
                             placeholder = document.getElementById(id).getAttribute("placeholder");
                             console.log(placeholder);
                             value = document.getElementById(id).value;
                             console.log(value);
                             if ((value == "Verify") || (value == "Submit")) {
                                 var text = "Kripaya" + value + "Button pur press karey";
                             }
                             else if (value == "") {
                                 console.log('1');
                                 var text = "kripaya " + placeholder+"enter karey";
                             }
                             else {
                                 var text = "appney pehle se hee " + placeholder+"enter kiya hai";
                             }
                             console.log(text);
                             speak(text);
                         }
                         else if (languages == "Kannada") {
                             id = this.id;
                             console.log(id);
                             placeholder = document.getElementById(id).getAttribute("placeholder");
                             console.log(placeholder);
                             value = document.getElementById(id).value;
                             console.log(value);
                             if ((value == "Verify") || (value == "Submit")) {
                                 var text = "Dayaviṭṭu klik māḍi" + value + "Button";
                             }
                             else if (value == "") {
                                 console.log('1');
                                 var text = "Dayaviṭṭu namūdisi " + placeholder;
                             }
                             else {
                                 var text = "Nīvu īgāgalē namūdisiruviri " + placeholder;
                             }
                             console.log(text);
                             speak(text);
                         }
                         },

                     function () {
                         speechSynthesis.cancel();
                     }
                 );
                 $('.uname').focus
                 (
                     function () {
                         languages = $('#<%=language.ClientID%>').val();
                         if (languages == "English") {
                             id = this.id;
                             placeholder = document.getElementById(id).getAttribute("placeholder");
                             value = document.getElementById(id).value;
                             if (value == "") {
                                 var text = "Please Enter " + placeholder;
                                 speak(text);
                             }
                         }
                         else if (languages == "Hindi") {
                             id = this.id;
                             placeholder = document.getElementById(id).getAttribute("placeholder");
                             value = document.getElementById(id).value;
                             if (value == "") {
                                 var text = "kripaya" + placeholder+"enter karey";
                                 speak(text);
                             }
                         }
                         else if (languages == "Kannada") {
                             id = this.id;
                             placeholder = document.getElementById(id).getAttribute("placeholder");
                             value = document.getElementById(id).value;
                             if (value == "") {
                                 var text = "Dayaviṭṭu namūdisi " + placeholder;
                                 speak(text);
                             }
                         }
                     }
                 );
             }
         });

         function Validate() {
            name = document.getElementById('<%=userid.ClientID%>').value;
             password = document.getElementById('<%=emailid.ClientID%>').value;
             languages = $('#<%=language.ClientID%>').val();
             if (languages == "English") {
                 if (name == "") {
                     var text = "Please Enter User Id ";
                     speak(text);
                     $('#<%=userid.ClientID %>').focus();
                     return false;
                 }
                 else if (password == "") {
                     var text = "Please Enter Email Id ";
                     speak(text);
                     $('#<%=emailid.ClientID %>').focus();
                     return false;
                 }
             }
             else if (languages == "Hindi") {
                 if (name == "") {
                     var text = "kripaya  User Id enter karey";
                     speak(text);
                     $('#<%=userid.ClientID %>').focus();
                     return false;
                 }
                 else if (password == "") {
                     var text = "kripaya  Email Id enter karey ";
                     speak(text);
                     $('#<%=emailid.ClientID %>').focus();
                     return false;
                 }
             }
             else if (languages == "Kannada") {
                 if (name == "") {
                     var text = "Dayaviṭṭu namūdisi User Id ";
                     speak(text);
                     $('#<%=userid.ClientID %>').focus();
                     return false;
                 }
                 else if (password == "") {
                     var text = "Dayaviṭṭu namūdisi Email Id ";
                     speak(text);
                     $('#<%=emailid.ClientID %>').focus();
                     return false;
                 }
             }
         }

         function Validate1() {
             pass = document.getElementById('<%=TextBox1.ClientID%>').value;
             languages = $('#<%=language.ClientID%>').val();
             languages2 = $('#<%=language1.ClientID%>').val();
             if (languages == "English" || languages2=="English") {
                 if (pass == "") {
                     var text = "Please Enter new Password ";
                     speak(text);
                     $('#<%=TextBox1.ClientID %>').focus();
                     return false;
                 }
             }
             else if (languages == "Hindi" || languages2 =="Hindi") {
                 if (pass == "") {
                     var text = "kripaya  new Password enter karey";
                     speak(text);
                     $('#<%=TextBox1.ClientID %>').focus();
                     return false;
                 }
             }
             else if (languages == "Kannada" || languages2 =="Kannada") {
                 if (pass == "") {
                     var text = "Dayaviṭṭu namūdisi new Password ";
                     speak(text);
                     $('#<%=TextBox1.ClientID %>').focus();
                     return false;
                 }
             }
           
        }
        
         function verification()
         {
             languages = $('#<%=language.ClientID%>').val();
             languages2 = $('#<%=language1.ClientID%>').val();
             if (languages == "English" || languages2 == "English") {
                 var text = "Verification done, kindly enter new password";
                 $('#<%=TextBox1.ClientID %>').focus();
                 speak(text);
             }
             else if (languages == "Hindi" || languages2 == "Hindi") {
                 var text = "Verification ho gaya hai, kripaya  new password enter karey";
                 $('#<%=TextBox1.ClientID %>').focus();
                 speak(text);
             }
             else if (languages == "Kannada" || languages2 == "Kannada") {
                 var text = "Pariśīlane māḍalāgide, Dayaviṭṭu namūdisi new password";
                 $('#<%=TextBox1.ClientID %>').focus();
                 speak(text);
             }
         }

         function emailverification() {
             languages = $('#<%=language.ClientID%>').val();
             languages2 = $('#<%=language1.ClientID%>').val();
             if (languages == "English" || languages2 == "English") {
                 var text = "Kindly enter correct Email id";
                 $('#<%=emailid.ClientID %>').val('');
                 $('#<%=emailid.ClientID %>').focus();
                 speak(text);
             }
             else if (languages == "Hindi" || languages2 == "Hindi") {
                 var text = "kripaya sahi Email id enter kare";
                 $('#<%=emailid.ClientID %>').val('');
                 $('#<%=emailid.ClientID %>').focus();
                 speak(text);
             }
             else if (languages == "Kannada" || languages2 == "Kannada") {
                 var text = "Dayaviṭṭu namūdisi correct Email id";
                 $('#<%=emailid.ClientID %>').val('');
                 $('#<%=emailid.ClientID %>').focus();
                 speak(text);
             }
         }

         function error() {
             languages = $('#<%=language.ClientID%>').val();
             languages2 = $('#<%=language1.ClientID%>').val();
             if (languages == "English" || languages2 == "English") {
                 var text = "Kindly enter correct user id";
                 $('#<%=userid.ClientID %>').val('');
                 $('#<%=userid.ClientID %>').focus();
                 speak(text);
             }
             else if (languages == "Hindi" || languages2 == "Hindi") {
                 var text = "Kripaya sahi user id enter karey";
                 $('#<%=userid.ClientID %>').val('');
                 $('#<%=userid.ClientID %>').focus();
                 speak(text);
             }
             else if (languages == "Kannada" || languages2 == "Kannada") {
                 var text = "Dayaviṭṭu namūdisi correct user id";
                 $('#<%=userid.ClientID %>').val('');
                 $('#<%=userid.ClientID %>').focus();
                 speak(text);
             }
         }

         function speak(text) {
             msg = new SpeechSynthesisUtterance();
             msg.pitch = "0";
             msg.lang = "hi";
             msg.text = text;
             speechSynthesis.speak(msg);
             
         }

         
     </script>

     <div class="well form-horizontal" id="verification" runat="server">
        <br />
        <center>
        <div class="wrapper">
            <asp:HiddenField ID="language" runat="server" />
            <div class="form-group">
                <h2><b>Forgot Password</b></h2>
                <br/>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:TextBox ID="userid" Height="80px" Font-Size="XX-Large" placeholder="User Id" CssClass="form-control uname"  runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>
            <br /><br />
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:TextBox ID="emailid" Height="80px" Font-Size="XX-Large" placeholder="Email Id" CssClass="form-control uname" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>
            <br /><br />
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:Button ID="ButtonLogin" CssClass="btn btn-success uname" Width="100%" Height="100px" Font-Size="XX-Large" OnClientClick="javascript:return Validate()" OnClick="ButtonLogin_Click" runat="server" Text="Verify" />
                </div>
                <div class="col-md-1"></div>
            </div>
            
        </div>
    </center>
         <asp:HiddenField ID="Type" runat="server" />
    </div>

    <div class="well form-horizontal" id="forgot_password" runat="server" visible="false">
        <br />
        <center><asp:HiddenField ID="language1" runat="server" />
        <div class="wrapper">
            <div class="form-group">
                <h2><b>Forgot Password</b></h2>
                <br/>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:TextBox ID="TextBox1" Height="80px" Font-Size="XX-Large" placeholder="New Password" CssClass="form-control uname"  runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>
             <br /><br />
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:Button ID="submit" CssClass="btn btn-success uname" Width="100%" Height="100px" Font-Size="XX-Large" OnClientClick="javascript:return Validate1()" OnClick="submit_Click"  runat="server" Text="Submit" />
                </div>
                <div class="col-md-1"></div>
            </div>
            </div>
            </center>
        </div>

</asp:Content>

