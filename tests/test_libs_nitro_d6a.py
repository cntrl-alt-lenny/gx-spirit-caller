"""Pin the D6.a (brief 072 follow-up) math-type vendoring contract.

D6.a vendors full bodies for the NitroSDK fixed-point vector +
matrix types into `libs/nitro/include/`:

  - `nitro/fx_vec.h`: Vecx32 / Vecx16 (+ VecFx32 / VecFx16 typedef
    aliases)
  - `nitro/fx_mtx.h`: Mtx22 / Mtx33 / Mtx43 / Mtx44 (+ MtxFx*
    aliases)

`nitro/fx.h` now includes both, replacing the pre-D6 forward-decl
section.

These tests pin the framework's vendored-identifier scanner picks
up the struct tags so the cross-project port driver's struct-
access check stops refusing them. Pokediamond's upstream source
uses the *tag* form (`struct Vecx32 *v`, `struct Mtx43 *mtx`) so
catching those is the critical contract; the typedef aliases
(`VecFx32`, `MtxFx43`) are nice-to-have for source files that use
the alias form (rare in NitroSDK).

Run locally:
    python -m unittest tests.test_libs_nitro_d6a
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


class TestD6aMathStructTags(unittest.TestCase):
    """D6.a — full bodies for the math types vendored.

    Pokediamond's upstream source uses `struct Vecx32 *v` /
    `struct Mtx43 *mtx` (the tag form) heavily. The framework's
    `_STRUCT_TYPE_HINT_RE` captures `Vecx32` / `Mtx43` from those
    declarations; both must be in the vendored struct set or
    cross-project ports of FX_*.c-style functions still refuse.
    """

    def setUp(self):
        _VENDORED_CACHE.clear()
        self.macros, self.structs, self.enums = (
            load_vendored_identifiers(_LIBS_NITRO)
        )

    def test_vector_struct_tags_vendored(self):
        self.assertIn("Vecx32", self.structs)
        self.assertIn("Vecx16", self.structs)

    def test_matrix_struct_tags_vendored(self):
        # 4×4 + 4×3 + 3×3 + 2×2 — full pokediamond surface.
        for tag in ("Mtx22", "Mtx33", "Mtx43", "Mtx44"):
            self.assertIn(tag, self.structs,
                          f"D6.a must vendor struct tag {tag!r}")

    def test_typedef_alias_vendored_for_primary(self):
        # The framework's _HEADER_TYPEDEF_RE doesn't handle
        # struct-body-with-typedef multi-line patterns reliably,
        # but the typedef-alias `VecFx32` should still be
        # picked up via the typedef-at-end form. Belt-and-
        # suspenders test — if this fails, audit
        # _HEADER_TYPEDEF_RE.
        self.assertIn("VecFx32", self.structs)


class TestD5IntactAfterD6a(unittest.TestCase):
    """Drift protection: D6.a's edits to `fx.h` (replacing the
    forward-decl block with `#include <nitro/fx_vec.h>` +
    `#include <nitro/fx_mtx.h>`) must NOT break D5's vendored
    OS-thread types or pre-existing typedef aliases."""

    def setUp(self):
        _VENDORED_CACHE.clear()
        self.macros, self.structs, self.enums = (
            load_vendored_identifiers(_LIBS_NITRO)
        )

    def test_d5_os_thread_still_vendored(self):
        # D5's #441 / 449 work must not regress.
        for tag in ("_OSThread", "_OSThreadQueue", "OSMutex",
                    "OSContext", "CPContext", "OSThreadInfo"):
            self.assertIn(tag, self.structs)

    def test_d5_intr_mode_still_vendored(self):
        self.assertIn("OSIntrMode", self.structs)
        self.assertIn("OS_INTRMODE_DISABLE_IRQ", self.enums)

    def test_arena_id_intact(self):
        self.assertIn("OSArenaId", self.structs)
        self.assertIn("OS_ARENA_MAIN", self.enums)


if __name__ == "__main__":
    unittest.main()
