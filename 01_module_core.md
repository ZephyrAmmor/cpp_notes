# 🧠 The C++ Master Companion — Syntax, Insight & Practice

**Author:** ZephyrAmmor
**Version:** 1.0 (C++11–C++23)
**License:** MIT
**Compiled on:** October 15, 2025

---

# 🧱 Module 1: Core Foundations

> "C++ is not a beginner’s playground — it’s a professional’s weapon. Master the fundamentals, and you master the machine."

---

## 🧩 Overview

This module lays the groundwork for everything you’ll build in C++. Before you touch templates or STL containers, you must first **think like the compiler** and understand **how code becomes executable reality**.

C++ rewards precision and punishes assumptions — so every detail matters. These foundations teach how the language *really works* under the hood, not just how to make it compile.

---

## ⚙️ 1.1 Anatomy of a C++ Program

### 🔹 Concept Overview

A C++ program starts at `main()`. The compiler translates `.cpp` files into object files (`.o` or `.obj`), and the linker combines them into an executable.

### 🔹 Syntax Block

```cpp
#include <iostream>  // Preprocessor directive

int main() {
    std::cout << "Hello, C++!" << std::endl;
    return 0; // Exit status
}
```

### 🔹 Example Explained

* `#include <iostream>` tells the preprocessor to include the standard I/O library.
* `std::cout` is an output stream object.
* `return 0;` signals successful execution.

### ⚠️ Pitfalls / Notes

* Forgetting semicolons (`;`) causes cascading compiler errors.
* You **cannot** use `using namespace std;` in professional code — it causes namespace pollution.

### 🧠 Under the Hood

* Compilation phases: **Preprocessing → Compilation → Assembly → Linking**.
* Each `.cpp` file becomes an *object file*; unresolved references are resolved during *linking*.
* The compiler inserts an *entry point* symbol `_start` that calls `main()`.

### 💡 Best Practices

* Keep your `main()` clean; delegate work to functions.
* Always return an integer from `main()`.

---

## 🧮 1.2 Variables, Literals, and Data Types

### 🔹 Concept Overview

Variables are **named memory slots**. Data types define how much space and what kind of data can be stored.

### 🔹 Syntax Block

```cpp
int age = 21;
double pi = 3.14159;
char grade = 'A';
bool isPassed = true;
```

### 🔹 Common Data Types Table

| Type     | Size (Typical) | Example             | Description                             |
| -------- | -------------- | ------------------- | --------------------------------------- |
| `int`    | 4 bytes        | `int count = 5;`    | Integer value                           |
| `double` | 8 bytes        | `double pi = 3.14;` | Floating-point                          |
| `char`   | 1 byte         | `'A'`               | Single character                        |
| `bool`   | 1 byte         | `true` / `false`    | Boolean value                           |
| `auto`   | Deduced        | `auto x = 3.14;`    | Type deduced at compile-time *(C++11+)* |

### ⚠️ Pitfalls

* **Uninitialized variables** have *garbage values* — always initialize.
* Beware of **integer division**: `5 / 2 == 2`, not `2.5`.
* `char` can be signed or unsigned depending on implementation.

### 🧠 Under the Hood

Each variable has:

1. **Name** (symbol)
2. **Type** (compile-time metadata)
3. **Memory address** (runtime location)

During compilation, the compiler maintains a *symbol table* mapping names to types and addresses.

### 💡 Best Practices

* Prefer `auto` for complex types (`auto iter = vec.begin();`).
* Use `const` or `constexpr` to enforce immutability.
* Avoid global variables unless absolutely necessary.

---

## ➕ 1.3 Operators and Expressions

### 🔹 Concept Overview

Operators perform operations on operands — they are the building blocks of computation.

### 🔹 Syntax Block

```cpp
int a = 10, b = 3;
int sum = a + b;
int quotient = a / b;
```

### 🔹 Operator Categories

| Category   | Operators                | Notes                              |                          |                          |
| ---------- | ------------------------ | ---------------------------------- | ------------------------ | ------------------------ |
| Arithmetic | `+ - * / %`              | `%` only works with integers       |                          |                          |
| Relational | `== != > < >= <=`        | Return `bool`                      |                          |                          |
| Logical    | `&&                      |                                    | !`                       | Short-circuit evaluation |
| Assignment | `= += -= *= /=`          | Compound forms supported           |                          |                          |
| Bitwise    | `&                       | ^ ~ << >>`                         | Operates at binary level |                          |
| Misc       | `sizeof`, `?:`, `typeid` | Runtime/compile-time introspection |                          |                          |

### ⚠️ Pitfalls

* Watch operator **precedence** and **associativity**.
* Avoid mixing **signed and unsigned** types in arithmetic.

### 💡 Best Practices

* Use parentheses for clarity, not cleverness.
* When mixing types, cast explicitly (`static_cast<double>(a)/b`).

