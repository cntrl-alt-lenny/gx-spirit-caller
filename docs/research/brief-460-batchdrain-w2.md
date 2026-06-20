[//]: # (markdownlint-disable MD013 MD041)

# Brief 460 — EUR ARM batch drain wave 2: ov002 gap + lane exhaustion census

**Brief:** 460 (scaffolder). Point `tools/batch_carve.py` at the next EUR ARM
veins: ov002 lower-half, then scan all other overlays + main for remaining
uncarved ARM residue. Report runway per scope and flag the pivot if the lane
is nearly exhausted.

## Runway census (all EUR ARM scopes, dry-run)

| scope | candidates | notes |
|---|---|---|
| ov002 (full, no size filter) | 48 | see below |
| ov000–ov001, ov003–ov023 (all others) | **0** | fully drained |
| arm9 main | **0** | fully drained (b419, 2,600 ships) |

**The EUR ARM `.s` lane is exhausted** after this wave. Every overlay and
main has been fully covered.

## What the 48 were — gap funcs, not lower-half residue

The brief expected "ov002 lower-half (addr < 0x02234000) residue". On
inspection the 48 candidates all have addresses **above** 0x02234000
(upper-half address space). They are the size-band **gap** between:
- Wave 13 / pilot: covered sizes ≤0xec
- Batchdrain-w1: started at `--min-size 0x101`

The 0xed–0x100 band (48 funcs) was never explicitly targeted by either wave.
The true lower-half (addr < 0x02234000) was **completely drained by the
decomper** in the Windows arc; zero candidates remain there.

## What shipped

**48/48 carves, 0 parks, clean-rate 100%, 1 auto-commit**, EUR sha1 OK.

| commit | carves | size band |
|---|---|---|
| `f2917c23` | +48 | 0xec–0x100 |

All 48 byte-identical on first attempt. Sizes 0xec / 0xf0 / 0xf4 / 0xf8 /
0xfc / 0x100. Consistent with the 100% clean pattern established across all
prior tiers (b458: 0 verify-fails even at 2700-byte functions).

## EUR ARM lane status — FULLY EXHAUSTED

Combined ov002 picture (all waves):

| band | wave | ships |
|---|---|---|
| ≤0xc0 | w12 (b452) | 58 |
| 0xc1–0xec | w13 (b454) + pilot (b456) | 40+50 |
| 0xec–0x100 | **this wave** | **48** |
| 0x101–0x140 | batchdrain-w1 (b458) tier 1 | 135 |
| 0x141–0x200 | batchdrain-w1 (b458) tier 2 | 195 |
| >0x200 | batchdrain-w1 (b458) tier 3 | 177 |
| lower-half | decomper (Windows arc, b441–b449) | ~276 |

ov002 is the last overlay with ARM `.s` runway. All other overlays (ov000–ov001,
ov003–ov023) and arm9 main report **0 remaining candidates**.

## Pivot flag

The EUR ARM `.s` lane is done. Recommended next mechanical levers:

1. **Region-port lane** — the decomper's `port_to_region.py` lane is the
   largest remaining mechanical vein (hundreds of portable overlay funcs).
   `batch_carve.py`'s `Ops` seam was designed for this: slot in a strategy
   that calls `port_to_region.py` per candidate and gates on USA+JPN sha1.
   The dirty-guard, in-memory revert, checked commit, dedup, and bisect all
   carry over unchanged.

2. **Thumb-emitter tooling** — ov002 + ov004 have `.thumb.c` candidates
   (b393/b406 era). `asm_escape --whole-function` already has a Thumb mode
   (b406). A batch driver for Thumb `.s` would use the same pipeline with
   `--thumb` flag.

3. **Remaining C decomp** — the hard-residue (reg-alloc-finicky builders,
   jump-table dispatchers) requires LLM-aided RE; not mechanical.

## Operational note

Ran as a harness-tracked background task (`run_in_background: true`) rather
than a detached `bash … &`, so progress was visible via task notifications
in the UI. PYTHONUNBUFFERED=1 ensured streaming output.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
