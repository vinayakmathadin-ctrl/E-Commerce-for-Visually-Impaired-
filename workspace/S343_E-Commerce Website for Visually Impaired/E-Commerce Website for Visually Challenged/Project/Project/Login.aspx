<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageMain.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <script>

          function PageLoad() {
             
                                      var text = "Welcome to e commerce for visually impaired now press 1 for English,2 for hindi and 3 for Kannada";
                

                speak(text);
            
          }
          function PageLoad1() {

              var text = "Successfully Registered , to continue  press 1 for English,2 for hindi and 3 for Kannada";


              speak(text);

          }
          function speak(text) {
              msg = new SpeechSynthesisUtterance();
              msg.pitch = "0";
              msg.text = text;
              msg.lang = "hi";
              speechSynthesis.speak(msg);

          }

          $(document).keydown(function (event) {


              keycode = (event.keyCode ? event.keyCode : event.which);
              switch (keycode) {
                  case 49:
                      window.location.href = "UserLogin.aspx?language=English&type=login";
                      break;
                  case 50:
                      window.location.href = "UserLogin.aspx?language=Hindi&type=login";
                      break;
                  case 51:
                      window.location.href = "UserLogin.aspx?language=Kannada&type=login";
                      break;
                  default:
                      window.location.href = "UserLogin.aspx?language=English&type=login";
              }
          });
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w3-container" style="padding: 100px 16px;  background-color:#c0c0c0" id="about">
        
        <h3 class="w3-center" style="font-weight:bolder">
            CHOOSE YOUR LOGIN</h3> 
        <p class="w3-center w3-large">
        </p>
        <hr />
     
        <div class="w3-row-padding w3-center" style="margin-top: 64px">
            <a href="AdminLogin.aspx" onclick="mylang">
                <div class="col-md-6">
                    <i class="fa fa-user-circle w3-margin-bottom w3-jumbo"></i>
                    <p class="w3-large" >
                       <h3 style=" font-weight:bolder">ADMIN</h3></p>
                </div>
            </a>
            <a href="UserLogin.aspx?type=login&language=English" onclick="mylang">
                <div class="col-md-6">
                   <asp:LinkButton ID="LinkButton1"  runat="server"> <i class="fa fa-users w3-margin-bottom w3-jumbo"></i>
                    <p class="w3-large">
                       <h3 style=" font-weight:bolder">
                           CONSUMER</asp:LinkButton> </h3></p>
                </div>
            </a>
        </div>
        
    <br />
    <br />
    <br />
      
</asp:Content>
        