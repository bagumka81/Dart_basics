import "package:dart_basics/07_roots.dart" as roots;
/// num extension for calculating root of power n
class Slau {
  /// Allowed calculation error
  static const double eps = 1e-13;

  /// Calculate system of linear equations roots
  /// for united matrix [Ub] - list of doubles,
  /// where matrix U - is system coefficients
  /// and vector b - is right part of equation system
  /// создаёт матрицу коэффициентов
  /// U * ⃗x = ⃗b
  static double solve(List<double> Ub) {

    if (!_isSizeOk(Ub.length)){
      throw ArgumentError("Matrix size should ne n * (n+1)!");
    }
    return 1.0;
  }

  /// checks is size of matrix is OK
  static bool _isSizeOk(int k)
  {
    // for x vector of n elements Ub size should be n*(n+1)
    // solution of n^2+n-k=0 should be positive integer
    final double descr = 1.0 + 4.0*k.toDouble();
    // negative solution doesn't have sense, analyze only positive
    final double x1 = 0.5*(-1.0+descr.myRoot(2));
    if ((x1 - x1.roundToDouble())<eps) return true;
    return false;
  }
}