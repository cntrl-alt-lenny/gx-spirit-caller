[//]: # (markdownlint-disable MD013 MD041)

# Brief 364 — fresh-overlay re-sweep with the new C-levers (ov004)

**Brief:** 364 (decomper). The 362 fallback: pick a Windows-drained overlay (not
main, not ov002), re-attack its remaining easy tier + near-misses with the **C-source
levers** (`(u8)` byte-pack cast, dispatch-order inversion, `goto`, pass-through). No
tri-compile (overlays are 2.0). Optionally permute commutative/peephole near-misses
(non-overlay-swap only). Gate = 3-region `ninja sha1`. **Report the yield and which
lever carried it — that tells us whether drained overlays re-open.**

## Headline — yes, drained overlays re-open, but NOT via the listed levers

**3 recovered (`021dd350`, `021d66f4`, `021d1360`), 3-region `ninja sha1` = EUR/USA/JPN
OK.** Picked **ov004** (richest residue: 213 uncarved, 40 ≤0x60). The answer to the
brief's question is **yes — but the re-opening came from two mechanisms the brief
didn't list, and *none* of the four named C-levers carried a single recovery.**

## Which lever carried each (the brief's core question)

| addr | size | what | lever |
|---|---|---|---|
| `021dd350` | 0x22 | printable-string validator (Thumb) | **`#pragma thumb on`** (a new C-source lever) |
| `021d66f4` | 0x40 | command builder (`func_02034888`) | none — a **missed clean ARM func** |
| `021d1360` | 0x7c | status-message + predicated tail | **cached-base recipe** (existing) |

**`(u8)` byte-pack, dispatch-order inversion, `goto`, pass-through → 0 recoveries.**
Those levers crack reg-mirror / inline-branch near-misses; the drained overlays don't
*have* fresh funcs in those classes (the Windows waves drained the easy ARM tier, and
362 confirmed the catalogued residue is reg-alloc-walled). So the re-opening is real
but its source is different:

## Source 1 — the Windows waves left clean builders on the table

ov004's uncarved ARM tier is **not** all reg-walls. There is a live **command-builder
/ status-message family** (~32 uncarved callers of `func_02037208`/`02034888`/
`0201cd1c`/`020124a4`) that the Windows-era waves simply never attempted. The simple
ones match with **existing** recipes:

- `021d66f4` — `buf[0]=arg; func_020124a4(field, buf+2); func_02034888(3, buf, 0x126);
  return 1;` — a clean builder, matched first try.
- `021d1360` — a status-message (`func_02037208(58,-1,0,1)` quirk) + a predicated
  tail; matched once the global base was **cached** (`char *b = data_…0220b500;` used
  across the calls), per the "cached-base mandatory" recipe — without it mwcc re-loads
  the pool and the frame diverges.

So the catalogued backlog is `.s`-bound (362), but the **un-catalogued** uncarved set
still holds matchable clean funcs. This is a missed-work vein, not a lever unlock.

## Source 2 — the Thumb cohort re-opens via `#pragma thumb on`

The `021dbxxx`–`021ddxxx` "Thumb-align-wall" cohort (catalogued `.s`-escape-only) is
clean-C-shaped utility code (byte-copy, string-scan, fn-ptr dispatch). **A Thumb TU
compiles and matches via `#pragma thumb on`** — `021dd350` is byte-identical and links
(3-region sha1). This is the project's **first Thumb `.c`** (all prior Thumb ships are
`.s`). The catch:

- **4-aligned starts only** — mwcc emits `sh_addralign=4` for Thumb; 2-aligned funcs
  still need the `.s` route (the genuine alignment wall).
- **Frameless funcs only, with pure C.** Call-having Thumb funcs hit a frame/epilogue
  idiom: orig uses `push {lr}; sub sp,#4` + the **ARMv4T-safe interworking return**
  `pop {r3}; bx r3`, while the project's `-proc arm946e` (ARMv5) emits `push {r3,lr}` +
  `pop {r3,pc}`. That is a **compiler `-proc` setting**, not a C-lever — so the
  call-having bulk needs a small harness rule (a `.thumb.c` suffix → `-proc arm7tdmi`-
  style frame). Only the lone frameless func (`021dd350`) recovers with pure C.

(Patched `/tmp/dcheck.py` to normalise Thumb `.n`/`.w` branch suffixes so it can gate
Thumb funcs.)

## What stayed walled (confirms 362)

changed-bool family (`021d48bc`, `021d52a0`, `021d4a48`, `021d5a90`, … — `c=0;
if(f){f=0;c=1;}` reg-alloc), materialized-bool (`021d4870`), jump-table (`021ced78`),
store-scheduling (`021cc2a4`, `021d1308`), Thumb reg-mirror (`021dcbcc`) and Thumb
frame (`021dbf48` and all call-having Thumb). None move under any C-lever.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (3 `.c`, byte-identical) |
| `check_match_invariants.py` | 0 errors |
| `ruff check .` | clean |

Carve-size audit: all three match the true gap-symbol size. EUR-only config (+3
`complete`).

## Recommendation for the brain

Drained overlays **do** re-open — pursue both veins, but **not with the byte-pack/goto
levers** (those are for fresh easy tiers the drained overlays lack):

1. **Drain the missed builder/status-message family on ov004** (~32 uncarved
   sink-callers; the simple ones match with the cached-base + buf-setup recipes). A
   normal drain wave, not a routing pass. Likely the highest-yield next step.
2. **Add a Thumb-compile harness rule** (`*.thumb.c` → `-proc` that emits the
   ARMv4T-interworking frame) as a follow-up brief. That opens the whole `021dbxxx`–
   `021ddxxx` cohort (dozens of clean utility funcs) — the bigger prize. With pure C
   (no harness change) only the frameless Thumb subset recovers (1 here).
3. **The four named C-levers carried nothing** on ov004 — the drained overlays have no
   fresh reg-mirror/inline-branch tier for them to crack. Save those levers for the
   *next* overlay's first clean-C drain (where they shine), not re-sweeps.

## Cross-references

- `docs/research/brief-362-backlog-resweep-pilot.md` — the catalogued backlog is
  `.s`-bound; this confirms the *un-catalogued* set still has clean funcs.
- `docs/research/thumb-align-wall.md` — the section-alignment wall (now known to bite
  only 2-aligned Thumb; 4-aligned frameless Thumb matches as `.c`).
