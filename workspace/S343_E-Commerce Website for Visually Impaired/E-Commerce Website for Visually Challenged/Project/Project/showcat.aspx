<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="showcat.aspx.cs" Inherits="showcat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="style2.css">
    <script type="text/javascript">
        var subcategory = [];
        var i, k, n = 0, user_keycode, keycode, text = "", uid, type, count, category, msg, error_text,status;

        function PageLoad()
        {
            var languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                count = document.getElementById('ContentPlaceHolder1_Count').value;
                category = document.getElementById('ContentPlaceHolder1_Category').value;
                status = $('#<%=Status.ClientID%>').val();
                for (i = 0; i < count; i++) {
                    subcategory[i] = $("#category #subcateory" + i).text();
                }
                if (status == "errorKey") {
                    text += "you have Pressed wrong key ,";
                }

                for (i = 0; i < count; i++) {
                    k = i + 1;
                    text += "press " + k + " for " + subcategory[i] + " , ";
                }
                text += "press backspace to go back";
                window.speechSynthesis.onvoiceschanged = function () {
                    var voices = [];
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
                count = document.getElementById('ContentPlaceHolder1_Count').value;
                category = document.getElementById('ContentPlaceHolder1_Category').value;
                status = $('#<%=Status.ClientID%>').val();
                for (i = 0; i < count; i++) {
                    subcategory[i] = $("#category #subcateory" + i).text();
                }
                if (status == "errorKey") {
                    text += "aapne galat key dabaya hai ,";
                }

                for (i = 0; i < count; i++) {
                    k = i + 1;
                    text += " " + subcategory[i] + " ko choose karne ke liye  " + k + "dabaye";
                }
                text += "   back jaane ke liye backspace dabaye";
                window.speechSynthesis.onvoiceschanged = function () {
                    var voices = [];
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
                count = document.getElementById('ContentPlaceHolder1_Count').value;
                category = document.getElementById('ContentPlaceHolder1_Category').value;
                status = $('#<%=Status.ClientID%>').val();
                for (i = 0; i < count; i++) {
                    subcategory[i] = $("#category #subcateory" + i).text();
                }
                if (status == "errorKey") {
                    text += "Nīvu tappu kīliyannu ottidiri ,";
                }

                for (i = 0; i < count; i++) {
                    k = i + 1;
                    text += "otti " + k + " Phār " + subcategory[i] + " , ";
                }
                text += "Hintirugalu backspace ottiri";
                window.speechSynthesis.onvoiceschanged = function () {
                    var voices = [];
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
            count = document.getElementById('ContentPlaceHolder1_Count').value;
            category = document.getElementById('ContentPlaceHolder1_Category').value;
            uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();
            speechSynthesis.cancel();
            user_keycode = (event.keyCode ? event.keyCode : event.which);
            for (i = 0; i < count; i++)
            {
                subcategory[i] = $("#category #subcateory" + i).text();
            }
            keycode = 49;
            for (i = 0; i < count; i++)
            {
                keycode = (49 + i);
                if (user_keycode == keycode)
                {
                    window.location.href = "ViewProduct.aspx?Category=" + category + "&SubCategory=" + subcategory[i] + "&uid=" + uid + "&type=" + type + "&status=key";
                    return false;
                }
            }
            switch (user_keycode)
            {
                case 8:
                    window.location.href = "HomeMain.aspx?status=category&uid=" + uid + "&type=" + type + "";
                    break;
                case 32:
                    window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
                    break;
                default:
                    window.location.href = "showcat.aspx?category=" + category + "&uid=" + uid + "&type=" + type + "&status=errorKey";
            }
            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:HiddenField ID="language" runat="server" />
    <asp:Panel ID="Panel1" runat="server" BackColor="#c0c0c0">
    <div class="container wrapper" >
      
        <asp:Label ID="content" runat="server" BackColor="#3366FF" Text="Label" Visible="false"></asp:Label>

        <asp:TextBox ID="Count" runat="server" BackColor="#3366FF" CssClass =" hide"></asp:TextBox>
        <asp:TextBox ID="Category" runat="server" BackColor="#3366FF" CssClass =" hide"></asp:TextBox>

        <asp:HiddenField ID="uid" runat="server" />
        <asp:HiddenField ID="type" runat="server" />
        <asp:HiddenField ID="Status" runat="server" />
    </div>
</asp:Panel>
</asp:Content>

