<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html>

    <head>

        <link rel="stylesheet" type="text/css" href="/default.css" />

        <script type="text/javascript" src="/org/cometd.js"></script>
        <script type="text/javascript" src="/org/cometd/AckExtension.js"></script>
        <script type="text/javascript" src="/org/cometd/ReloadExtension.js"></script>
        <script type="text/javascript" src="/jquery/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="/jquery/json2.js"></script>
        <script type="text/javascript" src="/jquery/jquery.cookie.js"></script>
        <script type="text/javascript" src="/jquery/jquery.cometd.js"></script>
        <script type="text/javascript" src="/jquery/jquery.cometd-reload.js"></script>

        <link rel="stylesheet" type="text/css" href="/chat.css" />
        <script type="text/javascript" src="chat.js"></script>
        <script type="text/javascript" src="files.js"></script>
        <script type="text/javascript" >
            var username = '<%= request.getUserPrincipal().getName()%>';
            var project = 'ide';
            var editor = null;

            $.cometd.websocketEnabled = true;
            $.cometd.configure({
                url: location.protocol + "//" + location.host.split(':')[0] + ":27306" +"/d/",
                logLevel: 'info'
            });
            $.cometd.handshake();

        </script>

        <script src="/src/ace.js" type="text/javascript" charset="utf-8"></script>
        <script src="/src/theme-twilight.js" type="text/javascript" charset="utf-8"></script>
        <script src="/src/mode-javascript.js" type="text/javascript" charset="utf-8"></script>
        <script src="/src/mode-xml.js" type="text/javascript" charset="utf-8"></script>
        <script src="/src/keybinding-vim.js" type="text/javascript" charset="utf-8"></script>


        <style type="text/css" media="screen">
            body {
                overflow: hidden;
            }

            #editor { 
                margin: 0;
                position: absolute;
                top: 5%;
                bottom: 10%;
                left: 15%;
                right: 20%;
            }
            #file { 
                margin: 0;
                position: absolute;
                top: 5%;
                bottom: 10%;
                left: 0%;
                right: 85%;
            }
            #chatroom { 
                margin: 0;
                position: absolute;
                top: 5%;
                bottom: 10%;
                left: 80%;
                right: 0;
            }
        </style>



        <script type="text/javascript" id="script_example">
            $(document).ready(function(){
                $("#editor").html( $("#script_example").html() );

                var JavaScriptMode = require("ace/mode/javascript").Mode;
	
                var mode = new JavaScriptMode();
                var keyBinding = require("ace/keyboard/keybinding/vim").Vim;
    
                editor = ace.edit("editor");
                editor.getSession().setMode( mode );
                editor.setKeyboardHandler( keyBinding )
                editor.setTheme("ace/theme/twilight");
                
            });
        </script>

    </head>
    <body>

        <div id="file">
            
            <div class="file">
                root
            </div>
            
        </div>

        <div id="editor">some text: sebastian javier marchano</div>

        <div id="chatroom">
            <div id="chat"></div>
            <div id="members"></div>
            <div id="input">
                <div id="join">
		nunca se ve
                </div>
                <div id="joined">
                    Chat:
                    &nbsp;
                    <input id="phrase" type="text" />
                    <button id="sendButton" class="button">Send</button>
                    <button id="leaveButton" class="button">Leave</button>
                </div>
            </div>
        </div>



    </body>
</html>