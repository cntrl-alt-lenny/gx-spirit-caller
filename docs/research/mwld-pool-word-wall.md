# mwld cross-object pool-word wall — proposal

**Status**: research writeup, cloud-written. Brain to scope as
followup to decomper's #208 finding, or close as "won't fix, use
workaround" if the inline .c escape-hatch (direct `asm void` body)
is deemed sufficient.

**Context**: decomper's #208 writeup hit an unseen `mwldarm`
behaviour when trying to emit an ARM-to-ARM cross-object tail call
from a `.s` file. The instruction sequence was:

```asm
; Inside a .s file compiled by mwasmarm + linked by mwldarm.
    ldr     ip, =Task_InvokeLocked    ; expected pool word: 0x02006870
    bx      ip
```

At link time, the pool word resolves to **`0x40086870`** — wildly
wrong. Executing the `bx ip` branches into an unmapped region on
real hardware and desyncs `dsd rom build`'s validator.

`Task_InvokeLocked` at `0x02006870` is a normal ARM function
(matched in PR #165's cascade-2 wave, renamed from
`func_02006870`, size 0x44). From C it's callable via a bare
`extern` + ordinary call syntax. The defect is specifically in
`.s` → `.o` → `mwldarm` with pool-table `ldr ip, =sym` encoding
across compilation units.

## The value shape

| Bits | Expected (`0x02006870`) | Observed (`0x40086870`) | Delta |
|---|---|---|---|
| `[31:24]` | `0x02` | `0x40` | +0x3E |
| `[23:16]` | `0x00` | `0x08` | +0x08 |
| `[15:0]`  | `0x6870` | `0x6870` | 0 |

The low 16 bits are correct. The upper half-word is mutated in a
non-obvious way. Some candidates:

- **Not** a byte-swap — `0x02006870` byte-swapped is `0x70680002`,
  not the observed value.
- **Not** an instruction encoding — reading the observed as an ARM
  instruction gives `cond=MI`, opcode bits that don't map to BL /
  B / LDR. If mwld somehow emitted an instruction instead of a
  pool word, it would still have legible ARM encoding.
- **Not** a veneer address — NDS ARM9 memory map has no executable
  region at `0x40000000`. Landing a veneer there would crash on
  first `bx`.
- **Does** match a **section-relative** encoding with a specific
  base offset. See the hypotheses below.

## Reproduction (for brain's local verification)

Decomper's #208 is the primary source. Minimal repro shape — brain
can reconstruct by:

1. Create `src/main/trampoline_test.s`:

   ```asm
   .text
   .globl TrampolineTest
   TrampolineTest:
       ldr     ip, =Task_InvokeLocked
       bx      ip
   ```

2. Add to `delinks.txt`, run `ninja rom`.

3. Inspect the linked `.arm9.bin` at `TrampolineTest`'s address +
   the pool-word slot (~8 bytes in). Expected word: `0x02006870`.
   Observed: `0x40086870`.

4. Alternative: `mwldarm -map=out.map ...` emits a link map
   showing the pool-word resolution path.

## Peer-project survey

