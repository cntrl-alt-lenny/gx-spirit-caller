[//]: # (markdownlint-disable MD013 MD041)

# Brief 389 — ov002 `.s` lower-half wave 3 (+ a durable fix for the delinks collision)

**Brief:** 389 (decomper). Wave 3 of the ov002 lower-half `.s` drain (waves 1+2 =
briefs 385/387, PRs #909/#911). **Primary deliverable: stop the recurring
`delinks.txt` merge collision** between the two `.s` lanes (decomper lower half,
scaffolder upper half). Then continue the lower-half drain. `asm_escape
--whole-function`; gate 3-region `ninja sha1`. Windows lane.

## Result

- **The collision is fixed durably** — `tools/sort_delinks.py` canonicalises
  `ov002/delinks.txt` into address order so each lane's carve blocks land in
  **disjoint line regions** (decomper low, scaffolder high). A 3-way git merge of
  the two lanes' PRs now auto-resolves instead of leaving conflict markers.
- **18 ov002 lower-half functions shipped as byte-exact `.s`** (target ~8) —
  3-region `ninja sha1` (EUR / USA / JPN) all `OK`.

## The headline: why this kept breaking, and the durable fix

### Root cause

`main` was broken twice (briefs 387, 388) by **unresolved git conflict markers
committed into `config/eur/arm9/overlays/ov002/delinks.txt`**. Both `.s` lanes
add their carve blocks by **appending to the end of the same file**, so every
co-merge of a decomper PR and a scaffolder PR collides on the same end-of-file
lines. `dsd delink` then aborts (`expected file path to end with ':'`) and
nobody can build.

### Can dsd read multiple delinks files per overlay? — No.

I tested whether we could just give each lane its own file:

| Attempt | `config.yaml` `delinks:` value | Result |
|---|---|---|
| YAML list | `[overlays/ov002/delinks.txt, …decomper.txt]` | dsd **panics** (it deserialises a `String`, not a sequence) |
| Directory | `overlays/ov002` | `Error: Access is denied. (os error 5)` — it opens the path as a file |
| CLI flag | `dsd delink --help` | only `--config-path`; no glob/include/dir option |

So `dsd` reads **exactly one** `delinks.txt` per overlay. A per-lane file split
is not possible without patching dsd. → Use the brief's stated fallback:
**address-sorted insertion.**

### The fix — `tools/sort_delinks.py`

The two lanes split ov002 by address (decomper `addr < 0x02234000`, scaffolder
`≥`). If the file is kept **sorted by address**, the decomper's blocks always sit
in the low part of the file and the scaffolder's in the high part — **different
line ranges** — so git 3-way-merges the two PRs cleanly. (dsd does not care about
block order, so this is pure source-control hygiene; verified by a green
3-region build on the reordered file.)

`sort_delinks.py`:

- Preserves the leading section-map header untouched.
- Sorts TU blocks by their first `start:0x…` address; each block keeps its
  **exact text** (only order changes).
- Has a **lossless-parse assertion** (header + blocks re-joined in original order
  must reproduce the input byte-for-byte) so it can never silently drop/mangle a
  block.
- Is **idempotent** — re-running on a sorted file is a no-op.

One-time canonicalisation of `ov002/delinks.txt`: **298 inversions → 0**, same
1187-block set, symmetric diff (lines moved, none added/removed).

### Discipline for BOTH lanes (scaffolder: please adopt)

After carving (append your block anywhere — the end is fine), run **before
committing**:

```sh
python tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt
```

That's it. Both lanes sorting → identical canonical order for shared blocks, so
only each lane's *new* blocks differ, and they differ in disjoint regions →
auto-merge. **One-time transition cost:** this PR reorders the whole file, so any
in-flight scaffolder branch will need a rebase onto the sorted file (carves
re-applied + `sort_delinks.py` re-run). After that, the collision class is gone.

## The 18 ships (wave 3)

Uncarved lower-half reg-alloc / plateau-class leaves, each `asm_escape
--whole-function`-verified byte-identical vs the delinked gap `.o` and screened
free of `kind:data` externs.

| function | size | function | size | function | size |
|---|---|---|---|---|---|
| `func_ov002_021b4354` | 0x50 | `func_ov002_0220aeb0` | 0x50 | `func_ov002_02222624` | 0x50 |
| `func_ov002_021bff00` | 0x50 | `func_ov002_0220b044` | 0x50 | `func_ov002_021ae430` | 0x54 |
| `func_ov002_021ca3f0` | 0x50 | `func_ov002_0220c980` | 0x50 | `func_ov002_021b1200` | 0x54 |
| `func_ov002_021de4d8` | 0x50 | `func_ov002_0221bdb0` | 0x50 | `func_ov002_021b27a4` | 0x54 |
| `func_ov002_0220337c` | 0x50 | `func_ov002_022047f0` | 0x50 | `func_ov002_021b3c5c` | 0x54 |
| `func_ov002_02204ab8` | 0x50 | `func_ov002_02207e18` | 0x50 | `func_ov002_021b3d7c` | 0x54 |

Wiring = the ov002 convention: `.s` under `src/overlay002/`, carve in
`config/eur/.../ov002/delinks.txt` (`end = addr + symbols.txt size`), now placed
in sorted position by `sort_delinks.py`. EUR-only baseline; USA/JPN keep them in
the gap → byte-identical for free.

## Method + screen

Enumerated uncarved lower-half (`addr < 0x02234000`) ov002 gap funcs ≤0x80 →
**296 candidates** (excluding the 5 known-bad from prior waves: `0222ceac`
asm-gap, `021bc6e8` kind:data, `021d8184`/`021e2cd4` argpack, `021aff4c`
bytepack). `asm_escape`-batched the smallest 18 → **18/18 verified**, **0
kind:data**. Shipped all 18.

## Runway (not thinning)

After waves 1+2+3 (**38 lower-half ships**), **296 uncarved ≤0x80 lower-half
candidates remain** (and far more above 0x80). Many waves of runway.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**. Sorter validated by a green
EUR build on the reordered (pre-carve) file.
