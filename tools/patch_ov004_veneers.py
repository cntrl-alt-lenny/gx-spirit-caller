#!/usr/bin/env python3

"""
patch_ov004_veneers.py — post-link binary patcher that splices
out mwldarm's spurious thumb→arm interwork veneers from
`build/<ver>/build/arm9_ov004.bin` (brief 134; generalised to
variable veneer counts in brief 142).

Context (W7 final mitigation tier)
----------------------------------

mwldarm 2.0/sp1p5 is overlay-blind when deciding whether to emit
ARM/Thumb interwork veneers (brief 129). When ov004's `.rodata`
contains a pointer to VA X, AND ov002 defines a FUNC at X (because
ov002 + ov004 are mutually-exclusive overlays sharing VAs), mwldarm
emits a veneer + rewrites the pointer to target the veneer.

Brief 131 (Phase 1) shipped an ALIGNALL fix that cut byte-diff by
95%. Brief 132 (Phase 2) falsified three .o-level fix approaches —
mwldarm uses ONLY (resolved VA, MEMORY-region membership), not
symbol type or section exec-flag. This left two options:

- Per-overlay link restructure (brief 132 Option A) — significant
  build surgery.
- **Post-link binary patching (this tool, brief 132 Option B,
  brief 134)** — surgical, contained to ov004.

Empirical veneer count is variable (brief 141 / 142)
----------------------------------------------------

Brief 134's first patcher hard-coded `EXPECTED_VENEER_COUNT = 86`
because mwldarm emitted exactly 86 cross-overlay veneers at the
source-coverage snapshot of the time. Brief 141 ran a `.rodata`
sweep on ov004 and found that **locally-defined symbols in
`.rodata` SUPPRESS veneer emission**: mwldarm resolves the
pointer locally and skips the veneer. Adding 2 `.rodata` claims
dropped the count from 86 → 9.

So the 86 figure is empirical (driven by current source coverage),
not structural. Brief 142 generalises the scanner + cascade math
to accept any `n ∈ [0, HISTORICAL_MAX_VENEER_COUNT]`. The historical
maximum is retained as a documentation constant + soft sanity bound;
the actual splice acts on whatever count the scanner finds.

How it works
------------

The patcher consumes mwldarm's `arm9_ov004.bin` (= orig size
+ veneer-pool delta) and produces a byte-identical-to-orig output
(268,192 bytes). Algorithm:

1. **Locate veneer pool.** Scan for the 12-byte canonical pattern
   `7847 c046 04f01fe5 <4-byte target>`. Accept any contiguous run
   of `n` matches (`0 ≤ n ≤ HISTORICAL_MAX_VENEER_COUNT`). If
   `n == 0` the patcher returns early — there are no veneers to
   splice and the binary already matches orig shape.

2. **Splice veneer pool.** Remove `n × 12` bytes from the file.
   Downstream sections shift left by `n × 12`.

3. **Fix .ctor + pad cascade.** Built has `.ctor` of 8 bytes
   (orig is 4 — extra `WRITEW(0)`) and pad of 8 bytes (orig is
   20). After splice, replace 16 bytes [post-splice ctor offset]
   with [keep ctor-first-4-bytes] + [20 zero pad]. This adds 8
   bytes net regardless of `n` (the `WRITEW(0)` after .ctor is
   per-overlay-unconditional in the linker LCF, independent of
   the veneer pool). Net output delta vs input:
   `n × 12 - 8` bytes (when `n ≥ 1`).

4. **Rewrite literal pool entries (un-shift cascade).** For each
   `kind:load` reloc in `relocs.txt`, write the reloc's `to`
   value at file offset (`from - BASE_VA`). dsd's relocs.txt
   uses orig VAs, and after splice+fix the binary layout matches
   orig — so the file offsets are correct. This handles:
     - .text literal pool entries pointing to shifted .data/.bss
       symbols
     - .rodata pointers that target veneers (un-shift restores
       them to the original ov002 addresses since the veneers
       are gone). The exact count varies with `n`.
     - .init literal pool entries
     - .data function-pointer entries

5. **Re-encode .init ARM BLs.** The 2 ARM BL instructions in
   `.init` were encoded by mwldarm using a shifted source-VA.
   After splice, the .init function moves back to orig VA. The
   BL bytes need re-encoded offsets. For each
   `kind:arm_call` reloc whose `from` is in .init range, compute
   `imm24 = (to - from - 8) >> 2 & 0xffffff` and write back
   preserving the top 8 cond/opcode bits.

Risk mitigation
---------------

- **False-positive pointer rewrites** (brief 132's concern):
  using `relocs.txt` as the authoritative whitelist of pointer
  positions eliminates false positives. We only touch words at
  reloc `from` addresses; bytes elsewhere are untouched.
- **Veneer pattern mismatch**: validates that the splice region
  contains a contiguous run of valid veneer patterns. Caps the
  count at `HISTORICAL_MAX_VENEER_COUNT` as a sanity bound — a
  larger count would indicate either a toolchain regression or
  a false positive (the canonical prefix matching arbitrary
  `.text`).
- **Idempotent**: detects already-patched binaries (no veneer
  pattern at expected location, i.e. `n == 0` on a binary whose
  size already matches orig) and skips silently. Lets ninja
  re-run the rule without harm.

Usage
-----

Wired into `tools/configure.py` as a post-link step:

    ninja → mwldarm → arm9.o → dsd rom build → arm9_ov004.bin
                                                    │
                                                    ▼
                                  patch_ov004_veneers.py
                                                    │
                                                    ▼
                                  (byte-identical to orig)

Manual invocation:

    python tools/patch_ov004_veneers.py \\
        --binary build/eur/build/arm9_ov004.bin \\
        --relocs config/eur/arm9/overlays/ov004/relocs.txt

See also
--------

- `docs/research/ov004-thunk-section-fix.md` — full W7 mitigation
  tier history (Phase 1 ALIGNALL → Phase 2 falsification →
  Phase 3 this tool).
- `docs/research/ov004-checksum-recovery.md` — brief 129 root
  cause scoping.
- Brief 113 — original Cat 4 hypothesis.
"""

