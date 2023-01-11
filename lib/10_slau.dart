import "package:dart_basics/07_roots.dart" as roots;

/// class for solving system of linear equations
class Slau {
  /// Allowed calculation error
  static const double eps = 1e-13;

  /// Calculate system of linear equations roots
  /// for united matrix [Ub] - list of doubles,
  /// where matrix U - is system coefficients
  /// and vector b - is right part of equation system
  /// создаёт матрицу коэффициентов
  /// U * ⃗x = ⃗b
  static List<double> solve(List<double> Ub) {
    print("DEBUG: input list:\n$Ub"); // debug only!
    final int n = _isSizeOk(Ub.length);
    if (n < 0) {
      throw ArgumentError("Matrix size should be n * (n+1)!");
    }
    final int rows = n; // equal size of U
    final int cols = n + 1; // last added column is ⃗b
    // Create and initialize Coefficients matrix
    var coeffs = List.generate(
        rows, (i) => List.filled(cols, 0.0, growable: false),
        growable: false);
    for (int i = 0, k = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        coeffs[i][j] = Ub[k];
        k++;
      }
    }
    print("DEBUG: original coefficients:\n$coeffs"); // debug only!
    // transform coeffs to upper triangular matrix
    // using Gaussian elimination algorithm
    return _gaussianElimination(coeffs);
  }

  // Function for solving systems of linear equations using Gaussian method
  static List<double> _gaussianElimination(List<List<double>> mat) {
    // transform coeffs to upper triangular matrix, forward elimination
    final int singularRow = _forwardElimination(mat);

    // if matrix is singular
    if (singularRow != -1) {
      // if vector ⃗b part is zero row, so there are many solutions,
      // else if not enough rows then system is inconsistent
      throw ArgumentError(
          "Matrix is singular!\n${(mat[singularRow][mat.length] != 0) ? 'System is inconsistent' : 'System has infinitely many solutions'}");
    }
    print("DEBUG: transformed to upper matrix:\n$mat");
    // get solution using backward substitution
    return _backwardSubstitution(mat);
  }

  /// Swapping rows [i] and [j] for [mat] method
  static void _swapRow(List<List<double>> mat, int i, int j) {
    for (int k = 0; k <= mat.length; k++) {
      double temp = mat[i][k];
      mat[i][k] = mat[j][k];
      mat[j][k] = temp;
    }
  }

  /// Function to transform to upper triangular matrix
  static int _forwardElimination(List<List<double>> mat) {
    for (int k = 0; k < mat.length; k++) {
      // Initialize maximum value and index for pivot
      int iMax = k;
      int vMax = mat[iMax][k].toInt();

      // find greater element for swap if any
      for (int i = k + 1; i < mat.length; i++) {
        if (roots.Root.abs(mat[i][k]) > vMax) {
          vMax = mat[i][k].toInt();
          iMax = i;
        }
      }

      // if a principal diagonal element  is zero,
      //   it denotes that matrix is singular,
      //   it will lead to a division-by-zero later.
      if (mat[k][iMax] < eps) return k; // return row number

      // Swap the greatest value row with current row
      if (iMax != k) _swapRow(mat, k, iMax);

      // subtracting from subsequent rows current row to get zeros in column i
      for (int i = k + 1; i < mat.length; i++) {
        double f = mat[i][k] / mat[k][k];
        for (int j = k + 1; j <= mat.length; j++) {
          mat[i][j] -= mat[k][j] * f;
        }

        mat[i][k] = 0; // zeroing lower triangular values instead of eps value
      }
    }
    return -1; // OK result (non singular matrix)
  }

  /// Method to calculate the values of the unknowns
  static List<double> _backwardSubstitution(List<List<double>> mat) {
    // vector to store solution
    List<double> x = List.filled(mat.length, 0.0, growable: false);

    // Calculate from last equation up to the first
    for (int i = mat.length - 1; i >= 0; i--) {
      x[i] = mat[i][mat.length];
      for (int j = i + 1; j < mat.length; j++) {
        x[i] -= mat[i][j] * x[j];
      }
      x[i] = x[i] / mat[i][i];
    }
    return x;
  }

  /// checks is size of matrix is OK
  /// returns vector ⃗x size or negative error code
  static int _isSizeOk(int k) {
    // for x vector of n elements Ub size should be n*(n+1)
    // solution of n^2+n-k=0 should be positive integer
    final double discr = 1.0 + 4.0 * k.toDouble();
    // negative solution doesn't have sense, analyze only positive
    final double x1 = 0.5 * (-1.0 + discr.myRoot(2));
    final x1Rounded = x1.roundToDouble();
    if ((x1 - x1Rounded) < eps) return x1Rounded.toInt();
    return -1;
  }
}
