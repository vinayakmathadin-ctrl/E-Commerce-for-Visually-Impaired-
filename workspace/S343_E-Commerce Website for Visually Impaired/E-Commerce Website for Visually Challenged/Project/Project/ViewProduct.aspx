<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="ViewProduct.aspx.cs" Inherits="ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View Products</title>
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
        
        function PageLoad()
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
                for (i = 0; i < count; i++) {
                    k = i + 1;
                    text += "press " + k + " for " + pname[i] + " price is " + price[i] + " rupee ,";
                }
                text += "press backspace to go back";
                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    msg = new SpeechSynthesisUtterance();
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
                    text += "aapne galat  key dabaya hai ,";
                }
                for (i = 0; i < count; i++) {
                    k = i + 1;
                    text += " " + pname[i] + " ke liye" + k + " dabaye jiska  price hai " + price[i] + " rupay ,";
                }
                text += "back menu ke liye backspace dabaye";
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
                for (i = 0; i < count; i++) {
                    k = i + 1;
                    text += "otti " + k + " phar " + pname[i] + " Bele āgide " + price[i] + " Rūpāyi ,";
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
                text += "Currently, No products found for this category, ";
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
                text += "is category me koi product nahi hai, ";
                text += "back  jaane ke liye backspace dabaye, "
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
                text += "Prastuta, ī vargakke yāvudē utpannagaḷu kaṇḍubandilla, ";
                text += "Īga, hintirugalu backspace ottiri, "
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

        $(document).keydown(function (event)
        {
            speechSynthesis.cancel();
            count = document.getElementById('ContentPlaceHolder1_Count').value;
            uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();
            category = $('#<%=LabelCategory.ClientID%>').text();
            subcategory = $('#<%=LabelSubCategory.ClientID%>').text();

            for (i = 0; i < count; i++)
            {
                pid[i] = $("#product #id" + i).text();
            }
            user_keycode = (event.keyCode ? event.keyCode : event.which);
            var keycode = 49;
            for (i = 0; i < count; i++)
            {
                var keycode = (49 + i);
                if (user_keycode == keycode)
                {
                    window.location.href = "ProductDetails.aspx?pid=" + pid[i] + "&status=notInCart&uid=" + uid + "&type=" + type + "&key=";
                    return false;
                }
            }
            switch (user_keycode)
            {
                case 8:
                    window.location.href = "showcat.aspx?category=" + category + "&uid=" + uid + "&type=" + type + "&status=key";
                    break;
                case 32:
                    window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
                    break;
                default:
                    window.location.href = "ViewProduct.aspx?Category=" + category + "&SubCategory=" + subcategory + "&uid=" + uid + "&type=" + type + "&status=errorKey";
            }
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container wrapper" style="background-color:#c0c0c0;">
    <div style="margin-bottom: 40px;">
         <asp:HiddenField ID="language" runat="server" />
        <asp:TextBox ID="Count" runat="server" cssClass="hide"></asp:TextBox>
       
        <asp:Label ID="LabelCategory" runat="server" Font-Bold="true" Text=""></asp:Label>
        > 
        <asp:Label ID="LabelSubCategory" runat="server" Font-Bold="true" Text=""></asp:Label>
    </div>
        <asp:Label ID="content" runat="server" Text="Label"></asp:Label>

        <asp:HiddenField ID="uid" runat="server" />
        <asp:HiddenField ID="type" runat="server" />
        <asp:HiddenField ID="Status" runat="server" />
      </div>
   
</asp:Content>

