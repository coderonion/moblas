from collections import InlineList

fn sswap(n: Int, inout sx: InlineList[Float32], incx: Int,
            inout sy: InlineList[Float32], incy: Int,
            index_offset: Int = 1):
    """
    This function interchanges two vectors.
    uses unrolled loops for increments equal to 1.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    inout sx:
        Real array, dimension (1 + (n - 1) * abs(incx))
    incx:
        Storage spacing between elements of sx.
    inout sy:
        Real array, dimension (1 + (n - 1) * abs(incy))
    incy:
        Storage spacing between elements of sy.
    index_offset:
        Index offset.
    """

    var stemp: Float32 = 0.0
    if n <= 0:
        return
    if incx == 1 and incy == 1:
        # code for both increments equal to 1
        var m = n % 3
        if m != 0:
            for i in range(1, m + 1):
                stemp = sx[i - index_offset]
                sx[i - index_offset] = sy[i - index_offset]
                sy[i - index_offset] = stemp
            if n < 3:
                return
        var mp1 = m + 1
        for i in range(mp1, n + 1, 3):
            stemp = sx[i - index_offset]
            sx[i - index_offset] = sy[i - index_offset]
            sy[i - index_offset] = stemp
            stemp = sx[i - index_offset + 1]
            sx[i - index_offset + 1] = sy[i - index_offset + 1]
            sy[i - index_offset + 1] = stemp
            stemp = sx[i - index_offset + 2]
            sx[i - index_offset + 2] = sy[i - index_offset + 2]
            sy[i - index_offset + 2] = stemp
    else:
        # code for unequal increments or equal increments not equal to 1
        var ix = 0
        var iy = 0
        if incx < 0:
            ix = (-n + 1) * incx + 1
        if incy < 0:
            iy = (-n + 1) * incy + 1
        for _ in range(1, n + 1):
            stemp = sx[ix - index_offset]
            sx[ix - index_offset] = sy[iy - index_offset]
            sy[iy - index_offset] = stemp
            ix += incx
            iy += incy