"""Tests for tools/routing_suffixes.py (brief 587).

Two parts:

  1. Pure-function tests for `split_routing_suffix` / `strip_routing_suffix`
     / `object_suffix_for_source` — the shared logic itself.

  2. A conformance suite proving every site in the brief-569 / improvement-
     swarm-r5-item-7 "suffix-strip" bug family actually RESOLVES suffixes
     through this module (identity-checked against `ROUTING_SUFFIXES`,
     not just behaviourally equivalent) — so a hand-rolled local copy can
     never silently reappear and drift again the way `.thumb` did.
"""

from __future__ import annotations

import importlib.util
import sys
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
_TOOLS = _ROOT / "tools"
sys.path.insert(0, str(_TOOLS))

from routing_suffixes import (  # noqa: E402
    ROUTING_SUFFIXES,
    object_suffix_for_source,
    split_routing_suffix,
    strip_routing_suffix,
)


class TestRoutingSuffixesConstant(unittest.TestCase):
    def test_contains_exactly_the_three_known_tiers(self) -> None:
        self.assertEqual(set(ROUTING_SUFFIXES), {".legacy_sp3", ".legacy", ".thumb"})

    def test_legacy_sp3_before_legacy(self) -> None:
        # Not behaviourally load-bearing under endswith() for these three
        # literal strings (see module docstring), but pins the order so a
        # future addition that DOES need most-specific-first doesn't have
        # to rediscover that constraint.
        self.assertLess(
            ROUTING_SUFFIXES.index(".legacy_sp3"),
            ROUTING_SUFFIXES.index(".legacy"),
        )


class TestSplitRoutingSuffix(unittest.TestCase):
    def test_legacy(self) -> None:
        self.assertEqual(
            split_routing_suffix("func_abc.legacy"), ("func_abc", ".legacy"))

    def test_legacy_sp3(self) -> None:
        self.assertEqual(
            split_routing_suffix("func_abc.legacy_sp3"),
            ("func_abc", ".legacy_sp3"),
        )

    def test_thumb(self) -> None:
        self.assertEqual(
            split_routing_suffix("func_abc.thumb"), ("func_abc", ".thumb"))

    def test_no_suffix(self) -> None:
        self.assertEqual(split_routing_suffix("func_abc"), ("func_abc", ""))

    def test_empty(self) -> None:
        self.assertEqual(split_routing_suffix(""), ("", ""))

    def test_misleading_substring(self) -> None:
        # "legacy_helper" doesn't END with ".legacy" — must not strip.
        self.assertEqual(
            split_routing_suffix("legacy_helper"), ("legacy_helper", ""))

    def test_reconstruction_invariant(self) -> None:
        for stem in ("func_abc.thumb", "func_abc.legacy_sp3", "func_abc"):
            base, suf = split_routing_suffix(stem)
            self.assertEqual(base + suf, stem)


class TestStripRoutingSuffix(unittest.TestCase):
    def test_strips(self) -> None:
        self.assertEqual(strip_routing_suffix("func_abc.thumb"), "func_abc")

    def test_passthrough(self) -> None:
        self.assertEqual(strip_routing_suffix("func_abc"), "func_abc")

    def test_matches_split_first_element(self) -> None:
        for stem in ("func_abc.legacy", "func_abc.legacy_sp3", "func_abc.thumb", "func_abc"):
            self.assertEqual(strip_routing_suffix(stem), split_routing_suffix(stem)[0])


class TestObjectSuffixForSource(unittest.TestCase):
    def test_legacy_c(self) -> None:
        self.assertEqual(
            object_suffix_for_source("src/main/func_abc.legacy.c"), ".legacy.o")

    def test_legacy_sp3_c(self) -> None:
        self.assertEqual(
            object_suffix_for_source("src/main/func_abc.legacy_sp3.c"),
            ".legacy_sp3.o",
        )

    def test_thumb_c(self) -> None:
        self.assertEqual(
            object_suffix_for_source("src/overlay004/func_x.thumb.c"), ".thumb.o")

    def test_plain_c(self) -> None:
        self.assertIsNone(object_suffix_for_source("src/main/func_abc.c"))

    def test_empty(self) -> None:
        self.assertIsNone(object_suffix_for_source(""))

    def test_misleading_substring(self) -> None:
        self.assertIsNone(object_suffix_for_source("src/main/legacy_helper.c"))


# --------------------------------------------------------------------------- #
# Conformance: every consumer site resolves suffixes THROUGH this module,    #
# not a hand-rolled copy (brief 587 / improvement-swarm r5 item B).          #
# --------------------------------------------------------------------------- #

def _load_module_from_path(name: str, path: Path):
    """Load `path` as a standalone module under `name`, independent of
    any same-named module already in sys.modules. Needed for the two
    `post_edit.py` copies (.claude/hooks/ and .codex/hooks/) — both are
    literally named `post_edit`, so a plain second `import post_edit`
    would just return the first one cached in sys.modules instead of
    loading the second file."""
    spec = importlib.util.spec_from_file_location(name, path)
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


class TestConformance(unittest.TestCase):
    """Each site is asserted to expose a `ROUTING_SUFFIXES` name that IS
    (identity, not just equal-valued) `routing_suffixes.ROUTING_SUFFIXES`
    — proof the site imports the shared tuple rather than defining its
    own copy. An equal-but-distinct tuple would pass an `==` check even
    after silently drifting again; `is` cannot."""

    def test_objdiff_filter_panic_units(self) -> None:
        import objdiff_filter_panic_units as m
        self.assertIs(m.ROUTING_SUFFIXES, ROUTING_SUFFIXES)

    def test_port_to_region(self) -> None:
        import port_to_region as m
        self.assertIs(m.ROUTING_SUFFIXES, ROUTING_SUFFIXES)

    def test_sig_census(self) -> None:
        import sig_census as m
        self.assertIs(m._ROUTING_SUFFIXES, ROUTING_SUFFIXES)

    def test_claude_post_edit(self) -> None:
        m = _load_module_from_path(
            "_conformance_claude_post_edit",
            _ROOT / ".claude" / "hooks" / "post_edit.py",
        )
        self.assertIs(m.ROUTING_SUFFIXES, ROUTING_SUFFIXES)

    def test_codex_post_edit(self) -> None:
        m = _load_module_from_path(
            "_conformance_codex_post_edit",
            _ROOT / ".codex" / "hooks" / "post_edit.py",
        )
        self.assertIs(m.ROUTING_SUFFIXES, ROUTING_SUFFIXES)

    def test_claude_and_codex_post_edit_stay_byte_identical(self) -> None:
        # Not this module's own concern in general (r5 flags the broader
        # .claude/.codex mirror-drift risk separately), but this specific
        # migration touched both copies in lockstep — cheap to pin here.
        claude = (_ROOT / ".claude" / "hooks" / "post_edit.py").read_bytes()
        codex = (_ROOT / ".codex" / "hooks" / "post_edit.py").read_bytes()
        self.assertEqual(claude, codex)


if __name__ == "__main__":
    unittest.main()
