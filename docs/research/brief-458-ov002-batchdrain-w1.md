[//]: # (markdownlint-disable MD013 MD041)

# Brief 458 — ov002 UPPER-half batch drain wave 1: 0x101+ tiers

**Brief:** 458 (scaffolder). Run `tools/batch_carve.py` at scale on the ov002
UPPER-half remaining size tiers (everything ≥0x101 not yet carved), report
clean-rate per tier, and auto-commit every green EUR sha1.

## What shipped

**507 `.s` carves across 3 tiers, 11 auto-commits, 0 parks except 2 kind:data.**
EUR `ninja sha1` green at every gate.

| tier | size range | candidates | shipped | REFUSE | verify-fail | clean-rate | commits |
|---|---|---|---|---|---|---|---|
| 1 | 0x101–0x140 | 135 | 135 | 0 | 0 | **100%** | 3 |
| 2 | 0x141–0x200 | 195 | 195 | 0 | 0 | **100%** | 4 |
| 3 | >0x200 | 179 | 177 | 2 | 0 | **98%** | 4 |
| **total** | | **509** | **507** | **2** | **0** | **99.6%** | **11** |

The 2 REFUSE (`func_ov002_022b867c`, `func_ov002_022b5590`) are both
`kind:data` — not ARM code at all. Zero byte-pack failures at any size.

Auto-commits (all `[auto, eur sha1 OK]`):

| commit | carves | size band |
|---|---|---|
| `29218a32` | +50 | 0x104–0x114 |
| `84982278` | +50 | 0x114–0x130 |
| `2e60a023` | +35 | 0x130–0x140 |
| `d87cd0ec` | +50 | 0x144–0x160 |
| `5f96897b` | +50 | 0x160–0x188 |
| `1bda8d42` | +50 | 0x188–0x1c8 |
| `9dc351f5` | +45 | 0x1cc–0x1fc |
| `7034aeee` | +50 | 0x204–0x280 |
| `69e07dee` | +50 | 0x280–0x35c |
| `c58246b0` | +50 | 0x360–0x544 |
| `e58ecbcf` | +27 | 0x544–0xa8c |

## Key finding — byte-pack drops do NOT climb with size

The brief predicted that verify-fails (byte-pack / reg-alloc failures)
would climb as function size increased. **That did not happen.** Every tier
produced 0 verify-fails:

- Tier 1 (0x101–0x140): 100% clean
- Tier 2 (0x141–0x200): 100% clean
- Tier 3 (>0x200): 98% clean — the 2% is 2 kind:data symbols, not
  code failures

Even the very large functions (0x544–0xa8c, i.e. 1348–2700 bytes) are
byte-identical through `asm_escape --whole-function`. This means the
ov002 UPPER-half ARM code is essentially **entirely byte-pack-clean** —
mwcc's reg-alloc and scheduling produce the same binary from these
functions' asm as the original compiler did. The wall class for this
tier turns out to be purely kind:data (2 symbols), not byte-pack
failures.

## Combined ov002 UPPER-half picture

Including earlier waves (w11–w13, brief 456 pilot, this wave):

| band | ships | notes |
|---|---|---|
| ≤0xc0 | 58 | wave 12, all byte-clean |
| 0xc1–0x100 | 40+50 | waves 13 + pilot, 100% clean |
| 0x101–0x140 | 135 | this wave tier 1, 100% |
| 0x141–0x200 | 195 | this wave tier 2, 100% |
| >0x200 | 177 | this wave tier 3, 98% (2 kind:data) |

The UPPER-half ARM code lane is **drained**. Remaining residue is the
2 kind:data symbols (now in `build/known_drops_ov002.txt`) + whatever
the decomper's lower-half still has.

## Operational notes

- **Wall-clock:** 12:17–16:56 BST (4h39m) for 507 carves across 11 gates.
  With `--batch 50`, the first gate hit a cold tree (~40 min); subsequent
  gates were warm (~15–25 min each).
- **No wineserver contention:** brain ran a JPN sha1 concurrently during
  tier 1; `--gate-retries 2` absorbed it cleanly with no deferrals.
- **Output buffering:** `python3.13 -u` (unbuffered) should be added to
  future drain scripts so `tee` captures progress in real time rather than
  in end-of-buffer bursts.
- **Dry-run pre-census:** running `--dry-run` without `--skip-list` before
  the live drain surfaced both REFUSE funcs with no skip-list pollution
  (dry-run `_park` is a no-op when `skip_path=None`).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
