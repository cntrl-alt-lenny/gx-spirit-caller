"""Regression tests for cross-region named-callee refusal."""

from __future__ import annotations

import sys
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from port_to_region import (  # noqa: E402
    is_placeholder_function_name,
    parse_symbols_in_source,
)


def test_named_extern_is_added_to_source_symbol_refs():
    source = "extern void Task_Invoke(int h);\nTask_Invoke(h);\n"
    refs = parse_symbols_in_source(
        source,
        default_module="ov002",
        named_functions={"Task_Invoke": ("main", 0x02006E1C)},
    )
    ref = refs[("func", "main", 0x02006E1C)]
    assert ref.text == "Task_Invoke"


def test_placeholder_name_classifier_matches_region_placeholders_only():
    assert is_placeholder_function_name("func_02006bf0")
    assert is_placeholder_function_name("func_ov002_022afea8")
    assert not is_placeholder_function_name("Task_Invoke")
