"""Tests for tools/fastmatch.py (brief 620).

fastmatch.py had zero test coverage before this brief. Scoped narrowly to
the one bug found and fixed while scale-validating cmatch_loop.py against
it: ninja_compile_one's error-summarizing took the FIRST n lines of a
failed compile's combined output, which on macOS is always wine/MoltenVK
startup noise, never the actual mwcc error -- every one of 70 real ov008
compile failures in one sweep showed nothing useful via the old behavior.
A position-based fix (take the LAST n lines instead) was a real
improvement but still incomplete: wine/MoltenVK prints not one but TWO
banners per compile (a ~150-line capability dump at startup, then a
second, shorter "Created VkInstance" banner later), so a fixed-size tail
can still land entirely inside noise for some candidates -- observed
directly across the same 70-candidate sweep, not a hypothetical. The
final fix filters out lines matching known noise patterns first, then
tails whatever real content remains. summarize_compile_error() is the
extracted, independently-testable pure function; this file does not
attempt to add broader coverage for the rest of fastmatch.py's real-
subprocess-driven surface (match_one, ninja_compile_one, gap discovery),
which is exercised indirectly and extensively by tests/test_cmatch_loop
.py's real-toolchain integration tests instead.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import fastmatch  # noqa: E402


def _mvk_capability_banner(n_extensions: int = 153) -> list[str]:
    """The large startup banner: MoltenVK version line, N supported
    Vulkan extensions, then a GPU capability block."""
    return [
        "[mvk-info] MoltenVK version 1.4.1, supporting Vulkan version 1.4.334.",
        f"\tThe following {n_extensions} Vulkan extensions are supported:",
        *(f"\tVK_KHR_ext_{i} v1" for i in range(n_extensions)),
        "\tmodel: Apple M1",
        "\ttype: Integrated",
        "\tvendorID: 0x106b",
        "\tdeviceID: 0x1a050207",
        "\tpipelineCacheUUID: DB445FF2-1A05-0207-0000-000100000000",
        "\tGPU memory available: 5461 MB",
        "\tGPU memory used: 0 MB",
        "\tMetal Shading Language 3.2",
        "\tsupports the following GPU Features:",
        "\t\tGPU Family Metal 3",
        "\t\tGPU Family Apple 7",
        "\t\tGPU Family Mac 2",
        "\t\tRead-Write Texture Tier 2",
    ]


def _mvk_instance_banner(n_extensions: int = 3) -> list[str]:
    """The SECOND, smaller banner wine/MoltenVK prints later, once the
    app actually creates a VkInstance -- confirmed real (not assumed):
    seen following the large capability banner in real captured ov008
    sweep output, close enough to the tail end that a fixed-size
    position-based tail alone was insufficient for some candidates."""
    return [
        "[mvk-info] Created VkInstance for Vulkan version 1.0.334, as requested "
        f"by app, with the following {n_extensions} Vulkan extensions enabled:",
        *(f"\tVK_KHR_ext_{i} v1" for i in range(n_extensions)),
    ]


def _wine_fixme_lines() -> list[str]:
    return [
        "0050:fixme:keyboard:NtUserActivateKeyboardLayout Changing user locale is not supported",
        "00a8:fixme:keyboard:NtUserActivateKeyboardLayout Changing user locale is not supported",
    ]


class TestSummarizeCompileError(unittest.TestCase):
    def test_filters_bare_vulkan_extension_lines(self):
        noise = [f"VK_KHR_extension_{i} v1" for i in range(150)]
        text = "\n".join(noise) + "\nsrc/foo.c:1: declaration syntax error\nErrors caused tool to abort.\n"
        result = fastmatch.summarize_compile_error(text)
        self.assertIn("declaration syntax error", result)
        self.assertIn("Errors caused tool to abort.", result)
        self.assertNotIn("VK_KHR_extension_0 ", result)

    def test_short_output_returned_whole(self):
        text = "src/foo.c:3: undefined identifier 'x'\n"
        result = fastmatch.summarize_compile_error(text)
        self.assertEqual(result, "src/foo.c:3: undefined identifier 'x'")

    def test_empty_input_falls_back_to_generic_message(self):
        self.assertEqual(fastmatch.summarize_compile_error(""), "ninja returned non-zero")

    def test_custom_n_respected(self):
        text = "\n".join(f"line{i}" for i in range(10))
        result = fastmatch.summarize_compile_error(text, n=3)
        self.assertEqual(result, "line7\nline8\nline9")

    def test_default_preserves_all_signal_lines(self):
        text = "\n".join(f"compiler line {i}" for i in range(20))
        result = fastmatch.summarize_compile_error(text)
        self.assertEqual(result, text)

    def test_all_noise_falls_back_to_raw_tail_not_blank(self):
        # If literally everything matches the noise filter (shouldn't
        # happen for a genuine compile error, but must never surface an
        # empty message when the process DID print something).
        text = "\n".join(_mvk_capability_banner(n_extensions=5))
        result = fastmatch.summarize_compile_error(text)
        self.assertTrue(result.strip())

    def test_single_banner_shape(self):
        lines = _mvk_capability_banner() + _wine_fixme_lines() + [
            r"src\overlay008\func_ov008_021b2200.c:1: declaration syntax error",
            r"src\overlay008\func_ov008_021b2200.c:2: undefined identifier 's32'",
            "Errors caused tool to abort.",
        ]
        result = fastmatch.summarize_compile_error("\n".join(lines))
        self.assertIn("declaration syntax error", result)
        self.assertIn("undefined identifier", result)
        self.assertIn("Errors caused tool to abort.", result)
        self.assertNotIn("mvk-info", result)
        self.assertNotIn("VK_KHR_ext_", result)

    def test_two_banner_shape_real_sweep_case(self):
        # The case a position-only fix (tail of a fixed size) missed:
        # TWO MoltenVK banners per compile, the second one close enough
        # to the real error that a small fixed-size tail can still land
        # entirely inside it for some candidates. Observed directly
        # across the real 70-candidate ov008 sweep, not constructed to
        # order -- this is why filtering by content, not just position,
        # was necessary.
        lines = (
            _mvk_capability_banner()
            + _mvk_instance_banner()
            + _wine_fixme_lines()
            + [
                r"src\overlay008\func_ov008_021b2268.c:4: illegal function definition",
                r"src\overlay008\func_ov008_021b2268.c:5: illegal function definition",
                "Errors caused tool to abort.",
            ]
        )
        result = fastmatch.summarize_compile_error("\n".join(lines))
        self.assertIn("illegal function definition", result)
        self.assertIn("Errors caused tool to abort.", result)
        self.assertNotIn("mvk-info", result)
        self.assertNotIn("VK_KHR_ext_", result)
        self.assertNotIn("fixme:", result)

    def test_default_n_holds_across_a_realistically_short_tail_window(self):
        # With the default n=15 and a SHORT real error (2 lines + abort
        # banner = 3 signal lines), the filtered signal must still be
        # exactly those 3 lines -- confirms the filter, not a generous n,
        # is what's doing the real work.
        lines = _mvk_capability_banner() + _mvk_instance_banner() + [
            "src/x.c:1: declaration syntax error",
            "Errors caused tool to abort.",
        ]
        result = fastmatch.summarize_compile_error("\n".join(lines))
        self.assertEqual(result, "src/x.c:1: declaration syntax error\nErrors caused tool to abort.")


if __name__ == "__main__":
    unittest.main()
