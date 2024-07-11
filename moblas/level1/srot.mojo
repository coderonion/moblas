from collections import InlineList

fn srot(n: Int, inout sx: InlineList[Float32], incx: Int,
        inout sy: InlineList[Float32], incy: Int,
        c: Float32, s: Float32,
        index_offset: Int = 1):
    """
    This function applies a plane rotation.

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
    c:
        Real
    s:
        Real
    index_offset:
        Index offset.
    """

    var stemp: Float32 = 0.0
    if n <= 0:
        return
    if incx == 1 and incy == 1:
        # Code for both increments equal to 1
        for i in range(1, n + 1):
            stemp = c * sx[i - index_offset] + s * sy[i - index_offset]
            sy[i - index_offset] = c * sy[i - index_offset] - s * sx[i - index_offset]
            sx[i - index_offset] = stemp
    else:
        # Code for unequal increments or equal increments not equal to 1
        var ix = 1
        var iy = 1
        if incx < 0:
            ix = (-n + 1) * incx + 1
        if incy < 0:
            iy = (-n + 1) * incy + 1
        for _ in range(1, n + 1):
            stemp = c * sx[ix - index_offset] + s * sy[iy - index_offset]
            sy[iy] = c * sy[iy - index_offset] - s * sx[ix - index_offset]
            sx[ix - index_offset] = stemp
            ix += incx
            iy += incy