[//]: # (markdownlint-disable MD013 MD041)

# Brief 541 — ov004/ov006/ov011 wall autopsy

**Status:** brief 541 (2026-07-06), wine-free (no `batch_carve`/gates — no
contention with the scaffolder's active ov002 drain). Brief 537's census
flagged `ov004` (2 uncarved), `ov006` (13 uncarved), `ov011` (0 uncarved)
as "100% kind:data C-absorbed walls." This brief autopsies every one of
those ~15 residual USA/JPN functions individually to confirm the class
is genuinely unrecoverable, or find an unlock.

## Verdict

**Confirmed: all 15 residual functions are genuinely `C-absorbed` under
the tool's current capability.** `ov011` has 0 uncarved (already fully
drained — nothing to investigate). `ov004`'s 2 and `ov006`'s 13 are a
clean **permanent-skip** for the mechanical drain campaign as it stands
today.

**But also: cracked open a scoped, testable unlock path.** Every one of
the 15 functions' C-absorbed refs resolve to a **small, clean
`base_symbol + constant_offset` relationship** — none hit the harder
`OFFSET` or `MISADDRESSED` verdicts. Brief 406 flagged "`.word base+off`
emission" as a theoretical (never-implemented) alternative to a bundle
split; this brief **prototyped it** in `tools/asm_escape.py` behind a new
opt-in flag (`--allow-absorbed-offset`), with 12 new pure-Python unit
tests (58/58 `test_asm_escape.py` pass, full suite 2452 pass). It is
**not verified against the real mwasmarm assembler** — that needs one
wine-based test this wine-free session couldn't run. See "Next step" below.

## Method

1. `ninja delink` (native `dsd`, wine-free) for USA and JPN to get the
   `_dsd_gap@*.o` objects `asm_escape --classify-data`'s B-gap check reads.
2. Enumerated the exact uncarved set per module/region directly from
   `symbols.txt` + `delinks.txt` (same method as briefs 537/539) —
   confirmed **identical function lists, addresses, and sizes between
   USA and JPN** for all three modules (so 15 distinct functions cover
   both regions, not 30).
3. Ran `asm_escape.py --classify-data --version usa <func>` for all 15
   and manually read every absorbing bundle `.s`/`.c` file's raw bytes to
   understand the *shape* of each absorption (not just trust the verdict
   string).

## Per-function classification

### `ov004` (2 functions)

| Func | Size | C-absorbed ref | Base (linkable) | Offset |
|---|---:|---|---|---:|
| `func_ov004_021d3d04` | 184 | `data_ov004_02209d28` | `data_ov004_02209d24` | `+0x4` |
| `func_ov004_021d4d2c` | 504 | `data_ov004_02209d28` (same) | `data_ov004_02209d24` | `+0x4` |

Both blocked by the exact same absorbed symbol. The base bundle
(`data_ov004_02209d24.c`) is a 16-byte, brief-174-generated 4-word array;
decoding the bytes, words 1-3 spell the NUL-padded ASCII string
`"game_level\0\0"` starting at the absorbed offset — i.e. the "bundle" is
mechanically-generated (`cluster_b_bundle_gen.py`'s "first 4-aligned
named symbol" heuristic), not a meaningful single C object; the absorbed
symbol is a genuine, independently-addressable string constant that just
never got its own delinks entry.

### `ov006` (13 functions)

All 13 confirmed `C-absorbed`, funneling through only **7 distinct base
symbols** (one base alone blocks 6 of the 13 functions):

| Base symbol | Absorbed symbol(s) (offset) | Functions blocked |
|---|---|---:|
| `data_ov006_021cdbe8` | `+0xc` | 1 |
| `data_ov006_021cca68` | `+0x280` | 1 |
| `data_ov006_021cc5ac` | `+0x12c` | 1 |
| `data_ov006_021ce530` | `+0x258` | **6** |
| `data_ov006_021ce9e4` | `+0xc` | 2 |
| `data_ov006_021cea2c` | `+0x1` (odd/unaligned — see note) | 1 |
| `data_ov006_021ceae4` | `+0x2`, `+0x6`, `+0x24a` (3 distinct) | 3 |

Full per-function detail:

| Func | Size | C-absorbed ref(s) |
|---|---:|---|
| `func_ov006_021bbfc0` | 912 | `021cdbf4` = `021cdbe8+0xc` |
| `func_ov006_021bc350` | 1848 | `021ccce8` = `021cca68+0x280` |
| `func_ov006_021bcdd0` | 2016 | `021cc6d8` = `021cc5ac+0x12c` |
| `func_ov006_021c7858` | 932 | `021ce788` = `021ce530+0x258` |
| `func_ov006_021c7c54` | 380 | `021ce788` = `021ce530+0x258` |
| `func_ov006_021c81a0` | 2248 | `021ce788`=`021ce530+0x258`; `021ce9f0`=`021ce9e4+0xc` |
| `func_ov006_021c8d8c` | 264 | `021ce788` = `021ce530+0x258` |
| `func_ov006_021c90d4` | 2536 | `021ce788` = `021ce530+0x258` |
| `func_ov006_021c9b48` | 172 | `021ce788` = `021ce530+0x258` (only ref) |
| `func_ov006_021c9bf4` | 460 | `021ce9f0`=`021ce9e4+0xc`; `021cea2d`=`021cea2c+0x1` |
| `func_ov006_021c9df0` | 872 | `021ceaea`=`021ceae4+0x6`; `021ced2e`=`021ceae4+0x24a` |
| `func_ov006_021ca158` | 316 | same two refs as `021c9df0` |
| `func_ov006_021ca5e8` | 880 | `021ceae6`=`+0x2`; `021ceaea`=`+0x6`; `021ced2e`=`+0x24a` (all base `021ceae4`) |

**The bundles have two distinct real shapes**, confirmed by reading the
raw bytes, not just the tool's verdict:

- `data_ov006_021ce530` (blocks 6 funcs): a **regular 2-element array** —
  `021ce788 - 021ce530 == 021ce9e0 - 021ce788 == 0x258` exactly. The
  "Cluster C Pattern 3" generator emitted the whole 1200-byte range as
  one TU because it couldn't (or wasn't asked to) recognize the repeat;
  byte-for-byte the second 0x258 block mirrors the first's structure and
  external-symbol reference order.
- `data_ov006_021ceae4` (blocks 3 funcs, brief-185 byte-granular bundle):
  irregular — offsets `+0x2`, `+0x6`, `+0x24a` are NOT evenly spaced (a
  2-byte header, a small sub-table, then a big gap to a much later
  field) — this one's comment explicitly says the extent was chosen by a
  size-cap/`max_inner_symbols` heuristic, not a recognized repeating type.
- `data_ov006_021cea2c`'s absorbed symbol sits at **`+0x1`** — an
  odd/unaligned offset. A relocation's addend is just an integer added to
  a base address, so this isn't a technical blocker for the "`.word
  base+off`" idea, but it means whatever field this is (likely a raw byte
  inside a packed struct) is unusually fine-grained for a would-be bundle
  split — a data point favoring the offset-emission approach over
  re-carving for this specific one.

### `ov011` (0 functions)

Already fully drained (0 uncarved, both regions, confirmed both at brief
537 and freshly here) — nothing to autopsy.

## Why this is the brief-406 "detected, not shippable" class exactly

Brief 406's own harness doc predicted this outcome precisely: "Class C is
detected, not yet shippable: a C-verdict func needs either a bundle split
… or `.word base+off` emission." Every one of these 15 functions matches
that description exactly — none hit `OFFSET` (an *interior pool-word*
target the emitter can't safely represent at all, brief 406's genuinely
unsupported case) or `MISADDRESSED` (a config defect). They're **the
same specific sub-case**: a real, addressable data object with no
individual carve entry, absorbed into a coarser sibling's TU.

Neither the brief-474 self-reloc class (a function's own literal pool
pointing at itself — a *comparator* bug, already fixed) nor the brief-477
boundary-overrun class (`parse_objdump` swallowing adjacent named symbols
— a *parser* bug, already fixed) apply here: these 15 functions parse and
classify cleanly; the block is a genuine, correctly-detected link-time
gap, not a tooling defect in either of those two senses. The brief-526
module-name class is a `port_to_region.py` (porter) issue and doesn't
apply to `asm_escape --whole-function`'s carve-only path at all.

## The prototype: `.word base+offset` emission

`tools/asm_escape.py` changes (additive, opt-in, zero effect on any
existing default code path):

1. `classify_data_refs()` now exposes `base` / `base_addr` / `offset` as
   explicit dict keys on every `C-absorbed` verdict (previously only
   embedded in the human-readable `note` string).
2. New pure helper `resolve_absorbed_substitutions(verdicts)`: given a
   verdict list, returns `{absorbed_sym: "base+0xN"}` for every
   C-absorbed ref IF every other bad verdict present is *also*
   C-absorbed (returns `None` if an `OFFSET`/`MISADDRESSED`/unconfirmed
   `B-gap` is mixed in — this fix doesn't address those).
3. `emit_asm()` takes a new optional `absorbed_subs` dict; a pool word
   whose reloc symbol is a key in that map gets the substituted
   `base+0xN` expression instead of the bare (unlinkable) symbol name.
4. `generate_whole()` and the CLI gain `--allow-absorbed-offset`
   (default off): only when passed, a C-absorbed-only REFUSE is retried
   with the substitution instead of failing immediately.
5. **12 new unit tests**, all pure-Python (no build): the substitution
   logic against synthetic verdicts (including the *exact* multi-ref
   shapes seen in `func_ov006_021c81a0`/`021c9bf4`/`021ca5e8` above), and
   `emit_asm`'s pool-word rewrite (including a no-op-when-unrelated
   safety check). `58/58 test_asm_escape.py`, full suite **2452 passed,
   6 skipped**.

### What is NOT verified — the honest gap

**Whether `mwasmarm` actually accepts `symbol+constant` syntax inside a
`.word` directive is UNKNOWN.** This is standard, common assembler
syntax (and ELF relocations inherently carry a symbol+addend pair, so
there's a real mechanism for it to resolve through), but this wine-free
session could not invoke `mwasmarm` even once to confirm it, and no
existing `.s` file in the tree uses this pattern as precedent. **Do not
trust `--allow-absorbed-offset` for a real ship without first**:

```bash
python tools/asm_escape.py --whole-function --allow-absorbed-offset \
    --version usa func_ov006_021c9b48 --out /tmp/test.s
# func_ov006_021c9b48 is the simplest candidate: ONE C-absorbed ref, no
# other data refs at all, mid-size (172B) — the cleanest first probe.
```

If that assembles + byte-verifies (the tool's own `bytes_match` check
inside `generate_whole` proves or disproves it in one shot — no manual
hex comparison needed), the other 14 are the same mechanism at different
offsets and should follow; if it fails, the assembler doesn't support
the syntax and the only remaining path is a real bundle split (re-carve
`data_ov006_021ce530` as two 0x258 TUs, etc. — mechanically
straightforward for the regular-array cases, harder for the byte-granular
`021ceae4` bundle).

## Recommendation for the drain work order

**Keep `ov004`/`ov006`/`ov011` on the SKIP list in
`usajpn-drain-workorder.md` as-is for now** — the verdict doc doesn't
change the campaign's near-term math (15 functions is a rounding error
against ov002's ~2,900 remaining). The `--allow-absorbed-offset` probe
above is a **5-minute, wine-required, single-candidate check** worth
running whenever the scaffolder's wine lane is next idle between drain
waves — if it works, all 15 unlock for free; if not, no time was lost
and the SKIP stands confirmed.

## Verification

| Check | Result |
|---|---|
| `ninja delink` (USA, JPN) | wine-free, ~4-5s each |
| 15/15 residual functions individually classified | all `C-absorbed`, no `OFFSET`/`MISADDRESSED` |
| USA vs JPN function lists/addresses/sizes | identical for all 3 modules |
| `tests/test_asm_escape.py` | 58 passed (12 new) |
| full `tests/` suite | 2452 passed, 6 skipped |
| `docs/tools-index.md` | regenerated (pre-existing staleness from 2 earlier-brief tools never indexed — unrelated byproduct fix, not from this brief's code change) |
| wine/`ninja sha1` | **not run** — wine-free brief by design; see "Next step" |
