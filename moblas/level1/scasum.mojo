from collections import InlineList
from complex import ComplexFloat32, abs

fn scasum(n: Int, cx: InlineList[ComplexFloat32], incx: Int,
            index_offset: Int = 1) -> Float32:
    """
    This function takes the sum of the (|Re(.)| + |Im(.)|)'s of
    a complex vector and returns a single precision result.

    Arguments:
    ----------
    n :
        Number of elements in the input vectors.
    cx :
        Complex array, dimension (1 + (n - 1) * abs(incx))
    incx :
        Storage spacing between elements of sx.
    index_offset:
        Index offset.

    Return:
    ----------
        The sum of the (|Re(.)| + |Im(.)|)'s of a complex vector
    """

    var stemp: Float32 = 0.0
    if n <= 0 or incx <= 0:
        return stemp
    if incx == 1:
        # code for increment equal to 1
        for i in range(1, n + 1):
            stemp += abs(cx[i - index_offset])
    else:
        # code for increment not equal to 1
        var nincx = n * incx
        for i in range(1, nincx + 1, incx):
            stemp += abs(cx[i - index_offset])
    return stemp