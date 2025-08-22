<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        var name, password, msg, id, placeholder, value, type="",uid="",languages;
        function PageLoad()
        {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                type = $('#<%=Type.ClientID%>').val();
                uid = $('#<%=Uid.ClientID%>').val();
                switch (type) {
                    case 'login':
                        var text = "kindly login from here, and press f 12 for Update Password";
                        break;
                    case 'forgot_password':
                        var text = "Password updated successfully, kindly login from here, and press f 12 for Update Password";
                        break;
                    case 'logout':
                        var text = "logout successful, for  Update Password press f 12 ";
                        break;
                    default:
                        var text = "You have successfully " + type + ", kindly login from here with Username  and password, and press f 12 for Update Password";
                }

                speak(text);
            }
            else if (languages == "Hindi") {
                type = $('#<%=Type.ClientID%>').val();
                uid = $('#<%=Uid.ClientID%>').val();
                switch (type) {
                    case 'login':
                        var text = "kripaya yaha se login karey,  Update Password ke liye f 12 press karey";
                        break;
                    case 'logout':
                        var text = "logout successful,  Update Password ke liye f 12 dabaye";
                        break;
                    case 'forgot_password':
                        var text = " aapka Password successfully update ho chuka hai , kripaya yaha se login karey, Update Password ke liye f 12 press karey";
                        break;
                    default:
                        var text = "aapne successfully " + type + ", kar liya  login ke liye Username  aur Password enter kare password update karne ke liye f 12 dabaye";

                       }

                speak(text);
            }
            else if (languages == "Kannada") {
                type = $('#<%=Type.ClientID%>').val();
                uid = $('#<%=Uid.ClientID%>').val();
                switch (type) {
                    case 'login':
                        var text = "Dayaviṭṭu illinda lāgin māḍi,  Update Password mele f 12 klik maadi";
                        break;
                    case 'forgot_password':
                        var text = " Pāsvarḍ annu yaśasviyāgi navīkarisalāgide , Dayaviṭṭu illinda lāgin māḍi,  Update Password mele f 12 klik maadi";
                        break;
                    case 'logout':
                        var text = "logout successful,  Update Password mele f 12 klik maadi";
                        break;
                    default:
                         var text = "Nīvu yaśasviyāgi lāg auṭ āgiruviri Dayaviṭṭu baḷakedārahesaru mattu pās‌varḍ baḷasi illinda lāgin māḍi  phar update password f 12 mele klik madi";

                }


                speak(text);
            }
        }

        function error()
        {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                var text = "Incorrect Credentials, Please insert details again";
                speak(text);
                $('#<%=TextBoxUsername.ClientID%>').val('');
            }
            else if (languages == "Hindi") {
                var text = "aapka input amanya hai kripaya dubara prayaas karey";
                speak(text);
                $('#<%=TextBoxUsername.ClientID%>').val('');
            }
           
        }

        function Validate() {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                name = document.getElementById('<%=TextBoxUsername.ClientID%>').value;
                password = document.getElementById('<%=TextBoxPass.ClientID%>').value;
                if (name == "") {
                    var text = "Please Enter name ";
                    speak(text);
                    $('#<%=TextBoxUsername.ClientID %>').focus();
                    return false;
                }
                else if (password == "") {
                    var text = "Please Enter password ";
                    speak(text);
                    $('#<%=TextBoxPass.ClientID %>').focus();
                    return false;
                }
            }
            else if (languages == "Hindi") {
                name = document.getElementById('<%=TextBoxUsername.ClientID%>').value;
                password = document.getElementById('<%=TextBoxPass.ClientID%>').value;
                if (name == "") {
                    var text = "kripaya apna naam enter karey";
                    speak(text);
                    $('#<%=TextBoxUsername.ClientID %>').focus();
                    return false;
                }
                else if (password == "") {
                    var text = "kripaya apna password enter karey";
                    speak(text);
                    $('#<%=TextBoxPass.ClientID %>').focus();
                    return false;
                }
            }
        }

        $(function () {

            
            if ('speechSynthesis' in window) {
                $('.uname').hover
                (
                    function () {
                        if (languages == "English") {
                            id = this.id;
                            placeholder = document.getElementById(id).getAttribute("placeholder");
                            value = document.getElementById(id).value;
                            if ((value == "LOGIN") || (value == "REGISTER")) {
                                var text = "Kindly Click on" + value + "Button";
                            }
                            else if (value == "") {
                                var text = "Please Enter " + placeholder;
                            }
                            else {
                                var text = "you have already entered " + placeholder;
                            }
                            speak(text);
                        }
                        else if (languages == "Hindi") {
                            id = this.id;
                            placeholder = document.getElementById(id).getAttribute("placeholder");
                            value = document.getElementById(id).value;
                            if ((value == "LOGIN") || (value == "REGISTER")) {
                                var text = "Kripaya" + value + "Button par click kare";
                            }
                            else if (value == "") {
                                var text = "krpaya " + placeholder+"enter kare";
                            }
                            else {
                                var text = "aapne pehle se he " + placeholder+"enter kiya hai";
                            }
                            speak(text);
                        }
                        else if (languages == "Kannada") {
                            id = this.id;
                            placeholder = document.getElementById(id).getAttribute("placeholder");
                            value = document.getElementById(id).value;
                            if ((value == "LOGIN") || (value == "REGISTER")) {
                                var text = "dayavittu" + value + "button  mele click madi";
                            }
                            else if (value == "") {
                                var text = "dayavittu namudisi" + placeholder + "";
                            }
                            else {
                                var text = "Īgāgalē namūdisalāgide " + placeholder + "";
                            }
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
                        id = this.id;
                        placeholder = document.getElementById(id).getAttribute("placeholder");
                        value = document.getElementById(id).value;
                        if (value == "") {
                            var text = "dayavittu namudisi " + placeholder+" ";
                            speak(text);
                        }
                    }
                );
            }
        });

        function speak(text)
        {
            msg = new SpeechSynthesisUtterance();
            msg.pitch = "0";
            msg.text = text;
            msg.lang = "hi";
            speechSynthesis.speak(msg);
           
        }

        $(document).keydown(function (event)
        {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {

                speechSynthesis.cancel();

                keycode = (event.keyCode ? event.keyCode : event.which);

                switch (keycode) {
                  
                    case 123:
                        window.location.href = "ForgotPassword.aspx";
                        break;
                    default:
                        var text = "You have pressed wrong key";
                    // speak(text);
                }
            }
            else if (languages == "Hindi") {

                speechSynthesis.cancel();

                keycode = (event.keyCode ? event.keyCode : event.which);

                switch (keycode) {
                    case 123:
                        window.location.href = "ForgotPassword.aspx";
                        break;
                    default:
                        var text = "aapne galat key dabaya hai";
                    // speak(text);
                }
            }
            else if (languages == "Kannada") {

                speechSynthesis.cancel();

                keycode = (event.keyCode ? event.keyCode : event.which);

                switch (keycode) {
                    case 123:
                        window.location.href = "ForgotPassword.aspx";
                        break;
                    default:
                        var text = "Nīvu tappu kīliyannu ottidiri";
                    // speak(text);
                }
            }
        });
    </script>

    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 33.33333333%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:HiddenField ID="language" runat="server" />
    <div class="well form-horizontal" style="background-color:#c0c0c0;" >
        <br />
        <center>
        <div class="wrapper">
            <div class="form-group">
                <h2 style="font-weight:bolder">USER LOGIN</h2>
                <br/>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:TextBox ID="TextBoxUsername" Height="80px" Font-Size="XX-Large" placeholder="Username" CssClass="form-control uname"  runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>
            <br /><br />
            <div class="form-group" >
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:TextBox ID="TextBoxPass" Height="80px" Font-Size="XX-Large" placeholder="Password" CssClass="form-control uname"  TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>
            <br /><br />
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:Button ID="ButtonLogin" CssClass="btn btn-success uname" Width="100%" Height="100px" Font-Size="XX-Large" OnClientClick="javascript:return Validate()" OnClick="ButtonLogin_Click" runat="server" Text="LOGIN" BackColor="#009933" />
                </div>
                <div class="col-md-1"></div>
            </div>
            <br /><br />
             <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                        <asp:Button ID="ButtonReg" CssClass="btn btn-info uname" Width="100%" Font-Size="XX-Large" Height="100px" OnClick="LinkButton1_Click" runat="server" Text="REGISTER" BackColor="#9933FF" />
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="auto-style1">              
                </div>
            </div>
        </div>
    </center>
         <asp:HiddenField ID="Type" runat="server" />
        <asp:HiddenField ID="Uid" runat="server" />
    </div>
   
</asp:Content>

