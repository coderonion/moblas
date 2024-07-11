from collections import InlineList

fn sscal(n: Int, sa: Float32, inout sx: InlineList[Float32], incx: Int,
            index_offset: Int = 1):
    """
    This function scales a vector by a constant.
    uses unrolled loops for increments equal to 1.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    sa :
        Real, specifies the scalar alpha.
    inout sx:
        Real array, dimension (1 + (n - 1) * abs(incx))
    incx:
        Storage spacing between elements of sx.
    index_offset:
        Index offset.
    """

    if n <= 0 or incx <= 0 or sa == 1.0:
        return
    if incx == 1:
        # code for increment equal to 1
        var m = n % 5
        if m != 0:
            for i in range(1, m + 1):
                sx[i - index_offset] *= sa
            if n < 5:
                return
        var mp1 = m + 1
        for i in range(mp1, n + 1, 5):
            sx[i - index_offset] *= sa
            sx[i - index_offset + 1] *= sa
            sx[i - index_offset + 2] *= sa
            sx[i - index_offset + 3] *= sa
            sx[i - index_offset + 4] *= sa
    else:
        # code for increment not equal to 1
        var nincx = n * incx
        for i in range(1, nincx + 1, incx):
            sx[i - index_offset] *= sa