from __future__ import annotations

import argparse
import re
import struct
import sys
from pathlib import Path


# Canonical thumb→arm interwork veneer prefix:
#   7847       BX PC               (thumb → arm switch)
#   c046       MOV R8, R8 (NOP)    (alignment to 4-byte boundary)
#   04f0 1fe5  LDR PC, [PC, #-4]   (load target into PC, in ARM)
#   <target>   4-byte absolute address
# Total: 12 bytes.
VENEER_PREFIX = bytes.fromhex("7847c04604f01fe5")
VENEER_SIZE = 12

# Brief 134 / 142: historical maximum veneer count. At the brief 134
# snapshot, mwldarm emitted exactly 86 spurious cross-overlay
# veneers for ov004 across all 3 regions (EUR / USA / JPN). Brief
# 141 found that locally-defined symbols in ov004's `.rodata`
# SUPPRESS veneer emission (mwldarm resolves locally + skips the
# veneer) — adding 2 such claims dropped the count to 9.
#
# So the 86 figure is EMPIRICAL (driven by current source coverage),
# not structural. The scanner now accepts any `n ∈ [0, 86]` and the
# cascade math derives the output-size delta from the observed n.
# This constant is retained only as:
#   - a soft upper bound (a count > 86 indicates a regression or
#     a false-positive prefix match in `.text`)
#   - a documentation anchor for the brief 134 baseline
HISTORICAL_MAX_VENEER_COUNT = 86

# Brief 142 + 146: the .ctor + pad cascade fix recovers either 8
# or 12 bytes net depending on whether mwldarm emitted the
# `WRITEW(0)` terminator after the real .ctor entry.
#
# - Historical (n == HISTORICAL_MAX_VENEER_COUNT = 86): mwldarm
#   emits [.ctor (4) + WRITEW(0) (4) + pad (8)] = 16 bytes. The
#   fix replaces those 16 with [.ctor[0:4] + 20-byte zero pad]
#   = 24 bytes → +8 net. This was brief 142's
#   `CTOR_PAD_FIX_NET_BYTES = 8` constant.
#
# - Generic (n < 86, surfaced by brief 145 / PR #566): mwldarm
#   emits [.ctor (4) + pad (8)] = 12 bytes (no terminator). The
#   fix replaces those 12 with the same 24 → +12 net.
#
# Brief 146 detects the shape from the post-splice bytes at the
# ctor file offset (see `_fix_ctor_and_pad`) and chooses the
# right `fix_end` and net delta accordingly.
CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR = 8
CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR = 12
# Brief 164: empirical measurement at n=5 found mwldarm emits a
# **28-byte cluster** (4-byte ctor + 24 zero bytes before
# `.data` starts), where n=86 emits 16 bytes and n=9 emits 12.
# The general rule: mwldarm emits the ctor entry followed by
# zero pad up to whatever address `.data` lives at — the number
# of zero words varies with the link-layout. Brief 164 replaces
# the brief 146 fixed-shape detector with a generic "walk
# forward to first non-zero word" finder so any zero-pad
# count is handled.
#
# Net-bytes-added by the fix (= 24 written − cluster bytes
# consumed) for each observed shape:
#   - 12-byte cluster (n=9 NO_TERMINATOR):  24 − 12 = +12
#   - 16-byte cluster (n=86 WITH_TERMINATOR): 24 − 16 =  +8
#   - 20-byte cluster (hypothetical mid):    24 − 20 =  +4
#   - 28-byte cluster (n=5 brief 164 empirical): 24 − 28 = −4
# (and so on for any 4-aligned cluster size; the patcher infers
# from the byte content, not from `n`)
CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG = -4
# Brief 142 alias retained so existing tests that pinned the
# +8 invariant against the historical-max case keep their
# named-import contract.
CTOR_PAD_FIX_NET_BYTES = CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR

