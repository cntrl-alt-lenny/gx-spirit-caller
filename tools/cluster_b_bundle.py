#!/usr/bin/env python3
"""
cluster_b_bundle.py — render brief 152/155 bundle TUs with
subsumed-placeholder aliases (brief 161 part 1).

Brief 152 (PR #579) + brief 155 (PR #584) introduced the
`unsigned int[N]` bundle recipe for two cluster B sub-pools:

  - size-1/2 scalars that the LCF `ALIGNALL(2)` cascade would
    otherwise pad-shift downstream layout.
  - size=4 value=0 scalars that mwcc would otherwise emit to
    `.bss` rather than `.data`.

The bundle absorbs the size-1/2 scalar (or value=0 slot) plus
its neighbouring placeholders into a single TU. mwcc emits the
TU's `.data` section as one chunk that's a multiple of 4 bytes
and naturally 4-aligned — ALIGNALL(2) adds zero padding, and
non-zero content avoids the `.bss` mis-routing.

Brief 158 collision
-------------------

Brief 158 PR #589 hit a structural collision: brief 155's
bundle for `data_021017f0` covers `[0x021017f0..0x021017fc)` and
subsumes the placeholder `data_021017f4` (at offset +4). The
bundle exports ONLY the leading symbol — the inner placeholder
is invisible to the linker. A downstream Pattern 3 chunk that
emits `.word data_021017f4` fails at link with:

    Undefined : "data_021017f4"

Brief 161 part 1 fixes this by adding a helper to render the
bundle as a `.s` TU (not `.c`) with `.global` directives for
every subsumed placeholder at its correct offset within the
bundle. mwasmarm's `.global` directive creates a proper
exported symbol at the labeled offset, so downstream chunks
can reference the inner placeholders directly.

Why `.s` rather than `__attribute__((alias))`
---------------------------------------------

The brief considered the GNU `__attribute__((alias("<sym>")))`
attribute, but the GCC/mwcc `alias` attribute creates a 1-to-1
**address-equal** alias — it can't introduce an alias at
`anchor + offset`. C has no language-level mechanism for
"symbol B is at offset N within symbol A's storage" outside of
inline assembly that defines a fresh `.global` label.

The `.s` fallback (per brief 153's size-1/2 overlay precedent
and the brief 161 spec's explicit fallback path) sidesteps the
C-language limitation entirely. mwasmarm assembles the `.data`
section with the same 12-byte content as the original `.c`
bundle but exports both the anchor and every inner placeholder
as `.global` symbols at the right offsets.

Round-trip invariant
--------------------

For a bundle that converts cleanly:

  - The emitted `.data` section bytes are bit-identical to the
    original `unsigned int[N]` bundle's bytes.
  - The anchor symbol's address is unchanged.
  - The new inner symbols' addresses equal the anchor + their
    offsets — which is exactly what they ALWAYS were as
    placeholders. `relocs.txt`-based `kind:load` resolution
    keeps working unchanged.

3-region `ninja sha1` PASS therefore should hold across the
`.c → .s` rewrite — the only visible change is at the
linker's symbol table layer (inner placeholders now resolve)
and the file extension (`.c → .s`, plus the delinks entry).

Usage
-----

  from cluster_b_bundle import render_bundle_s

  asm = render_bundle_s(
      anchor_name="data_021017f0",
      bundle_words=[0x00000000, 0x5f646970, 0x00000000],
      aliases=[
          ("data_021017f4", 4),  # at offset +4 within the bundle
      ],
      comment_lines=[
          "Brief 161 worked example — rewritten from brief 155 .c",
          "bundle so subsumed `data_021017f4` exports for downstream",
          "Pattern 3 chunks (brief 158 collision fix).",
      ],
  )
"""

from __future__ import annotations

from dataclasses import dataclass


# Word size in bytes — only `unsigned int` bundles (4-byte words)
# are supported. mwasmarm `.word` directive emits exactly 4 bytes.
WORD_SIZE = 4

