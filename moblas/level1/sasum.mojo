from collections import InlineList

fn sasum(n: Int, sx: InlineList[Float32], incx: Int,
            index_offset: Int = 1) -> Float32:
    """
    This function forms the sum of the absolute values.
    uses unrolled loops for increment equal to 1.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    sx :
        Real array, dimension (1 + (n - 1) * abs(incx))
    incx :
        Storage spacing between elements of sx.
    index_offset:
        Index offset.

    Return:
    ----------
        The sum of the absolute values.
    """

    var stemp: Float32 = 0.0
    if n <= 0 or incx <= 0:
        return stemp
    if incx == 1:
        # code for increment equal to 1
        var m = n % 6
        if m != 0:
            for i in range(1, m + 1):
                stemp = stemp + abs(sx[i - index_offset])
            if n < 6:
                return stemp
        var mp1 = m + 1
        for i in range(mp1, n + 1, 6):
            stemp += abs(sx[i - index_offset]) +
                    abs(sx[i - index_offset + 1]) +
                    abs(sx[i - index_offset + 2]) +
                    abs(sx[i - index_offset + 3]) +
                    abs(sx[i - index_offset + 4]) +
                    abs(sx[i - index_offset + 5])
    else:
        # code for increment not equal to 1
        var nincx = n * incx
        for i in range(1, nincx + 1, incx):
            stemp += abs(sx[i - index_offset])
    return stemp