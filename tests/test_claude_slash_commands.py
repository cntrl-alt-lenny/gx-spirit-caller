"""Unit tests for .claude/commands/*.md slash-command specs.

Slash commands are Markdown prompts that Claude Code loads when the
user types `/<name>`. A typo in the frontmatter (e.g. `description:`
misspelled) silently disables the command; the user sees nothing
helpful and doesn't know why. These tests pin the shape so
regressions fail loudly.

Pinned behaviours:
  - Each command file has valid YAML frontmatter with `description`
  - `allowed-tools` is a comma-separated list (not a YAML list — the
    Claude Code convention differs from agents)
  - The body references the backing `tools/*.py` script
  - `$ARGUMENTS` placeholder is present (else the command can't take
    user input)
  - File names match expected commands
"""

from __future__ import annotations

import re
import unittest
from pathlib import Path

_COMMANDS_DIR = (
    Path(__file__).resolve().parent.parent / ".claude" / "commands"
)

EXPECTED_COMMANDS = {
    "scratch": "tools/scratch_bundle.py",
    "cascade": "tools/find_cascades.py",
    "suggest": "tools/nitro_suggest_renames.py",
}


_FRONTMATTER_RE = re.compile(
    r"\A---\n(?P<body>.*?)\n---\n(?P<rest>.*)",
    re.DOTALL,
)


def _parse_frontmatter(text: str) -> tuple[dict, str]:
    """Lightweight YAML-ish frontmatter parser — the format Claude
    Code uses is simple key: value lines, not nested YAML. No need
    to pull in pyyaml."""
    m = _FRONTMATTER_RE.match(text)
    if not m:
        return {}, text
    fm_text = m.group("body")
    rest = m.group("rest")
    fields: dict[str, str] = {}
    for line in fm_text.splitlines():
        if ":" not in line:
            continue
        k, v = line.split(":", 1)
        fields[k.strip()] = v.strip()
    return fields, rest


class TestSlashCommandsShape(unittest.TestCase):
    def test_expected_files_exist(self):
        for name in EXPECTED_COMMANDS:
            path = _COMMANDS_DIR / f"{name}.md"
            self.assertTrue(
                path.is_file(),
                f"{path} missing — slash command wouldn't load",
            )

    def test_each_has_description_frontmatter(self):
        for name in EXPECTED_COMMANDS:
            path = _COMMANDS_DIR / f"{name}.md"
            fm, _ = _parse_frontmatter(path.read_text())
            self.assertIn(
                "description", fm,
                f"{name}.md missing `description` in frontmatter — "
                "the /commands picker won't show a help line",
            )
            # Description should be non-trivial (more than a word).
            self.assertGreater(
                len(fm["description"]), 30,
                f"{name}.md description suspiciously short",
            )

    def test_each_has_argument_hint(self):
        # Not strictly required by the format, but it's the one cue
        # the picker shows users. Pin it so it doesn't drop.
        for name in EXPECTED_COMMANDS:
            path = _COMMANDS_DIR / f"{name}.md"
            fm, _ = _parse_frontmatter(path.read_text())
            self.assertIn(
                "argument-hint", fm,
                f"{name}.md missing `argument-hint`",
            )

    def test_each_restricts_allowed_tools(self):
        # allowed-tools keeps slash commands scoped. If missing,
        # the command inherits the full tool set, which is fine
        # but unintentional — pin explicitly.
        for name in EXPECTED_COMMANDS:
            path = _COMMANDS_DIR / f"{name}.md"
            fm, _ = _parse_frontmatter(path.read_text())
            self.assertIn(
                "allowed-tools", fm,
                f"{name}.md missing `allowed-tools`",
            )
            # All three commands should at minimum allow Bash
            # (they invoke tools/*.py).
            self.assertIn(
                "Bash", fm["allowed-tools"],
                f"{name}.md allowed-tools should include Bash "
                "(runs python tools/*.py)",
            )

    def test_body_references_backing_tool(self):
        # If the command doesn't name the tool it wraps, the prompt
        # won't guide Claude to invoke the right script.
        for name, tool_path in EXPECTED_COMMANDS.items():
            path = _COMMANDS_DIR / f"{name}.md"
            _, body = _parse_frontmatter(path.read_text())
            self.assertIn(
                tool_path, body,
                f"{name}.md body doesn't reference {tool_path}",
            )

    def test_body_references_arguments_placeholder(self):
        for name in EXPECTED_COMMANDS:
            path = _COMMANDS_DIR / f"{name}.md"
            _, body = _parse_frontmatter(path.read_text())
            self.assertIn(
                "$ARGUMENTS", body,
                f"{name}.md body doesn't reference $ARGUMENTS — "
                "the command can't see user input",
            )

    def test_scratch_mentions_prompt_mode(self):
        # /scratch is meant to expose the --prompt flag for LLM
        # drafting. Pin so the wrapper doesn't silently drop it.
        path = _COMMANDS_DIR / "scratch.md"
        _, body = _parse_frontmatter(path.read_text())
        self.assertIn("--prompt", body)

    def test_cascade_mentions_both_modes(self):
        # Ranked mode (no args) + single-symbol mode.
        path = _COMMANDS_DIR / "cascade.md"
        _, body = _parse_frontmatter(path.read_text())
        self.assertIn("ranked", body.lower())
        self.assertIn("single-symbol", body.lower())

    def test_suggest_mentions_nitro_dict_prereq(self):
        # /suggest depends on nitro_dict.json being built first.
        # If the prompt doesn't mention that, users get a confusing
        # "dict not found" error.
        path = _COMMANDS_DIR / "suggest.md"
        _, body = _parse_frontmatter(path.read_text())
        self.assertIn("nitro_dict", body)


class TestFrontmatterParserItself(unittest.TestCase):
    """Sanity-check the helper parser, since the other tests depend
    on it being correct."""

    def test_extracts_simple_fields(self):
        text = (
            "---\n"
            "description: test description\n"
            "argument-hint: <foo>\n"
            "---\n"
            "Body content here.\n"
        )
        fm, body = _parse_frontmatter(text)
        self.assertEqual(fm["description"], "test description")
        self.assertEqual(fm["argument-hint"], "<foo>")
        self.assertIn("Body content", body)

    def test_no_frontmatter_returns_empty_fm(self):
        fm, body = _parse_frontmatter("just text no frontmatter")
        self.assertEqual(fm, {})
        self.assertIn("just text", body)


if __name__ == "__main__":
    unittest.main()
