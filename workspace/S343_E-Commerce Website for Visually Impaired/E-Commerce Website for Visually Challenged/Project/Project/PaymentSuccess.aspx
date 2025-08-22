<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true" CodeFile="PaymentSuccess.aspx.cs" Inherits="PaymentSuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        /*.hide1{
            display: none;
        }*/
        .style1
        {
            width: 159px;
        }
        .auto-style1 {
            font-family: gadugi;
            font-size: large;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
    <script type="text/javascript">
        var cost, text = "", n = 0, msg, uid, type, pid, user_keycode, status,languages;
        var pid = [];
        var pname = [], price = [];

        function PageLoad()
        {
            languages = $('#<%=language.ClientID%>').val();
            status = $('#<%=Status.ClientID%>').val();
            languages = $('#<%=language.ClientID%>').val();
            if (languages == "English") {
                cost = $("#ContentPlaceHolder1_cost").text();
                if (status == "errorKey") {
                    text += "you have Pressed wrong key ,";
                }
                text += "You have entered Card details successfully, " + cost + ",";
                text += "Now, press 1 for, Payment, and, press 2 for, cancel ";
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
                cost = $("#ContentPlaceHolder1_cost").text();
                if (status == "errorKey") {
                    text += "aapne galat key press kiya hai ,";
                }
                text += "aapne Card details successfully enter kiya hai, " + cost + ",";
                text += "ab, Payment ke liye 1 press karey, or cancel ke liye 2 press karey ";
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
                cost = $("#ContentPlaceHolder1_cost").text();
                if (status == "errorKey") {
                    text += "Nīvu tappu kīliyannu ottidiri,";
                }
                text += "Nīvu pravēśisiddīri Card details Yaśasviyāgi, " + cost + ",";
                text += "Now, Pāvatigāgi 1 ottiri, Mattu, 2 annu otti, raddumāḍi ";
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

        $(document).keydown(function (event) {
            uid = $('#<%=uid.ClientID%>').val();
            type = $('#<%=type.ClientID%>').val();

            speechSynthesis.cancel();
            pid = $('#ContentPlaceHolder1_pid').text();
            user_keycode = (event.keyCode ? event.keyCode : event.which);
            switch (user_keycode)
            {
                case 49:
                   // window.location.href = "EnterPaymentDetails.aspx?pid=" + pid + "&status=payment&uid=" + uid + "&type=" + type + "";

                   window.location.href = "Payment_Done.aspx?pid=" + pid + "&status=payment&uid=" + uid + "&type=" + type + "";
                    break;
                case 50:
                    window.location.href = "HomeMain.aspx?status=cancel&uid=" + uid + "&type=" + type + "";
                    break;
                case 32:
                    window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
                    break;
                default:
                    window.location.href = "Payment.aspx?pid=" + pid + "&cost=" + cost + "&uid=" + uid + "&type=" + type + "&status=errorKey";
            }
            //if (user_keycode == '49')
            //{
            //   window.location.href = "Payment_Done.aspx?pid=" + pid + "&status=payment&uid=" + uid + "&type=" + type + "";
            //}
            //else if (user_keycode == '50')
            //{
            //    window.location.href = "HomeMain.aspx?status=cancel&uid=" + uid + "&type=" + type + "";
            //}
            //else if (user_keycode == '32')
            //{
            //    window.location.href = "Payment_Done.aspx?pid=cartDelete&status=cart_delete&uid=" + uid + "&type=" + type + "";
            //}
            //else
            //{
            //    window.location.href = "Payment.aspx?pid=" + pid + "&cost=" + cost + "&uid=" + uid + "&type=" + type + "&status=errorKey";
            //}

        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="language" runat="server"></asp:HiddenField>
   </div>
    <center> 
        <br>
        <br>
      <div class="container wrapper" style="background-color:#c0c0c0;">
        <h1 >You have entered Card details successfully!!!
       <asp:Label ID="cost" runat="server" style="font-weight: 700; font-family: gadugi;"></asp:Label>
           /-</h1>
&nbsp;<br />
           <asp:Label ID="pid" runat="server" cssClass="hide"></asp:Label>

           <div class="form-group">
               
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <br>
                    <asp:Button ID="Submit_button" Width="100%" Height="80px" Font-Size="XX-Large"  CssClass="btn btn-success uname button hide1" runat="server" 
                        Text="Submit"  Visible="false"/>
                </div>
                <div class="col-md-1"></div>
            </div>
          <div class="clearfix"></div>
          <div class="form-group">
               
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <br>
                    <asp:Button ID="Cancel_button" Width="100%" Height="80px" Font-Size="XX-Large"  CssClass="btn btn-primary uname button " runat="server" 
                        Text="Cancel"  Visible="false"/>
                </div>
                <div class="col-md-1"></div>
            </div>
          <asp:HiddenField ID="uid" runat="server"></asp:HiddenField>
          <asp:HiddenField ID="type" runat="server"></asp:HiddenField>
          <asp:HiddenField ID="Status" runat="server"></asp:HiddenField>
   </div>
</center>
</asp:Content>