---

## 🔁 1.4 Control Flow

### 🔹 Concept Overview

Control flow determines **how** your program executes — the “logic skeleton.”

### 🔹 Syntax Block

```cpp
if (x > 0) {
    std::cout << "Positive";
} else if (x == 0) {
    std::cout << "Zero";
} else {
    std::cout << "Negative";
}
```

### 🔹 Loops

```cpp
for (int i = 0; i < 5; ++i)
    std::cout << i << " ";

while (n > 0) {
    std::cout << n--;
}
```

### ⚠️ Pitfalls

* Infinite loops (`while(true)`) without break conditions can freeze your program.
* Avoid modifying loop counters inside the loop.

### 💡 Best Practices

* Use **range-based for** loops in modern C++.
* Prefer `switch` for multiple discrete conditions.

---

## 🔧 1.5 Functions

### 🔹 Concept Overview

Functions are **modular building blocks** that encapsulate logic. In C++, functions can be overloaded, inlined, and even constexpr (evaluated at compile-time).

### 🔹 Syntax Block

```cpp
int add(int a, int b) {
    return a + b;
}

constexpr int square(int x) { return x * x; } // Evaluated at compile time
```

### 🔹 Function Overloading

```cpp
int area(int side) { return side * side; }
double area(double r) { return 3.14 * r * r; }
```

### ⚠️ Pitfalls

* Default arguments must be declared **from right to left**.
* Avoid recursion without base conditions.

### 🧠 Under the Hood

Each function gets a **stack frame** on call — storing parameters, return address, and local variables. When it returns, the stack unwinds.

### 💡 Best Practices

* Prefer `constexpr` when possible.
* Keep functions **pure** (no side effects) for predictability.
* Inline only small, frequently called functions.

---

## 🌐 1.6 Program Structure & Namespaces

### 🔹 Concept Overview

Namespaces prevent naming collisions and group logically related code.

### 🔹 Syntax Block

```cpp
namespace math {
    double add(double a, double b) { return a + b; }
}

int main() {
    std::cout << math::add(2.0, 3.0);
}
```

### ⚠️ Pitfalls

* Avoid `using namespace std;` in headers.
* Nested namespaces can clutter readability.

### 💡 Best Practices

* Use namespace aliases: `namespace fs = std::filesystem;`
* Organize large codebases by feature-based namespaces.

---

## 🔠 1.7 Arrays, Strings, and Bridge to `std::vector`

### 🔹 Syntax Block

```cpp
int arr[3] = {1, 2, 3};
std::string name = "Amor";
std::vector<int> nums = {1, 2, 3, 4};
```

### 🧠 Under the Hood

* Arrays are **contiguous memory blocks**.
* `std::vector` adds **dynamic resizing** and **RAII memory management**.

### ⚠️ Pitfalls

* Array indices out of range cause **undefined behavior**.
* Never return pointers to local arrays.

### 💡 Best Practices

* Use `std::array` (fixed size) or `std::vector` (dynamic size) — never raw arrays in modern code.

---

## 🧩 1.8 Enumerations and Type Aliases

```cpp
enum class Color { Red, Green, Blue };
using uint = unsigned int;
```

### 💡 Insight

`enum class` prevents name collisions — `Color::Red` is scoped.

### ⚠️ Pitfalls

Avoid implicit conversions from enum to int — they’re not allowed for a reason.

---

## 📘 1.9 Constants, Macros, and Preprocessor

```cpp
#define PI 3.14159
const double gravity = 9.81;
constexpr int size = 10;
```

### 🧠 Under the Hood

`#define` is replaced *before compilation*; `constexpr` is evaluated *during* compilation.

### 💡 Best Practices

Prefer `constexpr` over macros. Macros have no scope or type safety.

---

## 🧩 1.10 Error Handling & Debugging Basics

### 🔹 Example

```cpp
try {
    throw std::runtime_error("Error occurred!");
} catch (const std::exception& e) {
    std::cerr << e.what();
}
```

### ⚠️ Pitfalls

Never throw raw types (`throw 5;`). Always use `std::exception`-derived types.

### 💡 Best Practices

Use exceptions for *exceptional* events, not normal control flow.

---

## 🧠 1.11 The C++ Mental Model

### 💡 Insight

C++ revolves around three sacred principles:

1. **Ownership** – Who owns this memory?
2. **Value Semantics** – Each object is an independent entity.
3. **Zero-Cost Abstraction** – No hidden runtime cost for high-level constructs.

### 🧠 Under the Hood

C++ doesn’t have a garbage collector. You are the garbage collector.

### 💪 Best Practices

* Always know who “owns” what.
* Use RAII classes (`std::vector`, `std::unique_ptr`) to handle cleanup.

---

✅ **End of Module 1 — Core Foundations**
Next: **Module 2 – Object-Oriented Programming**
