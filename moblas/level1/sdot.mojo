from collections import InlineList

fn sdot(n: Int, sx: InlineList[Float32], incx: Int,
        sy: InlineList[Float32], incy: Int,
        index_offset: Int = 1) -> Float32:
    """
    This function forms the dot product of two vectors,
    uses unrolled loops for increments equal to 1.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    sx:
        Real array, dimension (1 + (n - 1) * abs(incx))
    incx:
        Storage spacing between elements of sx.
    sy:
        Real array, dimension (1 + (n - 1) * abs(incy))
    incy:
        Storage spacing between elements of sy.
    index_offset:
        Index offset.

    Return:
    ----------
        The dot product of two vectors.
    """

    var stemp: Float32 = 0.0
    if n <= 0:
        return stemp
    if incx == 1 and incy == 1:
        # code for both increments equal to 1
        var m = n % 5
        if m != 0:
            for i in range(1, m + 1):
                stemp += sx[i - index_offset] * sy[i - index_offset]
            if n < 5:
                return stemp
        var mp1 = m + 1
        for i in range(mp1, n + 1, 5):
            stemp += (sx[i - index_offset]*sy[i - index_offset] +
                      sx[i - index_offset + 1]*sy[i - index_offset + 1] +
                      sx[i - index_offset + 2]*sy[i - index_offset + 2] +
                      sx[i - index_offset + 3]*sy[i - index_offset + 3] +
                      sx[i - index_offset + 4]*sy[i - index_offset + 4])
    else:
        # code for unequal increments or equal increments not equal to 1
        var ix: Int = 1
        var iy: Int = 1
        if incx < 0:
            ix = (-n + 1) * incx + 1
        if incy < 0:
            iy = (-n + 1) * incy + 1
        for _ in range(1, n + 1):
            stemp += sx[ix - index_offset] * sy[iy - index_offset]
            ix += incx
            iy += incy
    return stemp