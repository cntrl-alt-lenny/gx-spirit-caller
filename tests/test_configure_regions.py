"""Unit tests for tools/configure.py's region-aware source filtering.

Brief 064 deliverable 3. Pins the `_is_region_source_excluded` helper
and the `region=` kwarg on `get_c_cpp_files` / `get_asm_files` /
`get_source_files` so a future configure refactor can't silently
break per-region builds.

Convention (deliverable-2 strawman):

  * `src/<R>/...` where R ∈ {eur, usa, jpn}  → for region R only
  * `src/<module>/...` (no region prefix)    → EUR baseline only
  * Anything outside `src/` (e.g. `libs/`)   → region-neutral

End-to-end build verification (does `ninja rom` produce a valid ROM
for each region? does `dsd check modules` hit the 24/27 baseline?)
needs the actual toolchain; scaffolder verifies this manually pre-push
and brain / decomper repeats on merge. The PR description records
the manual results.

Run locally:
    python -m unittest tests.test_configure_regions
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

# configure.py parses argv at import. Pin a benign one before import
# so this suite can run regardless of how pytest/unittest invokes it.
_OLD_ARGV = sys.argv
sys.argv = ["configure.py", "eur", "--skip-sha1"]
try:
    import configure  # noqa: E402
finally:
    sys.argv = _OLD_ARGV


def _posix(p) -> str:
    """Render `p` (a path-like or string) in POSIX form regardless
    of host OS. `Path.relative_to(...)` on Windows produces backslash
    paths; the test assertions below compare against forward-slash
    literals that match the project's actual on-disk convention
    (delinks.txt, symbols.txt — POSIX everywhere). Without this
    normalisation every region test would fail on Windows hosts."""
    return str(p).replace("\\", "/")


class TestIsRegionSourceExcluded(unittest.TestCase):
    """Pure-function tests for the per-region filter predicate."""

    def test_none_region_disables_filtering(self):
        # region=None: nothing is ever excluded.
        for p in [
            "src/main/foo.c",
            "src/usa/main/foo.c",
            "src/jpn/overlay002/bar.s",
            "libs/runtime/include/anything.h",
        ]:
            self.assertFalse(
                configure._is_region_source_excluded(Path(p), None),
                f"region=None should not exclude {p!r}",
            )

    def test_eur_includes_unprefixed_src(self):
        # EUR baseline: src/main/, src/overlay002/ — no region prefix.
        self.assertFalse(configure._is_region_source_excluded(
            Path("src/main/func_X.c"), "eur"))
        self.assertFalse(configure._is_region_source_excluded(
            Path("src/overlay002/data.c"), "eur"))

    def test_eur_excludes_per_region_src(self):
        # EUR build must not pull in USA / JPN ports.
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/usa/main/func_Y.c"), "eur"))
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/jpn/overlay001/data.c"), "eur"))

    def test_usa_includes_only_src_usa(self):
        # USA build: src/usa/... included, everything else under src/
        # excluded (EUR-baseline + other regions).
        self.assertFalse(configure._is_region_source_excluded(
            Path("src/usa/main/func_Y.c"), "usa"))
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/main/func_X.c"), "usa"))
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/jpn/main/func_Z.c"), "usa"))

    def test_jpn_includes_only_src_jpn(self):
        # JPN build: src/jpn/... included, everything else under src/
        # excluded.
        self.assertFalse(configure._is_region_source_excluded(
            Path("src/jpn/main/func_Z.c"), "jpn"))
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/main/func_X.c"), "jpn"))
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/usa/overlay002/data.c"), "jpn"))

    def test_libs_never_excluded(self):
        # libs/ is region-neutral SDK/runtime code.
        for region in ("eur", "usa", "jpn", None):
            self.assertFalse(configure._is_region_source_excluded(
                Path("libs/runtime/include/foo.h"), region))
            self.assertFalse(configure._is_region_source_excluded(
                Path("libs/nitro/include/bar.h"), region))

    def test_explicit_eur_prefix_supported(self):
        # If anyone ever migrates EUR sources under src/eur/, the
        # filter handles it symmetrically with usa/jpn.
        self.assertFalse(configure._is_region_source_excluded(
            Path("src/eur/main/func_X.c"), "eur"))
        self.assertTrue(configure._is_region_source_excluded(
            Path("src/eur/main/func_X.c"), "usa"))


class TestGetCCppFilesRegion(unittest.TestCase):
    """Integration tests for region-aware C/C++ discovery against
    a synthetic src/ tree."""

    def _build_tree(self, root: Path):
        # EUR baseline
        (root / "src" / "main").mkdir(parents=True)
        (root / "src" / "main" / "func_eur.c").write_text("// eur\n")
        (root / "src" / "overlay002").mkdir(parents=True)
        (root / "src" / "overlay002" / "data.c").write_text("// eur ov2\n")
        # USA ports
        (root / "src" / "usa" / "main").mkdir(parents=True)
        (root / "src" / "usa" / "main" / "func_usa.c").write_text("// usa\n")
        # JPN ports
        (root / "src" / "jpn" / "overlay001").mkdir(parents=True)
        (root / "src" / "jpn" / "overlay001" / "data.c").write_text("// jpn\n")
        # libs/ region-neutral
        (root / "libs" / "runtime").mkdir(parents=True)
        (root / "libs" / "runtime" / "shared.c").write_text("// libs\n")

    def test_eur_picks_baseline_plus_libs(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            self._build_tree(root)
            out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_c_cpp_files(
                    [root / "src", root / "libs"], region="eur",
                )
            )
            self.assertEqual(out, [
                "libs/runtime/shared.c",
                "src/main/func_eur.c",
                "src/overlay002/data.c",
            ])

    def test_usa_picks_only_src_usa_plus_libs(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            self._build_tree(root)
            out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_c_cpp_files(
                    [root / "src", root / "libs"], region="usa",
                )
            )
            self.assertEqual(out, [
                "libs/runtime/shared.c",
                "src/usa/main/func_usa.c",
            ])

    def test_jpn_picks_only_src_jpn_plus_libs(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            self._build_tree(root)
            out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_c_cpp_files(
                    [root / "src", root / "libs"], region="jpn",
                )
            )
            self.assertEqual(out, [
                "libs/runtime/shared.c",
                "src/jpn/overlay001/data.c",
            ])

    def test_no_region_walks_everything(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            self._build_tree(root)
            out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_c_cpp_files(
                    [root / "src", root / "libs"],
                )
            )
            self.assertEqual(out, [
                "libs/runtime/shared.c",
                "src/jpn/overlay001/data.c",
                "src/main/func_eur.c",
                "src/overlay002/data.c",
                "src/usa/main/func_usa.c",
            ])


class TestGetAsmFilesRegion(unittest.TestCase):
    """Same filter applies to hand-written .s discovery."""

    def test_asm_region_filter(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "src" / "main").mkdir(parents=True)
            (root / "src" / "main" / "boot.s").write_text("@ eur boot\n")
            (root / "src" / "usa" / "main").mkdir(parents=True)
            (root / "src" / "usa" / "main" / "boot.s").write_text("@ usa\n")

            eur_out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_asm_files(
                    [root / "src"], region="eur",
                )
            )
            usa_out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_asm_files(
                    [root / "src"], region="usa",
                )
            )
            self.assertEqual(eur_out, ["src/main/boot.s"])
            self.assertEqual(usa_out, ["src/usa/main/boot.s"])


class TestGetSourceFilesRegion(unittest.TestCase):
    """get_source_files = C/C++ ∪ asm. Both arms must honour the
    region filter."""

    def test_combined_region_filter(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "src" / "main").mkdir(parents=True)
            (root / "src" / "main" / "f.c").write_text("")
            (root / "src" / "main" / "g.s").write_text("")
            (root / "src" / "usa" / "main").mkdir(parents=True)
            (root / "src" / "usa" / "main" / "f.c").write_text("")
            (root / "src" / "usa" / "main" / "g.s").write_text("")

            eur_out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_source_files(
                    [root / "src"], region="eur",
                )
            )
            usa_out = sorted(
                _posix(p.relative_to(root)) for p in configure.get_source_files(
                    [root / "src"], region="usa",
                )
            )
            self.assertEqual(eur_out, ["src/main/f.c", "src/main/g.s"])
            self.assertEqual(usa_out,
                             ["src/usa/main/f.c", "src/usa/main/g.s"])


class TestKnownRegionsConstant(unittest.TestCase):
    """The KNOWN_REGIONS tuple is the single source of truth for
    per-region filtering. Pin it so it doesn't drift from
    BASEROM_SHA1 (which has its own region keys)."""

    def test_known_regions_matches_baserom_sha1_keys(self):
        self.assertEqual(
            set(configure.KNOWN_REGIONS),
            set(configure.BASEROM_SHA1.keys()),
        )

    def test_known_regions_tuple_shape(self):
        # Tuple so it's hashable + immutable.
        self.assertIsInstance(configure.KNOWN_REGIONS, tuple)
        # Exactly the three game regions documented in CLAUDE.md.
        self.assertEqual(set(configure.KNOWN_REGIONS), {"eur", "usa", "jpn"})


if __name__ == "__main__":
    unittest.main()
