"""Tests for the cross-platform Ninja stamp helper."""

import tempfile
import unittest
from pathlib import Path

from tools.touch_stamp import main


class TestTouchStamp(unittest.TestCase):
    def test_touch_stamp_creates_parent_and_file(self):
        with tempfile.TemporaryDirectory() as tmp_dir:
            stamp = Path(tmp_dir) / "nested" / ".delink.stamp"
            assert main(["touch_stamp.py", str(stamp)]) == 0
            assert stamp.is_file()


if __name__ == "__main__":
    unittest.main()
