"""Canonical repository parsers shared by tooling scripts.

The implementation remains in the two long-standing parser owners for now:
``analyze_symbols`` owns symbols.txt and ``progress`` owns delinks.txt.
This small facade gives new and migrated callers one stable import surface
without changing the direct-script build.ninja entry points.
"""

from __future__ import annotations

try:  # package import: ``from tools.parsers import ...``
    from .analyze_symbols import Symbol, parse_symbols_file
    from .progress import CODE_SECTIONS, DATA_SECTIONS, parse_delinks_file
except ImportError:  # direct script import: ``python tools/foo.py``
    from analyze_symbols import Symbol, parse_symbols_file
    from progress import CODE_SECTIONS, DATA_SECTIONS, parse_delinks_file

__all__ = [
    "CODE_SECTIONS",
    "DATA_SECTIONS",
    "Symbol",
    "parse_delinks_file",
    "parse_symbols_file",
]
