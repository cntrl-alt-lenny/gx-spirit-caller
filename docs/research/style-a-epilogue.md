# style-a-epilogue

**Asked:** brain noted brief 034 (PR #323) attempted 11 medium-tier
IRQ-bracket targets and matched **zero** — every one hit a single
divergence: target ROM uses **Style A** epilogue (`pop {regs, lr};
bx lr`, two-step interworking-explicit return) while mwcc 2.0/sp1p5
with the project's flags emits **Style B** (`pop {regs, pc}`,
single-step pc-merged return). The 5 C-source variations the
decomper tried in brief 034 didn't move the wall. Identify whether
the trigger is a compiler flag, source pragma, mwcc version, or
fundamentally codegen-resistant. Same research format as
[`ov006-cluster-stuck.md`](ov006-cluster-stuck.md) /
[`hard-tier-clustering.md`](hard-tier-clustering.md) /
[`medium-tier-plateau.md`](medium-tier-plateau.md) /
[`codegen-walls.md`](codegen-walls.md).

**Short answer (verdict (a) — Found It):** **Style A is
mwcc 1.2/sp2p3 output. Style B is mwcc 2.0/sp1+ output.** Same
project flags (`-O4,p -enum int -char signed -str noreuse -proc
arm946e -gccext,on -fp soft -inline noauto -Cpp_exceptions off
-RTTI off -interworking -w off -sym on -gccinc`), different mwcc
version. mwcc 1.2's base / sp2 / sp2p3 emit Style A; mwcc 1.2/sp3
onward + every mwcc 2.0 SP (base / sp1 / sp1p2 / sp1p5 / sp1p6 /
sp1p7 / sp2 / sp2p2 / sp2p3 / sp2p4) all collapsed to Style B.
The dividing line is between mwcc 1.2/sp2p3 and 1.2/sp3. **Verified
byte-identical** against two of brief 034's targets
(`func_0207cbbc` 32 bytes, `func_020a1e3c` 40 bytes) — same
encoding for every instruction including the `e12fff1e` `bx lr`
that `pop {regs, pc}` had eliminated. **This matches pokediamond's
approach** (pret/pokediamond uses both mwcc 2.0/sp1 *and*
1.2/sp2p3 for matching; per its INSTALL.md). Recommendation:
brain queues a `tools/configure.py` brief that adds mwccarm
1.2/sp2p3 as a per-TU compiler option, routed by a per-file or
per-overlay rule. Decomper's Style A medium-tier targets unblock
under whatever routing rule the implementation brief settles on.

## Method

Set up a minimal C reproduction of brief 034's `func_0207cbbc`
(simplest of the 11 IRQ-bracket targets — 8 instructions, 2-reg
push, no body branching):

```c
typedef struct {
    char _pad_00[0x28];
    int  field_28;
} data_021a0890_t;
extern data_021a0890_t data_021a0890;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);

void func_0207cbbc(int arg) {
    int saved = OS_DisableIrq();
    data_021a0890.field_28 = arg;
    OS_RestoreIrq(saved);
}
```

Built with `wine mwccarm.exe <project flags> -c test.c -o test.o`
across:

1. **Every available mwcc 2.0 SP** in `tools/mwccarm/2.0/`:
   `base / sp1 / sp1p2 / sp1p5 / sp1p6 / sp1p7 / sp2 / sp2p2 /
   sp2p3 / sp2p4`. (10 versions.)
2. **Every available mwcc 1.2 SP** in `tools/mwccarm/1.2/`:
   `base / sp2 / sp2p3 / sp3 / sp4`. (5 versions.)
3. **Compiler-flag variations** (single-version, sp1p5):
   `-O0` / `-O1` / `-O2` / `-O3` / `-O4` / `-Os` / `-opt
   level=N` / `-opt off` / `-opt all` / `-opt nospeed` /
   `-opt space` / `-interworking off` / `-fp hard` / `-fp on` /
   `-gccext,off` / `-ipa file` / `-ipa program` / `-ipa on` /
   `-ipa off` / `-pic` / `-pid` / `-ashla on` / `-rostr on/off` /
   `-Cpp_exceptions on` / `-RTTI on` / `-lang=c++` / `-lang=c99` /
   `-stack_align 8` / `-ARM on/off` / `-profile on` /
   `-thumb on/off` / `-constpool off` / `-opt nodeadcode|nocse|...`.
4. **Source-pragma variations**: `optimization_level 0`,
   `optimize_for_size on`, `simple_prologue on`,
   `opt_compare_branch off`, `optimize_pipelining off`,
   `function_align 4`, `simple_class_byval on`,
   `readonly_strings on`, `noinline on`, `section_visibility
   hidden`, `volatile_asm on`, `overload_proto on`,
   `fp_contract off`, `list_options on`.