# Bytes-per-line for the rendered `.word` directives. mwasmarm
# accepts one value per line; we follow brief 125's Pattern 3
# generator convention (1 value per `.word` line).


@dataclass(frozen=True)
class BundleAlias:
    """A subsumed-placeholder symbol the bundle should export at
    `offset` bytes past the anchor. Offsets must be a multiple of
    `WORD_SIZE` so the `.global` directive lands on a word
    boundary inside the `.word` stream."""
    name: str
    offset: int


def render_bundle_s(
    *,
    anchor_name: str,
    bundle_words: list[int],
    aliases: list[BundleAlias] | list[tuple[str, int]] | None = None,
    comment_lines: list[str] | None = None,
    indent: str = "        ",
) -> str:
    """Render an `.s` source for a brief 152/155-shape bundle
    with subsumed-placeholder aliases.

    Arguments:

    - `anchor_name`: the bundle's leading symbol name (e.g.
      `"data_021017f0"`).
    - `bundle_words`: list of 32-bit unsigned values, one per
      4-byte slot, in address-ascending order.
    - `aliases`: list of `(name, offset_in_bytes)` tuples (or
      `BundleAlias` instances) for subsumed-placeholder
      symbols to export. The anchor itself is always exported;
      aliases cover ONLY inner placeholders. Each alias offset
      must be `> 0`, `< len(bundle_words) * 4`, and a multiple
      of `WORD_SIZE`. Aliases at offset 0 collide with the
      anchor and are rejected (use the anchor name directly).
    - `comment_lines`: optional list of strings; rendered as a
      leading `;`-prefixed comment block (Pattern-3-style).
    - `indent`: indentation prefix for non-label lines (8-space
      mwasmarm convention, matching the brief 125 generator).

    Returns the full `.s` source as a single string with
    trailing newline. The output is deterministic and reproducible:
    same inputs → same bytes (for fixture-based regression
    testing).

    Round-trip property: the emitted `.data` bytes equal
    `b''.join(w.to_bytes(4, 'little') for w in bundle_words)`.
    Inner aliases land at their declared offsets — verified by
    the regression tests in `tests/test_cluster_b_bundle.py`.
    """
    if not anchor_name or not anchor_name.replace("_", "").isalnum():
        raise ValueError(
            f"anchor_name must be a valid C identifier; got "
            f"{anchor_name!r}"
        )
    if not bundle_words:
        raise ValueError(
            "bundle_words must contain at least one 32-bit value"
        )
    for w in bundle_words:
        if not (0 <= w <= 0xFFFFFFFF):
            raise ValueError(
                f"bundle_words entries must fit in unsigned 32 bits; "
                f"got {w!r}"
            )

    bundle_size = len(bundle_words) * WORD_SIZE

    # Normalise + validate aliases.
    raw = aliases or []
    parsed: list[BundleAlias] = []
    for a in raw:
        if isinstance(a, BundleAlias):
            parsed.append(a)
        else:
            name, offset = a
            parsed.append(BundleAlias(name=name, offset=offset))

    seen_offsets: set[int] = set()
    seen_names: set[str] = {anchor_name}
    for a in parsed:
        if not a.name or not a.name.replace("_", "").isalnum():
            raise ValueError(
                f"alias name must be a valid C identifier; got "
                f"{a.name!r}"
            )
        if a.name in seen_names:
            raise ValueError(
                f"alias name {a.name!r} duplicates an existing symbol "
                f"(anchor or prior alias)"
            )
        if a.offset <= 0:
            raise ValueError(
                f"alias offset must be > 0 (anchor is at offset 0); "
                f"got {a.name}@{a.offset}"
            )
        if a.offset >= bundle_size:
            raise ValueError(
                f"alias offset must be < bundle_size ({bundle_size}); "
                f"got {a.name}@{a.offset}"
            )
        if a.offset % WORD_SIZE != 0:
            raise ValueError(
                f"alias offset must be a multiple of {WORD_SIZE}; "
                f"got {a.name}@{a.offset}"
            )
        if a.offset in seen_offsets:
            raise ValueError(
                f"two aliases at the same offset {a.offset}: only one "
                f"label per word is allowed"
            )
        seen_offsets.add(a.offset)
        seen_names.add(a.name)

    # Build offset → alias_name lookup so we can interleave
    # `.global` directives + label lines with the `.word` stream.
    offset_to_alias: dict[int, str] = {
        a.offset: a.name for a in parsed
    }

    lines: list[str] = []

    # Comment block.
    if comment_lines:
        for cl in comment_lines:
            lines.append(f"; {cl}" if cl else ";")
        lines.append("")

    lines.append(f"{indent}.data")
    lines.append("")

    # Anchor + first word.
    lines.append(f"{indent}.global {anchor_name}")
    lines.append(f"{anchor_name}:")
    lines.append(f"{indent}.word 0x{bundle_words[0]:08x}")

    # Each subsequent word, with an alias label if one exists at
    # this offset.
    for i in range(1, len(bundle_words)):
        offset = i * WORD_SIZE
        if offset in offset_to_alias:
            alias_name = offset_to_alias[offset]
            lines.append("")
            lines.append(f"{indent}.global {alias_name}")
            lines.append(f"{alias_name}:")
        lines.append(f"{indent}.word 0x{bundle_words[i]:08x}")

    return "\n".join(lines) + "\n"


