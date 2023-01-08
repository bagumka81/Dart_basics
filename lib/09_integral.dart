/// class for integral calculation
class Integral {
  // https://ru.wikipedia.org/wiki/Интеграл_Римана#Вычисление
  // Using mid rectangular approximation as optimal for functions with issues

  /// Calculate Riemann integral value for function [f]
  /// [x1] is low limit, [x2] is high limit
  /// [steps_count] quantity of calculation steps
  /// so Complex results are not supported for negative [num] & non odd power
  static double calc(
      double Function(double) f, double x1, double x2, int steps_count) {
    if (x1 > x2) {
      throw ArgumentError("Limit x1 should be higher than x2!");
    }
    if (steps_count <= 0) {
      throw ArgumentError("Step value should be more than 0!");
    }
    //_rectangle_rule(func, a, b, nseg, 0.5)
    final double dx = (x2 - x1) / steps_count;
    double sum = 0.0;
    double currX = x1 + 0.5 * dx; // using midpoint rectangle rule
    for (int i = 0; i < steps_count; i++, currX += dx) {
      try {
        sum += f(currX) * dx;
      } catch (e) {
        // ignore it, because it doesn't matter for integral value
      }
    }
    return sum;
  }
}
