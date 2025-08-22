<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="Recommendation.aspx.cs" Inherits="Recommendation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style2.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
        var count, uid, type, category, i, keycode, user_keycode, text = "", k, n = 0, msg, status;
        var pid = [];
        var pname = [], price = [];

        $(document).keydown(function (event)
        {
            uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();
            speechSynthesis.cancel();
            count = document.getElementById('ContentPlaceHolder1_Count').value;

            for (i = 0; i < count; i++)
            {
                pid[i] = $("#product #id" + i).text();
            }

            user_keycode = (event.keyCode ? event.keyCode : event.which);
            keycode = 49;
            for (i = 0; i < count; i++)
            {
                if (i < 2)
                {
                    var keycode = (49 + i);
                    if (user_keycode == keycode)
                    {
                        window.location.href = "ProductDetails.aspx?pid=" + pid[i] + "&status=recommendation&uid=" + uid + "&type=" + type + "&key=";
                        return false;
                    }
                }
               
            }
            if (user_keycode == '8') {
                window.location.href = "UserCart.aspx?status=cart_detail&uid=" + uid + "&type=" + type + "";
            }
            else if (user_keycode == '32') {
                window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
            }
            else {
                window.location.href = "Recommendation.aspx?uid=" + uid + "&type=" + type + "&status=errorKey";
            }
            
        });

        function MyFunction()
        {
            var languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {


                status = $('#<%=Status.ClientID%>').val();
                count = document.getElementById('ContentPlaceHolder1_Count').value;
                for (i = 0; i < count; i++) {
                    pname[i] = $("#product #product_name" + i).text();
                    price[i] = $("#product #price" + i).text();
                }
                if (status == "errorKey") {
                    text += "you have Pressed wrong key ,";
                }
                text += "Recommendation product are . ";
                for (i = 0; i < count; i++) {
                    if (i < 2) {
                        var k = i + 1;

                        text += "press " + k + " for " + pname[i] + " price is " + price[i] + " rupee , ";
                    }
                }
                text += "press backspace to go back";
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    var msg = new SpeechSynthesisUtterance();
                    msg.voice = voices[4];
                    msg.voiceURI = "Google UK English Male";
                    msg.pitch = 0; //0 to 2
                    msg.lang = 'en-GB';
                    msg.text = text;
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                };
            }
            else if (languages == "Hindi") {


                status = $('#<%=Status.ClientID%>').val();
                count = document.getElementById('ContentPlaceHolder1_Count').value;
                for (i = 0; i < count; i++) {
                    pname[i] = $("#product #product_name" + i).text();
                    price[i] = $("#product #price" + i).text();
                }
                if (status == "errorKey") {
                    text += "aapne galat key press kiya hai ,";
                }
                text += "Recommendation  ke product hai. ";
                for (i = 0; i < count; i++) {
                    if (i < 2) {
                        var k = i + 1;

                        text +=  pname[i] + " ke liye press karey " + k + "  jiska price hai " + price[i] + " rupay , ";
                    }
                }
                text += "  back jaaney ke liye backspace press karey";
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    msg = new SpeechSynthesisUtterance();
                    msg.pitch = "1";
                    msg.text = text;
                    msg.lang = "hi";
                    speechSynthesis.speak(msg);
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                };
            }
            else if (languages == "Kannada") {


                status = $('#<%=Status.ClientID%>').val();
                count = document.getElementById('ContentPlaceHolder1_Count').value;
                for (i = 0; i < count; i++) {
                    pname[i] = $("#product #product_name" + i).text();
                    price[i] = $("#product #price" + i).text();
                }
                if (status == "errorKey") {
                    text += "Nīvu tappu kīliyannu ottidiri ,";
                }
                text += "Śiphārasu utpannagaḷendare . ";
                for (i = 0; i < count; i++) {
                    if (i < 2) {
                        var k = i + 1;

                        text += "otti " + k + " for " + pname[i] + " Bele āgide " + price[i] + " rupee , ";
                    }
                }
                text += "Hintirugalu backspace ottiri";
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    msg = new SpeechSynthesisUtterance();
                    msg.pitch = "1";
                    msg.text = text;
                    msg.lang = "hi";
                    speechSynthesis.speak(msg);
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                };
            }
        }

        function NoData()
        {
            var languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {

                status = $('#<%=Status.ClientID%>').val();
                if (status == "errorKey") {
                    text += "you have Pressed wrong key ,";
                }
                text += "Currently, No Recommendations are here ";
                text += "Now, press backspace to go back, "
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    var msg = new SpeechSynthesisUtterance();
                    msg.voice = voices[4];
                    msg.voiceURI = "Google UK English Male";
                    msg.pitch = 0; //0 to 2
                    msg.lang = 'en-GB';
                    msg.text = text;
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                };
            }
            else if (languages == "Hindi") {

                status = $('#<%=Status.ClientID%>').val();
                if (status == "errorKey") {
                    text += "aapne galat key press kiya hai,";
                }
                text += "abhi, koi Recommendations nahi hai";
                text += " back jaaney ke liye backspace press karey, "
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    var msg = new SpeechSynthesisUtterance();
                    msg.pitch = "1";
                    msg.text = text;
                    msg.lang = "hi";
                    speechSynthesis.speak(msg);
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                };
            }
            else if (languages == "Kannada") {

                status = $('#<%=Status.ClientID%>').val();
                if (status == "errorKey") {
                    text += "Nīvu tappu kīliyannu ottidiri,";
                }
                text += "Prastuta, illi yāvudē śiphārasugaḷilla ";
                text += "Īga, hintirugalu backspace ottiri, "
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    var msg = new SpeechSynthesisUtterance();
                    msg.pitch = "1";
                    msg.text = text;
                    msg.lang = "hi";
                    speechSynthesis.speak(msg);
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                };
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container wrapper" style="background-color:#c0c0c0;">
    <div style="margin-bottom: 40px;">
        <asp:TextBox ID="Count" runat="server" cssClass="hide"></asp:TextBox>
        <asp:Label ID="LabelUid" runat="server" Visible="false" Text="LabelUID"></asp:Label>
    
    </div>
        <asp:Label ID="content" runat="server" Text="Label"></asp:Label>
        
        <asp:HiddenField ID="language" runat="server" />
        <asp:HiddenField ID="uid" runat="server" />
        <asp:HiddenField ID="type" runat="server" />
        <asp:HiddenField ID="Status" runat="server" />
      </div>
</asp:Content>