# Brief 162 + 164: per-n empirical overrides. Brief 150's formula
# defaults `0 < n < 86` to NO_TERMINATOR, but real mwldarm
# behaviour at intermediate n values diverges from that default
# — empirically WITH_TERMINATOR at some n. Each entry is keyed
# by veneer count and maps to the byte-detected `ctor_pad_net`
# observed against a real mwldarm output capture. Used by
# `expected_output_delta_for` to silence the brief 150 stderr
# disagreement note at the listed n values.
#
# Empirically observed:
#   n=5: WITH_TERMINATOR_LONG (net=4). Captured in brief 162 by
#        making one 4-aligned ov004 `.rodata` source claim
#        (data_ov004_021f4a40) and snapshotting the pre-patch
#        arm9_ov004.bin produced by mwldarm. Brief 164 corrected
#        the override from 8 to 4 once `_fix_ctor_and_pad`
#        learned to detect the 20-byte cluster shape mwldarm
#        emits at this boundary. After brief 164, n=5 builds
#        SHA1 PASS — both byte-detection and n-inference return
#        the correct +4 net (the cluster has 4 extra zero bytes
#        between the 16-byte WITH_TERMINATOR core and the
#        `.data` start that the patcher now strips by consuming
#        20 cluster bytes instead of 16).
#
# All other low n values (4, 3, 2, 1) are unreached from
# current source coverage — adding additional ov004 `.rodata`
# claims didn't drop the veneer count below 5 in brief 162 / 164
# experiments. The block-level cascade brief 160 hypothesised
# (9 → 5 → 1) didn't reproduce in practice. Those n values
# stay on the n=86-or-formula path until empirical samples
# pin them.
# Brief 164 empirical n=5 value: cluster is 28 bytes (4 ctor + 24
# zero pad), fix writes 24, net = -4. Updated from brief 162's
# +8 once `_fix_ctor_and_pad` learned to detect the 28-byte
# shape and the geometric SHA1 residual was closed.
N_INFERENCE_OVERRIDES: dict[int, int] = {
    5: CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,  # = -4
}


class PatchError(Exception):
    """Patcher detected an unexpected input shape and aborted."""


def expected_output_delta_for(veneer_count: int) -> int:
    """**N-inference hint** for how many bytes the patcher removes
    from the input — see the warning below.

    Resolution order (brief 162 added the override lookup):

    1. `veneer_count <= 0` → returns 0 (the patcher is a no-op;
       the binary is already orig-shape and no ctor/pad fix is
       applied).
    2. `veneer_count == HISTORICAL_MAX_VENEER_COUNT` (== 86) →
       `n * VENEER_SIZE - CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR`
       (= `86 * 12 - 8 = 1024`). Brief 142 historical case.
    3. `veneer_count in N_INFERENCE_OVERRIDES` → consult the
       per-n empirical override dict (brief 162). Each entry
       maps to the byte-detected `ctor_pad_net` observed against
       a real mwldarm output capture at that n value. Currently
       overrides `n=5` (brief 160 / brief 162 empirical:
       WITH_TERMINATOR at n=5 despite the n<86 default below).
    4. Otherwise `0 < veneer_count < HISTORICAL_MAX_VENEER_COUNT`
       → `n * VENEER_SIZE - CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR`
       (= `n * 12 - 12`). Brief 146 generic case: mwldarm drops
       the `WRITEW(0)` terminator after .ctor when fewer overlays
       / veneers force the layout pass.

    ⚠ Brief 150: this n-based mapping was originally wrong at
    very low n (brief 147 bisection found n=2 / n=7 use
    WITH_TERMINATOR not NO_TERMINATOR). Brief 162's
    `N_INFERENCE_OVERRIDES` table corrects the cases that have
    been empirically sampled. The patcher continues to log a
    stderr note on byte-vs-n-inference disagreement; only n
    values in the override table go silent.

    Production callers in `patch_ov004` use the byte-detected
    `ctor_pad_net` from `stats`; the n-inference here is retained
    only as:

      1. The fallback path in `expected_output_size_for` when
         `ctor_pad_net` is unavailable (e.g. older callers).
      2. The informational compare value in `patch_ov004`'s
         brief-150 warn note when the two disagree.

    Both call sites are documented to prefer `ctor_pad_net` when
    available. Test coverage pins both the n-inference contract
    (this function) and the byte-detection contract
    (`_fix_ctor_and_pad`) independently.
    """
    if veneer_count <= 0:
        return 0
    if veneer_count >= HISTORICAL_MAX_VENEER_COUNT:
        return (
            veneer_count * VENEER_SIZE
            - CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR
        )
    # Brief 162: empirical per-n override before the default
    # formula. Each entry in N_INFERENCE_OVERRIDES is the
    # observed ctor_pad_net at that n.
    if veneer_count in N_INFERENCE_OVERRIDES:
        return (
            veneer_count * VENEER_SIZE
            - N_INFERENCE_OVERRIDES[veneer_count]
        )
    return (
        veneer_count * VENEER_SIZE
        - CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR
    )


