"""Focused tests for the distinct-site field exposure census."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from field_exposure_census import (  # noqa: E402
    DocumentedField,
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
                "ldr r1, =data_tiny\n"
                "ldr r0, [r1, #0x4]\n"
                "ldr r2, [r1, #0x4]\n"
                "str r0, [r1, #0x4]\n"
            ),
        }
        target = DocumentedField(
            "Tiny.md", "target", 0x04, ("data_tiny",)
        )
        untouched = next(field for field in fields if field.name == "untouched")
        self.assertEqual(count_exposure(target, sources), (2, 2, 2))
        self.assertEqual(count_exposure(untouched, sources), (0, 0, 0))

    def test_comments_are_not_sites(self):
        field = parse_documented_fields("Tiny.md", "int target; /* +0x04 */")[0]
        sources = {"src/overlay000/comment.c": "// obj->target = 1;\n"}
        self.assertEqual(count_exposure(field, sources), (0, 0, 0))

    def test_documented_getter_anchors_assembly_base(self):
        fields = parse_documented_fields(
            "GameSingleton.md",
            "GameSingleton *func_020498f0(void);\n"
            "int f4; /* +0x04 */\n",
        )
        field = next(item for item in fields if item.name == "f4")
        self.assertEqual(field.base_symbols, ("func_020498f0",))
        sources = {
            "src/main/unanchored.s": "ldr r0, [r1, #0x4]\n",
            "src/main/anchored.s": (
                "bl func_020498f0\n"
                "ldr r0, [r1, #0x4]\n"
            ),
        }
        self.assertEqual(count_exposure(field, sources), (1, 0, 1))

    def test_decimal_offset_and_member_alias_require_context(self):
        pending = DocumentedField(
            "DuelQueueState.md", "f_5b4", 0x5B4,
            ("data_ov002_022ce288",),
        )
        edge = DocumentedField(
            "DuelQueueState.md", "f_5d4", 0x5D4,
            ("data_ov002_022ce288",),
        )
        sources = {
            "src/overlay002/positive.c": (
                "if (*(int *)(data_ov002_022ce288 + 1460) == 0) return 1;\n"
                "data_ov002_022ce288.f1492 = 0;\n"
            ),
            "src/overlay002/bare-literals.c": (
                "int unrelated = 1460;\n"
                "cfg.unrelated = cfg.unrelated | 1492;\n"
            ),
        }
        self.assertEqual(count_exposure(pending, sources), (1, 0, 1))
        self.assertEqual(count_exposure(edge, sources), (0, 1, 1))
        unrelated_alias = {
            "src/overlay002/unrelated.c": "other.f1492 = 0;\n",
            "src/overlay002/separate-line-base.c": (
                "data_ov002_022ce288;\n"
                "other.f1492 = 0;\n"
            ),
        }
        self.assertEqual(count_exposure(edge, unrelated_alias), (0, 0, 0))


if __name__ == "__main__":
    unittest.main()