For each invocation: disassembled the resulting .o via
`/usr/bin/objdump -d --triple=arm-none-eabi` and inspected the
prologue/epilogue. Recorded prologue mask + epilogue shape.

## Per-hypothesis verdict

### (a) Compiler-flag hypothesis — partial hit, not actionable

`-O0` (and equivalents `-opt level=0` / `-opt off` / `-Os` —
`-Os` aliases to `-opt level=0,space` apparently) **does** emit
the Style A epilogue (`pop {regs, lr}; <add sp>; bx lr`) — but
only with extra `push {r0, r1, r2, r3}` caller-arg spill at the
prologue, plus an `add sp, sp, #16` to clean up. Target ROM has
**neither** the caller-arg spill nor the `add sp` cleanup;
target ROM is clearly compiled at a higher opt level. So `-O0`
gets the epilogue right but the prologue and overall shape
wrong; not byte-matchable without mass per-function variation.

`-O1` / `-O2` / `-O3` / `-O4` / `-O4,p` / `-Os`-with-different-
substring all collapse to Style B. **No mwcc 2.0 flag tested
flips Style B → Style A while keeping the clean -O4-shape body.**

### (b) mwcc-version hypothesis — confirmed

The big finding. The shipped `tools/mwccarm/` tree includes 10
mwcc 2.0 SPs **and** 5 mwcc 1.2 SPs — the 1.2 series wasn't
exercised by the project's existing build. With identical flags:

| Compiler                | Epilogue emitted   |
|-------------------------|--------------------|
| `mwccarm 1.2/base`      | **Style A** (`pop {r4, lr}; bx lr`) |
| `mwccarm 1.2/sp2`       | **Style A**        |
| `mwccarm 1.2/sp2p3`     | **Style A**        |
| `mwccarm 1.2/sp3`       | Style B (`pop {r4, pc}`) |
| `mwccarm 1.2/sp4`       | Style B            |
| `mwccarm 2.0/base`      | Style B            |
| `mwccarm 2.0/sp1`       | Style B            |
| `mwccarm 2.0/sp1p2`     | Style B            |
| `mwccarm 2.0/sp1p5` (current) | Style B      |
| `mwccarm 2.0/sp1p6`     | Style B            |
| `mwccarm 2.0/sp1p7`     | Style B            |
| `mwccarm 2.0/sp2`       | Style B            |
| `mwccarm 2.0/sp2p2`     | Style B            |
| `mwccarm 2.0/sp2p3`     | Style B            |
| `mwccarm 2.0/sp2p4`     | Style B            |

The dividing line is **between mwcc 1.2/sp2p3 and 1.2/sp3**: the
optimiser was tightened in sp3 to merge the explicit `bx lr`
into the `pop` via a multi-load PC merge. That tightening
persists across every later SP including all of mwcc 2.0.

### (c) Source-pragma hypothesis — no exposed knob

14 distinct mwcc pragmas tried at the project's -O4,p flag set
(`optimization_level 0`, `optimize_for_size on`,
`simple_prologue on`, `opt_compare_branch off`,
`optimize_pipelining off`, `function_align 4`,
`simple_class_byval on`, `readonly_strings on`, `noinline on`,
`section_visibility hidden`, `volatile_asm on`,
`overload_proto on`, `fp_contract off`, `list_options on`). The
only one that affected epilogue was `optimization_level 0` —
which is identical to the `-O0` flag-level result above (Style A
epilogue + caller-arg spill prologue, not byte-matchable). **No
pragma exposed a per-TU "force interworking-explicit epilogue"
toggle.** `mwccarm.exe -help all,deprecated,obsolete,ignored,
meaningless` lists 112 flags; none are stack-frame, prologue,
epilogue, leaf, or tail-call related beyond the `-interworking`
flag (which controls Thumb-call sequences, not the epilogue's
return).

### (d) Per-function ABI / hand-asm hypothesis — falsified

Target ROM `func_0207cbbc` looks like idiomatic mwcc output:
literal pool word at function end, `mov r4, r0` parameter cache,
canonical `bl` calls. Not handwritten asm. Confirmed by the
mwcc 1.2/sp2p3 reproduction matching it byte-for-byte (see
*Verification* below).

## Recommendation