def _scan_veneer_pool(data: bytes) -> tuple[int, list[tuple[int, int]]]:
    """Scan the binary for the canonical veneer-pool region — a
    contiguous run of `n` veneers each starting with `VENEER_PREFIX`
    (`0 ≤ n ≤ HISTORICAL_MAX_VENEER_COUNT`).

    Returns `(pool_file_offset, veneers)` where `veneers` is a list
    of `(file_offset, target_VA)` of length `n`. When `n == 0`
    (binary already patched, or no veneers were emitted at all),
    returns `(-1, [])`.

    Brief 142: the count was a hard `== 86` assertion in the brief
    134 patcher. It's now any non-negative count, because
    source-level `.rodata` claims suppress veneer emission. The
    `HISTORICAL_MAX_VENEER_COUNT` upper bound stays as a sanity
    guard against runaway false-positive matches.

    Raises `PatchError` if the pool exists but isn't contiguous,
    or if the count exceeds the historical maximum.

    Auto-detects the pool location so the patcher works across all
    3 regions (EUR / USA / JPN) without hardcoded offsets.
    """
    # Find every veneer-prefix occurrence in the input.
    positions: list[int] = []
    pos = 0
    while True:
        pos = data.find(VENEER_PREFIX, pos)
        if pos < 0:
            break
        positions.append(pos)
        pos += 1

    if not positions:
        return (-1, [])

    if len(positions) > HISTORICAL_MAX_VENEER_COUNT:
        raise PatchError(
            f"found {len(positions)} veneer-prefix matches in input "
            f"(> historical maximum {HISTORICAL_MAX_VENEER_COUNT}). "
            f"Either mwldarm regressed and is emitting more veneers "
            f"than the brief 134 baseline, or the canonical prefix "
            f"is matching arbitrary `.text` (false positive). Bail "
            f"rather than risk corrupting the binary."
        )

    # Verify the pool is contiguous (each veneer 12 bytes from
    # the next).
    for i in range(len(positions) - 1):
        if positions[i + 1] - positions[i] != VENEER_SIZE:
            raise PatchError(
                f"veneer pool not contiguous: gap of "
                f"{positions[i + 1] - positions[i]} bytes between "
                f"veneers at 0x{positions[i]:05x} and "
                f"0x{positions[i + 1]:05x} (expected {VENEER_SIZE})"
            )

    pool_start = positions[0]
    veneers: list[tuple[int, int]] = []
    for off in positions:
        target = struct.unpack_from("<I", data, off + 8)[0]
        veneers.append((off, target))
    return pool_start, veneers


def _splice_veneer_pool(
    data: bytearray, pool_start: int, veneer_count: int,
) -> bytearray:
    """Return a NEW bytearray with the `veneer_count`-element
    veneer pool removed starting at `pool_start`. Downstream
    sections shift left by `veneer_count * VENEER_SIZE` bytes.

    Brief 142: takes `veneer_count` explicitly so the splice
    length tracks the scanner's actual finding rather than a
    hard-coded `86 × 12`.
    """
    pool_end = pool_start + veneer_count * VENEER_SIZE
    return bytearray(data[:pool_start]) + bytearray(data[pool_end:])


def _fix_ctor_and_pad(
    data: bytearray, ctor_file_offset: int,
) -> tuple[bytearray, int]:
    """After splice, replace the cluster of [.ctor + pad] at the
    post-splice file range with [orig .ctor first 4 bytes] +
    [20 zero pad bytes].

    Returns `(fixed_data, ctor_pad_net_bytes)` — the net bytes the
    fix adds. One of:
      - `CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR` (8) — n=86 shape
      - `CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR` (12) — n=9 shape
      - `CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG` (4) —
        n=5 boundary shape, added in brief 164

    Brief 146 / 164 shape detection
    -------------------------------

    mwldarm's ctor/pad cluster shape varies with the veneer count
    (brief 134 → 142 → 146 → 164 chain documented this empirically).
    Brief 164 generalised the per-shape detector into a single
    "walk forward to first non-zero word" rule that handles any
    zero-pad count mwldarm emits.

    Algorithm:

    1. Read the 4-byte ctor entry at `ctor_file_offset`.
    2. Walk forward in 4-byte words starting at
       `ctor_file_offset + 4`, advancing while each word is zero.
    3. The first non-zero word is the start of `.data`. Set
       `fix_end` to that file offset.
    4. The cluster contains `(fix_end - ctor_file_offset)` bytes
       total. The fix replaces them with
       `[ctor[0:4] + 20-byte zero pad]` (always 24 bytes).
    5. Net bytes added = `24 - (fix_end - ctor_file_offset)`
       (positive when cluster < 24, negative when cluster > 24).

    Observed shapes (all 3 reachable from current source coverage):

    | shape | bytes | net | example |
    |---|---:|---:|---|
    | NO_TERMINATOR     | 12 |  +12 | n=9 (current main) |
    | WITH_TERMINATOR   | 16 |   +8 | n=86 (historical) |
    | WITH_TERMINATOR_LONG | 28 |  −4 | n=5 (brief 164 / 160) |

    The constants `CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR`,
    `CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR`, and
    `CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG` are retained as
    documentation anchors for the three observed nets; the helper
    no longer keys off them at runtime.

    Walk safety
    -----------

    The walk advances a maximum of `MAX_CLUSTER_WORDS` words (=
    16 words = 64 bytes) before giving up — that's well beyond
    any cluster shape mwldarm has been seen emitting (28 bytes /
    7 words observed at n=5). Beyond that limit the walk
    terminates and the patcher raises `PatchError`, surfacing
    that mwldarm has emitted a cluster shape we've never seen
    so the operator can investigate.

    Failure mode
    ------------

    If `.data` first word is coincidentally zero, the walk would
    over-shoot into `.data` and incorrectly classify the cluster
    as longer than it actually is. For ov004 EUR/USA/JPN this
    isn't a concern — `.data` starts with `.LZN` (non-zero) per
    [`ov004-rodata-patcher-blocker.md`](../docs/research/ov004-rodata-patcher-blocker.md).
    Future ov004 source-coverage states that change the `.data`
    leading bytes would need a separate fallback path.

    `ctor_file_offset` is the file offset of the post-splice .ctor
    (typically the orig .ctor's file offset — derived from
    delinks.txt's `.ctor start:` minus the module base VA).
    """
    # Walk forward in 4-byte words to find the start of `.data`
    # (first non-zero word after the ctor entry).
    MAX_CLUSTER_WORDS = 16  # 64 bytes — well beyond any observed shape
    cursor = ctor_file_offset + 4
    for _ in range(MAX_CLUSTER_WORDS):
        word = bytes(data[cursor:cursor + 4])
        if len(word) < 4:
            raise PatchError(
                f"reached end of binary while walking ctor/pad "
                f"cluster at file offset 0x{ctor_file_offset:x}"
            )
        if word != b"\x00\x00\x00\x00":
            break
        cursor += 4
    else:
        raise PatchError(
            f"ctor/pad cluster at file offset 0x{ctor_file_offset:x} "
            f"has more than {MAX_CLUSTER_WORDS} zero words before "
            f"`.data` — never seen empirically. mwldarm may have "
            f"changed its emission shape; investigate before "
            f"re-running."
        )
    fix_end = cursor
    cluster_size = fix_end - ctor_file_offset
    REPLACEMENT_SIZE = 24  # 4 ctor + 20 zero pad
    net = REPLACEMENT_SIZE - cluster_size
    ctor_first_4 = bytes(
        data[ctor_file_offset:ctor_file_offset + 4]
    )
    pad_20 = b"\x00" * 0x14
    fixed = (
        bytearray(data[:ctor_file_offset])
        + bytearray(ctor_first_4)
        + bytearray(pad_20)
        + bytearray(data[fix_end:])
    )
    return fixed, net


