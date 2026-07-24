"""Tests for the cross-platform Ninja stamp helper."""

from pathlib import Path

from tools.touch_stamp import main


def test_touch_stamp_creates_parent_and_file(tmp_path: Path):
    stamp = tmp_path / "nested" / ".delink.stamp"
    assert main(["touch_stamp.py", str(stamp)]) == 0
    assert stamp.is_file()
