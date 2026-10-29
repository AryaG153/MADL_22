void main() {
  print("Hello, Dart!");
  // Variables
  String name = "Alice";
  int age = 25;
  double height = 5.6;
  bool isStudent = true;
  print("Name: $name");
  print("Age: $age");
  print("Height: $height");
  print("Student: $isStudent");
  // List
  List<String> fruits = ["Apple", "Banana", "Orange"];
  print("\nFruits:");
  for (var fruit in fruits) {
    print("- $fruit");
  }
  // Function
  int add(int a, int b) {
    return a + b;
  }
  print("\n10 + 20 = ${add(10, 20)}");
  // Class
  Person person = Person("Bob", 30);
  person.introduce();
}
class Person {
  final String name;
  final int age;
  Person(this.name, this.age);
  void introduce() {
    print("\nHi, I'm $name and I'm $age years old.");
  }
}

