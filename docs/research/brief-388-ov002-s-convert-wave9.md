[//]: # (markdownlint-disable MD013 MD041)

# Brief 388 — ov002 reg-alloc → `.s`, upper-half wave 9 (Windows lane)

**Brief:** 388 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–8 (= 64 ships). `asm_escape --whole-function` each, gate on
3-region `ninja sha1`. Target ~8. Flag if my half thins.

## Headline — 8 upper-half `.s` shipped + fixed a build-breaking merge conflict on `main`

**8 byte-exact upper-half ov002 `.s` shipped, 3-region `ninja sha1` green.** But
first: **`origin/main`'s `ov002/delinks.txt` had committed git merge-conflict
markers** that broke `dsd dis` (and the build) — found and resolved as part of
this wave. Details below.

## ⚠️ Fixed: conflict markers committed to `ov002/delinks.txt` on `main`

`dsd dis` failed with `expected file path to end with ':'` at
`ov002/delinks.txt:5230`. The cause: literal **`<<<<<<< HEAD` / `=======` /
`>>>>>>> origin/main`** markers (lines 5230/5271/5304) committed into the file —
a botched merge of two concurrent ov002 PRs:

- **HEAD side** (10 entries): the decomper's **lower-half** wave (`021b085c`,
  `021b8ecc`, `021b9b64`, `021d81d4`, `021d90c0`, `02200084`, `02200400`,
  `022032f0`, `022056ac`, `0220a7f0`).
- **origin/main side** (8 entries): my **wave-8 upper-half** ships (`0223b584` …
  `0228deac`).

The two sides are **non-overlapping** (different address halves) and **both** have
their `.s` files committed — so the correct resolution is to **keep both** (remove
only the 3 marker lines). Verified: 0 duplicate `.s` delink entries after the fix,
all 18 `.s` files present, `dsd dis` clean (592 ov002 gap files), 3-region
`ninja sha1` green. **FLAG for the brain:** concurrent ov002 PRs both append
delink blocks near the same region; the auto-merge conflicts and the resolution
must keep both — a future merge should `git checkout --theirs`+`--ours` union, not
leave markers.

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl |
|---|---|---|
| `02244cd8` | 0x54 | 1 |
| `02239934` | 0x58 | 2 |
| `02242e50` | 0x58 | 1 |
| `02248434` | 0x58 | 1 |
| `02249398` | 0x58 | 1 |
| `0224cbfc` | 0x58 | 1 |
| `0223b468` | 0x5c | 1 |
| `0223832c` | 0x60 | 2 |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss`. No byte-pack.

## The `kind:bss` check dropped 3 this wave (25% in the 0x50–0x60 band)

`02253638` (→`data_ov002_022cad34`), `0225368c` and `022536e8` (both
→`data_ov002_022cad38`) verified byte-exact but reference **`kind:data`** symbols
→ would fail the link gate. Dropped all 3. The non-bss-data rate is **higher in
the larger (0x50–0x60) funcs** (3/12 = 25%, vs ~1/13 for ≤0x4c) — they touch more
data — so the `kind:` grep is even more load-bearing as we move up the size band.

## Thinning watch — NOT thinning; extending to ≤0x60 opens 98 candidates

The upper-half `≤0x4c` pool is down to ~15, but extending the size filter to
**≤0x60** (most ov002 walls are 0x48–0x60) reveals **98** non-arg-pack
non-byte-pack uncarved candidates. That's **~10 waves** of upper-half runway. The
tier is healthy; the move from this wave on is to enumerate at ≤0x60.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`
**and −3 conflict-marker lines** (the repair). No main/USA/JPN change. Running
total scaffolder reg-alloc `.s`: 8×9 = **72** (main 17, ov002 55).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
