[//]: # (markdownlint-disable MD013 MD041)

# Brief 301 — cold-RE wave 14: keep draining the ov002 reachable cohort

**Brief:** 301 (decomper). (A) `<0x100` fast zone (families + `.s`-hatch).
(B) `0x100-0x200` reachable tier (~3-6 `.c`/wave, composite). Sole owner of
`ov002_core.h` now (scaffolder moved to ov006) — add sink decls directly.
Defer loop/liveness/register-numbering.

## Headline

**12 shipped (all `.c`), all 3-region SHA1 PASS — all 12 from the `<0x100`
tail.** The `021d479c` event-post family + forwarder predicates remain a rich,
reliable vein. The `0x100-0x200` band again yielded **0 clean `.c`** — every
band candidate walled (reg-numbering / reschedule), confirming wave 13's
finding that the band is `.s`-territory, not hand-`.c`.

## (A) `<0x100` — 12 `.c`

- **`021d479c` event-post family** (`(flag ? 0x8000 : 0) | cmd` + payload):
  `02211430` `02217130` `021df6d4` `021df680` `021e2818`.
- **Forwarder / compound predicates**: `0220069c` `0225a098` `022819d4`
  `02205d20` `0226e9ac` `0226ea7c` `0222ba38`.

### Sub-recipes banked

1. **`021d479c` post truncation is per-arg.** Only the *variable* args get the
   `lsl#16;lsr#16` on entry; constant args stay `mov`s. So with the header's
   `int×4` proto, write `(u16)` casts on the variable args only and bare
   constants for the rest (a *local* `u16×4` proto would also work but
   conflicts with the header). `(arg0 ? 0x8000 : 0) | cmd` for the high-bit
   command word.
2. **Byte-temp register ordering** (`0222ba38`): two byte temps from one field
   (`lo`/`hi`) colour into the *order they're written*. Compute them as
   **explicit locals in the original's order** (`lo` then `hi`) — the inline
   `f(low, high, …)` form lets mwcc evaluate right-to-left and swaps the regs.
3. **Header `int[]` globals need a `(char*)` byte-offset cast.** `cf17c` is
   declared `int[]`; `data + (player&1)*0x868` then indexes by *ints* (`lsl#2`).
   Cast `(char *)data_ov002_022cf17c + …` for the byte offset (`021e2818`).

## (B) `0x100-0x200` band — 0 `.c` (every candidate walled)

Consistent with wave 13. Each band/composite attempt and its wall:

| func | wall |
|---|---|
| `0225a51c` | global-prelude **reschedule** (mwcc hoists the cf3f4 load above the d016c writes) |
| `021d8128` | reg-numbering (the `vip` flag + packed temp land in `r2` vs `ip`) |
| `021e2cd4` | reg-numbering (the d016c value in `r0` vs `r2`) |
| `021df62c` | reg-numbering (reused `arg2` index + table read swap regs) |
| `021d5a6c` `021d5ca4` `021d5a08` | packed-post reg-wall / argless-guard ambiguity |

The composite posts (packed payload, global prelude, multi-flag) reg-wall; only
the **single-cmd posts** and **forwarder predicates** (args-forwarded) match.

## Header (sole owner now)

Added `data_ov002_022cf178[]` (per-player event count table) — used by
`022819d4` and others. The header is the single canonical build copy
(brief 298); future sink decls go straight here.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | objdump byte-identical (bl/pool modulo) |
| `tools/check_match_invariants.py` | 0 errors (4805 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 12 `.c` + the `cf178` header decl; EUR ov002
`delinks.txt` gains 12 `complete` blocks. No USA/JPN config change, no tool
change.)

## Recommendation for the brain

1. **The `<0x100` post/forwarder vein still has runway** — ~40 unshipped
   `021d479c` callers remain (the simple single-cmd ones drain fast; the
   composite packed-payload ones reg-wall). Keep mining it; it's the reliable
   `.c` source while the band waits on tooling.
2. **The band is confirmed `.s`-territory** (2 waves now, ~0 clean `.c`). It
   needs the `.s` tooling — the `asm_escape` internal-branch enhancement
   **and** a register-rename `.s` hatch — before it drains. Reaffirming the
   brief-299 recommendation.
3. **Register-numbering is now the dominant `<0x100` waller too** (composite
   posts, global-value-in-reg). A register-rename `.s` hatch would also unlock
   these near-miss `<0x100` composites (`021e2cd4`, `021df62c`, `021d8128`, …).

## Cross-references

- `docs/research/brief-299-coldre-wave13-reachable-drain.md` — the band
  `.s`-territory finding this wave reconfirms + the post-family recipe.
- `docs/research/brief-296-ov002-0x100-0x200-tier.md` — the band census.
- `src/overlay002/ov002_core.h` — the canonical header (now decomper-owned).
