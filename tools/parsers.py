"""Canonical repository parsers shared by tooling scripts.

Parser ownership is deliberately explicit so a new consumer does not grow a
slightly different copy of an existing grammar:

* ``progress.py`` owns ``parse_delinks_file`` and the C-source helpers
  ``_strip_c_comments_and_literals`` and ``_is_primitive_type_clause``.
* ``analyze_symbols.py`` owns the ``symbols.txt`` grammar and
  ``parse_symbols_file``.
* ``routing_suffixes.py`` owns the per-TU routing suffix vocabulary and
  ``split_routing_suffix``.
* This module is the public facade for the reusable parsers above.  New
  consumers should import from the owner or this facade; they must not copy a
  parser, regex, or comment/literal scrubber locally.

Objdump instruction-word parsing is a known transitional exception:
``verify.py`` and ``fastmatch.py`` carry synchronized copies while
``asm_escape.py`` has a deliberately richer parser for bytes, mnemonics, and
relocations.  Three other pairs are intentionally left for a later,
separately-reviewed consolidation: the shared objdump-word helper, the
claimed-range adapters in ``batch_carve.py`` and ``size_census.py`` (their
range contracts differ), and the relocation grammar readers in
``analyze_symbols.py``, ``find_region_siblings.py``, and ``calcrom.py`` (their
output types and error handling are caller-specific).  These are acceptable
duplication, not invitations to add another copy.

The facade does not change the direct-script build.ninja entry points.
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
