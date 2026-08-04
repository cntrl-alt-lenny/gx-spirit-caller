"""Focused tests for the distinct-site field exposure census."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from field_exposure_census import (  # noqa: E402
    count_exposure,
    parse_documented_fields,
)


class TestFieldExposureCensus(unittest.TestCase):
    def test_counts_each_source_once_and_unions_read_write_sites(self):
        fields = parse_documented_fields(
            "Tiny.md",
            """
            typedef struct Tiny {
                int target; /* +0x04 */
                int untouched; /* +0x08 */
            } Tiny;
            """,
        )
        sources = {
            "src/overlay000/a.c": (
                "if (obj->target && obj->target != 2) { }\n"
                "obj->target = 1;\n"
            ),
            "src/overlay000/b.s": (
                "ldr r0, [r1, #0x4]\n"
                "ldr r2, [r1, #0x4]\n"
                "str r0, [r1, #0x4]\n"
            ),
        }
        target = next(field for field in fields if field.name == "target")
        untouched = next(field for field in fields if field.name == "untouched")
        self.assertEqual(count_exposure(target, sources), (2, 2, 2))
        self.assertEqual(count_exposure(untouched, sources), (0, 0, 0))

    def test_comments_are_not_sites(self):
        field = parse_documented_fields("Tiny.md", "int target; /* +0x04 */")[0]
        sources = {"src/overlay000/comment.c": "// obj->target = 1;\n"}
        self.assertEqual(count_exposure(field, sources), (0, 0, 0))


if __name__ == "__main__":
    unittest.main()
