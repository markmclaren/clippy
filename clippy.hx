import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.display.Bitmap;
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;

class Clippy {
  // Main
  static function main() {
    var text:String = flash.Lib.current.loaderInfo.parameters.text;
	var html:String = flash.Lib.current.loaderInfo.parameters.html;
	
    
    // label
    
    var label:TextField = new TextField();
    var format:TextFormat = new TextFormat("Arial", 10);
    
    label.text = "copy to clipboard";
    label.setTextFormat(format);
    label.textColor = 0x888888;
    label.selectable = false;
    label.x = 15;
    label.visible = false;
    
    flash.Lib.current.addChild(label);
    
    // button
    
    var button:SimpleButton = new SimpleButton();
    button.useHandCursor = true;
    button.upState = new ButtonUp();
    button.overState = new ButtonOver();
    button.downState = new ButtonDown();
    button.hitTestState = new ButtonDown();
    
    button.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
      // Clear out the clipboard before starting to copy data
	  Clipboard.generalClipboard.clear();
	  if (text != null) {
	   	Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, text);
	  }
	  if (html != null) {
 	    Clipboard.generalClipboard.setData(ClipboardFormats.HTML_FORMAT, html);	  
	  }
      label.text = "copied!";
      label.setTextFormat(format);
    });
    
    button.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
      label.visible = true;
    });
    
    button.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
      label.visible = false;
      label.text = "copy to clipboard";
      label.setTextFormat(format);
    });
    
    flash.Lib.current.addChild(button);
  }
}

class ButtonUp extends Bitmap { public function new() { super(); } }
class ButtonOver extends Bitmap { public function new() { super(); } }
class ButtonDown extends Bitmap { public function new() { super(); } }