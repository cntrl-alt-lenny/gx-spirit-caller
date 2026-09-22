### decomper/bios-svc-thunks

**Goal:** Match the 17 ARM BIOS SWI-thunk functions in ARM9 `main`
that dsd's delinker already named canonically — `Halt`, `SoftReset`,
`Div`, `Mod`, `Sqrt`, `CpuSet`, `CpuFastSet`, `BitUnPack`, `IntrWait`,
`VBlankIntrWait`, `IsDebugger`, `GetCRC16`, `WaitByLoop`, and the five
decompress thunks (`LZ77…`, `RL…`, `Huff…` pairs). Each is a
one-instruction `swi 0xNN` + `bx lr` pattern. First named-tier work,
first decomp work inside the failing-module perimeter.

**Context:**

- The named tier reports 0/22 matched. Of those 22: 17 are BIOS SWI
  thunks (handled by this brief), 4 are runtime glue (`AutoloadCallback`,
  `main`, `Entry`, `__register_global_object` — defer to brief 012),
  1 is `AutoloadCallback` a 4-byte `bx lr` that landed already via a
  different path.
- **`main` is a failing module** (checksum diff at the module level,
  from `--allow-unknown-function-calls` placeholder-symbol artifacts
  injected during `dsd init`). Earlier briefs explicitly scoped out
  failing modules because *module-level* regression detection is
  unreliable there. This brief is the first to cross that line.
- **Why it's safe:** objdiff operates at function granularity. A
  per-function 100% match is a per-function match, full stop — it
  doesn't depend on the enclosing module round-tripping. The 24/27
  failure comes from cross-module relocations elsewhere in `main`,
  not from these leaf thunks.
- Each thunk is **one instruction**. Read the disassembly to get
  the SWI number (`swi 0xNN`), write the C wrapper, done. No
  hypothesis, no iteration.

**Target list (all in `main`, all `size=0x4` unless noted):**

| Address | Symbol | Size |
|--------:|--------|-----:|
| `0x02000086` | `VBlankIntrWait` | 0x6 |
| `0x020000f2` | `LZ77UnCompReadByCallbackWrite16bit` | 0x4 |
| `0x0200017a` | `RLUnCompReadByCallbackWrite16bit` | 0x4 |
| `0x020001f2` | `Div` | 0x4 |
| `0x02000254` | `CpuSet` | 0x4 |
| `0x020002ae` | `BitUnPack` | 0x4 |
| `0x02000324` | `Mod` | 0x6 |
| `0x02000394` | `HuffUnCompReadByCallback` | 0x4 |
| `0x02000400` | `WaitByLoop` | 0x4 |
| `0x0200045a` | `IsDebugger` | 0x4 |
| `0x020004b0` | `LZ77UnCompReadNormalWrite8bit` | 0x4 |
| `0x02000524` | `CpuFastSet` | 0x4 |
| `0x02000584` | `Halt` | 0x4 |
| `0x020005f6` | `GetCRC16` | 0x4 |
| `0x02000652` | `RLUnCompReadNormalWrite8bit` | 0x4 |
| `0x020006b0` | `IntrWait` | 0x4 |
| `0x02000728` | `Sqrt` | 0x4 |
| `0x0200078a` | `SoftReset` | 0x4 |

**Pattern (mwcc-ARM inline asm):**

```c
asm void Halt(void) {
    nofralloc
    swi 0x06
    bx  lr
}
```

The exact SWI number comes from reading each function's extracted
assembly. Don't guess from ARM BIOS references; the baserom is the
ground truth. The header file at `libs/nitro/include/nitro/sinit.h`
shows the same `asm` + `nofralloc` dance the sinit work standardised.

**Scope:**

- `src/main/bios_thunks.c` (one file, or split by group — the decomper
  picks. Either way, place it under `src/main/` since main is the
  module). Each thunk is its own `asm void <Name>(...)` function.
- `config/eur/arm9/delinks.txt` — append `complete` entries for each
  matched TU. Per-function carving, not one big TU.
- Symbols already named correctly — **no symbols.txt touches**.

**Pattern reuse vs. new-ground:**

- Uses the same `asm void` + `nofralloc` pattern from brief 009's
  sinit ov002 outlier (`src/overlay002/sinit_ov002_022ca7e8.c`).
  `asm` is the right tool when the function body is literally one
  SWI — there's no C equivalent.
- Unlike the sinit work, these don't go in `.init` — they live in
  `.text` alongside everything else in main. So no `#pragma section`
  dance is needed.

**Non-scope:**

- ❌ `AutoloadCallback`, `Entry`, `main`, `__register_global_object`
  — the 4 non-thunk named targets. Brief 012 territory; they need
  actual C logic, not SWI wrappers.
- ❌ Matching anything else in `main` (placeholder `func_*`s, etc.).
- ❌ Touching other failing modules (`dtcm`, `ov004`).
- ❌ Changes to `tools/`, `libs/`, `AGENTS.md`.

**Success:**

- Each of the 17 thunks at 100% objdiff on a first build.
- `./dsd check modules -c config/eur/arm9/config.yaml` either stays
  at 24/27 OK or — best case — flips main from ❌ to ✅ (not
  expected; the placeholder-symbol artifacts are in cross-module
  relocations, not these thunks).
- `python tools/check_match_invariants.py --version eur` exits 0
  (the CI gate will enforce this anyway).
- Named-tier count: 0/22 → 17/22. First non-zero named match in the
  project.

**Cadence:** **One PR, all 17.** Each is mechanical and identical in
shape — per-overlay splitting doesn't make sense here. If anything
goes wrong the first few would reveal it. Brain reviews the first
match carefully, then trusts the pattern for the rest.

**Branch:** `decomper/bios-svc-thunks`.

**After this brief lands:**

1. **Brief 012** — the remaining 4 named-tier targets in main
   (`AutoloadCallback`, `main`, `Entry`, `__register_global_object`).
   Actual C logic; each its own small analysis.
2. **Brief 013 (or 011 wrap)** — `nitro_suggest_renames` used for
   its actual purpose: scanning *passing* overlays' `func_*`
   placeholders and proposing NitroSDK names where shape + callsite
   signal gives high confidence. Brain will run the tool, filter the
   output, and produce a candidate list for the decomper to verify.
3. Next easy-tier wave — continuing the grind through the heavy
   overlays (ov000, ov010, ov011, ov015 still have hundreds left).