_RELOC_RE = re.compile(
    r"from:0x([0-9a-f]+)\s+kind:(\w+)\s+to:0x([0-9a-f]+)"
)


def _load_relocs(
    path: Path,
) -> list[tuple[int, str, int]]:
    """Parse a dsd `relocs.txt`. Returns list of (from_va, kind,
    to_va) tuples."""
    out: list[tuple[int, str, int]] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = _RELOC_RE.match(line)
        if m is None:
            continue
        out.append((
            int(m.group(1), 16),
            m.group(2),
            int(m.group(3), 16),
        ))
    return out


def _apply_load_rewrites(
    data: bytearray,
    relocs: list[tuple[int, str, int]],
    base_va: int,
) -> int:
    """For each `kind:load` reloc, write `to_va` at file offset
    `from_va - base_va`. Returns count of writes that actually
    changed bytes (vs. were already correct)."""
    changed = 0
    for from_va, kind, to_va in relocs:
        if kind != "load":
            continue
        fo = from_va - base_va
        if fo < 0 or fo + 4 > len(data):
            # Out-of-range — should not happen for a well-formed
            # ov004 binary; skip silently rather than abort.
            continue
        current = struct.unpack_from("<I", data, fo)[0]
        if current == to_va:
            continue
        struct.pack_into("<I", data, fo, to_va)
        changed += 1
    return changed


def _reencode_init_bls(
    data: bytearray,
    relocs: list[tuple[int, str, int]],
    base_va: int,
    init_start_va: int,
    init_end_va: int,
) -> int:
    """Re-encode each ARM BL instruction in .init whose source-VA
    changed due to the splice. Computes the correct 24-bit signed
    offset from (from_va, to_va) and writes back preserving the
    top 8 cond/opcode bits."""
    changed = 0
    for from_va, kind, to_va in relocs:
        if kind != "arm_call":
            continue
        if not (init_start_va <= from_va < init_end_va):
            continue
        fo = from_va - base_va
        if fo < 0 or fo + 4 > len(data):
            continue
        offset_bytes = to_va - from_va - 8
        # Must be 4-aligned (ARM instruction offsets are);
        # encoded as a signed 24-bit word offset.
        if offset_bytes & 0x3:
            raise PatchError(
                f"arm_call from 0x{from_va:08x} to 0x{to_va:08x}: "
                f"offset {offset_bytes:#x} not 4-aligned"
            )
        imm24 = (offset_bytes >> 2) & 0xffffff
        current = struct.unpack_from("<I", data, fo)[0]
        # Preserve top 8 bits (cond + opcode); replace bottom 24.
        new_word = (current & 0xff000000) | imm24
        if new_word == current:
            continue
        struct.pack_into("<I", data, fo, new_word)
        changed += 1
    return changed


_SECTION_LINE_RE = re.compile(
    r"\.(\w+)\s+start:0x([0-9a-f]+)\s+end:0x([0-9a-f]+)",
)


