import 'dart:math';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

String expr = "";

String calcLogic(String btnVal, BuildContext ctx) {
  if (btnVal == "C") {
    expr = "";
  } else if (btnVal == '⌫') {
    expr = expr.substring(0, expr.length - 1);
  } else if (btnVal == 'π') {
    expr = '${expr}3.141592';
  } else if (btnVal == 'e') {
    expr = '${expr}2.718281';
  } else if (btnVal != "=") {
    expr = expr + btnVal;
    print(expr);
  } else if (btnVal == "=") {
    _evaluate(expr, ctx);
  } else {
    print("Something Went Wrong !!");
  }
  return expr;
}

_evaluate(String xpression, BuildContext ctx) {
  xpression = xpression.replaceAll('\u00d7', "*").replaceAll('\u2212', "-");
  xpression = xpression.replaceAll('\u2022', ".");
  xpression = xpression.replaceAll('\u0025', "^");

  // Parse expression:
  late Expression expression;

  try {
    expression = Expression.parse(xpression);
  } on Exception catch (e) {
    print(e);
    final snackBar = SnackBar(
      content: const Text("L'opération entrée est erronée"),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () => ScaffoldMessenger.of(ctx).removeCurrentSnackBar(),
      ),
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  // Create context containing all the variables and functions used in the expression
  var context = {"^": exp, "cos": cos, "sin": sin};

  // Evaluate expression
  const evaluator = ExpressionEvaluator();
  var r = evaluator.eval(expression, context);
  // ignore: avoid_print
  print(r); // = true

  expr =
      r.toString().length > 10 ? r.toString().substring(0, 10) : r.toString();
}