| Project | Uses cross-object `.s` tail calls? | Pool-word pattern |
|---|---|---|
| [pret/pokediamond](https://github.com/pret/pokediamond) | **Yes** — `arm9/lib/syscall/_svc_mw.s` + others | Uses `ldr r0, =syscall_arg` **within the same .s** consistently; no cross-object `ldr ip, =sym` |
| [pret/pokeheartgold](https://github.com/pret/pokeheartgold) | Yes (same pattern as diamond) | Same |
| [pret/pokeplatinum](https://github.com/pret/pokeplatinum) | Yes | Same |
| [StanHash/dqix](https://github.com/StanHash/dqix) | No `.s` tail-calls across objects found in tree | N/A |
| [Arisotura/NitroSDK-Decomp](https://github.com/Arisotura/NitroSDK-Decomp) | Yes, extensively | Uses bare `b sym` for same-section, `ldr pc, =sym` explicitly within the same .s for cross-section |

**Key finding**: no peer project ships the `ldr ip, =sym; bx ip`
sequence where `sym` is a **cross-object** symbol (i.e. defined in
a `.c` that compiles separately from the `.s`). Every peer keeps
the pool-word-target and the pool-word-generator in the same
translation unit.

The pokediamond-shape that does work: `b sym` (direct ARM branch,
24-bit immediate signed → ±32 MB range, sufficient for intra-
module). When B won't reach — e.g. Thumb → ARM transition, or a
target outside the 24-bit window — they emit a single-purpose
thunk in the same `.s` as the caller, and the thunk itself is
`ldr pc, =sym` inline with the thunk's pool. That pool word
resolves correctly because it's intra-object.

## Hypothesised root cause (most-likely first)

### H1: cross-object pool dedup with stale section-offset (≈70% likelihood)

`mwldarm` is known to dedupe pool constants within a `.o`. When
the reloc is `R_ARM_ABS32` targeting a symbol defined in a
different `.o`, `mwldarm`'s dedup pass appears to merge the pool
word against a neighbouring constant from the containing `.o`,
losing the section-base component in the merge. The resulting
word is `(nearby_constant & 0xff00ffff) | (wrong_section_base &
0x00ff0000)` — fits the observed bit pattern where `0x02` is
replaced with `0x40` and byte `[23:16]` shifts from `0x00` to
`0x08`.

**Testability**: add a dummy constant to the same `.s` that
encodes `0x40000000` and see if the observed pool word changes
(i.e. dedups against whatever that constant is). If the observed
value shifts with the dummy, this is confirmed.

### H2: section-relative encoding without LCF anchor (≈20%)

`ldr ip, =Task_InvokeLocked` may produce an `R_ARM_SBREL32`
(section-base-relative) reloc instead of `R_ARM_ABS32` when the
source and target live in different sections. Without an
`SBSECT` / `section()` directive tying the two sections together,
`mwldarm` resolves the section base to a default value
(`0x40000000`?) and encodes the symbol as `default_base +
section_offset`.

**Testability**: `objdump -r` on the `.o` to inspect the reloc
type. If `R_ARM_SBREL32`, this hypothesis fits.

### H3: `ip` register (r12) intercepted by interworking veneer (≈8%)

`mwldarm` uses `r12`/`ip` as scratch for ARM/Thumb interworking
veneers. A `ldr ip, =sym; bx ip` sequence against a symbol mwld
thinks might need interworking could trigger veneer generation
that overwrites the pool word with a veneer address.

**Testability**: try `ldr r0, =sym; bx r0` (use a different
register). If the value changes, this hypothesis is implicated.

### H4: unresolved-reloc sentinel (≈2%)

`0x40086870` could be an internal `mwldarm` placeholder that
indicates an unresolved relocation. Low-probability because the
link would normally fail rather than silently emit a sentinel,
but worth checking that `mwldarm -v` doesn't produce a
reloc-unresolved warning.

## Suggested fix paths

### Path A — accept the workaround (lowest risk, recommended)

Decomper's current workaround: emit the tail call from inline
`asm void` in a `.c` file rather than a standalone `.s`. This
gives `mwccarm` control over the pool placement, and the
pool-word resolution goes through the normal `.c` → `.o` path
that does work.

**Cost**: decomper has to paste the asm into a `.c` wrapper for
each cross-object tail-call need. Modest.

**Payoff**: no toolchain investigation needed. The `.c` escape
hatch already exists for cases like #115's medium-tier trio and
brief 013's `.s` shippers that do work in-section.

### Path B — emit `b sym` instead of `ldr ip, =sym; bx ip`

For same-module tail calls (which is what the Task_* cluster is),
`b sym` resolves via `R_ARM_PC24`. That reloc is fully supported
by `mwldarm` and every peer project. 24-bit signed immediate gives
±32 MB range — more than enough for within `main` (which spans
~2 MB).

**Cost**: requires `sym` to be in range. For the Task_*
cluster, it is.

**Payoff**: sidesteps the pool-word question entirely. The
NitroSDK-Decomp project uses this pattern routinely.

**Caveat**: doesn't help if the target is in a different
overlay or module (24-bit range might exceed). But decomper's
PR #208 case is specifically `Task_InvokeLocked`, which is in
`main` — same module as any caller in `main`.

### Path C — emit the pool word explicitly

Skip `ldr ip, =sym` and write the pool manually:

```asm
TrampolineTest:
    ldr     ip, .L_pool
    bx      ip
.L_pool:
    .word   Task_InvokeLocked
```

This forces the pool word into the same section as the loader.
`mwldarm`'s pool-dedup pass treats explicit `.word sym` as a
regular data reloc, which resolves correctly.

**Cost**: one extra line per cross-object tail call. Similar
magnitude to path A's `asm void` wrapper.

**Payoff**: works for ARM→Thumb cross-state transitions where
path B (`b sym`) won't interwork. Validates hypothesis H1 /
H2 without deep mwld investigation.

### Path D — investigate + fix mwld behaviour

Full understanding of why mwld produces `0x40086870`. Requires
running `mwldarm -v` with all verbose flags, examining relocs
with `arm-none-eabi-objdump`, potentially reading leaked mwld
source (some community projects have it).

**Cost**: days of investigation. Payoff is the permanent fix
across all future .s escape-hatches.

**Payoff**: deep, but not urgent. The other paths sidestep.

### Path E — mwld flag search

`mwldarm` has many undocumented flags. `-pool1`, `-pool2`,
`-noreorder`, `-group` all exist. Brain / decomper could
try them individually and see if any changes the resolution.

**Cost**: 30 min of experimentation.

**Payoff**: a flag that fixes this would be the cleanest
solution. Low probability but nonzero.

## Recommendation

**Path B for the Task_* cluster (same-module tail calls)**, then
**Path C as the fallback** for the minority of cases that need
cross-state interworking. Escalate to **Path D** only if a
pattern appears that neither B nor C addresses.

Rationale:
- Path A (inline `asm void` in `.c`) works but loses the
  `.s`-file convention that brief 013 established for escape
  hatches. Fine for one-offs, awkward as a standing pattern.
- Paths B and C are both valid for different cases (same-state vs
  cross-state). Together they cover essentially all cross-object
  tail-call needs.
- Path D is deep research that brain and decomper would
  do together, not cloud's scope.

## What this unblocks

Once the `.s`-form cross-object tail call works:

1. More pure-asm escape hatches become viable (instruction
   patterns that C can't express but require calling into other
   `.o`).
2. Brief-013-shape `.s` cluster shipping for overlay-internal
   thunks that currently have to go through C.
3. A single `.s` file can host cross-object references without
   forcing the tail-call target into the same TU.

## Non-fix: reject on principle

`mwldarm` is a sealed 20-year-old commercial toolchain. We have
no vendor to file a bug report with. Our options are:
1. Work around it in our `.s` (paths A, B, C, E).
2. Understand it deeply and document (path D).
3. Switch toolchains — a project-level decision, not a brief.

Option 3 is a non-starter for this project (byte-matching the
baserom requires the exact mwcc-sp1p5 toolchain). Options 1-2
are the real question.

## Cross-refs

- [`thumb-align-wall.md`](thumb-align-wall.md) — the prior
  mwld/mwcc quirk writeup; brief 013 was the fix-path.
- PR #135 — the `.s` file that motivated the Task_* cluster
  cascade; uses `.word` explicitly (path C) and works.
- PR #165 — cascade-2 wave that named Task_InvokeLocked +
  siblings, making the cross-object tail-call scenario real.
- [pokediamond `_svc_mw.s`](https://raw.githubusercontent.com/pret/pokediamond/master/arm9/lib/syscall/_svc_mw.s) — in-TU pool pattern that
  works.
- [NitroSDK-Decomp](https://github.com/Arisotura/NitroSDK-Decomp) — extensive
  cross-object `b sym` usage as reference for path B.

## Suggested next steps for brain / decomper

1. **Try path B** on the specific case that motivated #208
   (assuming same-module). If the `b sym` sequence works, log
   the result here and close H1/H2/H3 investigation.
2. **If path B is out of range**, try path C (explicit
   `.word sym` pool) — still validates the pool-word path
   without needing to understand the `=sym` encoding.
3. **If neither works**, escalate: inspect `.o` relocs with
   objdump, re-read this doc, decide whether to do path D deep
   investigation or path E flag search.
4. **Add whichever fix works to `docs/decomp-workflow.md`** as a
   pattern note alongside brief 013's `.s` precedent.