def parse_section_map(delinks_path: Path) -> dict[str, tuple[int, int]]:
    """Parse the first stanza of `delinks.txt` to a dict
    `{section_name: (start_va, end_va)}`. The `section_name`
    keeps the leading dot (e.g. `.text`)."""
    sections: dict[str, tuple[int, int]] = {}
    for line in delinks_path.read_text(encoding="utf-8").splitlines():
        stripped = line.strip()
        if not stripped.startswith("."):
            break
        m = _SECTION_LINE_RE.match(stripped)
        if m is None:
            continue
        sections["." + m.group(1)] = (
            int(m.group(2), 16),
            int(m.group(3), 16),
        )
    return sections


def expected_output_size_for(
    data: bytes | bytearray,
    *,
    already_patched: bool,
    veneer_count: int | None = None,
    ctor_pad_net: int | None = None,
) -> int:
    """Compute the size the patched ov004 binary SHOULD have,
    derived from the input.

    Argument precedence (brief 150):

    1. `already_patched=True` → return `len(data)` unchanged
       (brief 140 part 1 off-by-1024 fix).
    2. `ctor_pad_net` provided → use the byte-detected truth.
       Return `len(data) - veneer_count * VENEER_SIZE + ctor_pad_net`.
       This is the authoritative path: `ctor_pad_net` comes from
       `patch_ov004`'s stats, populated by `_fix_ctor_and_pad`'s
       byte-level discriminator at runtime. **Use this when you
       have access to `patch_ov004`'s stats** — it tracks
       mwldarm's actual emission shape regardless of veneer count.
    3. `ctor_pad_net is None` → fall back to n-based inference via
       `expected_output_delta_for(veneer_count)`. Brief 150
       degraded n-inference to a hint (the historical defaults
       misclassify at very low n, where mwldarm keeps the
       WITH_TERMINATOR cluster shape). This path is kept for
       backwards-compat with brief 140 / 142's helper signature
       and tests that pin the n-inference contract directly, but
       new callers should pass `ctor_pad_net` whenever they have
       it.
    4. Both `veneer_count` and `ctor_pad_net` None → defaults
       `veneer_count` to `HISTORICAL_MAX_VENEER_COUNT` (delta =
       1024) before invoking the n-inference fallback.

    Used by `main()` to drive the YAML `code_size` rewrite. Pure
    function — exposed so tests can pin the branching behaviour
    without round-tripping a real binary."""
    if already_patched:
        return len(data)
    n = (
        HISTORICAL_MAX_VENEER_COUNT
        if veneer_count is None
        else veneer_count
    )
    if ctor_pad_net is not None:
        # Brief 150: byte-detected truth path — directly compute
        # the post-patch size from the actual splice delta plus the
        # byte-detected ctor/pad net. No dependency on n-inference.
        return len(data) - n * VENEER_SIZE + ctor_pad_net
    return len(data) - expected_output_delta_for(n)


