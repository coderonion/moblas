from collections import InlineList

fn isamax(n: Int, sx: InlineList[Float32], incx: Int,
            index_offset: Int = 1) -> Int:
    """
    This function finds the index of the first element having maximum absolute value.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    sx:
        Real array, dimension (1 + (n - 1) * abs(incx))
    incx:
        Storage spacing between elements of sx.
    index_offset:
        Index offset.
    """

    var smax: Float32 = 0.0
    var isamax = 0
    if n < 1 or incx <= 0:
        return isamax
    if n == 1:
        return isamax
    if incx == 1:
        # code for increment equal to 1
        smax = abs(sx[0])
        for i in range(2, n + 1):
            if abs(sx[i - index_offset]) > smax:
                isamax = i - index_offset
                smax = abs(sx[i - index_offset])
    else:
        # code for increment not equal to 1
        var ix = 1
        smax = abs(sx[0])
        ix += incx
        for i in range(2, n + 1):
            if abs(sx[ix - index_offset]) > smax:
                isamax = i - index_offset
                smax = abs(sx[ix - index_offset])
            ix += incx
    return isamax