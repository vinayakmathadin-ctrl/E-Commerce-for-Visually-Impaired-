<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Product Details</title>
     <link rel="stylesheet" href="style2.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">

        var uid, type, category, subcategory, pid, cost, keycode, user_keycode, cart, name, desscription, key;
        var text = "", n = 0, msg;

        $(document).keydown(function (event)
        {
            cart = $('#<%=Status.ClientID%>').text();
            uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();
            category = $('#<%=category.ClientID%>').val();
            subcategory = $('#<%=subcategory.ClientID%>').val();
            key = $('#<%=key.ClientID%>').val();
            speechSynthesis.cancel();
            pid = document.getElementById('ContentPlaceHolder1_pid').value;
            cost = $("#product_detail #cost").text();
            user_keycode = (event.keyCode ? event.keyCode : event.which);
            
            switch (user_keycode)
            {
                case 9:
                    if (cart != "recommendation")
                        {
                            window.location.href = "Payment.aspx?pid=" + pid + "&cost=" + cost + "&uid=" + uid + "&type=" + type + "&status=key";
                        }
                        else
                        {
                            window.location.href = "ProductDetails.aspx?pid=" + pid + "&status=recommendation&uid=" + uid + "&type=" + type + "&key=errorKey";
                        }
                    break;

                case 17:
                    window.location.href = "Payment_Done.aspx?pid=" + pid + "&status=noPayment&uid=" + uid + "&type=" + type + "";
                    break;
                case 49:
                    window.location.href = "UserCart.aspx?status=cart_detail&uid=" + uid + "&type=" + type + "&errstatus=key";
                    break;
                case 50:
                    window.location.href = "HomeMain.aspx?status=cart&uid=" + uid + "&type=" + type + "";
                    break;
                case 32:
                    window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
                    break;
                default:
                    window.location.href = "ProductDetails.aspx?pid=" + pid + "&status=" + cart + "&uid=" + uid + "&type=" + type + "&key=errorKey";
            }
        });

        function PageLoad()
        {
             var languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                cart = $('#<%=Status.ClientID%>').text();
                name = $("#product_detail #name").text();
                cost = $("#product_detail #cost").text();
                desscription = $("#product_detail #description").text();
                key = $('#<%=key.ClientID%>').val();
                if (key == "errorKey") {
                    text += "you have Pressed wrong key , ";
                }
                switch (cart) {
                    case 'addCart':
                        text += "You Have Successfully added product to cart, now, press 1, for view cart, and, press 2, for visit main categry,";
                        break;
                    case 'existInCart':
                        text += "already exist in cart, press 2, for visit main categry,";
                        break;
                    case 'recommendation':
                        text += "Product Name " + name + ", Price is " + cost + "rupees, descriptions is " + desscription + ",";
                        text += "Now press CTRL, for add Cart, press 2, for visit main categry, ";
                        break;
                    case 'fullCart':
                        text += "Can not add more than 10 product, for insert new product, please delete product from cart, press 1 for view cart, press 2, for visit main categry, ";
                        break;
                    default:
                        text += "Product Name is " + name + " Price is " + cost + "rupees descriptions is " + desscription + "";
                        text += "Now press CTRL for add Cart and  press TAB for Buy Now, press 2, for visit main categry,";
                }

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
                cart = $('#<%=Status.ClientID%>').text();
                name = $("#product_detail #name").text();
                cost = $("#product_detail #cost").text();
                desscription = $("#product_detail #description").text();
                key = $('#<%=key.ClientID%>').val();
                if (key == "errorKey") {
                    text += "aapne galat button dabaya hai";
                }
                switch (cart) {
                    case 'addCart':
                        text += "product Successfully cart may add ho gaya hai,  view cart ke liye 1 dabaye, and,  main categry ke liye 2 dabaye,";
                        break;
                    case 'existInCart':
                        text += "ye product already cart me hai,  main categry me jaane ke liye 2 press kare,";
                        break;
                    case 'recommendation':
                        text += "Product ka naam " + name + ", Price hai " + cost + "rupay, descriptions hai " + desscription + ",";
                        text += "add Cart ke liye Control dabaye,main category me jaane ke liye 2 dabaye, ";
                        break;
                    case 'fullCart':
                        text += " 10 product se zyada add nahi kar sakte,  naya product add karne ke liye, cart se delete karey, view cart ke liye 1 dabaye, main categry me jaane ke liye 2 dabaye, ";
                        break;
                    default:
                        text += "Product ka naam hai" + name + " Price hai" + cost + "rupay description hai " + desscription + "";
                        text += "add Cart ke liye control dabaye buy ke liye TAB dabaye main category ke liye 2 dabaye,";
                }

                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    
                    voices = window.speechSynthesis.getVoices();
                    msg = new SpeechSynthesisUtterance();

                    msg.pitch = 0; //0 to 2
                    msg.lang = 'hi';

                    msg.text = text;
                    if (n == "0") {
                        speechSynthesis.speak(msg);
                        n++;
                    }
                   
                };
            }
            else if (languages == "Kannada") {
                cart = $('#<%=Status.ClientID%>').text();
                name = $("#product_detail #name").text();
                cost = $("#product_detail #cost").text();
                desscription = $("#product_detail #description").text();
                key = $('#<%=key.ClientID%>').val();
                if (key == "errorKey") {
                    text += "Nīvu tappu kīliyannu ottidiri, ";
                }
                switch (cart) {
                    case 'addCart':
                        text += "Nīvu kārṭ‌ge utpannavannu yaśasviyāgi sērisiruviri, Īga, kārṭ vīkṣisalu 1 ottiri, Mattu, mukhya vargakke bhēṭi nīḍalu 2 annu ottiri,";
                        break;
                    case 'existInCart':
                        text += "Kārṭ‌nalli īgāgalē astitvadallide, Mukhya vargakke bhēṭi nīḍalu 2 annu ottiri,";
                        break;
                    case 'recommendation':
                        text += "Utpanna Name " + name + ", Bele iday " + cost + "Rūpāyi, vivaraṇegaḷu " + desscription + ",";
                        text += "Īga ottiri CTRL, Kārṭ sērisalu, Mukhya vargakke bhēṭi nīḍalu kārṭ pres 2 annu sērisalu, ";
                        break;
                    case 'fullCart':
                        text += "10 Kkinta heccu utpannavannu sērisalāguvudilla, Hosa utpannavannu sērisalu, dayaviṭṭu kārṭ‌ninda utpannavannu aḷisi, Kārṭ vīkṣisalu 1 ottiri, Mukhya vargakke bhēṭi nīḍalu 2 annu ottiri, ";
                        break;
                    default:
                        text += "Utpannada hesaru " + name + " Bele iday " + cost + "Rūpāyi, vivaraṇegaḷu " + desscription + "";
                        text += "Īga ottiri CTRL, Kārṭ sērisalu, Mukhya vargakke bhēṭi nīḍalu kārṭ pres 2 annu sērisalu,";
                }

                var voices = [];
                window.speechSynthesis.onvoiceschanged = function () {
                    voices = window.speechSynthesis.getVoices();
                    msg = new SpeechSynthesisUtterance();
                    msg.pitch = "1";
                    msg.text = text;
                    msg.lang = "hi";
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
     <asp:HiddenField ID="language" runat="server" />

    <div class="container wrapper" style="background-color:#c0c0c0;">
        <asp:TextBox ID="pid" runat="server" CssClass="hide"></asp:TextBox>
        <asp:Label ID="Status" runat="server" Text="Label" CssClass="hide"></asp:Label>
        <asp:Label ID="Data" runat="server" Text="Label" Visible="false"></asp:Label>

        <asp:HiddenField ID="uid" runat="server" />
        <asp:HiddenField ID="type" runat="server" />
        <asp:HiddenField ID="category" runat="server" />
        <asp:HiddenField ID="subcategory" runat="server" />
        <asp:HiddenField ID="key" runat="server" />
           </div>
</asp:Content>