def patch_ov004(
    data: bytes | bytearray,
    relocs: list[tuple[int, str, int]],
    sections: dict[str, tuple[int, int]],
) -> tuple[bytearray, dict[str, int]]:
    """Apply the full Phase-3 patch to `data`. Returns
    (patched_bytes, stats) where `stats` reports each step's
    change count. Idempotent: if `data` is already patched (no
    veneers present), returns unchanged.

    `sections` is the parsed delinks.txt section map; must include
    `.text`, `.ctor`, `.init`."""

    base_va = sections[".text"][0]
    ctor_start_va, ctor_end_va = sections[".ctor"]
    init_start_va, init_end_va = sections[".init"]
    ctor_file_offset = ctor_start_va - base_va

    # Quick "already patched" check — no veneer pattern in the
    # binary means we either never had veneers or already spliced.
    if data.find(VENEER_PREFIX) < 0:
        return bytearray(data), {
            "veneers_spliced": 0,
            "ctor_pad_fixed": 0,
            "ctor_pad_net": 0,
            "load_rewrites": 0,
            "bl_reencodes": 0,
            "already_patched": 1,
        }

    pool_start, veneers = _scan_veneer_pool(data)
    # Brief 142: splice length + size validation derive from the
    # scanner's observed count, not a hard-coded 86 / 1024.
    veneer_count = len(veneers)
    spliced = _splice_veneer_pool(
        bytearray(data), pool_start, veneer_count,
    )
    # Brief 146: _fix_ctor_and_pad now byte-detects the ctor/pad
    # cluster shape (16-byte WITH terminator at n=86, 12-byte
    # WITHOUT terminator at n<86) and returns the actual net
    # bytes added so the size validation can match either shape.
    fixed, ctor_pad_net = _fix_ctor_and_pad(spliced, ctor_file_offset)
    splice_delta = veneer_count * VENEER_SIZE
    expected_output_size = len(data) - splice_delta + ctor_pad_net
    if len(fixed) != expected_output_size:
        raise PatchError(
            f"post-fix size {len(fixed)} != expected "
            f"{expected_output_size} (input {len(data)} - "
            f"{splice_delta} + {ctor_pad_net}; "
            f"veneer_count={veneer_count})"
        )
    # Brief 150 — informational shape cross-check.
    #
    # Brief 146 used n-based inference as a hard cross-check against
    # the byte-detected ctor/pad shape. Brief 147 / 150 found that
    # n-inference is unreliable at low `n`: mwldarm continues to
    # emit the WITH_TERMINATOR cluster shape at very low veneer
    # counts (empirically n=2 and n=7), where the n=86-or-else-NO
    # inference defaults wrong. Promoting the disagreement to a hard
    # failure blocked brief 147's wave 1 extension at any source
    # claim that dropped the count below 9.
    #
    # Brief 150 (Option A per the brief spec) downgrades the
    # cross-check to a stderr warn. The byte-detection at
    # `_fix_ctor_and_pad`'s discriminator (bytes 12-15 of the
    # post-splice cluster) is the authoritative truth source — it
    # observes the ACTUAL shape mwldarm emitted rather than
    # inferring it from `n`. Agreement is logged silently;
    # disagreement surfaces the n-inference's predicted value for
    # the operator's awareness but does not block.
    #
    # If byte-detection itself ever misfires (e.g. a future ov004
    # source-coverage state where `.data` starts with a 4-byte zero
    # word), the geometric self-consistency check above WILL catch
    # the wrong cluster length — `_fix_ctor_and_pad`'s `fix_end`
    # and `net` are computed from the same `terminator_present`
    # decision, so the output size stays consistent with the
    # chosen shape even when that shape is wrong. The downstream
    # SHA1 check catches content errors. Tests pin both edges.
    inferred_delta = expected_output_delta_for(veneer_count)
    actual_delta = splice_delta - ctor_pad_net
    if inferred_delta != actual_delta:
        print(
            f"note: {veneer_count}-veneer ctor/pad shape disagrees "
            f"with n-inference: byte-detected net {ctor_pad_net} "
            f"(delta {actual_delta}) vs n-inferred delta "
            f"{inferred_delta}. Byte-detection takes precedence; "
            f"this is informational only (brief 150). Common at "
            f"n<9 where mwldarm keeps the WITH_TERMINATOR shape "
            f"that n-inference assumes only for n=86.",
            file=sys.stderr,
        )

    load_rewrites = _apply_load_rewrites(fixed, relocs, base_va)
    bl_reencodes = _reencode_init_bls(
        fixed, relocs, base_va, init_start_va, init_end_va,
    )

    return fixed, {
        "veneers_spliced": len(veneers),
        "ctor_pad_fixed": 1,
        "ctor_pad_net": ctor_pad_net,
        "load_rewrites": load_rewrites,
        "bl_reencodes": bl_reencodes,
        "already_patched": 0,
    }


def patch_overlays_yaml(
    yaml_path: Path,
    overlay_id: int,
    *,
    new_code_size: int,
    new_ctor_start_va: int,
    new_ctor_end_va: int,
) -> bool:
    """Rewrite the ov004 entry in arm9_overlays.yaml to reflect
    the post-patch binary size and orig `.ctor` table VAs.

    `dsd rom build` reads this YAML to learn each overlay's
    `code_size`, `ctor_start`, `ctor_end`. Without this rewrite,
    the YAML would still hold the pre-patch (mwldarm) values
    (269216, 0x02209ea0, 0x02209ea8) and the ROM packaging step
    would mis-pack ov004 — even though the .bin itself is correct.

    Returns True if any field was changed.
    """
    text = yaml_path.read_text(encoding="utf-8")
    # Locate the `- id: <overlay_id>` block.
    block_re = re.compile(
        rf"(\s+-\s+id:\s+{overlay_id}\n)((?:\s{{4,}}.+\n)+)",
    )
    m = block_re.search(text)
    if m is None:
        # Block not found — silently no-op.
        return False
    block = m.group(2)

    def _sub(field: str, new_value: int, b: str) -> tuple[str, bool]:
        field_re = re.compile(
            rf"(\s+{field}:\s+)\d+",
        )
        new_b, n = field_re.subn(
            rf"\g<1>{new_value}", b, count=1,
        )
        return new_b, (n > 0 and new_b != b)

    new_block, ch1 = _sub("code_size", new_code_size, block)
    new_block, ch2 = _sub("ctor_start", new_ctor_start_va, new_block)
    new_block, ch3 = _sub("ctor_end", new_ctor_end_va, new_block)

    if not (ch1 or ch2 or ch3):
        return False

    new_text = text[:m.start(2)] + new_block + text[m.end(2):]
    yaml_path.write_text(new_text, encoding="utf-8")
    return True


