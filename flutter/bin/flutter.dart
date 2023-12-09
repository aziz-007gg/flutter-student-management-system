// A. Define an interface named Role
abstract class Role {
  void displayRole();
}

// B. Create a class Person
class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  // here i use Getter method
  String getName() => name;
  int getAge() => age;
  String getAddress() => address;


  @override
  void displayRole() {
    role.displayRole();
  }
}

// C. Create a class Student that extends Person
class Student extends Person {
  String studentID;
  List<double> courseScores;

  Student(String name, int age, String address, this.studentID)
      : courseScores = [],
        super(name, age, address, StudentRole());

  @override
  void displayRole() {
    print("Role: Student");
  }


  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    double sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }
}

// D. Create another class Teacher that extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID)
      : coursesTaught = [],  // Initialize coursesTaught
        super(name, age, address, TeacherRole());

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  // Method to display the courses taught by the teacher
  void displayCoursesTaught() {
    if (coursesTaught.isEmpty) {
      print("No courses taught yet.");
    } else {
      print("Courses Taught:");
      for (var course in coursesTaught) {
        print("- $course");
      }
    }
  }
}

// E. Create a class StudentManagementSystem
class StudentManagementSystem {
  static void main() {

    var student = Student("John Doe", 20, "123 Main St", "S123");
    student.courseScores = [90, 85, 82];

    var teacher = Teacher("Mrs. Smith", 35, "456 Oak St", "T456");
    teacher.coursesTaught = ["Math", "English", "Bangla"];

    // Display information
    print("Student Information:");
    student.displayRole();
    print("Name: ${student.getName()}");
    print("Age: ${student.getAge()}");
    print("Address: ${student.getAddress()}");
    print("Average Score: ${student.calculateAverageScore().toStringAsFixed(1)}");

    print("\nTeacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.getName()}");
    print("Age: ${teacher.getAge()}");
    print("Address: ${teacher.getAddress()}");
    teacher.displayCoursesTaught();
  }
}


class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

void main() {
  StudentManagementSystem.main();
}
