from collections import InlineList

fn srotm(n: Int, inout sx: InlineList[Float32], incx: Int,
        inout sy: InlineList[Float32], incy: Int,
        sparam: InlineList[Float32],
        index_offset: Int = 1):
    """
    This function applies the modified givens transformation.

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
    sparam:
        Real array, dimension (5)
            sparam(0) = sflag
            sparam(1) = sh11
            sparam(2) = sh21
            sparam(3) = sh12
            sparam(4) = sh22
    index_offset:
        Index offset.
    """

    var zero: Float32 = 0.0
    var two: Float32 = 2.0
    var sflag = sparam[0]
    if n <= 0 or (sflag + two == 0):
        return
    if incx == incy and incx > 0:
        var nsteps = n * incx
        if sflag < zero:
            var sh11 = sparam[1]
            var sh12 = sparam[3]
            var sh21 = sparam[2]
            var sh22 = sparam[4]
            for i in range(1, nsteps + 1, incx):
                var w = sx[i - index_offset]
                var z = sy[i - index_offset]
                sx[i - index_offset] = w * sh11 + z * sh12
                sy[i - index_offset] = w * sh21 + z * sh22
        elif sflag == zero:
            var sh12 = sparam[3]
            var sh21 = sparam[2]
            for i in range(1, nsteps + 1, incx):
                var w = sx[i - index_offset]
                var z = sy[i - index_offset]
                sx[i - index_offset] = w + z * sh12
                sy[i - index_offset] = w * sh21 + z
        else:
            var sh11 = sparam[1]
            var sh22 = sparam[4]
            for i in range(1, nsteps + 1, incx):
                var w = sx[i - index_offset]
                var z = sy[i - index_offset]
                sx[i - index_offset] = w * sh11 + z
                sy[i - index_offset] = -w + z * sh22
    else:
        var kx = 1
        var ky = 1
        if incx < 0:
            kx = 1 + (1 - n) * incx
        if incy < 0:
            ky = 1 + (1 - n) * incy
        if sflag < zero:
            var sh11 = sparam[1]
            var sh12 = sparam[3]
            var sh21 = sparam[2]
            var sh22 = sparam[4]
            for _ in range(1, n + 1):
                var w = sx[kx - index_offset]
                var z = sy[ky - index_offset]
                sx[kx - index_offset] = w * sh11 + z * sh12
                sy[ky - index_offset] = w * sh21 + z * sh22
                kx += incx
                ky += incy
        elif sflag == zero:
            var sh12 = sparam[3]
            var sh21 = sparam[2]
            for _ in range(1, n + 1):
                var w = sx[kx - index_offset]
                var z = sy[ky - index_offset]
                sx[kx - index_offset] = w + z * sh12
                sy[ky - index_offset] = w * sh21 + z
                kx += incx
                ky += incy
        else:
            var sh11 = sparam[1]
            var sh22 = sparam[4]
            for _ in range(1, n + 1):
                var w = sx[kx - index_offset]
                var z = sy[ky - index_offset]
                sx[kx - index_offset] = w * sh11 + z
                sy[ky - index_offset] = -w + z * sh22
                kx += incx
                ky += incy