**Update (brief 045 / PR 045-sp3-routing-implementation): a third
routing tier has shipped.** The dual-compiler boundary documented
below was correct as far as it went, but brief 042 (PR #334)
discovered that mwcc **1.2/sp3** emits a *third* prologue/epilogue
combination — `push {regs, lr}; sub sp, #4 ... pop {regs, pc}` —
that neither sp1p5 nor sp2p3 produces. Brief 044 (PR #337,
[`docs/research/sp3-routing-decision.md`](sp3-routing-decision.md))
counted 7 sp3-unique medium+easy candidates plus 416 hard-tier
candidates and recommended shipping the third tier. Brief 045
implemented it: `*.legacy_sp3.c` files now route through mwcc
1.2/sp3 alongside the `*.legacy.c` → 1.2/sp2p3 and default `.c` →
2.0/sp1p5 tiers documented below. The 3-tier discriminator from
brief 044 (re-stated for convenience):

| Compiler | Push | Sub-sp? | Epilogue |
|---|---|---:|---|
| 2.0/sp1p5 | r3-spill (`push {r3, ..., lr}` when reg-count odd) | no | `pop {regs, pc}` |
| 1.2/sp2p3 | no r3-spill | `sub sp, #4` | `pop {regs, lr}; bx lr` |
| **1.2/sp3** | **no r3-spill** | **`sub sp, #4`** | **`pop {regs, pc}`** |

> **Pitfall (brief 049 self-extend 1 / wave 11 — PR #362).**
> `sub sp, #4` is **necessary but not sufficient** for sp3
> classification: both sp2p3 and sp3 emit it. The
> disambiguating signal between sp2p3 and sp3 is the **pop
> target** — `pop {regs, lr}; bx lr` (2-step) is sp2p3 (Style
> A); `pop {regs, pc}` (1-step) is sp3. Wave 11 mis-routed
> `func_020a6150` through `*.legacy_sp3.c` after seeing
> `sub sp, #4`; re-routing through `*.legacy.c` fixed the
> size mismatch immediately. Always read the epilogue first,
> the prologue second.

The original two-tier recommendation below is preserved for
historical context; treat the brief 044/045 update as the
current state of the routing.

**Verdict (a) — Found It.** Brain queues a follow-up brief that:

1. **Adds mwccarm 1.2/sp2p3 as a recognised compiler.** The
   binary is already shipped in `tools/mwccarm/1.2/sp2p3/` (no
   download needed; it ships with the mwccarm bundle pulled by
   `tools/download_tool.py mwccarm`).
2. **Defines a per-TU routing rule** in `tools/configure.py` so
   the build picks 1.2/sp2p3 for Style A targets and keeps
   2.0/sp1p5 for everything else. Three plausible routing
   shapes:
   - **Filename convention** — e.g. `*.legacy.c` or
     `*_armv4.c` routes through 1.2/sp2p3. Lowest friction;
     decomper opts in per-file when the disassembly shows
     Style A. Pokediamond/pokeplatinum use a similar convention.
   - **Explicit per-file allowlist** in `configure.py` — a list
     of `src/main/<addr>.c` paths that compile via 1.2/sp2p3.
     Higher review friction but explicit.
   - **Per-overlay default** — e.g. all `src/main/` past
     0x0207XXXX uses 1.2/sp2p3. Likely too coarse; brief 034
     noted that briefs 020/022 matched Style B targets in the
     same address ranges as Style A targets. Probably not the
     right routing.
3. **Decomper resumes medium-tier work** under the chosen
   routing. The 11 brief-034 targets unblock immediately under
   any of the three routing options (rebuilt with 1.2/sp2p3,
   they should match within a small per-target body-coercion
   budget — the epilogue wall is gone, but per-shape body C
   variation may still be needed for the more complex targets).

The implementation brief should also handle:

- **Configure-time check** that `tools/mwccarm/1.2/sp2p3/`
  exists. The shipped mwccarm bundle includes both 1.2 and 2.0
  trees, so this should be a no-op on existing dev machines, but
  worth gating on for fresh-clone error messages.
- **Test-suite extension** — at least one fixture .c that
  routes through 1.2/sp2p3 and produces a known byte-identical
  output. `func_0207cbbc` is the natural candidate (smallest of
  the 11 brief-034 targets; full reproduction at the bottom of
  this doc).
- **Regression risk** — make sure the existing 905+ matched .c
  files keep matching under 2.0/sp1p5 (no change) and don't get
  accidentally re-routed through 1.2/sp2p3 if the routing rule
  is too greedy.

## Verification

Two byte-identical reproductions, both built with mwcc 1.2/sp2p3
+ project's existing CC_FLAGS (no flag change):

### `func_0207cbbc` (brief 034 67% partial → 100% match)

C source (16 lines):

```c
typedef struct {
    char _pad_00[0x28];
    int  field_28;
} data_021a0890_t;
extern data_021a0890_t data_021a0890;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);

void func_0207cbbc(int arg) {
    int saved = OS_DisableIrq();
    data_021a0890.field_28 = arg;
    OS_RestoreIrq(saved);
}
```

Output (mwcc 1.2/sp2p3, encoded bytes vs target ROM):

```
                              compiled                  target ROM
0:  e92d4010  push {r4, lr}    e92d4010  push {r4, lr}
4:  e1a04000  mov r4, r0       e1a04000  mov r4, r0
8:  ebXXXXXX  bl OS_DisableIrq ebXXXXXX  bl OS_DisableIrq
c:  e59f100c  ldr r1, [pc,#c]  e59f100c  ldr r1, .L_0207cbdc
10: e5814028  str r4, [r1,#28] e5814028  str r4, [r1, #0x28]
14: ebXXXXXX  bl OS_RestoreIrq ebXXXXXX  bl OS_RestoreIrq
18: e8bd4010  pop {r4, lr}     e8bd4010  pop {r4, lr}
1c: e12fff1e  bx lr            e12fff1e  bx lr
20: 00000000  .word            <reloc>   .word data_021a0890
```

8 of 8 instruction-encoded bytes identical. The `.word`
relocation differs only in the unresolved offset; identical
post-link.

### `func_020a1e3c` (brief 034 73% partial → 100% match)

C source (one extra line for the `+0x1000` hop):

```c
typedef struct { char _pad[0x1000]; } region_t;
extern region_t *data_021a98fc;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);

void func_020a1e3c(int arg) {
    int saved = OS_DisableIrq();
    *(int*)((char*)data_021a98fc + 0x1000 + 0x4e4) = arg;
    OS_RestoreIrq(saved);
}
```

Output:

```
                              compiled                  target ROM
0:  e92d4010  push {r4, lr}    e92d4010  push {r4, lr}
4:  e1a04000  mov r4, r0       e1a04000  mov r4, r0
8:  ebXXXXXX  bl OS_DisableIrq ebXXXXXX  bl OS_DisableIrq
c:  e59f1014  ldr r1, [pc,#14] e59f1014  ldr r1, .L_020a1e64
10: e5911000  ldr r1, [r1]     e5911000  ldr r1, [r1, #0x0]
14: e2811a01  add r1, r1, #1000 e2811a01 add r1, r1, #0x1000
18: e58144e4  str r4, [r1,#4e4] e58144e4 str r4, [r1, #0x4e4]
1c: ebXXXXXX  bl OS_RestoreIrq ebXXXXXX  bl OS_RestoreIrq
20: e8bd4010  pop {r4, lr}     e8bd4010  pop {r4, lr}
24: e12fff1e  bx lr            e12fff1e  bx lr
28: 00000000  .word            <reloc>   .word data_021a98fc
```

10 of 10 instruction-encoded bytes identical.

### `func_02091690` (brief 034 79% partial → close match, body coercion needed)

mwcc 1.2/sp2p3 produces Style A epilogue but with 3 `ldr r1`
loads of the volatile global where target has 1; standard C-2
*local-pointer reuse* coercion from
[`codegen-walls.md`](codegen-walls.md) applies. Confirms the
**epilogue wall is gone**; remaining body shape divergences fall
back to the existing codegen-walls playbook.

## Prior art (cross-references)

- **pret/pokediamond** ([INSTALL.md](https://github.com/pret/pokediamond/blob/master/INSTALL.md))
  documents requiring "Metrowerks C Compiler versions 2.0/sp1
  *and* 1.2/sp2p3 to compile matching files." Same dual-compiler
  pattern we're adopting. pokediamond's per-TU compiler routing
  is a likely template for the implementation brief.
- **pret/pokeplatinum** and **pret/pokeheartgold** also use the
  dual-compiler approach per their respective INSTALL docs (worth
  cross-checking when the implementation brief is scoped).
- **decomp.wiki MWCC entry** ([decomp.wiki/compilers/MWCC](https://decomp.wiki/compilers/MWCC))
  notes the broader pattern that mwcc compilers were used across
  Nintendo DS / GameCube / Wii titles in many SP combinations,
  and that matching often requires identifying the exact build's
  compiler.

## Tooling angle (codegen-walls.md addition)

Update `docs/research/codegen-walls.md` once the implementation
brief lands. The Style B → Style A divergence (currently
provisionally classified as Permanent in brief 034's PR body) is
**actually mwcc-version-coercible**, and the right entry is in
the *Coercible-with-knowledge* bucket as a new C-9 (or similar):
*"Style A 2-step epilogue requires mwcc 1.2/sp2p3 — see
docs/research/style-a-epilogue.md"*. Brief 034's "100% wall hit
rate" reclassifies to coercible once the per-TU routing is in
place.

## Sources

- [pret/pokediamond INSTALL.md](https://github.com/pret/pokediamond/blob/master/INSTALL.md)
- [decomp.wiki MWCC](https://decomp.wiki/compilers/MWCC)
- Local mwccarm 1.2 / 2.0 binaries under `tools/mwccarm/`
  (already shipped with the project's mwccarm download).
- Brief 034 PR ([#323](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/323))
  — the original Style A vs Style B observation.
