from collections import InlineList

fn sdsdot(n: Int, sb: Float32, sx: InlineList[Float32], incx: Int,
            sy: InlineList[Float32], incy: Int,
            index_offset: Int = 1) -> Float32:
    """
    This function computes the inner product of two vectors
    with extended precision accumulation.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    sb :
        Real, single precision scalar to be added to inner product.
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
        The inner product of two vectors.
    """

    var dsdot: Float64 = sb
    if n <= 0:
        return dsdot
    if incx == incy and incx > 0:
        # code for equal and positive increments.
        var ns = n * incx
        for i in range(1, ns + 1, incx):
            dsdot = dsdot + sx[i - index_offset] * sy[i - index_offset]
    else:
        # code for unequal or nonpositive increments.
        var kx = 1
        var ky = 1
        if incx < 0:
            kx = 1 + (1 - n) * incx
        if incy < 0:
            ky = 1 + (1 - n) * incy
        for _ in range(1, n + 1):
            dsdot = dsdot + sx[kx - index_offset] * sy[ky - index_offset]
            kx += incx
            ky += incy
    return dsdot

