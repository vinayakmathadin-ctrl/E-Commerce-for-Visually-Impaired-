<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <script type="text/javascript">
        var name, email, contact, address, age, password, id, text = "", placeholder, value, msg,languages;

        function PageLoad()
        {
             languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                var text = "You are now, on registration page, press ctrl to go back, ";
                speak1(text);
            }
            else if (languages == "Hindi") {
                var text = " abhi aap,registration page par hai, back jaaney ke liye control  press karey, ";
                speak1(text);
            }
            else if (languages == "Kannada") {
                var text = " Nīvu nōndaṇi puṭadalliddīri, Hintirugalu ctrl ottiri ";
                speak1(text);
            }
        }

        $(document).keydown(function (event)
        {
            var user_keycode = (event.keyCode ? event.keyCode : event.which);
            if(user_keycode == '17')
            {
                window.location.href = "UserLogin.aspx?type=login";
            }
        });

        function Validate()
        {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                name = document.getElementById('<%=TextBox2.ClientID%>').value;
                email = document.getElementById('<%=TextBox3.ClientID%>').value;
                contact = document.getElementById('<%=TextBox4.ClientID%>').value;
                address = document.getElementById('<%=TextBox5.ClientID%>').value;
                age = document.getElementById('<%=TextBox6.ClientID%>').value;
                password = document.getElementById('<%=TextBox7.ClientID%>').value;
                if (name == "") {
                    id = "kripaya apna naam enter karey";

                    speak(id);
                    $('#<%=TextBox2.ClientID %>').focus();
                    return false;
                }
                else if (email == "") {
                    id = "ContentPlaceHolder1_TextBox3";
                    speak(id);
                    $('#<%=TextBox3.ClientID %>').focus();
                    return false;
                }
                else if (contact == "") {
                    id = "ContentPlaceHolder1_TextBox4";
                    speak(id);
                    $('#<%=TextBox4.ClientID %>').focus();
                    return false;
                }
                else if (address == "") {
                    id = "ContentPlaceHolder1_TextBox5";
                    speak(id);
                    $('#<%=TextBox5.ClientID %>').focus();
                    return false;
                }
                else if (age == "") {
                    id = "ContentPlaceHolder1_TextBox6";
                    speak(id);
                    $('#<%=TextBox6.ClientID %>').focus();
                    return false;
                }
                else if (password == "") {
                    id = "ContentPlaceHolder1_TextBox7";
                    speak(id);
                    $('#<%=TextBox7.ClientID %>').focus();
                    return false;
                }
            }
            else if (languages == "Hindi") {
                name = document.getElementById('<%=TextBox2.ClientID%>').value;
                email = document.getElementById('<%=TextBox3.ClientID%>').value;
                contact = document.getElementById('<%=TextBox4.ClientID%>').value;
                address = document.getElementById('<%=TextBox5.ClientID%>').value;
                age = document.getElementById('<%=TextBox6.ClientID%>').value;
                password = document.getElementById('<%=TextBox7.ClientID%>').value;
                if (name == "") {
                    id = " kripaya apna naam enter karey";

                    speak(id);
                    $('#<%=TextBox2.ClientID %>').focus();
                    return false;
                }
                else if (email == "") {
                    id = "kripaya apna email enter karey";
                    speak(id);
                    $('#<%=TextBox3.ClientID %>').focus();
                    return false;
                }
                else if (contact == "") {
                    id = "kripaya apna contact enter karey";
                    speak(id);
                    $('#<%=TextBox4.ClientID %>').focus();
                    return false;
                }
                else if (address == "") {
                    id = "kripaya apna address enter karey";
                    speak(id);
                    $('#<%=TextBox5.ClientID %>').focus();
                    return false;
                }
                else if (age == "") {
                    id = "kripaya apni age enter karey";
                    speak(id);
                    $('#<%=TextBox6.ClientID %>').focus();
                    return false;
                }
                else if (password == "") {
                    id = "kripaya apna password enter karey";
                    speak(id);
                    $('#<%=TextBox7.ClientID %>').focus();
                    return false;
                }
            }
            else if (languages == "Kannada") {
                name = document.getElementById('<%=TextBox2.ClientID%>').value;
                email = document.getElementById('<%=TextBox3.ClientID%>').value;
                contact = document.getElementById('<%=TextBox4.ClientID%>').value;
                address = document.getElementById('<%=TextBox5.ClientID%>').value;
                age = document.getElementById('<%=TextBox6.ClientID%>').value;
                password = document.getElementById('<%=TextBox7.ClientID%>').value;
                if (name == "") {
                    id = " Dayeyinda namūdisi name";

                    speak(id);
                    $('#<%=TextBox2.ClientID %>').focus();
                    return false;
                }
                else if (email == "") {
                    id = "Dayeyinda namūdisi email adddress";
                    speak(id);
                    $('#<%=TextBox3.ClientID %>').focus();
                    return false;
                }
                else if (contact == "") {
                    id = "Dayeyinda namūdisi contact number";
                    speak(id);
                    $('#<%=TextBox4.ClientID %>').focus();
                    return false;
                }
                else if (address == "") {
                    id = "Dayeyinda namūdisi address";
                    speak(id);
                    $('#<%=TextBox5.ClientID %>').focus();
                    return false;
                }
                else if (age == "") {
                    id = "Dayeyinda namūdisi your age ";
                    speak(id);
                    $('#<%=TextBox6.ClientID %>').focus();
                    return false;
                }
                else if (password == "") {
                    id = "Dayeyinda namūdisi password";
                    speak(id);
                    $('#<%=TextBox7.ClientID %>').focus();
                    return false;
                }
            }
        }

        function speak(id)
        {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                placeholder = document.getElementById(id).getAttribute("placeholder");
                value = document.getElementById(id).value;

                if (id == "ContentPlaceHolder1_ButtonSubmit") {
                    text = "Kindly Click on Submit Button";
                }

                else if (value == "") {
                    text = "Please Enter " + placeholder;
                }
                else {
                    text = "you have already entered " + placeholder;
                }
                var msg2 = new SpeechSynthesisUtterance();
                msg2.pitch = "0";
                msg2.text = text;
                msg2.lang = "hi";
                speechSynthesis.speak(msg2);
            }
            else if (languages == "Hindi") {
                placeholder = document.getElementById(id).getAttribute("placeholder");
                value = document.getElementById(id).value;

                if (id == "ContentPlaceHolder1_ButtonSubmit") {
                    text = " Submit Button par click karey";
                }

                else if (value == "") {
                    text = "kripaya apna" + placeholder+" enter karey";
                }
                else {
                    text = "app pehle se he " + placeholder+"enter kar chukey hai";
                }
                var msg2 = new SpeechSynthesisUtterance();
                msg2.pitch = "0";
                msg2.text = text;
                msg2.lang = "hi";
                speechSynthesis.speak(msg2);
            }
            else if (languages == "Kannada") {
                placeholder = document.getElementById(id).getAttribute("placeholder");
                value = document.getElementById(id).value;

                if (id == "ContentPlaceHolder1_ButtonSubmit") {
                    text = " Sallisu buṭton mēle klik māḍi";
                }

                else if (value == "") {
                    text = "Dayeyinda namūdisi" + placeholder + " ";
                }
                else {
                    text = "Īgāgalē namūdisalāgide" + placeholder + "";
                }
                var msg2 = new SpeechSynthesisUtterance();
                msg2.pitch = "0";
                msg2.text = text;
                msg2.lang = "hi";
                speechSynthesis.speak(msg2);
            }
        }

        function speak1(text)
        {
            msg = new SpeechSynthesisUtterance();
            msg.pitch = 0; //0 to 2
            msg.text = text;
            msg.lang = "hi";
            speechSynthesis.speak(msg);
        }

        $(function ()
        {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                if ('speechSynthesis' in window) {
                    $('.uname').hover
                        (
                            function () {

                                id = this.id;
                                placeholder = document.getElementById(id).getAttribute("placeholder");
                                value = document.getElementById(id).value;
                                email = document.getElementById('ContentPlaceHolder1_TextBox3').value;
                                contact = document.getElementById('ContentPlaceHolder1_TextBox4').value;
                                age = document.getElementById('ContentPlaceHolder1_TextBox6').value;

                                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                                var reg1 = /^[0-9]+$/;


                                if ((email != "") && (reg.test(email) == false)) {
                                    text = "Please enter valid email";
                                    speak1(text);

                                    $('#<%=TextBox3.ClientID %>').focus();
                                }
                                else if ((contact != "") && (reg1.test(contact) == false)) {
                                    text = "Please enter valid Number";
                                    speak1(text);
                                    $('#<%=TextBox4.ClientID %>').focus();
                                }
                                else if ((age != "") && (reg1.test(age) == false)) {
                                    text = "Please enter valid Age";
                                    speak1(text);
                                    $('#<%=TextBox6.ClientID %>').focus();
                                }
                                else {
                                    speak(id);
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
                                email = document.getElementById('ContentPlaceHolder1_TextBox3').value;
                                contact = document.getElementById('ContentPlaceHolder1_TextBox4').value;
                                age = document.getElementById('ContentPlaceHolder1_TextBox6').value;

                                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                                var reg1 = /^[0-9]+$/;

                                if ((email != "") && (reg.test(email) == false)) {
                                    text = "Please enter valid email";
                                    // speak1(text);
                                    $('#<%=TextBox3.ClientID %>').focus();
                                }
                                else if ((contact != "") && (reg1.test(contact) == false)) {
                                    text = "Please enter valid Number";
                                    //speak1(text);
                                    $('#<%=TextBox4.ClientID %>').focus();
                                }
                                else if ((age != "") && (reg1.test(age) == false)) {
                                    text = "Please enter valid Age";
                                    //speak1(text);
                                    $('#<%=TextBox6.ClientID %>').focus();
                                }
                                else {
                                    if (id != "ContentPlaceHolder1_ButtonSubmit") {
                                        speak(id);
                                    }

                                }
                            }
                        );
                }
            }
            else if (languages == "Hindi") {
                if ('speechSynthesis' in window) {
                    $('.uname').hover
                        (
                            function () {

                                id = this.id;
                                placeholder = document.getElementById(id).getAttribute("placeholder");
                                value = document.getElementById(id).value;
                                email = document.getElementById('ContentPlaceHolder1_TextBox3').value;
                                contact = document.getElementById('ContentPlaceHolder1_TextBox4').value;
                                age = document.getElementById('ContentPlaceHolder1_TextBox6').value;

                                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                                var reg1 = /^[0-9]+$/;


                                if ((email != "") && (reg.test(email) == false)) {
                                    text = "kripaya sahi email enter karey";
                                    speak1(text);

                                    $('#<%=TextBox3.ClientID %>').focus();
                                }
                                else if ((contact != "") && (reg1.test(contact) == false)) {
                                    text = "kripaya sahi contact number enter karey";
                                    speak1(text);
                                    $('#<%=TextBox4.ClientID %>').focus();
                                }
                                else if ((age != "") && (reg1.test(age) == false)) {
                                    text = "kripaya sahi age enter karey";
                                    speak1(text);
                                    $('#<%=TextBox6.ClientID %>').focus();
                                }
                                else {
                                    speak(id);
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
                                email = document.getElementById('ContentPlaceHolder1_TextBox3').value;
                                contact = document.getElementById('ContentPlaceHolder1_TextBox4').value;
                                age = document.getElementById('ContentPlaceHolder1_TextBox6').value;

                                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                                var reg1 = /^[0-9]+$/;

                                if ((email != "") && (reg.test(email) == false)) {
                                    text = "Please enter valid email";
                                    // speak1(text);
                                    $('#<%=TextBox3.ClientID %>').focus();
                                }
                                else if ((contact != "") && (reg1.test(contact) == false)) {
                                    text = "Please enter valid Number";
                                    //speak1(text);
                                    $('#<%=TextBox4.ClientID %>').focus();
                                }
                                else if ((age != "") && (reg1.test(age) == false)) {
                                    text = "Please enter valid Age";
                                    //speak1(text);
                                    $('#<%=TextBox6.ClientID %>').focus();
                                }
                                else {
                                    if (id != "ContentPlaceHolder1_ButtonSubmit") {
                                        speak(id);
                                    }

                                }
                            }
                        );
                }
            }
            else if (languages == "Kannada") {
                if ('speechSynthesis' in window) {
                    $('.uname').hover
                        (
                            function () {

                                id = this.id;
                                placeholder = document.getElementById(id).getAttribute("placeholder");
                                value = document.getElementById(id).value;
                                email = document.getElementById('ContentPlaceHolder1_TextBox3').value;
                                contact = document.getElementById('ContentPlaceHolder1_TextBox4').value;
                                age = document.getElementById('ContentPlaceHolder1_TextBox6').value;

                                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                                var reg1 = /^[0-9]+$/;


                                if ((email != "") && (reg.test(email) == false)) {
                                    text = "Dayavittu sariyāda imēl annu namūdisi";
                                    speak1(text);

                                    $('#<%=TextBox3.ClientID %>').focus();
                                }
                                else if ((contact != "") && (reg1.test(contact) == false)) {
                                    text = "Dayaviṭṭu sariyāda samparkavannu namūdisi";
                                    speak1(text);
                                    $('#<%=TextBox4.ClientID %>').focus();
                                }
                                else if ((age != "") && (reg1.test(age) == false)) {
                                    text = "Dayaviṭṭu sariyāda vayas'sannu namūdisi";
                                    speak1(text);
                                    $('#<%=TextBox6.ClientID %>').focus();
                                }
                                else {
                                    speak(id);
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
                                email = document.getElementById('ContentPlaceHolder1_TextBox3').value;
                                contact = document.getElementById('ContentPlaceHolder1_TextBox4').value;
                                age = document.getElementById('ContentPlaceHolder1_TextBox6').value;

                                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                                var reg1 = /^[0-9]+$/;

                                if ((email != "") && (reg.test(email) == false)) {
                                    text = "Dayaviṭṭu mān'yavāda email id annu namūdisi";
                                    // speak1(text);
                                    $('#<%=TextBox3.ClientID %>').focus();
                                }
                                else if ((contact != "") && (reg1.test(contact) == false)) {
                                    text = "Dayaviṭṭu mān'yavāda phōne saṅkhyeyannu namūdisi";
                                    //speak1(text);
                                    $('#<%=TextBox4.ClientID %>').focus();
                                }
                                else if ((age != "") && (reg1.test(age) == false)) {
                                    text = "Dayaviṭṭu mān'ya vayas'sannu namūdisi";
                                    //speak1(text);
                                    $('#<%=TextBox6.ClientID %>').focus();
                                }
                                else {
                                    if (id != "ContentPlaceHolder1_ButtonSubmit") {
                                        speak(id);
                                    }

                                }
                            }
                        );
                }
            }
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="language" runat="server" />
    <div class="well form-horizontal" style="background-color:#c0c0c0;">
        <center>
        <h2><b>REGISTRATION FORM</b></h2>

        <!-- Text input-->
        <div class="wrapper">
           
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="uid" Height="80px" Font-Size="XX-Large" ReadOnly="true" placeholder="UID" CssClass="form-control hide" runat="server" Type="Number"></asp:TextBox>
                        
                </div>
                <div class="col-md-1"></div>
            </div>
            
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="TextBox2"  Height="80px" Font-Size="XX-Large" placeholder="Name" CssClass="form-control uname" runat="server"></asp:TextBox>
                        
                </div>
                <div class="col-md-1"></div>
            </div>

            <br/>
            <br />
            <!-- Text input-->
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="TextBox3" Height="80px" Font-Size="XX-Large" placeholder="Email Address" CssClass="form-control uname" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>

             <br/>
             <br/>
            <!-- Text input-->

            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="TextBox4" Height="80px" Font-Size="XX-Large" placeholder="Contact Number" CssClass="form-control uname" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>

            <br/>
             <br/>
            <div class="form-group">
                 <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="TextBox5" Height="80px" Font-Size="XX-Large" placeholder="Address" CssClass="form-control uname" runat="server" Rows="5" Type="MultiLine"></asp:TextBox>
                </div>
                 <div class="col-md-1"></div>
            </div>

            <br/>           
             <br/>
            <div class="form-group">
                 <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="TextBox6" Height="80px" Font-Size="XX-Large" placeholder="Age" CssClass="form-control uname" runat="server"></asp:TextBox>
                </div>
                 <div class="col-md-1"></div>
            </div>

            <br/>
             <br/>
            <!-- Text input-->

            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="TextBox7" Height="80px" Font-Size="XX-Large" placeholder="Password" CssClass="form-control uname" runat="server" Type="Password"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>

            <br/>

            <!-- Select Basic -->

            <!-- Success message -->
            <!-- <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Success!.</div> -->

            <!-- Button -->
            <div class="form-group">
               
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <br>
                    <asp:Button ID="ButtonSubmit" Width="100%" Height="80px" Font-Size="XX-Large"  CssClass="btn btn-success uname button" runat="server" 
                        Text="SUBMIT" OnClientClick="javascript:return Validate()" onclick="ButtonSubmit_Click" BackColor="#009933"/>
                </div>
                <div class="col-md-1"></div>
            </div>
         
        </div>
        </center>

    </div>
    <!-- /.container -->
</asp:Content>

