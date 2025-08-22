<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="EnterPaymentDetails.aspx.cs" Inherits="EnterPaymentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        var cardNo, cvv, bankName, branch, id, text = "", placeholder, value, msg,languages;
        var cost, text = "", n = 0, msg, uid, type1, pid, user_keycode, status;
        var pid = [];
        var pname = [], price = [];

        function PageLoad() {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                var text = "You are now, on Card Details page, please enter card details, press ctrl to go back, ";
                speak1(text);
            }
            else if (languages == "Hindi") {
                var text = "app abhi Card Details page pur hai,kripaya card details enter karey,  back jaaney ke liye ctrl press karey, ";
                speak1(text);
            }
            else if (languages == "Kannada") {
                var text = "Nīvu īga, Mēle Card Details Puṭa, Dayaviṭṭu namūdisi card details, Hintirugalu ctrl ottiri, ";
                speak1(text);
            }
        }
        
        
        $(document).keydown(function (event) {
            var user_keycode = (event.keyCode ? event.keyCode : event.which);
            if (user_keycode == '17') {
                window.location.href = "UserLogin.aspx?type=login";
            }
        });

        function Validate() {
            cardNo = document.getElementById('<%=txtCardNo.ClientID%>').value;
            cvv = document.getElementById('<%=txtCVV.ClientID%>').value;
            bankName = document.getElementById('<%=txtbankName.ClientID%>').value;
            branch = document.getElementById('<%=txtBranch.ClientID%>').value;

            if (cardNo == "")
            {
                id = "ContentPlaceHolder1_txtCardNo";
                
                speak(id);
                $('#<%=txtCardNo.ClientID %>').focus();
                return false;
            }
            else if(cvv == "")
            {
                 id = "ContentPlaceHolder1_txtCVV";
                 speak(id);
                $('#<%=txtCVV.ClientID %>').focus();
                return false;
            }
            else if (bankName == "") {
                 id = "ContentPlaceHolder1_txtbankName";
                 speak(id);
                $('#<%=txtbankName.ClientID %>').focus();
                return false;
            }
            else if (branch == "") {
                 id = "ContentPlaceHolder1_txtBranch";
                 speak(id);
                $('#<%=txtBranch.ClientID %>').focus();
                return false;
            }
            
        }
        function speak(id) {
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                placeholder = document.getElementById(id).getAttribute("placeholder");
                value = document.getElementById(id).value;

                if (id == "ContentPlaceHolder1_ButtonPay") {
                    text = "Kindly Click on Pay Button";
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

                speechSynthesis.speak(msg2);
            }
            else if (languages == "Hindi") {
                placeholder = document.getElementById(id).getAttribute("placeholder");
                value = document.getElementById(id).value;

                if (id == "ContentPlaceHolder1_ButtonPay") {
                    text = "Kripaya Pay Button par click karey";
                }

                else if (value == "") {
                    if (placeholder == "Card Number") {
                        text = "kripaya card number enter karey";
                    }
                    else
                        if (placeholder == "CVV") {
                            text = "kripaya cvv enter karey";
                        }
                        else {
                            text = "kripaya" + placeholder + "enter karey";
                        }
                }
                else {
                    text = "appne pehle say" + placeholder+"enter kiya hai";
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

                if (id == "ContentPlaceHolder1_ButtonPay") {
                    text = "Pay button mēle dayaviṭṭu click māḍi";
                }

                else if (value == "") {
                    text = "Dayaviṭṭu namūdisi " + placeholder;
                }
                else {
                    text = "Nīvu īgāgalē namūdisiruviri " + placeholder;
                }
                var msg2 = new SpeechSynthesisUtterance();
                msg2.pitch = "0";
                msg2.text = text;
                msg2.lang = "hi";
                speechSynthesis.speak(msg2);
            }
        }
        function speak1(text) {
            msg = new SpeechSynthesisUtterance();
            msg.pitch = 0; //0 to 2
            msg.text = text;
            msg.lang = "hi";
            speechSynthesis.speak(msg);
        }
        $(function ()
        {
            if ('speechSynthesis' in window)
            {
                $('.uname').hover
                    (
                        function () {

                            id = this.id;
                            placeholder = document.getElementById(id).getAttribute("placeholder");
                            value = document.getElementById(id).value;
                            cardNo = document.getElementById('ContentPlaceHolder1_txtCardNo').value;
                            cvv = document.getElementById('ContentPlaceHolder1_txtCVV').value;
                            bankName = document.getElementById('ContentPlaceHolder1_txtbankName').value;

                            var reg = /^[0-9]{16}$/;
                            var reg1 = /^[0-9]{3}$/;
                            languages = $('#<%=language.ClientID%>').val();
                            if (languages == "English") {

                                if ((cardNo != "") && (reg.test(cardNo) == false)) {
                                    text = "Please enter valid Card number";
                                    speak1(text);

                                    $('#<%=txtCardNo.ClientID %>').focus();
                                }
                                else if ((cvv != "") && (reg1.test(cvv) == false)) {
                                    text = "Please enter valid CVV ";
                                    speak1(text);
                                    $('#<%=txtCVV.ClientID %>').focus();
                                }

                                else {
                                    speak(id);
                                }
                            }
                            else if (languages == "Hindi") {

                                if ((cardNo != "") && (reg.test(cardNo) == false)) {
                                    text = "kripaya valid Card number daaley";
                                    speak1(text);

                                    $('#<%=txtCardNo.ClientID %>').focus();
                                }
                                else if ((cvv != "") && (reg1.test(cvv) == false)) {
                                    text = "kripaya valid CVV daaley";
                                    speak1(text);
                                    $('#<%=txtCVV.ClientID %>').focus();
                                }

                                else {
                                    speak(id);
                                }
                            }
                            else if (languages == "Kannada") {

                                if ((cardNo != "") && (reg.test(cardNo) == false)) {
                                    text = "Dayaviṭṭu mān'yavāgi namūdisiCard number";
                                    speak1(text);

                                    $('#<%=txtCardNo.ClientID %>').focus();
                                }
                                else if ((cvv != "") && (reg1.test(cvv) == false)) {
                                    text = "Dayaviṭṭu mān'yavāgi namūdisi CVV ";
                                    speak1(text);
                                    $('#<%=txtCVV.ClientID %>').focus();
                                }

                                else {
                                    speak(id);
                                }
                            }
                    },
                    function ()
                    {
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
                            cardNo = document.getElementById('ContentPlaceHolder1_txtCardNo').value;
                            cvv = document.getElementById('ContentPlaceHolder1_txtCVV').value;

                            var reg = /^[0-9]{16}$/;
                            var reg1 = /^[0-9]{3}$/;

                            if ((cardNo != "") && (reg.test(cardNo) == false)) {
                                text = "Please enter valid Card Number";
                                speak1(text);
                                $('#<%=txtCardNo.ClientID %>').focus();
                            }
                            else if ((cvv != "") && (reg1.test(cvv) == false)) {

                                text = "Please enter valid CVV";
                                speak1(text);
                                $('#<%=txtCVV.ClientID %>').focus();
                            }

                            else {
                                if (id != "ContentPlaceHolder1_ButtonPay") {
                                    speak(id);
                                }

                            }
                        }
                        else if (languages == "Hindi") {

                            id = this.id;
                            placeholder = document.getElementById(id).getAttribute("placeholder");
                            value = document.getElementById(id).value;
                            cardNo = document.getElementById('ContentPlaceHolder1_txtCardNo').value;
                            cvv = document.getElementById('ContentPlaceHolder1_txtCVV').value;

                            var reg = /^[0-9]{16}$/;
                            var reg1 = /^[0-9]{3}$/;

                            if ((cardNo != "") && (reg.test(cardNo) == false)) {
                                text = "kripaya valid Card Number enter karey";
                                speak1(text);
                                $('#<%=txtCardNo.ClientID %>').focus();
                            }
                            else if ((cvv != "") && (reg1.test(cvv) == false)) {

                                text = "kripaya valid CVV enter karey";
                                speak1(text);
                                $('#<%=txtCVV.ClientID %>').focus();
                            }

                            else {
                                if (id != "ContentPlaceHolder1_ButtonPay") {
                                    speak(id);
                                }

                            }
                        }
                        else if (languages == "Kannada") {

                            id = this.id;
                            placeholder = document.getElementById(id).getAttribute("placeholder");
                            value = document.getElementById(id).value;
                            cardNo = document.getElementById('ContentPlaceHolder1_txtCardNo').value;
                            cvv = document.getElementById('ContentPlaceHolder1_txtCVV').value;

                            var reg = /^[0-9]{16}$/;
                            var reg1 = /^[0-9]{3}$/;

                            if ((cardNo != "") && (reg.test(cardNo) == false)) {
                                text = "Dayaviṭṭu mān'yavāgi namūdisi Card Number";
                                speak1(text);
                                $('#<%=txtCardNo.ClientID %>').focus();
                            }
                            else if ((cvv != "") && (reg1.test(cvv) == false)) {

                                text = "Dayaviṭṭu mān'yavāgi namūdisi CVV";
                                speak1(text);
                                $('#<%=txtCVV.ClientID %>').focus();
                            }

                            else {
                                if (id != "ContentPlaceHolder1_ButtonPay") {
                                    speak(id);
                                }

                            }
                        }
                    }

                );
             }
        });
           
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="language" runat="server"></asp:HiddenField>
     <div class="well form-horizontal" style="background-color:#c0c0c0;">
        <center>
        <h2><b>Fill Payment Details</b></h2>

        <!-- Text input-->
        <div class="wrapper">
           
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="txtCardNo" Height="80px" Font-Size="XX-Large"  placeholder="Card Number" CssClass="form-control uname" runat="server" ></asp:TextBox>
                        
                </div>
                <div class="col-md-1"></div>
            </div>
            <br/>
            <br />
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="txtCVV"  Height="80px" Font-Size="XX-Large" placeholder="CVV" CssClass="form-control uname" runat="server"></asp:TextBox>
                        
                </div>
                <div class="col-md-1"></div>
            </div>

            <br/>
            <br />
            <!-- Text input-->
            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="txtbankName" Height="80px" Font-Size="XX-Large" placeholder="Bank Name" CssClass="form-control uname" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>

             <br/>
             <br/>
            <!-- Text input-->

            <div class="form-group">
                <div class="col-md-1"></div>
                <div class="col-md-10 inputGroupContainer">
                        <asp:TextBox ID="txtBranch" Height="80px" Font-Size="XX-Large" placeholder="Branch" CssClass="form-control uname" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1"></div>
            </div>

            <br/>
             <br/>
            
            <br/>

            <!-- Select Basic -->

            <!-- Success message -->
            <!-- <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Success!.</div> -->

            <!-- Button -->
            <div class="form-group">
               
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <br>
                    <asp:Button ID="ButtonPay" Width="100%" Height="80px" Font-Size="XX-Large"  CssClass="btn btn-success uname button" runat="server" 
                        Text="Pay" OnClientClick="javascript:return Validate()" OnClick="ButtonPay_Click" BackColor="#009933" />
                </div>
                <div class="col-md-1"></div>
            </div>
         
        </div>
        </center>
         <div>
          <asp:HiddenField ID="uid" runat="server"></asp:HiddenField>
          <asp:HiddenField ID="type1" runat="server"></asp:HiddenField>
          <asp:HiddenField ID="Status" runat="server"></asp:HiddenField>
         </div>
    </div>
    <!-- /.container -->

</asp:Content>

