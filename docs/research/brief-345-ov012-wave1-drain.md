[//]: # (markdownlint-disable MD013 MD041)

# Brief 345 — pivot to ov012: clean-C wave 1

**Brief:** 345 (scaffolder, co-drain). ov009 wave 1 (8 matched, #859) is at
target; its residue is reg-alloc coin-flips, so pivot to a fresh overlay rather
than a thin ov009 wave 2. Pick **ov012** (~12 funcs `<0x100`). Survey by
size-histogram but VERIFY clone families by reading seeds (the ov009 finding —
histogram pairs can be coincidental) and use `symbols.txt` sizes, not disasm
line-count. Full recipe library. Own `src/overlay012/` + the ov012 `delinks.txt`
+ a new `ov012_core.h`. Per-pick gate = EUR objdiff 100%; the brain runs the
3-region SHA1 on merge. Decomper is on ov014 — steer clear. Target ~6.

## Headline

**6 shipped (all `.c`), all EUR objdiff 100% + `ninja rom` OK — at target.**
6 of 9 attempts matched; the recipe library transferred to a **6th overlay**
(after ov006/005/015/021/003/009). ov012 is a map/board overlay (tile lookups,
panel transitions, a task spawner).

## Survey

21 gap funcs (12 `<0x100`, 5 `<0x80`). One size-histogram "clone" pair (0x98) —
**read it, coincidental again**: 021caea8 is a sprite builder, 021cbeb4 an init
sequence. So no clone-by-template; each pick stood on its own recipe. Sizes from
`symbols.txt` (`size=0x…`); the disasm line-count under-counts pool words (it
cost me four delink-range retries — banked the gotcha in the recipe memo).

## The 6 picks (by recipe)

| func | size | recipe |
|---|---|---|
| `021cbeb4` | 0xc0 | graphics-up **init** — clean call sequence (reload `data_cc6a0`, no base-bind) |
| `021ca2a0` | 0xa0 | task **spawner** — `struct{int w[6]}` copy + bind + uninit-default switch |
| `021cbf74` | 0xa8 | opening-transition **chooser** — control flow + `:4` nibble |
| `021ca3fc` | 0x54 | panel **open/close** — branch-tail-dup + hoisted base + `:4` nibble |
| `021c9d60` | 0x2c | suppress-**guard** + call (system-work bit 11 via the shift pair) |
| `021caf44` | 0x3c | single-slot **table scan** |

## Levers (re-proven + one new finding)

1. **`:4` bitfield struct → the shift pair** (`lsl#1c; lsr#1c`), not `and`. The
   low-nibble extract `((struct{unsigned f:4;}*)(p+off))->f` reproduces the orig
   exactly, where `(x<<28)>>28` **folds** to `and` and `x&0xf` emits `and`. The
   cleanest confirmation yet (used in three picks: 021ca3fc / 021cbf74 / 021ca2a0).
2. **Bind-vs-reload is per-global.** Bind `data_cc6dc` (referenced many times
   across calls → one callee-saved load), but leave `data_cc6a0` / `data_021040ac`
   as direct references — the orig **reloads** those each time. Match the orig's
   choice; don't over-apply the bind-struct-base lever.
3. **NEW — an intentionally uninitialised switch variable matches** when the orig
   leaves the register untouched in the unhandled path (`021ca2a0`: cases 0/1 set
   `sel`, the implicit default falls through with `sel` = whatever was in r5).
   Adding a spurious `default: sel = 0;` would diverge. Don't "fix" the latent UB.

## Deferred (attempted → Mac/permuter lane)

| func | best % | class |
|---|:---:|---|
| `021cc01c` | 80% | blx post-call register rotation (clean-tail idiom + array-index `++` fixed structure 76→80; r0/r1 rotation remains, = ov009 `021ad7d4`) |
| `021ca36c` | 32% | 2-mode tile lookup — 5-value register permutation + nested-`*32` address lowering (mwcc separates the shift vs folding it into the address add) |
| `021cb400` | 26% | 4-corner loop — heavy register-allocation divergence (spills to r11) |

Untried complex residue: `021caea8` / `021caf80` (the `func_0201e964` builder
family, stack-layout — same wall as ov003 `021cedf8`), `021ca18c` / `021cb320`
(byte-marshalling / jump-table-in-loop), `021c9e1c` / `021c9da0` (big / dense
stack-marshalling).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (per-unit + `report.json`) | **6/6 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled + linked, ROM written |
| ov012 `delinks.txt` | +6 `complete .text`; gap set 21 → 15 (−6, clean re-dis) |
| `check_match_invariants.py` | **0 errors** |
| `ruff check tools/ tests/` | clean |
| 3-region `ninja sha1` | deferred to the brain on merge (per brief) |

Pre-flight: branched from fresh `origin/main` (`fb464b1`, after #859/#860);
cleaned stale gaps + re-`dis`. Deferred near-misses removed from `delinks.txt`
and `src/` before the authoritative build. New `ov012_core.h` (reference only).

## Recommendation

ov012's clean small-function tier yielded **6 at target**. The remaining 15 split
into the three catalogued near-miss classes plus the builder/marshalling/big
bodies — all Mac/permuter material. A wave 2 would be thin; recommend the next
scaffolder wave pivot to another fresh overlay and route ov012's residue to the
permuter/m2c lane.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
