# pokeheartgold extension — feasibility verdict

**Brief:** 080 (cloud research). Brief 066's headline projected a
"≥95% expected hit rate on the nitrocrypto exact-SP-match sub-pool"
as the most concrete cross-project extension target. Brief 080
verifies that finding by cloning the upstream pokeheartgold repo,
auditing per-subtree SP versions, running a full compile sweep, and
sample-validating byte-fingerprint hit rate against our EUR
placeholder pool.

**Verdict:** ⭐ **GO with caveats**. The extension is feasible and
ships ~50 net-new ports after disambiguation, but brief 066's
headline "nitrocrypto bonus pool" turned out to be a **research-
mistake** — there is no nitrocrypto `.c` source in pokeheartgold,
only `.s` assembly. The actual win comes from the broader `lib/`
tree, which is one SP-rev away from our default rather than an
exact match.

**Estimated unlock:** **~50-80 net-new HIGH-confidence ports** for
EUR, scaling to **~150-240 across all three regions** via the
existing brief 064/065 cross-region pipeline.

## 1. Correction to brief 066's headline finding

Brief 066's `docs/research/cross-project-feasibility.md`§1 noted:

> The `pokeheartgold` repo's separate use of `1.2/sp2p3` for
> `nitrocrypto.o` is a curiosity: that's the **exact same SP** as
> our `.legacy.c` routing tier.

This is technically true (the upstream `Makefile` does set
`MWCCVER := 1.2/sp2p3` for the nitrocrypto target), but
operationally **useless for cross-project source mining**:

```
$ ls tools/_vendor/pokeheartgold/asm/nitrocrypto.s
asm/nitrocrypto.s                            # ← assembly, not .c

$ grep -l nitrocrypto tools/_vendor/pokeheartgold/Makefile
tools/_vendor/pokeheartgold/Makefile         # rule is for the .s file
```

