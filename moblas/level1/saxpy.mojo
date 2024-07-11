from collections import InlineList

fn saxpy(n: Int, sa: Float32, sx: InlineList[Float32], incx: Int,
            inout sy: InlineList[Float32], incy: Int,
            index_offset: Int = 1):
    """
    This function forms a constant times a vector plus a vector.
    uses unrolled loops for increments equal to 1.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    sa :
        Real, specifies the scalar alpha.
    sx:
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

    if n <= 0:
        return
    if sa == 0.0:
        return
    if incx == 1 and incy == 1:
        # code for both increments equal to 1
        var m = n % 4
        if m != 0:
            for i in range(1, m + 1):
                sy[i - index_offset] += sa * sx[i - index_offset]
        if n < 4:
            return
        var mp1 = m + 1
        if n >= 4:
            for i in range(mp1, n + 1, 4):
                sy[i - index_offset] += sa * sx[i - index_offset]
                sy[i - index_offset + 1] += sa * sx[i - index_offset + 1]
                sy[i - index_offset + 2] += sa * sx[i - index_offset + 2]
                sy[i - index_offset + 3] += sa * sx[i - index_offset + 3]
    else:
        # code for unequal increments or equal increments not equal to 1
        var ix: Int = 1
        var iy: Int = 1
        if incx < 0:
            ix = (-n + 1) * incx + 1
        if incy < 0:
            iy = (-n + 1) * incy + 1
        for _ in range(1, n + 1):
            sy[iy - index_offset] += sa * sx[ix - index_offset]
            ix += incx
            iy += incy