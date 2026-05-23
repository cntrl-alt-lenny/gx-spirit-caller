# First-wave wall — mwldarm interwork veneer (C-31)

**Brief:** 191 (scaffolder). Brief 188 (PR #636) skipped 5 of 12
trivial picks with a consistent diagnosis: a small `ldr rN,
[pc, …]; bx rN; .word target` shape that caused multi-KB
downstream cascades when source-claimed. This note documents
the wall, proposes [`docs/research/codegen-walls.md`'s][cw] new
**C-31** entry, ships a working recipe, and gives
[`tools/predict_walls.py`](../../tools/predict_walls.py) a
detector so brief 192+ flags affected picks before the
decomper burns iterations.

[cw]: codegen-walls.md

## What the wall is

mwldarm 2.0/sp1p5 emits **interwork veneers** when a call
crosses a Thumb/ARM mode boundary or a long-distance branch
range. The veneer is a tiny code stub at a stable address that
loads the real target from a PC-relative literal pool and
indirect-jumps to it:

```text
; Thumb 8-byte form (Thumb caller → ARM target, e.g.
; func_ov004_021dbdbc → main:func_0206ecb4)
4b 00       ldr   r3, [pc, #0]
47 18       bx    r3
b4 ec 06 02 .word 0x0206ecb4

; ARM 12-byte form (long-distance branch in one module, e.g.
; main:func_0209085c → main:func_020909b0)
00 c0 9f e5 ldr   ip, [pc]
1c ff 2f e1 bx    ip
b0 09 09 02 .word 0x020909b0
```

These show up in `symbols.txt` as ordinary `func_<addr>`
entries because dsd extracts the bytes from orig and the
linker map shows the symbol at the veneer's address — but
they're not source-authored functions. They're a deterministic
side-effect of mwldarm's link-time decisions about how to
bridge calls.

## Why naive source-claim cascades

When a decomper attempts to source-claim the veneer — even as
a minimal `.c` tail-call wrapper that LOOKS equivalent —
mwldarm sees an `.o` file that wants to OWN those bytes:

1. The veneer's `.text` content is now produced by an `.o`
   that mwldarm places into the link, not by passive gap-fill
   from dsd's extract.
2. mwldarm's interwork pass still sees `thumb_call` relocs
   pointing at the veneer's address. It needs to know that the
   user-supplied function IS the interwork shim, otherwise it
   emits its OWN shim alongside.
3. The mode mismatch between mwcc's default ARM emission (for
   `.c` files) and the orig's Thumb veneer (for the Thumb
   variant) immediately changes the byte count + alignment of
   the TU.
4. Layout cascades downstream.

### Empirical cascade — pick #3 (`func_ov004_021dbdbc`)

Brief 191 Part 1 reproduced the cascade by staging a minimal
`.c` claim:

```c
extern void func_0206ecb4(void);
void func_ov004_021dbdbc(void) { func_0206ecb4(); }
```

Result (pre-patch `arm9_ov004.bin` vs orig):

- **Same overall size** (268,192 B each).
- **158,713 bytes differ** (59.2 % of the binary).
- **19,693 divergence runs** spread throughout `.text` and
  `.rodata`.
- **First divergence at fo 0x33c** (VA `0x021ca09c`) — only
  832 B past `.text` start.
- The brief 180 patcher's layout-reconstruction pass tries to
  fix this but **bails with `TU data_ov004_021ded69.o
  (.rodata) has shift +5 bytes (|shift| > MAX_SHIFT_BYTES =
  4)`** — the cascade exceeds the patcher's safety bound.

The cascade is structurally beyond the patcher's brief-180
recipe. Source-side coercion is the only path.

## Recipe — option (b) per the brief: `.s` with explicit mode

The Brief-191 worked example for pick #3 ships at
[`src/overlay004/func_ov004_021dbdbc.s`](../../src/overlay004/func_ov004_021dbdbc.s):

```text
        .text
        .global func_ov004_021dbdbc
        .thumb
func_ov004_021dbdbc:
        ldr     r3, [pc, #0]
        bx      r3
        .word   0x0206ecb4
```

Three details matter:

1. **`.thumb` directive** (NOT `.thumb_func` — mwasmarm
   rejects the GNU symbol-type marker; just the encoding-mode
   switch is enough). Without this, mwasmarm assembles the
   `ldr; bx` mnemonics in ARM mode (32-bit instructions),
   blowing the size from 8 to 12 bytes and triggering the
   cascade.
2. **Literal pool inline** — `.word 0x0206ecb4` as a raw
   4-byte literal, not via a named extern. mwasmarm doesn't
   need a `.pool` directive here because the `.word` is
   already at the right offset (PC + 0 from the `ldr`).
3. **`.global` only** — no `.global func_0206ecb4` extern,
   no thumb-vs-arm interwork attribute. The target is
   resolved at link time by mwldarm via the orig-VA literal.

### Why `.c` doesn't work

