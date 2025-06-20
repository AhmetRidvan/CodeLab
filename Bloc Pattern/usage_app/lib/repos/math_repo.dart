class MathRepo {
  static int add(String incomingNumber1, String incomingNumber2) {
    int x = int.parse(incomingNumber1);
    int y = int.parse(incomingNumber2);
    int total = x + y;
    return total;
  }

  static int subtraction(String incomingNumber1, String incomingNumber2) {
    int x = int.parse(incomingNumber1);
    int y = int.parse(incomingNumber2);
    int total = x * y;
    return total;
  }
}
