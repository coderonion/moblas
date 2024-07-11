from complex import ComplexFloat32, abs

fn scabs1(z: ComplexFloat32) -> Float32:
    """
    This function computes |Re(.)| + |Im(.)| of a complex number.

    Arguments:
    ----------
    z :
        A complex number.

    Return:
    ----------
        |Re(.)| + |Im(.)| of a complex number.
    """

    return abs(z)