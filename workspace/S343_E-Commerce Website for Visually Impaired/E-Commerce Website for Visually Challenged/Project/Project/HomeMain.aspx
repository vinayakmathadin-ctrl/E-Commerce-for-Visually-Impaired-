<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true"
    CodeFile="HomeMain.aspx.cs" Inherits="HomeMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style2.css">
    <script type="text/javascript">
        var login, text = "", keycode, error_text="";
        var uid, type, msg, n=0, error_n = 0;
        
        function PageLoad()
        {
            var languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                login = $('#<%=Login.ClientID%>').text();
                switch (login) {
                    case 'login':
                        text += "You have successfully log in , Press Spacebar for logout any time, ";
                        break;
                    case 'cancel':
                        text += "you have cancelled the payment process , ";
                        break;
                    case 'order':
                        text += "you have successfully done Payment and order product , ";
                        break;
                    case 'errorKey':
                        text += "you have Pressed wrong key , ";
                        break;
                    default:
                        text += "";
                }
                text += "now, press 1, for electronics,  press 2, for home appliances, press 3, for clothing, press 4, for furniture, press 5, for life style, press 6, for accessories";
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
                login = $('#<%=Login.ClientID%>').text();
                switch (login) {
                    case 'login':
                        text += "aapne successfully login kar liya hai , kabhi bhi logout karney ke liye Spacebar dabaye, ";
                        break;
                    case 'cancel':
                        text += "aapne   payment process cancel  kar diya hai, ";
                        break;
                    case 'order':
                        text += "aapne successfully  Payment kar diya hai  product order karne ke liye , ";
                        break;
                    case 'errorKey':
                        text += "aapne galat key dabaya hai , ";
                        break;
                    default:
                        text += "";
                }
                text += " electronics ke liye 1 dabaye home appliances ke liye 2 dabaye clothing ke liye 3 dabaye ";
                text += "furniture ke liye 4 dabaye life style ke liye 5 dabaye accessories ke liye 6 dabaye";
                window.speechSynthesis.onvoiceschanged = function () {
                    var voices = [];
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
                login = $('#<%=Login.ClientID%>').text();
                switch (login) {
                    case 'login':
                        text += "Lāgin yaśasviyāgide, Lāg‌auṭ‌gāgi spacebar ottiri ";
                        break;
                    case 'cancel':
                        text += "Nīvu ādēśavannu raddugoḷisiddīri, ";
                        break;
                    case 'order':
                        text += "Nīvu yaśasviyāgi pāvati mattu ārḍar utpannavannu māḍiddīri , ";
                        break;
                    case 'errorKey':
                        text += "Nīvu tappu kīliyannu ottidiri , ";
                        break;
                    default:
                        text += "";
                }
                text += "Elekṭrāniksgāge 1 ottiri,  Gr̥hōpayōgi upakaraṇagaḷigāge 2 ottiri, Baṭṭey 3 ottiri,Pīṭhōpakaraṇagaḷigāge 4 ottiri, Jīvanaśailigāgi 5 ottiri, Biḍibhāgagaḷigāgi 6 ottiri";
                window.speechSynthesis.onvoiceschanged = function () {
                    var voices = [];
                    voices = window.speechSynthesis.getVoices();
                    msg = new SpeechSynthesisUtterance();
                    msg.pitch = "1";
                    msg.text = text;
                    msg.lang = "hi";
                    msg.rate ="1";
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
             uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();
             speechSynthesis.cancel();

             keycode = (event.keyCode ? event.keyCode : event.which);
             switch (keycode)
             {
                 case 49:
                     window.location.href = "showcat.aspx?category=Electronics&uid=" + uid + "&type=" + type + "&status=key";
                     break;
                 case 50:
                     window.location.href = "showcat.aspx?category=Home Appliances&uid=" + uid + "&type=" + type + "&status=key";
                     break;
                 case 51:
                     window.location.href = "showcat.aspx?category=Clothing&uid=" + uid + "&type=" + type + "&status=key";
                     break;
                 case 52:
                     window.location.href = "showcat.aspx?category=Furniture&uid=" + uid + "&type=" + type + "&status=key";
                     break;
                 case 53:
                     window.location.href = "showcat.aspx?category=Life Style&uid=" + uid + "&type=" + type + "&status=key";
                     break;
                 case 54:
                     window.location.href = "showcat.aspx?category=Accessories&uid=" + uid + "&type=" + type + "&status=key";
                     break;
                 case 32:
                     window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
                     break;
                 default:
                     window.location.href = "HomeMain.aspx?status=errorKey&uid=" + uid + "&type=" + type + "";
             }
         });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:HiddenField ID="language" runat="server" />
        <div class="container wrapper" style="background-color:#c0c0c0;">

            <asp:Table ID="Table1" runat="server" ViewStateMode="Enabled" Width="100%" BackColor="#c0c0c0">
                <asp:TableRow runat="server"  BackColor="white"  BorderColor="White" BorderWidth="10px" Width="100%">
                    <asp:TableCell runat="server" HorizontalAlign="Center" Width="25%">
                        <asp:Button ID="Button1" runat="server" Text="Electronics" Width="90%" Height="80px" BackColor="#3366FF" ForeColor="White" Font-Size="Medium">
                        </asp:Button>
                    </asp:TableCell>
                    <asp:TableCell runat="server" HorizontalAlign="Center" Width="25%">
                        <asp:Button ID="Button2" runat="server" Text="Home Appliances" Width="90%" Height="80px" BackColor="#3366FF" ForeColor="White" Font-Size="Medium">
                        </asp:Button>
                    </asp:TableCell>
                    <asp:TableCell runat="server" HorizontalAlign="Center" Width="25%">
                        <asp:Button ID="Button3" runat="server" Text="Clothing" Width="90%" Height="80px" BackColor="#3366FF" ForeColor="White" Font-Size="Medium">
                        </asp:Button>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server"  BackColor="white" BorderColor="White" BorderWidth="10px" Width="100%" >
                    <asp:TableCell runat="server" HorizontalAlign="Center" Width="25%">
                        <asp:Button ID="Button5" runat="server" Text="Furniture" Width="90%" Height="80px" BackColor="#3366FF" ForeColor="White" Font-Size="Medium">
                        </asp:Button>
                    </asp:TableCell>
                    <asp:TableCell runat="server" HorizontalAlign="Center" Width="25%">
                        <asp:Button ID="Button6" runat="server" Text="Life Style" Width="90%" Height="80px" BackColor="#3366FF" ForeColor="White" Font-Size="Medium">
                        </asp:Button>
                    </asp:TableCell>
                    <asp:TableCell runat="server" HorizontalAlign="Center" Width="25%">
                        <asp:Button ID="Button7" runat="server" Text="Accessories" Width="90%" Height="80px" BackColor="#3366FF" ForeColor="White" Font-Size="Medium">
                        </asp:Button>
                    </asp:TableCell>
                   
                </asp:TableRow>               
            </asp:Table>

            <asp:Label ID="Login" runat="server" Text="Label" CssClass="hide"></asp:Label>
            
            <asp:HiddenField ID="uid" runat="server" />
            <asp:HiddenField ID="type" runat="server" />

        </div>
</asp:Content>
