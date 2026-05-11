class Widget {}
class Text extends Widget {
  Text(String text);
}

class MyText extends Widget {
  Widget build() {
    return Text('Hello');
  }
}
