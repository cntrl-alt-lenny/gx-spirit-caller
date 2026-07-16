"""Check that relative links in documentation point at real files."""

from pathlib import Path
import re
import unittest
from urllib.parse import urlsplit


ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"
INLINE_LINK = re.compile(r"!?(?:\[[^\]]*\])\((<[^>]+>|[^)\s]+)")
REFERENCE_LINK = re.compile(r"^\s*\[[^\]]+\]:\s*(<[^>]+>|\S+)", re.MULTILINE)
FENCED_CODE = re.compile(r"```.*?```", re.DOTALL)
INLINE_CODE = re.compile(r"`[^`]*`")


def relative_targets(markdown: str):
    """Yield link targets from inline links and reference definitions."""
    markdown = FENCED_CODE.sub("", markdown)
    markdown = INLINE_CODE.sub("", markdown)
    for pattern in (INLINE_LINK, REFERENCE_LINK):
        for match in pattern.finditer(markdown):
            yield match.group(1).strip("<>")


class DocumentationLinksTest(unittest.TestCase):
    def test_relative_markdown_links_exist(self):
        missing = []
        for document in DOCS.rglob("*.md"):
            for raw_target in relative_targets(document.read_text(encoding="utf-8")):
                parsed = urlsplit(raw_target)
                if parsed.scheme or parsed.netloc or not parsed.path:
                    continue
                target = Path(parsed.path)
                if (
                    target.is_absolute()
                    or not target.suffix
                    or {"build", "extract"} & set(target.parts)
                    or "brain" in target.parts
                ):
                    continue
                resolved = (document.parent / target).resolve()
                if ROOT not in resolved.parents and resolved != ROOT:
                    continue
                if not resolved.is_file():
                    missing.append(f"{document.relative_to(ROOT)} -> {raw_target}")

        self.assertEqual([], missing, "Missing documentation link targets:\n" + "\n".join(missing))


if __name__ == "__main__":
    unittest.main()
