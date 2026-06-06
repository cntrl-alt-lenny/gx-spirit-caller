[//]: # (markdownlint-disable MD013 MD041)

# Brief 357 — main easy-tier wave 5 (tri-compile)

**Brief:** 357 (scaffolder, co-drain). main is still not thinning (~305 easy
candidates `≤0x40` at a steady ~50–55% tri-compile yield). Continue the `<0x80`
simple cohort; **tri-compile every candidate** (`tools/verify.py --cc all`);
always try all three tiers (last wave sp2p3 dominated). Route endgame residue out
of the way (canonicalisation → `asm_escape.py` `.s`; reg-choice → permuter). Per-
pick gate = EUR objdiff 100%. Target ~12–15. Branch `scaffolder/main-wave5`.

## Headline — 16 picks (above target)

**16 shipped**, all EUR objdiff 100%, all drop out of a clean re-delink, and EUR
`ninja sha1` PASSES (main `complete` 1704 → 1720). The yield held at ~50% even as
the cohort moved off the now-drained 0x2c tier into the **0x30 tier** — the
first-pass shape rate drops a little there, but the recurring shape *families*
(out-param queries, `&&`-chains, comparators, call-sequences) still match across
all three compilers.

## The 16 picks by compiler tier

| tier | suffix | funcs |
|---|---|---|
| mwcc 2.0/sp1p5 | `.c` | `0201ab80` `0202c4e8` `02033828` `020342f0` `02052768` `020535a4` `020627a8` `02065f78` |
| mwcc 1.2/sp2p3 | `.legacy.c` | `02064d58` `02072414` `020727dc` `02075d44` |
| mwcc 1.2/sp3 | `.legacy_sp3.c` | `0204d438` `02054fd0` `02055000` `0205d504` |

Shapes: range-map over a call result (`0201ab80`), alloc→global-field store
(`0202c4e8`), stack-struct build (`02033828`), guarded `||` over two fields
(`020342f0`), call + 2-field store (`02052768`), bit-clear-via-helper
(`020535a4`), 3-call `&&`-guard chain (`020627a8`), reset-and-free (`02065f78`),
a record comparator with sign-extended tie-break (`02064d58`), a `&&`-valid-pair
predicate (`020727dc`), 2-subobject init (`02075d44`), byte-dispatch
(`0204d438`), an **out-param query clone pair** (`02054fd0`/`02055000`), and a
callback-driven query (`0205d504`, passes wave-3's `func_0205d534` as the
callback).

All 16: EUR objdiff 100% (direct, per-tier) · 16/16 clean re-delink drop-out ·
EUR `ninja sha1` OK.

## Recipes (new / refined)

- **`&~K` is the *inverse* of `|K`.** Wave 3 found `f()|K` as a call-arg needs a
  temp (`int v=f()|K; g(a0,v);`) to drop a redundant `mov`. Wave 5's `f()&~K`
  (`020535a4`) is the opposite — the **DIRECT** form `g(a0, f()&~K)` is correct,
  because the orig keeps `mov r1,r0; bic` (mwcc won't fuse `bic r1,r0,#K`). Pick
  temp-vs-direct by which the orig's first op is (fused `orr` → temp; separate
  `mov`+`bic` → direct).
- **sp3 stays common** (4/16); the out-param/`&local` query shapes
  (`02054fd0`/`02055000`/`0205d504`) are reliably sp3.

## Walls routed out (the brief's "don't grind", executed)

- **`||`-equality base+offset family → permuter/`.s` (recurring, 3 this wave).**
  `0202ef08` / `0202f59c` / `02031764` test a value against `BASE`, `BASE+K1`,
  `BASE+K2`. The orig CSEs the base into a reg and compares with `addne
  r1,base,#K`; mwcc **won't CSE the comparison base** — it loads each constant
  separately (count blows up, 16v12) or range-opts consecutive values away
  (7v12). No C form reaches the `addne` chain. Same class as wave-2 `02031794`.
  A clean candidate to batch through the permuter (or `asm_escape` once it
  tri-compiles).
- **reg/scheduling → permuter:** `02004fb8` (7-arg stack shuffle, 11v11),
  `0201a0e0` (table-base vs index-compute order), `0202147c` (global-load hoisted
  above the guard), `02037b04` (predication-vs-branch on the `<0` guard),
  `0203cb90` (range+table, 14v11).
- Loops skipped per brief; the varargs forwarder family (`020a978c` + siblings)
  stays deferred pending the `va_list` shim.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct, per-tier) | **16/16 byte-identical** |
| clean re-delink drop-out | **16/16** out of `_dsd_gap@main_*.o` |
| EUR `ninja sha1` | **OK** (full ROM byte-identical) |
| build routing | 8 → `mwcc` · 4 → `mwcc_legacy` · 4 → `mwcc_legacy_sp3` |
| `ruff` / `tests/` / `check_match_invariants` | clean / 2339 passed / 0 errors |

`src/main/` gains 8 `.c` + 4 `.legacy.c` + 4 `.legacy_sp3.c`; EUR
`arm9/delinks.txt` +16 `complete` (1704 → 1720). No USA / JPN change.

## Recommendation for the brain

1. **main still isn't thinning** — ~257 candidates `≤0x40` remain at a steady
   ~50% tri-compile yield; wave 6 is worth it (always `--cc all`).
2. **The `||`-equality base+offset family is now a clean batch** (4 known:
   `02031794`, `0202ef08`, `0202f59c`, `02031764`) — route them together to the
   permuter, or to `asm_escape` once `--c` tri-compiles (brief-355 follow-up).
3. Standing: the `va_list` shim (varargs family) and the legacy/sp3 re-sweep of
   the catalogued ov004/006/011 wall backlog remain queued.

## Cross-references

- `docs/research/brief-355-main-wave4-tri-compile.md` — wave 4 (routing +
  `asm_escape --c` 2.0-only finding).
- `tools/verify.py --cc all` — the tri-compile gate.