# --------------------------------------------------------------------------- #
# CLI (small + optional — main consumer is library use from porting scripts).
# --------------------------------------------------------------------------- #

def _main() -> int:
    """Tiny CLI for ad-hoc bundle rendering. Library use is the
    primary interface; this is for one-off command-line testing.

    Usage:

        python tools/cluster_b_bundle.py \\
            --anchor data_021017f0 \\
            --word 0x00000000 --word 0x5f646970 --word 0x00000000 \\
            --alias data_021017f4=4

    Prints the rendered `.s` to stdout."""
    import argparse
    import sys

    ap = argparse.ArgumentParser(
        description=(
            "Render a cluster B bundle as `.s` source with "
            "subsumed-placeholder aliases (brief 161 part 1)."
        ),
    )
    ap.add_argument(
        "--anchor", required=True,
        help="Bundle anchor symbol name (the leading global, e.g. "
             "data_021017f0).",
    )
    ap.add_argument(
        "--word", action="append", required=True,
        type=lambda s: int(s, 0),
        help="32-bit value for the bundle (repeat per word, in "
             "address-ascending order).",
    )
    ap.add_argument(
        "--alias", action="append", default=[],
        help="Subsumed-placeholder alias as NAME=OFFSET (repeat for "
             "each). Offset is in bytes from the anchor; must be a "
             "positive multiple of 4 less than the bundle size.",
    )
    ap.add_argument(
        "--comment", action="append", default=None,
        help="Comment line for the file header (repeat for multiple "
             "lines). Each rendered as `; <line>`.",
    )
    args = ap.parse_args()

    aliases: list[BundleAlias] = []
    for spec in args.alias:
        if "=" not in spec:
            print(
                f"error: --alias {spec!r} must be NAME=OFFSET",
                file=sys.stderr,
            )
            return 1
        name, offset_str = spec.split("=", 1)
        try:
            offset = int(offset_str, 0)
        except ValueError:
            print(
                f"error: --alias {spec!r} offset must be an integer",
                file=sys.stderr,
            )
            return 1
        aliases.append(BundleAlias(name=name, offset=offset))

    try:
        text = render_bundle_s(
            anchor_name=args.anchor,
            bundle_words=args.word,
            aliases=aliases,
            comment_lines=args.comment,
        )
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(_main())
