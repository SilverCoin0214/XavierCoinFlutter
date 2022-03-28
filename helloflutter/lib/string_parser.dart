/*
 * @Author: your name
 * @Date: 2022-03-15 14:00:25
 * @LastEditTime: 2022-03-17 12:03:43
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/helloflutter/lib/StringParser.dart
 */
import 'package:string_scanner/string_scanner.dart';
import 'package:flutter/material.dart';

class StringParser {
  // 导入的文本
  final String content;
  // 高亮部分尾部索引, 也就是两段的区分位置
  final int endIndex;

  StringParser({required this.content, required this.endIndex});

  late StringScanner _scanner;

  InlineSpan parser() {
    _scanner = StringScanner(content);

    parseContent();

    final List<InlineSpan> spans = [];

    int currentPosition = 0;

    // 需要高亮的部分
    spans.add(TextSpan(style: _spans.style, text: _spans.text(content)));
    currentPosition = _spans.end;

    // 未高亮的部分
    if (currentPosition != content.length) {
      spans.add(
          TextSpan(text: content.substring(currentPosition, content.length)));
    }

    return TextSpan(style: TextStyleSupport.defaultStyle, children: spans);
  }

  late SpanBean _spans;

  // 解析需要变成高亮的字符
  void parseContent() {
    int startIndex = 0;

    _spans = SpanBean(startIndex, endIndex);

    if (!_scanner.isDone) {
      _scanner.position++;
    }
  }
}

class SpanBean {
  SpanBean(this.start, this.end);

  final int start;
  final int end;

  String text(String src) {
    return src.substring(start, end);
  }

  TextStyle get style => TextStyleSupport.highLightStyle;
}

class TextStyleSupport {
  static const defaultStyle = TextStyle(color: Colors.black, fontSize: 36);
  static const highLightStyle = TextStyle(color: Colors.green, fontSize: 36);
}
