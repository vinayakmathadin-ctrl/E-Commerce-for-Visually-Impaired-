<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="UserCart.aspx.cs" Inherits="UserCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="style2.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <style type="text/css">
    .table-bordered {
    border: 10px solid #dee2e6;
}
         </style>
    <script type="text/javascript">
        var count, pname, i;
        var pname = [], cost = [], total = [], text = "", n = 0, uid, type,keycode, user_keycode, status;
        var pid = [];
        function PageLoad()
        {
            var lng = $('#<%=languages.ClientID%>').val();
            if (lng == "English") {
                status = $('#<%=Status.ClientID%>').val();
                count = $('#<%=Count.ClientID%>').text();
                cart_detail = $('#<%=cart_detail.ClientID%>').val();
                total = $("#total").text();
                for (i = 0; i < count; i++) {
                    pname[i] = $("#pname" + i).text();
                    cost[i] = $("#cost" + i).text();
                }
                if (status == "errorKey") {
                    text += "you have Pressed wrong key ,";
                }
                switch (cart_detail) {
                    case 'deleteProduct':
                        for (i = 0; i < count; i++) {
                            var k = i + 1;
                            text += "press " + k + " for delete product " + pname[i] + ", ";
                        }
                        text += "press backspace to go back,";
                        break;
                    case 'delete':
                        text += "You have successfully delete product, now, ";
                        for (i = 0; i < count; i++) {
                            var k = i + 1;
                            text += "press " + k + " for delete product, " + pname[i] + ", ";
                        }
                        text += "press backspace to go back,";
                        break;
                    default:
                        text += "Your Cart Details Are, ";
                        for (i = 0; i < count; i++) {
                            var k = i + 1;
                            text += "product " + k + " is, " + pname[i] + " , cost is, " + cost[i] + " rupees, ";
                        }
                        text += " Your total cost payable is, " + total + " rupees, ";
                        text += " Press 1 for, Recommendation, Press 2 for, Shop More, Press 3 for, Buy Now, Press 4 for Delete product";
                }
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
            if (lng == "Hindi") {
                status = $('#<%=Status.ClientID%>').val();
                 count = $('#<%=Count.ClientID%>').text();
                 cart_detail = $('#<%=cart_detail.ClientID%>').val();
                 total = $("#total").text();
                 for (i = 0; i < count; i++) {
                     pname[i] = $("#pname" + i).text();
                     cost[i] = $("#cost" + i).text();
                 }
                 if (status == "errorKey") {
                     text += "aapne galat key dabaya hai,";
                 }
                 switch (cart_detail) {
                     case 'deleteProduct':
                         for (i = 0; i < count; i++) {
                             var k = i + 1;
                             text += pname[i] +" delete karney ke liye press karey " + k + "  ";
                         }
                         text += "peeche jaane ke liye backspace dabaye,";
                         break;
                     case 'delete':
                         text += " ab aapne product successfully delete kar diya hai, ";
                         for (i = 0; i < count; i++) {
                             var k = i + 1;
                             text += " " + pname[i] + ",product delete karne ke liye " + k + "dabaye,";
                         }
                         text += "peeche jaane ke liye backspace dabaye,";
                         break;
                     default:
                         text += "aapke Cart me hai, ";
                         for (i = 0; i < count; i++) {
                             var k = i + 1;
                             text += "product " + k + " hai, " + pname[i] + " , jiski price hai, " + cost[i] + " rupay, ";
                         }
                         text += " aapko total , " + total + " rupay, dena hai  ";
                         text += " ,Recommendation ke liye 1 dabaye,shopping continue karne ke liye 2 dabaye, buy now ke liye 3 dabaye, product Delete karne ke liye 4 dabaye ";
                 }
                 var voices = [];
                 window.speechSynthesis.onvoiceschanged = function () {
                     voices = window.speechSynthesis.getVoices();
                     var msg = new SpeechSynthesisUtterance();
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
            else if (lng == "Kannada") {
                status = $('#<%=Status.ClientID%>').val();
                count = $('#<%=Count.ClientID%>').text();
                cart_detail = $('#<%=cart_detail.ClientID%>').val();
                total = $("#total").text();
                for (i = 0; i < count; i++) {
                    pname[i] = $("#pname" + i).text();
                    cost[i] = $("#cost" + i).text();
                }
                if (status == "errorKey") {
                    text += "Nīvu tappu kīliyannu ottidiri,";
                }
                switch (cart_detail) {
                    case 'deleteProduct':
                        for (i = 0; i < count; i++) {
                            var k = i + 1;
                            text += "otti " + k + " Utpannavannu aḷisalu " + pname[i] + ", ";
                        }
                        text += "Hintirugalu backspace ottiri,";
                        break;
                    case 'delete':
                        text += "Nīvu idīga utpannavannu yaśasviyāgi aḷisiruviri, ";
                        for (i = 0; i < count; i++) {
                            var k = i + 1;
                            text += "otti " + k + " Utpannavannu aḷisalu, " + pname[i] + ", ";
                        }
                        text += "Hintirugalu backspace ottiri";
                        break;
                    default:
                        text += "Nim'ma Cart Details Ive, ";
                        for (i = 0; i < count; i++) {
                            var k = i + 1;
                            text += "Utpanna " + k + " Ide " + pname[i] + " , veccha ide, " + cost[i] + " Rūpāyi, ";
                        }
                        text += " Pāvatisabēkāda nim'ma oṭṭu veccha, " + total + " Rūpāyi, ";
                        text += " Śiphārasugāgi 1 annu ottiri, 2 Annu ottiri, innaṣṭu śāpiṅg māḍi, 3 Annu ottiri, īga kharīdisi, Utpannavannu aḷisalu 4 annu ottiri";
                }
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
            count = $('#<%=Count.ClientID%>').text();
           var content = $('#<%=Product.ClientID%>').text();
            uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();
            cart_detail = $('#<%=cart_detail.ClientID%>').val();
            cost = $("#total").text();
            speechSynthesis.cancel();
           
            user_keycode = (event.keyCode ? event.keyCode : event.which);

            switch(cart_detail)
            {
                case 'cart_detail':
                    switch (user_keycode)
                    {
                        case 49:
                            if (content == "Currently, No products found in cart")
                            {
                                window.location.href = "HomeMain.aspx?status=key&uid=" + uid + "&type=" + type + "";
                            }
                            else
                            {
                                window.location.href = "Recommendation.aspx?uid=" + uid + "&type=" + type + "&status=key";
                            }
                            break;
                        case 50:
                            window.location.href = "HomeMain.aspx?status=cart&uid=" + uid + "&type=" + type + "";
                            break;
                        case 51:
                            window.location.href = "Payment.aspx?pid=user_cart&cost=" + cost + "&uid=" + uid + "&type=" + type + "&errstatus=keys";
                            break;
                        case 52:
                            window.location.href = "UserCart.aspx?status=deleteProduct&uid=" + uid + "&type=" + type + "&errstatus=key";
                            break;
                        case 32:
                            window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
                            break;
                        default:
                            window.location.href = "UserCart.aspx?status=cart_detail&uid=" + uid + "&type=" + type + "&errstatus=errorKey";
                    }
                    break;

                case 'deleteProduct':
                case 'delete':
                    if (count > 0)
                    {
                        for (i = 0; i < count; i++) 
                        {
                            pid[i] = $(".product_list #pid" + i).text();
                        }
                        keycode = 49;
                        for (i = 0; i < count; i++) 
                        {
                            keycode = (49 + i);
                            if (user_keycode == keycode) 
                            {
                                window.location.href = "Payment_Done.aspx?pid=" + pid[i] + "&status=delete&uid=" + uid + "&type=" + type + "";
                                return false;
                            }
                            else if (user_keycode == '8')
                            {
                                window.location.href = "UserCart.aspx?status=cart_detail&uid=" + uid + "&type=" + type + "&errstatus=key";
                            }
                            else 
                            {
                                window.location.href = "UserCart.aspx?status=deleteProduct&uid=" + uid + "&type=" + type + "&errstatus=errorKey";
                            }
                        }
                    }
                    else
                    {
                        if (user_keycode == '49')
                        {
                            window.location.href = "HomeMain.aspx?status=emptyCart&uid=" + uid + "&type=" + type + "";
                        }
                        else {
                            window.location.href = "UserCart.aspx?status=deleteProduct&uid=" + uid + "&type=" + type + "&errstatus=errorKey";
                        }
                    }
                    break;
            }
        });
          
        function NoData()
        {
            var language = $('#<%=languages.ClientID%>').text();
            if (language == "English") {
                text += "Currently, No products found in cart, ";
                text += "Now, press 1 to go main  category, "
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
            else if(language == "Hindi") {
                text += "Abhi cart me product nahi hai ";
                text += " main  category me jaane ke liye 1 dabaye "
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
            else if (language == "Kannada") {
                text += "Prastuta, kārṭ‌nalli yāvudē utpannagaḷu kaṇḍubandilla, ";
                text += "Īga, mukhya vargakke hōgalu 1 ottiri "
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
        }
       
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="container wrapper" style="background-color:#c0c0c0;">
        <center>
            <h3>Cart Details</h3>
            <br/>
        <asp:Label ID="Product" runat="server" Text="Label" Visible="false"></asp:Label>
             
                 <div class="form-group col-md-12">
            <asp:Button ID="Button1" CssClass="btn btn-info button" runat="server" Text="Recommendation" Height="80px" Font-Size="XX-Large" Width ="100%" Visible="false" BackColor="#0066CC"></asp:Button >
                     </div>
            <asp:HiddenField ID="languages" runat="server" />
           
                 <div class="form-group col-md-12">
            <asp:Button CssClass="btn btn-secondary button" ID="Button2" runat="server" Text="Shop More" Height="80px" Font-Size="XX-Large" Width ="100%" Visible="false" BackColor="#9933FF"></asp:Button>
                      </div>

                 <div class=" form-group col-md-12">
            <asp:Button CssClass="btn btn-success button" ID="Button3" runat="server" Text="Buy Now" Height="80px" Font-Size="XX-Large" Width ="100%" Visible="false" BackColor="#009933"></asp:Button>
                      </div>
                 
       
            <asp:Label ID="Count" runat="server" Text="Label" CssClass="hide"></asp:Label>
            </center>

        <asp:HiddenField ID="uid" runat="server" />
        <asp:HiddenField ID="type" runat="server" />
        <asp:HiddenField ID="cart_detail" runat="server" />
        <asp:HiddenField ID="Status" runat="server" />
        </div>
    

</asp:Content>

