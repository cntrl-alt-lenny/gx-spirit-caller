"""Pin the D5 (brief 072) full struct-vendoring contract.

Brief 072 adds full struct bodies for `_OSThread` / `_OSThreadQueue`
/ `OSMutex` (and their transitive deps `OSContext` / `CPContext`)
plus `OSIntrMode` enum to `libs/nitro/include/`. These tests verify:

  - The vendored-identifier scanner picks up all the new types
    (so port_external_source.py's D2+D3 framework relaxes
    refusals for them).
  - The PR 072 worked-example failing cases from brief 071 wave 2
    (`_OSThread`, `_OSThreadQueue`, `OSMutex`, `printfStr`) are
    all in the vendored set after D5.

Layout / byte-compatibility of the structs is verified by brief
071's byte-identity gate on the next wave (not in this test
suite — it needs the full mwccarm + region pipeline).

Run locally:
    python -m unittest tests.test_libs_nitro_d5
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_TOOLS))

from port_external_source import (  # noqa: E402
    _VENDORED_CACHE,
    load_vendored_identifiers,
)


_LIBS_NITRO = _ROOT / "libs" / "nitro"


class TestD5VendoredHeaders(unittest.TestCase):
    """Brief 072 D5 worked-example types must all be in the
    vendored set so port_external_source.py's struct-access
    check stops refusing them."""

    def setUp(self):
        _VENDORED_CACHE.clear()
        self.macros, self.structs, self.enums = (
            load_vendored_identifiers(_LIBS_NITRO)
        )

    def test_top3_struct_types_vendored(self):
        # Brain's brief 071 wave-2 funnel cited these three as
        # the dominant compile-fail cause (112 instances total
        # across 69+32+11).
        for name in ("_OSThread", "_OSThreadQueue", "OSMutex"):
            self.assertIn(name, self.structs,
                          f"D5 must vendor struct tag {name!r}")

    def test_typedef_aliases_vendored(self):
        # `OSThread` typedef → `struct _OSThread`. Sources use the
        # typedef form; the framework's _STRUCT_TYPE_HINT_RE
        # collects CamelCase names so the typedef alias is what
        # needs to be in the structs set.
        for name in ("OSThread", "OSThreadQueue", "OSThreadLink",
                     "OSMutexQueue", "OSMutexLink", "OSAlarm"):
            self.assertIn(name, self.structs,
                          f"D5 must vendor typedef {name!r}")

    def test_transitive_deps_vendored(self):
        # `_OSThread` has `OSContext context` as a field;
        # `OSContext` has `CPContext cp_context`. Both must be
        # in the vendored set so the framework doesn't refuse
        # ports that touch them.
        self.assertIn("OSContext", self.structs)
        self.assertIn("CPContext", self.structs)

    def test_thread_state_enum_vendored(self):
        # OSThreadState is referenced from _OSThread's `state`
        # field. Decomper's source patterns include
        # `thread->state == OS_THREAD_STATE_READY` etc.
        self.assertIn("OSThreadState", self.structs)
        self.assertIn("OS_THREAD_STATE_READY", self.enums)
        self.assertIn("OS_THREAD_STATE_WAITING", self.enums)
        self.assertIn("OS_THREAD_STATE_TERMINATED", self.enums)

    def test_thread_info_singleton_vendored(self):
        # `OSThreadInfo` is the per-process scheduler state
        # referenced by `OSi_ThreadInfo` extern (which D4 picks up
        # via the parallel-reloc map). The struct body must be
        # vendored so functions that touch
        # `OS_GetThreadInfo()->current` compile.
        self.assertIn("OSThreadInfo", self.structs)

    def test_printf_str_vendored(self):
        # Brief 071 wave-2 mentioned `printfStr` too — it's
        # defined inline in upstream's OS_printf.c, not in any
        # header. D5 surfaces it in nitro/os_printf.h.
        self.assertIn("printfStr", self.structs)

    def test_intr_mode_enum_vendored(self):
        # Second-most-common unvendored type in D5's smoke-test
        # (22 instances). Added to `nitro/os.h` alongside
        # OSIrqMask.
        self.assertIn("OSIntrMode", self.structs)
        self.assertIn("OS_INTRMODE_DISABLE_IRQ", self.enums)
        self.assertIn("OS_INTRMODE_DISABLE_FIQ", self.enums)
        self.assertIn("OS_INTRMODE_ENABLE", self.enums)
        # OSProcMode too — same source header
        self.assertIn("OSProcMode", self.structs)


class TestExistingHeadersStillScan(unittest.TestCase):
    """Belt-and-suspenders: the additions don't break existing
    decomper-vendored content like OSArenaId / OSLockWord."""

    def setUp(self):
        _VENDORED_CACHE.clear()
        self.macros, self.structs, self.enums = (
            load_vendored_identifiers(_LIBS_NITRO)
        )

    def test_pre_d5_arena_enum_still_present(self):
        self.assertIn("OSArenaId", self.structs)
        self.assertIn("OS_ARENA_MAIN", self.enums)
        self.assertIn("OS_ARENA_MAX", self.enums)

    def test_lock_word_still_present(self):
        self.assertIn("OSLockWord", self.structs)

    def test_basic_types_still_present(self):
        # `BOOL` is in nitro/types.h. Decomper-vendored from
        # day one; must not be lost.
        self.assertIn("BOOL", self.macros)


if __name__ == "__main__":
    unittest.main()
