# Module 8: File Handling and I/O Streams

Modern C++ treats I/O as a high-level abstraction over OS-level read/write operations, providing safety, flexibility, and extensibility. Understanding streams, formatting, and file I/O is fundamental to building real-world applications.

---

## 🔹 Concept Overview

* **Streams**: Abstractions representing data flow — input or output.
* **Types**: Standard streams (`cin`, `cout`, `cerr`, `clog`), file streams (`ifstream`, `ofstream`, `fstream`), and string streams (`istringstream`, `ostringstream`).
* **Goal**: Perform formatted, type-safe I/O operations efficiently and portably.

---

## 🔹 Basic Console I/O

### Syntax Block

```cpp
#include <iostream>
using namespace std;

int main() {
    int age;
    cout << "Enter your age: ";
    cin >> age;
    cout << "You are " << age << " years old." << endl;
}
```

### Notes & Insights

💡 **Insight:** `cin` and `cout` use overloaded operators (`>>`, `<<`) for type-safe streaming.

⚠️ **Pitfall:** Using `cin >>` with strings stops at spaces — use `getline()` for full lines.

---

## 🔹 File Streams: Reading & Writing Files

### Example: Writing to a File

```cpp
#include <fstream>
#include <iostream>

int main() {
    std::ofstream file("example.txt");
    if (!file) {
        std::cerr << "Error opening file for writing!\n";
        return 1;
    }

    file << "Hello, C++ File I/O!\n";
    file << 42 << ' ' << 3.14 << std::endl;
    file.close();
}
```

### Example: Reading from a File

```cpp
#include <fstream>
#include <iostream>
#include <string>

int main() {
    std::ifstream file("example.txt");
    std::string word;

    if (!file.is_open()) {
        std::cerr << "Failed to open file.\n";
        return 1;
    }

    while (file >> word)
        std::cout << word << '\n';

    file.close();
}
```

💡 **Insight:** File streams automatically handle buffer flushing and EOF detection.

⚠️ **Pitfall:** Always check `.is_open()` before performing I/O.

---

## 🔹 Appending and File Modes

| Mode          | Description                              |
| ------------- | ---------------------------------------- |
| `ios::in`     | Open for reading                         |
| `ios::out`    | Open for writing (overwrites by default) |
| `ios::app`    | Append to the end of the file            |
| `ios::binary` | Open in binary mode                      |
| `ios::ate`    | Seek to end immediately after opening    |

### Example

```cpp
#include <fstream>

int main() {
    std::ofstream file("log.txt", std::ios::app);
    file << "Log entry added." << std::endl;
}
```

🧠 **Under the Hood:** File modes control how the OS file descriptor is opened — binary mode bypasses newline translation on Windows.

---

## 🔹 Binary File I/O

### Example

```cpp
#include <fstream>
#include <iostream>

struct Record {
    int id;
    double score;
};

int main() {
    Record r1 = {1, 99.5};

    std::ofstream out("data.bin", std::ios::binary);
    out.write(reinterpret_cast<char*>(&r1), sizeof(r1));
    out.close();

    Record r2;
    std::ifstream in("data.bin", std::ios::binary);
    in.read(reinterpret_cast<char*>(&r2), sizeof(r2));

    std::cout << "Read Record: ID=" << r2.id << ", Score=" << r2.score << '\n';
}
```

💡 **Insight:** Binary I/O is faster and preserves exact in-memory structure.

⚠️ **Pitfall:** Binary files are not portable across architectures with different endianness or alignment.

---

## 🔹 String Streams (stringstream)

Useful for parsing and formatting strings like streams.

### Example

```cpp
#include <sstream>
#include <iostream>

int main() {
    std::stringstream ss;
    ss << "42 3.14 Hello";

    int a; double b; std::string c;
    ss >> a >> b >> c;

    std::cout << a << ' ' << b << ' ' << c << '\n';
}
```

💡 **Insight:** `stringstream` provides a consistent interface for both string parsing and generation.

---

## 🔹 Error Handling & Exception Safety

### Example

```cpp
#include <fstream>
#include <iostream>

int main() {
    std::ifstream file("nonexistent.txt");
    file.exceptions(std::ifstream::failbit | std::ifstream::badbit);

    try {
        std::string line;
        std::getline(file, line);
    } catch (const std::ios_base::failure& e) {
        std::cerr << "I/O error: " << e.what() << '\n';
    }
}
```

💡 **Insight:** Use exceptions for critical file operations; prefer state checks (`.fail()`, `.eof()`) for regular I/O.

🧠 **Under the Hood:** I/O errors are tracked via stream state bits — `failbit`, `eofbit`, and `badbit`.

---

## 🔹 Formatting Output

```cpp
#include <iomanip>
#include <iostream>

int main() {
    double pi = 3.1415926535;
    std::cout << std::fixed << std::setprecision(3) << pi << '\n';
}
```

💡 **Insight:** The `<iomanip>` header provides fine-grained control over output formatting — width, precision, fill characters, and alignment.

---

## ⚙️ Best Practices

* Always check file open status (`is_open()`).
* Use RAII: Streams automatically close when they go out of scope.
* Prefer binary I/O for performance-critical data serialization.
* Combine `stringstream` for safe parsing over `scanf`-style functions.
* Use exception flags judiciously — not all I/O failures are fatal.

---

## 🧭 Summary

| Concept                           | Class/Function           | C++ Version |
| --------------------------------- | ------------------------ | ----------- |
| `cin`, `cout`, `cerr`, `clog`     | Console I/O              | C++98       |
| `ifstream`, `ofstream`, `fstream` | File I/O                 | C++98       |
| `stringstream`, `istringstream`   | String-based I/O         | C++98       |
| `exceptions()` on streams         | Exception-safe I/O       | C++11       |
| `std::filesystem`                 | Path and file management | C++17       |

---

💡 **Final Mentor Note:** File I/O isn’t just about reading and writing — it’s about **designing reliable data pipelines**. Always think about **ownership**, **format**, and **fault tolerance** before touching a single byte.
