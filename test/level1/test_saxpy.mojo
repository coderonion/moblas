from testing import assert_almost_equal
from collections import InlineList

import moblas as mb

fn test_saxpy_with_unit_increment() raises:
    """Test saxpy with unit increment."""
    alias n = 5
    alias sa = 2.0
    var sx = InlineList[Float32](1.0, 2.0, 3.0, 4.0, 5.0)
    var sy = InlineList[Float32](5.0, 4.0, 3.0, 2.0, 1.0)
    alias expected = InlineList[Float32](7.0, 8.0, 9.0, 10.0, 11.0)
    mb.saxpy(n, sa, sx, 1, sy, 1)
    for i in range(n):
        assert_almost_equal(sy[i], expected[i], msg = "Expected " +
            str(expected[i]) + ", but got " + str(sy[i]))

fn test_saxpy_with_zero_length() raises:
    """Test saxpy with zero length vector."""
    alias n = 0
    alias sa = 2.0
    var sx = InlineList[Float32]()
    var sy = InlineList[Float32]()
    alias expected = InlineList[Float32]()
    mb.saxpy(n, sa, sx, 1, sy, 1)
    for i in range(n):
        assert_almost_equal(sy[i], expected[i], msg = "Expected " +
            str(expected[i]) + ", but got " + str(sy[i]))

fn test_saxpy_with_non_unit_increment() raises:
    """Test saxpy with non-unit increment."""
    alias n = 4
    alias sa = 2.0
    var sx = InlineList[Float32](1.0, 3.0, 5.0, 7.0, 9.0, 11.0, 13.0, 15.0)
    var sy = InlineList[Float32](2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0)
    alias expected = InlineList[Float32](4.0, 4.0, 16.0, 8.0, 28.0, 12.0, 40.0, 16.0)
    mb.saxpy(n, sa, sx, 2, sy, 2)
    for i in range(n):
        assert_almost_equal(sy[i], expected[i], msg = "Expected " +
            str(expected[i]) + ", but got " + str(sy[i]))

fn test_saxpy_with_negative_increment() raises:
    """Test saxpy with negative increment."""
    alias n = 3
    alias sa = 2.0
    var sx = InlineList[Float32](1.0, 2.0, 3.0)
    var sy = InlineList[Float32](3.0, 2.0, 1.0)
    alias expected = InlineList[Float32](5.0, 6.0, 7.0)
    mb.saxpy(n, sa, sx, -1, sy, -1)
    for i in range(n):
        assert_almost_equal(sy[i], expected[i], msg = "Expected " +
            str(expected[i]) + ", but got " + str(sy[i]))