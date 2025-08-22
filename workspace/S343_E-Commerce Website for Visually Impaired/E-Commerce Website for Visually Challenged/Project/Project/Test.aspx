<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/materialize/0.95.1/js/materialize.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/materialize/0.95.1/css/materialize.min.css"/>
    <script type="text/javascript">
        $(function(){
  if ('speechSynthesis' in window) {
    speechSynthesis.onvoiceschanged = function() {
      var $voicelist = $('#voices');

      if($voicelist.find('option').length == 0) {
        speechSynthesis.getVoices().forEach(function(voice, index) {
          var $option = $('<option>')
          .val(index)
          .html(voice.name + (voice.default ? ' (default)' :''));

          $voicelist.append($option);
        });

        $voicelist.material_select();
      }
      }
          $('#speak').hover(function () {
              var text = $('#message').val();
              var msg = new SpeechSynthesisUtterance();
              var voices = window.speechSynthesis.getVoices();

              msg.voice = voices[$('#voices').val()];
              msg.rate = $('#rate').val() / 10;
              msg.pitch = "0";
              msg.text = text;

              msg.onend = function (e) {
                  console.log('Finished in ' + event.elapsedTime + ' seconds.');
              };

              speechSynthesis.speak(msg);
          })
  } else {
    $('#modal1').openModal();
  }
});

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
                        <label class="col-md-4 control-label">Product Image</label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <asp:FileUpload ID="FileUpload1" CssClass="btn btn-default" runat="server"/>
                                <asp:Button ID="ButtonUpload" runat="server" CssClass="btn btn-info" Text="Upload" onclick="ButtonUpload_Click" />
                                <br />
                                <asp:Image ID="Image1" Visible="false" runat="server" Height="100px" Width="99px" />
                            </div>
                        </div>
                    </div>

<div class="container">
  <div class="row">
    <nav>
      <div class="nav-wrapper">
        <div class="col s12">
          <a href="#" class="brand-logo">Text to speech example</a>
        </div>
      </div>
    </nav>
  </div>
  <form class="col s8 offset-s2">
    <div class="row">
      <label>Choose voice</label>
      <select id="voices"></select>
    </div>
    <div class="row">
      <div class="col s6">
        <label>Rate</label>
        <p class="range-field">
          <input type="range" id="rate" min="1" max="100" value="10" />
        </p>
      </div>
      <div class="col s6">
        <label>Pitch</label>
        <p class="range-field">
          <input type="range" id="pitch" min="0" max="2" value="1" />
        </p>
      </div>
      <div class="col s12">
        <p>N.B. Rate and Pitch only work with native voice.</p>
      </div>
    </div>
    <div class="row">
      <div class="input-field col s12">
        <textarea id="message" class="materialize-textarea"></textarea>
        <label>Write message</label>
      </div>
    </div>
    <%--<a href="#" id="speak" class="waves-effect waves-light btn">Speak</a>--%>
  </form>  
</div>

        <input type="text" id="speak" />

<div id="modal1" class="modal">
  <h4>Speech Synthesis not supported</h4>
  <p>Your browser does not support speech synthesis.</p>
  <p>We recommend you use Google Chrome.</p>
  <div class="action-bar">
    <a href="#" class="waves-effect waves-green btn-flat modal-action modal-close">Close</a>
  </div>
</div>


    </form>
</body>
</html>
