from testing import assert_almost_equal
from collections import InlineList

import moblas as mb

fn test_sdot_with_basic() raises:
    """Test sdot with unit increment."""
    alias n = 5
    var sx = InlineList[Float32](1, 2, 3, 4, 5)
    var sy = InlineList[Float32](5, 4, 3, 2, 1)
    var result = mb.sdot(n, sx, 1, sy, 1)
    alias expected = 35.0
    assert_almost_equal(result, expected, msg = "Expected " +
        str(expected) + ", but got " + str(result))

fn test_sdot_with_zero_length() raises:
    """Test sdot with zero length vector."""
    alias n = 0
    var sx = InlineList[Float32]()
    var sy = InlineList[Float32]()
    var result = mb.sdot(n, sx, 1, sy, 1)
    alias expected = 0.0
    assert_almost_equal(result, expected, msg = "Expected " +
        str(expected) + ", but got " + str(result))

fn test_sdot_non_unit_increments() raises:
    """Test sdot with non-unit increment."""
    alias n = 4
    var sx = InlineList[Float32](1, 3, 5, 7, 9, 11, 13, 15)
    var sy = InlineList[Float32](2, 4, 6, 8, 10, 12, 14, 16)
    var result = mb.sdot(n, sx, 2, sy, 2)
    alias expected = 304.0
    assert_almost_equal(result, expected, msg = "Expected " +
        str(expected) + ", but got " + str(result))

fn test_sdot_with_negative_increments() raises:
    """Test sdot with negative increment."""
    alias n = 3
    var sx = InlineList[Float32](1, 2, 3)
    var sy = InlineList[Float32](3, 2, 1)
    var result = mb.sdot(n, sx, -1, sy, -1)
    alias expected = 10.0
    assert_almost_equal(result, expected, msg = "Expected " +
        str(expected) + ", but got " + str(result))