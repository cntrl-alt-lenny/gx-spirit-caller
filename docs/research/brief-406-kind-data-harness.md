[//]: # (markdownlint-disable MD013 MD041)

# Brief 406 — the kind:data carve harness: the binding constraint DISSOLVED

**Brief:** 406 (scaffolder, TOOLING). Make a kind:data-referencing
whole-function `.s` carve link and ship byte-identical; study how dsd delink
represents the data section FIRST; acceptance = ≥3 previously-parked funcs
end-to-end + a mechanism/limits doc + a negative test shown red (Verify gate
item 7). Stretch: the asm_escape Thumb-gap-object fix. Plus the `m2ctx.py`
macOS clang flag one-liner.

## Headline — the wall was 5 % real: ALL 12 ov002 parked funcs shipped, the harness is a 5-verdict link preflight, and the Thumb stretch landed 3/3

The study phase **falsified the blanket park rule**. "Any `kind:data` ref
`Undefined`-fails the link" (briefs 361/364, applied to ~19 parked funcs) is
true for exactly ONE shape — a ref whose address was **absorbed mid-bundle
into a cluster-era data TU** under another symbol's name. Every other shape
links **today** with a plain `.extern`:

| class | data target lives… | linkable? | parked funcs in class |
|---|---|:---:|---|
| **A-aligned** | in a carved data TU whose delinks range starts AT the symbol (cluster era, briefs 143–163) — TU defines the global | ✅ | 7 of 19 |
| **B-gap** | in no carve → dsd delink emits it as a **GLOBAL** in the module data gap object (`g O .data` per objdump; xMAP-confirmed) | ✅ | 12 of 19 |
| **C-absorbed** | inside a bundle TU that defines only the bundle-BASE symbol (`data_020ff920[16]` absorbing `…924/…928`, brief 155); gap-side relocs are patched post-link by `patch_module_literals.py`, so no named definition exists | ❌ `mwldarm: Undefined` | **0 of 19** |

The 19-func "binding endgame constraint" decomposed into **7 A + 12 B + 0 C**
— every parked func was shippable all along. The one real C instance remains
brief 361's `func_020489c4` → `data_020ff924` (main arm9), **reproduced live
this session** (see the reds below). This is Verify-gate item 8's exact
failure shape (a cross-agent classification propagated unverified since brief
361) and is reported as such per item 9.

## Acceptance (a) — 12 previously-parked funcs shipped, not just 3

The suggested wave-9 trio first, then the entire remaining ov002 parked set
(all my own delinks file; the other-overlay parks belong to the decomper):

| func | size | class | data ref(s) |
|---|---|---|---|
| `func_ov002_02253638` | 0x54 | A | `022cad34` (carved `.c` TU) |
| `func_ov002_0225368c` | 0x5c | A | `022cad38` (carved `.s` TU) |
| `func_ov002_022536e8` | 0x60 | A | `022cad38` |
| `func_ov002_022aaf38` | 0x54 | B | `022cc498` (gap GLOBAL) |
| `func_ov002_02297c3c` | 0x44 | A | `022c9508` (rodata TU) |
| `func_ov002_0229a060` | 0x44 | A | `022ca370` (rodata TU) |
| `func_ov002_022aafe4` | 0x54 | B | `022cc4d0` |
| `func_ov002_022627ac` | 0x58 | B | `022cb96c`, `022cd090` |
| `func_ov002_0229ad88` | 0x58 | B | `022cba04`, `022cd090` |
| `func_ov002_022aaf8c` | 0x58 | B | `022cc4b4` |
| `func_ov002_02297d08` | 0x60 | A | `022c9ad0` (rodata TU) |
| `func_ov002_022ab038` | 0x6c | B | `022cc498`, `022cc4d0` |

All 12 `asm_escape --whole-function` byte-identical (first attempt), all
preflight-clean, EUR `ninja sha1` **OK** at each ship point and on the final
tree. Carve audit: 12/12 carve = symtab size exactly, **0 overlaps** across
**1236** `.text` intervals (1224 → 1236 = +12), delinks additions-only +
sort-normalised. **The ov002 parked set is now 0** (was 12).

## The harness — a 5-verdict link preflight in `asm_escape.py`

`classify_data_refs()` (pure, unit-tested) resolves every `kind:load` target
of the function against symbols.txt (ALL kinds — bss/function targets are not
gated) and the module delinks data/rodata ranges:

- **A-aligned / B-gap → ok** (B additionally verified build-side: a gap `.o`
  must actually define the symbol GLOBAL, else refuse);
- **C-absorbed → REFUSE** naming the absorbing TU + base symbol;
- **OFFSET → REFUSE**: a pool word targeting `sym+N`. This catches a **latent
  emitter bug**: `parse_objdump` strips reloc addend suffixes and the
  byte-verify is reloc-modulo, so an interior-offset pick would previously
  emit, "verify", and only corrupt at `ninja sha1`. Now refused up front;
- **MISADDRESSED → REFUSE**: a covering carve range that starts at NO data
  symbol — a mis-sized/mis-addressed data carve in delinks.txt (config
  defect, named loudly).

Both generate modes run the preflight before emitting; `--classify-data` runs
it standalone for wave sweeps (prints per-ref verdicts, exit 1 on any
unlinkable ref). Wave classifiers should now park ONLY on a REFUSE verdict —
not on the presence of a `kind:data` ref.

## Acceptance (c) — the reds, shown before trusting green

**Red 1 — classifier on the real C-instance** (exit 1):

```
  data-ref data_020ff924 @0x020ff924: C-absorbed (REFUSE) [src/main/data/data_020ff920.c]
      absorbed into bundle TU (base data_020ff920); data_… has NO linkable definition -> mwldarm Undefined (brief 361 class)
func_020489c4: ❌ kind:data preflight REFUSED — the carve would not link (or would mislink).
```

**Red 2 — integrated gate**: `--whole-function func_020489c4` refuses with
the same verdict, exit 1, **no `.s` emitted**.

**Red 3 — the live link failure the verdict predicts** (preflight bypassed
deliberately; transient delinks entry, reverted + re-verified green after):

```
mwldarm.exe: Undefined : "data_020ff924"
mwldarm.exe: Referenced from "func_020489c4" in func_020489c4.o
mwldarm.exe: alert: Link failed.
```

**Red 4 — the mis-sized/mis-addressed carve** the brief demands: unit fixture
(`test_misaddressed_carve_red`) — a `.data` range starting at no symbol →
MISADDRESSED; plus C-absorbed / OFFSET / A / B / rodata / bss-skip fixtures.
`tests/test_asm_escape.py` 36 pass; full suite **2355 pass**.

## Limits + the USA/JPN story

- **Class C is detected, not yet shippable**: a C-verdict func needs either a
  bundle split (re-carve the absorbed address as its own TU — the cluster-era
  pattern, fully precedented) or `.word base+off` emission. Zero parked funcs
  need it today; the one known C instance (`func_020489c4`) is a main-lane
  pick that was already routed to permuter/C.
- **OFFSET (interior pool words)** is refused, not emitted — no known
  instance in any current backlog; revisit only if one appears.
- **USA/JPN**: nothing region-specific — the preflight reads per-version
  config (`--version usa/jpn` work against their symbols/relocs/delinks);
  the 12 ships are EUR-only by construction (`src/overlay002/*.s`,
  `configure.py:1176`). Brain reproduces 3-region SHA1 on merge.
- The preflight gates **named data refs**; it does not (and need not) model
  `patch_module_literals.py`'s post-link address fixups — those only ever
  applied to gap-side code, which a carve removes the func from.

## Stretch — the Thumb gap-object fix: 3/3 byte-identical

`parse_objdump` only accepted 8-hex ARM words; Thumb gap funcs (4-hex
halfwords, `xxxx yyyy` bl pairs) parsed to nothing (brief 397's tooling gap).
Fixed end-to-end: halfword/pair parsing, Thumb pc-rel pool base
(`Align(addr+4,4)`), `.thumb` emission with `.align 2` pool padding, and an
objdump-UAL → legacy-mwasm Thumb dialect map (probed live against mwasmarm
2.0/sp1p5: the UAL flag-setting names `movs/adds/lsls/…` are rejected — drop
the `s`; **reg-reg `movs rX, rY` is the `lsls #0` encoding and must emit
`lsl rX, rY, #0x0`**, since legacy `mov rX, rY` assembles to `adds rX, rY, #0`
= wrong bytes, caught by the byte-verify). Thumb-ness auto-detected from
symbols.txt `kind:function(thumb,…)`.

All three parked ov004 Thumb reg-walls verify **byte-identical** through the
full pipeline: `021dc1cc` (53 words) / `021dcd1c` (33) / `021dd2c8` (64).
**Capability only — no ov004 delinks change** (decomper's overlay this round);
the decomper regenerates + ships them on its next wave. ARM path
regression-checked (`func_ov002_0229f2f8` byte-identical post-change).

## Also fixed — `m2ctx.py` on macOS

`-fworking-directory` is GCC-only (Apple clang rejects it:
`clang: error: unknown argument '-fworking-directory'` — red captured) and a
no-op under `-E -P` anyway (it only shapes linemarkers, which `-P`
suppresses). Dropped — not swapped to clang's `-working-directory=` spelling,
which GNU gcc on Linux would reject. `ninja build/eur/src/overlay002/
func_ov002_021ab864.ctx.c` now passes (was the red).

## Consequences for the lanes

- **ov002 `.s` lane (mine)**: parked set 12 → **0**; the w17 runway math
  improves (~62 → ~74 clean ≈ 9 waves at ≤0x6c).
- **Decomper**: its 5 route-w1 parks (`ov017 021b66a8` = A; `ov008
  021aafa4`/`021b2268`, `ov005 021acfb0`, `ov016 021b3174` = B) and the
  dispatcher twins (`ov017 021b2c8c`, `ov016 021b2824` = B) are all
  preflight-classified linkable — plus the 3 ov004 Thumb reg-walls now have
  a `.s` path. ~10 ready ships next round.
- **Wave classifiers**: replace "park on kind:data" with "park on preflight
  REFUSE" (`--classify-data` per candidate).

## Verification (this session, this worktree)

| gate | result |
|---|---|
| `tests/` | **2355 passed** (36 in test_asm_escape, 11 new) |
| `asm_escape --whole-function` | 12/12 ov002 + 3/3 ov004-Thumb byte-identical |
| EUR `ninja sha1` (final tree) | **OK** |
| `check_match_invariants.py` | 0 errors; +12 warnings = the standard placeholder-name advisory every carved func gets (diffed vs main) |
| negative tests | reds 1–4 above, all captured before trusting green |

🤖 Generated with [Claude Code](https://claude.com/claude-code)
