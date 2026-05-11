class Widget {}
class Button extends Widget {
  Button(String text);
}

class MyButton extends Widget {
  Widget build() {
    return Button('Hello');
  }
}