mwcc 2.0/sp1p5 with this project's flags (`-proc arm946e`,
no `-mthumb`) emits ARM-mode code by default for every `.c`
function. A tail-call wrapper compiles to 12+ bytes of ARM
(`push {lr}; bl target; pop {pc}` or similar). For a target
function whose orig is an 8-byte Thumb veneer, the size
mismatch alone cascades the layout. Even with `__attribute__
((target("thumb")))` or similar (which mwcc doesn't honor),
mwcc's call convention adds prologue/epilogue overhead that
won't match the bare-veneer 8-byte shape.

### Why option (a) was misleading

The brief framed option (a) as "don't claim the veneer at all,
claim only the underlying target function; mwldarm re-emits
the veneer to the same byte pattern." For pick #3 this isn't
viable — the underlying target `func_0206ecb4` is **already
claimed** as `src/main/func_0206ecb4.c` (a tail-call wrapper
to `func_0206de68`). So "claim the target" was already done
pre-brief-191, and the veneer's bytes still came from dsd's
extract gap-fill rather than from mwldarm's auto-emission.
The cascade isn't about whether the TARGET is claimed; it's
about whether the VENEER's own bytes are emitted by an `.o`
or by passive gap-fill.

Option (a) might apply to OTHER veneer clusters where the
target is unclaimed (mwldarm may then re-emit the veneer
automatically when the target's `.o` is linked). Brief 191
doesn't test that path; brief 192+ can if a future veneer pick
fits that profile.

## The five affected picks (brief 188 PR #636)

| Pick | Module | Addr | Size | Mode | Target | Recipe |
|---|---|---|---:|---|---|---|
| #3 | `ov004` | `0x021dbdbc` | 8 | Thumb | `func_0206ecb4` | **shipped** as `.s` (this brief) |
| #4 | `ov004` | `0x021dbdd0` | 8 | Thumb | `func_0206eecc` | apply the brief 191 recipe |
| #5 | `ov004` | `0x021de280` | 8 | Thumb | `func_02091768` | apply the brief 191 recipe |
| #9 | `main` | `0x0209085c` | 12 | ARM | `func_020909b0` | apply the brief 191 recipe (12-byte ARM variant — use `.arm` instead of `.thumb`, `ldr r1, [pc, #0]; bx r1; .word target`) |
| #12 | `ov004` | `0x021dbdc4` | 12 | Thumb | `func_0206eea0` | apply the brief 191 recipe with the pre-`strb` prefix |

Picks #3, #4, #5 are byte-identical except for the literal-
pool target. Picks #9 and #12 have variant shapes (different
scratch register, side-effect prefix) — same recipe, just
emit the correct opcode bytes.

Brief 192+ (decomper) drains the remaining 4 by following
the brief 191 worked example.

## Recognition cue for the classifier

[`tools/predict_walls.py`](../../tools/predict_walls.py)'s
new `InterworkVeneer` detector flags a function when:

1. Its size is **8 bytes** (Thumb 2-instruction shape) OR
   **12 bytes** (ARM 3-instruction OR Thumb with prefix).
2. The bytes match one of three patterns:
   - Thumb 8 B: starts with `4b 00 47 18` (or `4b XX 47 NN`
     where the `b` pool index varies; for the canonical
     `[pc, #0]` form the first nibble of the load destination
     is consumed in the immediate).
   - ARM 12 B: contains `00 ?0 9f e5` (`ldr rN, [pc, #0]`)
     followed by `?c ff 2f e1` (`bx rN`).
   - Thumb 12 B with prefix: starts with a small store
     (`strb`/`strh`/`str rN, [rM]`) then the Thumb 8 B veneer
     pattern.
3. The literal-pool target VA is in a different module's
   `.text` range, OR exceeds the ARM-direct-branch range
   (~32 MB) from the call site — the cross-mode or
   long-distance trigger for mwldarm's veneer emission.

The classifier emits `InterworkVeneer` with a routing hint
that points the decomper at this brief.

## Test coverage

`tests/test_predict_walls.py::TestInterworkVeneerDetection`
covers:

- 8-byte Thumb veneer shape detection.
- 12-byte ARM trampoline shape detection.
- 12-byte Thumb prefix shape detection.
- Negative case: ordinary `ldr/bx`-shaped function (e.g.
  `bx lr` epilogue) doesn't trigger.

## Cross-references

- [`docs/research/codegen-walls.md` § C-31](codegen-walls.md#c-31)
  — canonical taxonomy entry.
- [`docs/research/code-decomp-wall-predictions.md`](code-decomp-wall-predictions.md)
  — brief 187 queue audit; doesn't include the trivial
  bucket, which is where these veneer picks live, but the
  per-cluster section will absorb the wall once the next
  trivial-bucket audit runs.
- [Brief 188 commit](https://github.com/cntrl-alt-lenny/gx-spirit-caller/commit/9475c1e)
  / PR #636 — original empirical discovery (5 of 12 trivial
  picks skipped with this wall).
- [`src/overlay004/func_ov004_021dbdbc.s`](../../src/overlay004/func_ov004_021dbdbc.s)
  — brief 191's worked example.
- Brief 168 patcher BL re-encoding + brief 180 layout-
  reconstruction — the relevant priors for mwldarm interwork
  / pool re-encoding behaviour.