def main() -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Splice spurious mwldarm interwork veneers out of "
            "ov004's binary and un-shift the cascade. Final W7 "
            "mitigation tier (brief 134 Phase 3)."
        ),
    )
    ap.add_argument(
        "--binary", type=Path, required=True,
        help="Path to arm9_ov004.bin (e.g. "
             "build/eur/build/arm9_ov004.bin).",
    )
    ap.add_argument(
        "--relocs", type=Path, required=True,
        help="Path to ov004's relocs.txt (e.g. "
             "config/eur/arm9/overlays/ov004/relocs.txt).",
    )
    ap.add_argument(
        "--delinks", type=Path, required=True,
        help="Path to ov004's delinks.txt (e.g. "
             "config/eur/arm9/overlays/ov004/delinks.txt). The "
             "patcher reads the section map from here to derive "
             "the module base VA + ctor / init ranges per region.",
    )
    ap.add_argument(
        "--overlays-yaml", type=Path, default=None,
        help="Optional: path to arm9_overlays.yaml. If given, the "
             "ov004 entry's code_size + ctor_start + ctor_end are "
             "rewritten to match the post-patch binary (needed for "
             "`dsd rom build` to pack ov004 correctly into the ROM).",
    )
    args = ap.parse_args()

    try:
        data = args.binary.read_bytes()
    except OSError as e:
        print(f"error: read {args.binary}: {e}", file=sys.stderr)
        return 1
    try:
        relocs = _load_relocs(args.relocs)
    except OSError as e:
        print(f"error: read {args.relocs}: {e}", file=sys.stderr)
        return 1
    try:
        sections = parse_section_map(args.delinks)
    except OSError as e:
        print(f"error: read {args.delinks}: {e}", file=sys.stderr)
        return 1

    required = (".text", ".ctor", ".init")
    missing = [s for s in required if s not in sections]
    if missing:
        print(
            f"error: {args.delinks}: missing section(s) "
            f"{missing}",
            file=sys.stderr,
        )
        return 1

    # Compute YAML metadata from sections.
    ctor_start_va, ctor_end_va = sections[".ctor"]
    # overlays.yaml's ctor_end = .ctor_end + 4 (NULL terminator
    # convention — built has WRITEW(0) appended, orig leaves it
    # as part of the alignment pad but the table layout is the
    # same: 1 real entry + 1 NULL terminator).
    yaml_ctor_start = ctor_start_va
    yaml_ctor_end = ctor_end_va + 4

    try:
        patched, stats = patch_ov004(data, relocs, sections)
    except PatchError as e:
        print(f"error: {args.binary}: {e}", file=sys.stderr)
        return 1

    # Brief 140 part 1 fix: the YAML `code_size` is the POST-PATCH
    # ov004 binary size. If `data` already came in pre-patched
    # (e.g. on the rom_config invocation that runs the patcher a
    # second time after the .bin was already spliced by the mwld
    # invocation), `len(data)` IS the post-patch size — DON'T
    # subtract the delta again. The brief 134 patcher had this
    # bug: it always subtracted, writing `268192 - 1024 = 267168`
    # into the YAML on the YAML-only re-invocation, which `dsd
    # rom build` then aligned to 0x413a0 and wrote into the ROM
    # overlay table — 512 bytes short of orig's 0x417a0.
    #
    # Brief 142 generalisation: pass the observed `veneers_spliced`
    # count so the delta math tracks the scanner's actual finding
    # rather than the historical-max constant.
    #
    # Brief 150 fix: ALSO pass the byte-detected `ctor_pad_net`
    # from stats so the YAML uses the exact post-patch size mwldarm
    # actually emitted, not the n-inference (which misclassifies
    # the WITH_TERMINATOR shape at very low n). Without this, a
    # source-claim wave that drops the veneer count to n=2 or n=7
    # would write the wrong `code_size` into arm9_overlays.yaml
    # and break SHA1 at the ROM-packaging step.
    expected_output_size = expected_output_size_for(
        data,
        already_patched=bool(stats["already_patched"]),
        veneer_count=stats["veneers_spliced"],
        ctor_pad_net=(
            stats["ctor_pad_net"]
            if not stats["already_patched"] else None
        ),
    )

    def _do_yaml_patch() -> bool:
        if args.overlays_yaml is None:
            return False
        try:
            return patch_overlays_yaml(
                args.overlays_yaml,
                overlay_id=4,
                new_code_size=expected_output_size,
                new_ctor_start_va=yaml_ctor_start,
                new_ctor_end_va=yaml_ctor_end,
            )
        except OSError as e:
            print(
                f"error: overlays-yaml {args.overlays_yaml}: {e}",
                file=sys.stderr,
            )
            return False

    if stats["already_patched"]:
        # .bin already patched; still try to keep the overlays
        # YAML in sync (idempotent).
        if _do_yaml_patch():
            print(
                f"patched {args.overlays_yaml}: ov004 code_size + "
                f"ctor_start + ctor_end rewritten to orig values",
                file=sys.stderr,
            )
        return 0

    try:
        args.binary.write_bytes(bytes(patched))
    except OSError as e:
        print(f"error: write {args.binary}: {e}", file=sys.stderr)
        return 1

    yaml_changed = _do_yaml_patch()

    pool_bytes = stats["veneers_spliced"] * VENEER_SIZE
    msg = (
        f"patched {args.binary}: "
        f"spliced {stats['veneers_spliced']} veneers "
        f"({pool_bytes} bytes), "
        f"rewrote {stats['load_rewrites']} load literals, "
        f"re-encoded {stats['bl_reencodes']} .init ARM BLs"
    )
    if yaml_changed:
        msg += (
            f"; also patched {args.overlays_yaml} "
            f"(ov004 code_size + ctor VAs)"
        )
    print(msg, file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