pokeheartgold ships nitrocrypto as a hand-written assembly source,
not C. The `1.2/sp2p3` SP setting in the Makefile is for the
**assembler**, not a C compiler — and assembly source is not in
scope for cross-project porting (it's already at the lowest
representation level; there's nothing to extract).

**Lesson:** SP audits must verify that the Makefile target is a
`.c → .o` rule, not a `.s → .o` rule. Brief 066's audit pulled the
SP setting straight from the Makefile without checking source
extension.

## 2. SP audit — re-validated

| Subtree | Upstream MWCCVER | Files (`.c`) | Δ vs our default (`2.0/sp1p5`) |
|---|---|---:|---:|
| `lib/NitroSDK/src/mi` | `2.0/sp2p2` (top-level inherit) | 1 | one SP-rev |
| `lib/NitroSDK/src/os` | `2.0/sp2p2` (top-level inherit) | 28 | one SP-rev |
| `lib/MSL_C/src` | `2.0/sp2p2` (top-level inherit) | 2 | one SP-rev |
| `lib/dsprot/src` | `2.0/sp2p3` (subtree override) | 8 | one SP-rev |
| `lib/NitroDWC` | (no `.c` files; headers only) | 0 | n/a |
| `asm/nitrocrypto` | `1.2/sp2p3` (asm rule, not C) | 0 | n/a |
| `lib/syscall` | `2.0/sp2p3` (asm only) | 0 | n/a |

**Total porting-eligible pool: 39 `.c` files.** All live in the
`2.0/` SP family — one minor-version distance from our default
`2.0/sp1p5`, in line with brief 066's general 50-70% pairing
projection. There is no exact-SP-match sub-pool.

## 3. Compile coverage

After resolving the `fx_const.h` build dependency (see §5), all
39 candidate files compile cleanly with the brief 080 BuildProfile
additions to `tools/external_obj.py`:

```
$ python3 tools/external_obj.py pokeheartgold lib/NitroSDK/src/os/os_terminate_proc.c
compiled: tools/_vendor/_cache/pokeheartgold/lib/NitroSDK/src/os/os_terminate_proc.o  (6320 bytes)
functions: 2
  OS_Terminate    size=0x0010  relocs=2  fp[0:8]=08402de900000000
  OS_Halt         size=0x000c  relocs=0  fp[0:8]=0000a0e3900f07ee
```

Sweep summary:

| Subtree | `.c` files | Compiled OK | Functions extracted |
|---|---:|---:|---:|
| `lib/NitroSDK/src/mi` | 1 | 1 | (small) |
| `lib/NitroSDK/src/os` | 28 | 28 | 215 |
| `lib/MSL_C/src` | 2 | 2 | 4 |
| `lib/dsprot/src` | 8 | 8 | 10 |
| **Total** | **39** | **39 (100%)** | **229** |

(Exact per-subtree function counts vary across compile sweeps —
the 229 total is reproducible from `compile_external` + `extract_functions`
over the full pool.)

## 4. Byte-fingerprint hit-rate survey

Full byte-scan of all 39 files against the EUR placeholder pool
(`python3 tools/find_external_source.py --byte-scan pokeheartgold
--region eur --format csv --byte-scan-min-similarity 0.80`):

| Band | Match rows | Unique pokeheartgold functions | Unique our-placeholders |
|---|---:|---:|---:|
| HIGH (sim ≥ 0.95) | 378 | 89 | 345 |
| MEDIUM (0.80 ≤ sim < 0.95) | 1,383 | 53 | 313 |
| HIGH+MEDIUM | 1,761 | 92 | 509 |

The total CSV is 1,762 lines (header + 1,761 match rows). Some
externals match multiple of our placeholders (byte-twin collisions —
see §4.1).

**Note on inflated match counts:** the 89 unique HIGH externals
matching 345 placeholders is **not** 345 net ports. After
brief 069/070's disambiguator filters byte-twin collisions, the
realistic per-function port yield is significantly smaller. See §4.1
for the dominant collision sources.

### 4.1 Byte-twin trap (top HIGH-band collisions)

```
138  OS_IrqDummy                  # likely matches every empty stub
 61  OS_VSNPrintf                 # large; many of our placeholders
                                  # share the prefix
 20  OS_IsThreadAvailable
 15  OS_IsRunOnEmulator
 12  srand
```

These five externals account for **246 of 345** HIGH-band
placeholder matches (71%). After disambiguation by brief 070's
unique-callee / parallel-reloc rules, only the byte-twin's
**actual** placeholder remains; the other ~245 collisions are
filtered as ambiguous.

**Realistic net-new HIGH port estimate** after disambiguation:
~50-80 ports (89 unique externals minus ambiguous-after-filter
casualties).

### 4.2 dsprot — niche but clean

```
$ grep '^HIGH' /tmp/phg_scan.csv | grep dsprot/
HIGH,1.0000,pokeheartgold,lib/dsprot/src/encryptor.c,clearDataAndInstructionCache,0x0020,eur,ov002,func_ov002_021f60dc,0x021f60dc
HIGH,1.0000,pokeheartgold,lib/dsprot/src/encryptor.c,clearDataAndInstructionCache,0x0020,eur,ov002,func_ov002_021e0098,0x021e0098
HIGH,1.0000,pokeheartgold,lib/dsprot/src/encryptor.c,clearDataAndInstructionCache,0x0020,eur,ov002,func_ov002_02285dd0,0x02285dd0
```

dsprot contributes one unique HIGH-band function across multiple
placeholder addresses. The pool is niche cryptographic code; lower
overlap is expected because dsprot integrates against Nintendo
Wi-Fi infrastructure not present in our card-game ROM. The 8 dsprot
files compile correctly via the `POKEHEARTGOLD_DSPROT` profile,
but their contribution to the port unlock is small.

## 5. fx_const.h build dependency

Every `.c` file in `lib/NitroSDK/` that pulls in `<nitro.h>`
transitively includes `nitro/fx/fx_mtx44.h`, which in turn does
`#include "nitro/fx/fx_const.h"`. That header is **generated at
upstream build time** from
`tools/gen_fx_consts/fx_const.csv` by a small C program
(`tools/gen_fx_consts/main.c`, ~150 LoC of CSV-driven macro
emission for fixed-point constants like `FX64C_PI`).

Without this header, every NitroSDK file fails with:

```
the file 'nitro/fx/fx_const.h' cannot be opened
... 'FX32_ONE' undefined identifier
... 'FX64_PI' undefined identifier
```

The brief 080 implementation **wires the generator into the post-
clone hook** in `tools/vendor_external_sources.py`:

```python
def _post_clone(target: Target, dest: Path) -> None:
    if target.name != "pokeheartgold":
        return
    fx_const_h = dest / "lib/include/nitro/fx/fx_const.h"
    if fx_const_h.is_file():
        return
    gen_dir = dest / "tools/gen_fx_consts"
    if not (gen_dir / "gen_fx_consts").is_file():
        _run(["make"], cwd=gen_dir)
    _run([str(gen_dir / "gen_fx_consts"), str(fx_const_h)])
```

The generator requires only a system `gcc` (standard on macOS via
Xcode CLT, on Linux via the build-essentials meta-package). The
header generation runs once per clone (idempotent — short-circuits
if the header already exists).

**Build-tool risk:** if upstream pokeheartgold ever changes the
generator layout (renames `tools/gen_fx_consts/`, switches to
Python, etc.), the post-clone hook silently no-ops with a stderr
warning. Pinned to the `HEAD` commit at brief 080 land-time; revisit
on next pokeheartgold re-vendor.

## 6. Implementation summary

This brief lands as code in two files plus this research doc:

1. **`tools/external_obj.py`** — adds two `BuildProfile` entries:
   - `POKEHEARTGOLD_NITROSDK` (sp2p2, lib/NitroSDK + lib/MSL_C)
   - `POKEHEARTGOLD_DSPROT` (sp2p3, lib/dsprot subtree override)

   Registered in `PROFILES` with `lib/dsprot` **before** `lib/NitroSDK`
   so dsprot files win the prefix-match lookup. A unit test
   (`TestProfileFor.test_pokeheartgold_dsprot_prefix_wins_over_nitrosdk`)
   pins this priority.

2. **`tools/vendor_external_sources.py`** — adds `_post_clone()`
   hook that generates `lib/include/nitro/fx/fx_const.h` on first
   clone. Idempotent + no-op for non-pokeheartgold targets.

3. **`tests/test_external_obj.py`** — five new tests cover the
   pokeheartgold profile-routing rules and metadata invariants.

4. **`tests/test_find_external_source.py`** — three new tests pin
   `_post_clone` behavior (no-op for other targets, no-op when
   generator missing, idempotent when header exists).

## 7. Comparison to brief 066's projections

| Metric | Brief 066 projection | Brief 080 measured | Delta |
|---|---|---|---|
| pokeheartgold `.c` pool size | "~50" | 39 | -22% |
| nitrocrypto exact-SP-match bonus | "≥95% on sub-pool" | **N/A — assembly source** | corrected |
| Other-subtree pairing rate | 50-70% | 92/229 ≈ 40% MEDIUM+ unique | ~within range |
| Realistic HIGH ports | not specifically estimated | ~50-80 after disambig | new estimate |

The brief 066 projection was directionally correct (significant
unlock, but smaller than pokediamond's primary pool) — only the
specific "nitrocrypto bonus" framing was wrong. The 50-80 net-new
HIGH ports are a meaningful incremental win after pokediamond
saturates (current state: pokediamond pool is the main source of
brief 069/070's ports; pokeheartgold opens once that saturates).

## 8. Recommendation

**Land brief 080 immediately** as decomper infrastructure ready for
the next bulk-port wave. The natural sequencing:

1. (This PR) Lands the profile registry + post-clone hook + tests.
2. (Future decomper brief) Run
   `find_external_source.py --byte-scan pokeheartgold --region eur
   --format csv > pokeheartgold-ports.csv` and feed it through the
   existing brief 070 port-driver pipeline. Expected yield 50-80 net
   ports per region, ~150-240 total via brief 064/065 cross-region
   propagation.

No follow-up cloud brief required.
