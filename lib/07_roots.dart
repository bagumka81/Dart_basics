/// num extension for calculating root of power n
extension Root on num {
  /// Allowed calculation error
  static const double eps = 1e-13;

  /// Calculate [num] root in [rootPower]. Result should be Real number,
  /// so Complex results are not supported for negative [num] & non odd power
  num myRoot(int rootPower) {
    if ((this < 0) && (rootPower % 2 == 0)){
      throw ArgumentError("Non odd root from negative number "
          "can't be calculated!");
    }
    return _sqrtn(toDouble(), rootPower, toDouble(), eps);
  }

  /// Method helper for next iteration of [arg] root in [n] calculating
  /// using previous step result [xLast], up to [eps] precision
  static double _sqrtn(double arg, int n, double xLast, double eps) {
    final double res; // current result
    double am = xLast; //  m - 1 power of last result
    //  m - 1 power last result calculation
    for (int i = 2; i < n; i++, am *= xLast) {}
    // calculate current result
    res = ((n.toDouble() - 1.0) * xLast + arg / am) / n.toDouble();
    if (abs(res - xLast) > eps) { // check precision
      return _sqrtn(arg, n, res, eps); // need more accurate result
    }
    return res; // reached precision
  }

  /// Calculate absolute value of [x]
  static double abs(double x) => (x < 0) ? (-x) : x;
}
