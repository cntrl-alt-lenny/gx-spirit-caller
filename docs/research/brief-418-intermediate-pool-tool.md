[//]: # (markdownlint-disable MD013 MD041)

# Brief 418 — asm_escape intermediate-literal-pool support (un-park the wave-23 edge)

**Brief:** 418 (scaffolder, TOOLING). Wave 23 (PR #949) found the asm_escape
capability edge at ~0x1040–0x109c: above it, ov002 functions carry
*intermediate* literal pools (mid-function `....` words) that `mwasmarm`
rejects. Teach `asm_escape` to emit them; ship ≥5 previously-above-edge funcs;
add a NEGATIVE test (Verify-gate item 7) shown red.

## Headline — edge un-parked; 12 above-edge ov002 funcs ship byte-identical

The intermediate-pool wall is **two bugs in one**, both fixed in
`tools/asm_escape.py`:

1. **Backward pc-relative loads were invisible.** A function whose body
   exceeds ~4 KB gets an *intermediate* literal pool that `mwcc` threads
   through the code so every `ldr [pc, …]` stays inside the ±4 KB ARM offset
   field. Words BEHIND such a load are reached by a backward `ldr rX,
   [pc, #-N]`. `pool_addrs` / `emit_asm` matched only `#(\d+)` (non-negative),
   so the backward-reached words were never recognised as pool data — they
   fell through to the instruction path and were emitted as objdump's data
   rendering (`....`, or any ASCII gutter like `h...`/`p...`/`2...`), which
   `mwasmarm` rejects as `Undefined macro or opcode`.
2. **Pool words were appended at the end.** `emit_asm` collected every pool
   word into a trailing list. For a trailing-only pool that is correct; for an
   *intermediate* pool it would relocate the words to the end of the function,
   changing every pc-relative offset (and overflowing ±4 KB). They must stay
   **inline at their original address**.

**Fix:** the offset regex is now signed (`#(-?\d+)`) in `pool_addrs` and both
`emit_asm` sites, and pool words are emitted **inline in stream order** (a
trailing-only pool is the degenerate case — its words are last, so inline ==
appended, byte-for-byte identical to pre-418).

### Why load-target detection is complete (not a heuristic)

A pool word is detected iff some `ldr [pc, #±N]` in the function targets it.
Measured on the first reject `func_ov002_021e797c` (0x109c): **31 structural
data words = 31 forward+backward load targets, 0 missed, 0 spurious.** Every
literal-pool word is referenced by at least one load within the function and
every such load points to a data word — so detecting forward + backward loads
catches the pool exactly. (An unreferenced pool word, were one to exist, would
leak as a `....` line and FAIL loudly at assemble time, never silently.)

## The safety-net hole this brief also closed (Verify-gate item 7)

While adding the negative test, the byte-verifier `bytes_match` was found to
have a **hole that pre-dates this brief**: it tolerated any byte mismatch whose
rendering started with `.word` —

```
if x["mnem"].startswith(".word") or y["mnem"].startswith(".word") ... : continue
```

`mwasmarm` marks every emitted pool word `$d`, so objdump prints MY side
`.word 0x…` for **every** pool word, raw constants included. A mis-emitted raw
pool constant (wrong value, or a dropped intermediate-pool word) therefore
slipped through **GREEN** — the verifier was only really checking code words.

The comparator is now the pure `diff_words`, which tolerates by **reloc
presence**, not by `.word` text:

- relocated word (pool pointer / `bl`) → compare by SYMBOL (bytes differ by
  construction: `0 + ABS32` vs resolved);
- raw constant (no reloc) → **compare bytes**; a mismatch is flagged.

Shown red, two ways (the item-7 obligation — see the run captured this round):

```
corrupted pool word: mine=000015d4  orig=000015d5
  PRE-418 comparator : []                                  -> TOLERATED (false GREEN = the hole)
  brief-418 diff_words: ['[0] 000015d4(.word …) vs 000015d5(....)']  -> flagged RED (hole closed)

# end-to-end (real func, one intermediate-pool word corrupted 0x868 -> 0x869):
GOOD (untouched)    : ✅ byte-identical
CORRUPTED pool word : ❌ REJECTED   [368] 00000869(.word 0x00000869) vs 00000868(h...)
```

The new unit test `TestDiffWordsPoolGuard.test_corrupted_raw_pool_is_flagged_red`
FAILS against the pre-418 tolerance (monkeypatched, verified red this round) and
passes now.

## Acceptance ships — 12 previously-above-edge ov002 funcs

All were wave-23 rejects (≥0x109c, intermediate pools). Each: `--classify-data`
clean (0 REFUSE), `--whole-function` byte-identical first attempt.

| size | func | words | pool |
|------|------|-------|------|
| 0x1e98 | func_ov002_0225ee48 | 1958 | intermediate |
| 0x1ae0 | func_ov002_0228df3c | 1720 | intermediate |
| 0x1a18 | func_ov002_0229ade0 | 1670 | intermediate |
| 0x1668 | func_ov002_0227f03c | 1434 | intermediate |
| 0x1560 | func_ov002_02267fd4 | 1368 | intermediate |
| 0x1398 | func_ov002_0223e21c | 1254 | intermediate |
| 0x135c | func_ov002_02288aa0 | 1239 | intermediate |
| 0x130c | func_ov002_021aa558 | 1219 | intermediate |
| 0x12b8 | func_ov002_021b6600 | 1198 | intermediate |
| 0x1294 | func_ov002_02276bb8 | 1189 | intermediate |
| 0x1294 | func_ov002_02281d78 | 1189 | intermediate |
| 0x109c | func_ov002_021e797c | 1063 | intermediate |

**This drains the entire uncarved above-edge ov002 ARM tier** (exactly 12 funcs
≥0x109c; 0 Thumb). Scaffolder `.s` total: **≈287** (was ≈275 post-wave-23).

## Remaining limits

- **Thumb intermediate pools** are NOT exercised here (0 of the 12 are Thumb;
  the project's Thumb large-func cohort is the separate pending Thumb-emitter
  brief). The emitter inserts `.align 2` at each pool-run start when `thumb`,
  but a Thumb intermediate pool's pre-pool halfword padding is unverified — the
  byte-verify gate would REFUSE any mis-emission, so it fails safe.
- **Unreferenced pool words** (a pool word reached by no in-function load) would
  still leak as `....` and fail at assemble — by design, loud not silent. None
  observed in the 12 ships.
- The verifier compares relocated words by symbol NAME (addend stripped); an
  interior-offset pool word (`symbol+N`) is caught earlier by the brief-406
  `--classify-data` OFFSET REFUSE, not here.

## Verification

| gate | result |
|---|---|
| unit tests `tests/test_asm_escape.py` | 43 passed (36 + 7 new: intermediate-pool emit + diff_words pool guard) |
| negative test red→green | corrupted pool word flagged by `diff_words`; RED against pre-418 tolerance (monkeypatch) + end-to-end ❌ on a real func |
| `--whole-function` on 12 above-edge funcs | 12/12 byte-identical (first attempt) |
| `--classify-data` on 12 | 0 REFUSE |
| trailing-pool regression | small trailing-only funcs (0x90) still ✅; 0 instrs after pool |
| EUR `ninja sha1` (12 carves added) | **OK** — `gx-spirit-caller_eur.nds: OK` (clean baseline `OK` first; reconfigured at origin/main + 12 carves) |
| overlap audit | 0 overlaps across 1375 `.text` intervals (1363 → 1375 = +12) |

**Build note for the brain:** concurrent-worktree builds **deadlock the shared
wineserver** when both the scaffolder and the decomper spawn parallel wine jobs
(a default-`-j` `ninja sha1` hung ~18 min with no progress). Serialising with
`ninja -j1 sha1` cleared it. This is the same class as the brief-417
"11 parallel wine jobs" artifact — cap concurrent wine across worktrees.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
