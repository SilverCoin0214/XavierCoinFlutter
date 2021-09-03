/*
 * @Author: your name
 * @Date: 2021-09-02 15:02:05
 * @LastEditTime: 2021-09-02 15:09:55
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/dart/document/overview.dart
 */

// 1. 所有变量引用的都是 对象. 每个对象都是一个 类  的实例. 数字, 函数以及null都是对象.
//    除去null以外, 所有的类都继承于 Object类

// 2. Dart是强类型语言, 但是 声明变量时指定类型是可选的, 因为dart存在类型推断

// 3. 变量在未声明为可空类型时不能为 Null, 可以通过增加 ? 来类型声明为可空.
//    在明确指定一个表达式不为空时, 可以添加 ! 来断言表达式不为空

// 4. 如果想要显示的声明允许任意类型, 使用 Object?, Object或者 dynamic, 将检查会延迟到运行时进行.

// 5. dart支持泛型, 比如List<int>表示一组由int对象组成的列表, List<Object>表示一组由任意对象组成的列表

// 6. dart支持顶级函数, 同时还支持定义属于类或对象的函数, 还可以在函数中定义函数.

// 7. dart支持顶级变量, 以及定义属于类活对象的变量.

// 8. dart没有类似 java的 public, protected和private成员访问限定符. 如果一个标识符以下划线 _ 开头则表示私有

// 9. 标识符可以以 _ 或字母开头, 之后跟字母, 下划线或者数字

// 10. dart中 语句和表达式是有区别的, 表达式有值, 而语句没有.

// 11. dart工具可以显示 警告和错误 两种类型.
