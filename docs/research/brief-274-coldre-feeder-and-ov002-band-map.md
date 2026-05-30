[//]: # (markdownlint-disable MD013 MD041)

# Brief 274 — m2c cold-RE feeder + the ov002 0x200-0x400 band map

**Status:** the feeder is productionized (`tools/m2c_feed.py` +
`tests/test_m2c_feed.py`); the ov002 0x200-0x400 band (260 funcs) is
sub-clustered with a structural sibling-context + type map. decomp.me /
research / tools only — no SHA1, no `.c` shipped. Fetched content treated
as data.

## (A) The feeder — `tools/m2c_feed.py` (one command)

Brief 272 documented the objdump→GAS recipe; this brief ships it. The
decomper's cold-RE loop is now:

```bash
python tools/m2c_feed.py --version eur func_ov002_021aa4a0 > f.s
m2c.py -t arm-mwcc-c -f func_ov002_021aa4a0 f.s   # comprehension draft
```

- Input: a `func_…` name, a hex address, or `--obj <gap.o> --func …`.
- ARM vs Thumb **auto-detected** from `symbols.txt` (`$t`/`$a`
  mapping-symbol fallback); Thumb gets `.syntax unified` + `.code 16` +
  `.thumb_func`.
- pc-relative pool loads resolve to `ldr rX, =symbol` (so m2c names the
  global, not `M2C_ERROR($pc)`); objdump reloc/`@` noise stripped; a code
  label is folded only if its address is a real data word (a `bl`/branch
  with a reloc keeps its label).
- **Fails loudly, not silently** (the brief's explicit ask): unknown
  target / undefined func / empty function → exit 1; objdump missing →
  exit 2; an **address ambiguous across overlapping overlays** (gotcha
  18) → exit 1 listing the candidates (`--module ov002` disambiguates).
  `tests/test_m2c_feed.py` (18 cases) covers each, incl. a negative test
  that reds if the empty-function guard is removed.

Validated end-to-end (dogfooded) on ARM + Thumb funcs this session — see
the type-map excerpts below, all produced through this tool.

## (B) The ov002 0x200-0x400 band — what the decomper is walking into

**260 unmatched funcs, ~0x2c61c (181 KB).** Size spread: 62 in
0x200-0x240, 54 in 0x240-0x280, then a tail to 0x400.

**Key fact that shapes the whole approach: ov002 is a COLD overlay —
0 of its functions are named, and the band calls 0 named symbols**
(project-wide only 91 funcs are named). So there is **no sibling-name
vocabulary to borrow** — the context is *structural*: a handful of
central globals + a handful of hub helpers that almost everything
shares. **RE the hubs + the central structs first; then the 260 band
funcs read cleanly.**

### The Rosetta Stone — RE these hubs FIRST

~30 ov002 helpers are each called by 12-64 band funcs, and **almost all
are <0x200** (quick to RE — below the band, but they unlock it):

| Hub | band-callers | size | inferred role (from m2c) |
|---|---:|---|---|
| `func_ov002_021ae400` | 64 | 0x30 | gated trigger: `if (!flag[idx]) dispatch(0x31, a)` |
| `func_ov002_022593f4` | 38 | 0x2c | small accessor |
| `func_ov002_021b9ecc` | 37 | 0x168 | — |
| `func_ov002_021e2c5c` | 33 | 0x78 | — |
| `func_ov002_021e2b3c` | 33 | 0x98 | — |
| `func_0202e234` | 30 | 0x24 | main-module leaf helper |
| `func_ov002_021bc618` | 28 | 0x74 | — |
| `func_ov002_0223de94` | 27 | 0x60 | — |
| `func_ov002_021e286c` | 27 | 0x48 | — |
| `func_ov002_021ca2b8` / `021af9d0` | 24 | <0x200 | — |

Three hubs are big dispatchers (RE later, pair with dsd-ghidra):
**`func_ov002_0229ade0`** (0x1a18, 29 callers — the central
**event dispatcher**, called `(code, …)`), `func_ov002_02290500`
(0x79c, 21), `func_ov002_0229c7f8` (0x510, 13). The full ≥12-caller hub
list is in the appendix.

### Type map — the central duel-state (from m2c, via the feeder)

The band partitions by which central global it touches. m2c recovers
their access shapes:

- **`data_ov002_022cf16c` / `…022cf1a6` — per-player state table (141
  funcs, 54 % of the band).** Indexed `(player & 1) * 0x868` — this is
  the **C-39f `0x868`-table family** (gotcha 14: the index needs the
  explicit `& 1`). The dominant struct; 0x868-stride per player.
- **`data_ov002_022d016c` / `…022d0650` — entity/card list (41 funcs).**
  m2c shows 8-byte nodes walked as a linked list (`node->unk0`,
  `->unk2`, `->unk6`; `node = base + idx*8`).
- **`data_ov002_022cd744` — flag/"done" array (56 funcs).** `int[]`
  indexed by id; the `021ae400` hub guards on it.
- **`data_ov002_022ce288` (16 funcs)** + `data_ov002_022cd73c` (12) —
  secondary state / utility buffers.

Worked example (the feeder → m2c, unedited):

```c
/* func_ov002_021ae400 — the 64-caller hub */
void func_ov002_021ae400(s32 arg0, ? arg1) {
    if (*(&data_ov002_022cd744 + (arg0 * 4)) != 0) return;
    func_ov002_0229ade0(0x31, 0, arg1, 0);   /* central event dispatcher */
}
```

### Clusters (open each pick with this context)

| Cluster | central global | n | shared hubs | character |
|---|---|---:|---|---|
| **A** | `022cf16c` | 141 | `021ae400`, `021b9ecc`, `021e2b3c`, `021e2c5c`, `022593f4` | per-player duel-state core |
| **B** | `022d016c` | 41 | `021ae400`, `022593f4`, `021af9d0`, `0225935c` | entity/card-list ops |
| **C** | `022ce288` | 16 | `021ae400`, `021af9d0`, `021afb74`, `021e286c` | secondary state |
| **D** | `022cd73c` | 12 | `func_0207f05c`, `func_02006194`, **`Copy32`** | utility / buffer-copy (calls main mem helpers) |
| **E** | `022cf1a4` | 3 | `021b9ecc` | small |
| **IND** | (none) | 47 | `func_02037208`, `func_02006c0c`, `func_02006e1c`, `func_0201d47c` | self-contained logic calling **main-module** gfx/system helpers |

Clusters A/B/C/E are the duel-state core (share the ov002 hubs); D is
buffer utility (`Copy32` etc.); **IND calls main-module services**
(`func_0203xxxx` gfx, `func_0200xxxx` system) and is the most
self-contained — a good early-confidence target.

### Easy-start picks for brief 275

Lowest context dependency → fastest first matches + velocity calibration:

- **5 leaf funcs (no `bl`, pure compute):** `func_ov002_022a60f4`
  (0x230), `func_ov002_022bc2b4` (0x248), `func_ov002_021b78b8` (0x300),
  `func_ov002_02299d34` (0x318), `func_ov002_021b947c` (0x358). No call
  context needed — m2c gives the whole algorithm.
- **Smallest IND funcs (self-contained, named-ish main callees):**
  `func_ov002_0227ee34` (0x208), `func_ov002_0229f57c` (0x20c),
  `func_ov002_022ae7b4` (0x20c), `func_ov002_022a68ec` (0x210).

### Recommended brief-275 order

1. **RE the Rosetta-Stone hubs first** (the ~30 small <0x200 helpers,
   esp. `021ae400` / `022593f4` / `021bc618` / `0223de94`). Each is a
   quick match AND names a verb used 12-64× across the band — the
   highest-leverage work. (These are below the 0x200 band but are the
   key to it; count them toward velocity.)
2. **Then the leaf + IND easy-starts** (above) — build confidence +
   calibrate cold-RE minutes/pick vs the recipe drains.
3. **Then drain Cluster A** (the 0x868 per-player table family — gotcha
   14 `& 1` applies) using the now-named hubs + the type map.
4. Defer the 3 big dispatchers (`0229ade0` etc.) to a dsd-ghidra pass.

## Falsification / how to check these claims

- The feeder: `python tools/m2c_feed.py --version eur <func>` emits a
  `.s` that `m2c -t arm-mwcc-c` parses; the 18 tests + the negative
  empty-input test gate it. Run on `func_ov002_021ae400` → the hub C
  above.
- "Cold overlay": `grep -c 'kind:function' config/eur/.../ov002/symbols.txt`
  vs the non-`func_ov002_` count → 0 named.
- The hub leverage: `tools/find_callsites.py func_ov002_021ae400` → 64
  callers; RE'ing it names them all.
- The 0x868 table: m2c on any Cluster-A func shows
  `(player & 1) * 0x868 + &data_ov002_022cf1a6` (the C-39f family).

## What did NOT pan out

1. **"Borrow names from adjacent matched ov002 funcs."** There are none
   — ov002 is fully cold. The band map pivots to *structural* context
   (hubs + central structs + inferred roles) instead, which also yields
   a better RE *order* (hubs first).
2. **Cross-module named callees as a type source.** The band calls 0
   named symbols (only 91 funcs are named project-wide). The main-module
   callees IND leans on (`func_0203xxxx` etc.) are themselves
   placeholders — useful as *grouping* signal, not names.

## Scope

`tools/m2c_feed.py` + `tests/test_m2c_feed.py` + this band map + the
tool-index entry (match-acceleration). No `.c`. The C-23-MMIO cohort
(brief 273) is untouched. m2c remains the deliberate local clone from
brief 272 (no install script piped to a shell).

## Appendix — full ≥12-caller hub list

`021ae400`(64) `022593f4`(38) `021b9ecc`(37) `021e2c5c`(33)
`021e2b3c`(33) `0202e234`(30) `0229ade0`(29,0x1a18) `021bc618`(28)
`0223de94`(27) `021e286c`(27) `021ca2b8`(24) `021af9d0`(24)
`0227adb8`(22) `0223df38`(22) `02290500`(21,0x79c) `022592ec`(21)
`021d479c`(21) `021d59cc`(19) `0225368c`(18) `0225935c`(17)
`0202b878`(17) `0226b054`(16) `0225764c`(16) `021bc6c4`(16)
`021e276c`(15) `021afb74`(15) `0202e2f8`(15) `0227ac64`(14)
`0229c7f8`(13,0x510) `021b3ecc`(13) `021b0c04`(13) `021ae484`(13)
`02037208`(13) `0202b8a8`(13) `02257b48`(12) `021e27c0`(12)
`0202b8c0`(12). (`02xxxxxx` = main-module helpers.)

## Cross-references

- `docs/research/brief-272-track2-coldre-accelerator-pilot.md` — the m2c
  validation + the converter recipe this productionizes.
- `tools/m2c_feed.py` / `tests/test_m2c_feed.py` — the feeder + tests.
- `tools/scratch_bundle.py`, `tools/m2ctx.py`, `tools/find_callsites.py`
  — the existing context tooling the cold-RE loop pairs with.
- `docs/research/recipe-gotchas.md` — gotcha 14 (`0x868` table `& 1`),
  gotcha 18 (overlay-overlap address ambiguity, why the feeder needs
  `--module`).
