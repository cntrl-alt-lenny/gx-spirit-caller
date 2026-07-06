[//]: # (markdownlint-disable MD013)

# Brief 535 — targeted hard-RE on flagged high-value residue

Branch: `claude/hard-re-535`

Scope: two targets flagged by briefs 533/525 as the campaign's best
remaining hand-RE candidates. Owned `main` + `ov006`/`ov010`/`ov015` for
these specific functions only (the scaffolder's lane is pure tooling —
no collision).

## Outcome

- **Target 1 (B4) — CRACKED.** `func_ov010_021b2924` / `func_ov015_021b2924`
  (byte-identical 484B pair) both match, byte-for-byte, confirmed via
  full ROM `ninja sha1` on all three regions.
- **Target 2 (permuter cohort) — all 2 live candidates re-confirmed
  as genuine register-allocator tie-breaks, parked.** (A third named
  candidate, `021b79ac`, turned out to already be matched by brief 525 —
  see correction below.)

## Correction to the kickoff

The kickoff named three permuter-cohort candidates: `0200dd58` (main),
`021ac91c` (**"ov015"**), `021b79ac` (ov006). Checking the actual tree:

- **`021ac91c` is ov005, not ov015.** `docs/research/brief-525-cmatch-overlays-w2.md`
  confirms this explicitly (`CardList_WriteTileRow`, ov005). No
  `021ac91c` exists anywhere in ov015. Treated as a typo and worked the
  real address.
- **`021b79ac` (ov006) was already matched by brief 525**, 3-region,
  and is `.c` in the current tree (`src/overlay006/func_ov006_021b79ac.c`).
  No action needed or taken.

## Target 1 — B4: `func_ov010_021b2924` / `func_ov015_021b2924`

Brief 533 had fully traced the logic but avalanched on a 32-byte
compiled-`.text` shortfall and parked without landing any code (the PR
carried no diff — the draft only existed transiently in that session).
This wave re-derived from scratch against the raw `.s`, function by
function:

```c
typedef struct {
    char pad0[8];
    int mode;                   /* 0x8 */
    int state;                  /* 0xc */
    int trigger;                 /* 0x10 */
    void (*callback)(int);        /* 0x14 */
    int target;                    /* 0x18 */
    short rectX, rectY;              /* 0x1c, 0x1e */
    unsigned short rectW, rectH;       /* 0x20, 0x22 */
} Widget;

int func_ov010_021b2924(Widget *self, void *rngArg, int arg2)
{
    int px, py;
    int savedRng = func_0207ec28(rngArg);
    int ret = 0;
    int fired = ret;

    if (func_02006194()) {
        func_02006110(&px, &py);
        if (px >= self->rectX && px <= self->rectX + self->rectW &&
            py >= self->rectY && py <= self->rectY + self->rectH) {
            if (self->state == 0) {
                if (func_02006164()) self->trigger = 1;
            } else {
                self->trigger = 1;
            }
        }
    }

    switch (self->mode) {
    case 0: /* ... 2-state ladder, sets fired on specific transitions ... */
    case 1: /* ... 4-state ladder, sets fired on specific transitions ... */
    default: break;
    }

    if (fired == 1 && self->target > 0) self->callback(self->state);
    self->trigger = 0;
    ret = ret + func_ov010_021b27d8(self, arg2, &savedRng, 0);
    return ret;
}
```

First compile landed at 480/484 bytes (4 bytes short) with a
register-set that didn't match orig (`r3,r4,r5,r6` vs orig's
`r4,r5,r6,r7`). Three reshape levers closed the gap, each fixing a
distinct symptom:

1. **Stack-slot order.** `savedRng`/`px`/`py` had to be declared in
   function scope (not `px`/`py` nested inside the `if`-block) with
   `savedRng` first, `px` second, `py` third — matching orig's
   `sp+0`/`sp+8`/`sp+4` layout exactly. Scope nesting, not just
   declaration order, drove the allocator's stack-slot assignment here.
2. **The "phantom dead register."** The disassembly's
   `add r0, r4, r0` at the tail adds a register that's provably always
   `0` (`mov r4, #0` at entry, never touched again) to the final call's
   result — a real, if unusual, codebase idiom (confirmed by checking
   *callers* of this function: `func_ov010_021b7104` and siblings do
   the exact same `add r0, r0, #0` / `add rN, rN, r0` pattern when
   capturing a sub-call's return value, so this is a systemic "sum
   call results" convention, not dead code). A plain `int ret = 0;`
   gets folded to an immediate by mwcc (byte-identical either way);
   forcing it into a genuine register needed **all three** of:
   `int ret = 0; int fired = ret;` (copy, not a fresh literal — keeps
   two zero-valued registers instead of one) declared in that order,
   **and** `ret = ret + call(); return ret;` as two statements (a
   direct `return ret + call();` still folds `ret` away even with the
   `fired = ret` copy in place). `volatile int ret` was tried first and
   overshot (forces a stack slot instead of a register — 488 bytes, one
   *too many*).
3. Once (1) and (2) were both right, every one of the ~90 remaining
   instructions matched orig exactly, including branch targets,
   immediate values, and the final register-role assignment
   (`r4`=ret, `r5`=fired, `r6`=arg2, `r7`=self, matching orig's
   `r4`/`r5`/`r6`/`r7` one-for-one).

Sibling copy (`func_ov015_021b2924`) is the identical C source with
only the two overlay-local symbol names substituted
(`func_ov010_021b27d8` → `func_ov015_021b27d8`); compiles to the
identical 484 bytes and instruction sequence, as expected from the
proven byte-identical `.s` pair.

**Verification:** both objects individually confirmed via
`objdump -h` exact `.text` size match, full instruction-by-instruction
manual diff against the original disassembly (zero divergence), and a
full EUR `ninja sha1` rebuild (byte-identical ROM, not just isolated
object files).

## Target 2 — permuter-class near-miss cohort

Both live candidates were re-derived from scratch (neither had
surviving code in the tree — both prior briefs fully reverted before
landing) and independently re-confirmed as the *exact* register swap
their originating briefs described. `#pragma opt_strength_reduction
off` (gotcha 27, this wave's specifically-requested first lever) had
**zero effect** on either — expected, since gotcha 27 targets
pointer-increment strength-reduction, a different optimization class
than a register-allocator tie-break. Per the kickoff's explicit
"don't marathon" instruction, both were parked after this single
confirmation pass rather than re-attempting the half-dozen levers
brief 525/533 had already exhausted.

| Addr | Module | Size | Result |
|---|---|---:|---|
| `0200dd58` | main | 108B | Re-derived via C bitfield (matches brief 533's shape fix); confirmed exact same `r0/r1` vs orig's `r1/r2` register-role swap across the whole bitfield-manipulation section. gotcha 27: no effect. Parked. |
| `021ac91c` | ov005 | 104B | Re-derived via the 3-statement split (`*dst=...; dst++; counter++;`) brief 525 found fixes `row`/`dst`; confirmed `counter`/`col` still land on `ip`/`r4` instead of orig's `r4`/`ip`. gotcha 27: no effect. Parked. |

Both remain fully diagnosed (instruction-shape-correct, single
register-pair swap) and are good permuter/decomp.me candidates for a
future brief that wants to invest the tooling-setup cost — see
`docs/research/permuter-workflow.md` (not attempted this wave; the
gap is register-allocator-specific rather than expression-shape, so
it's unclear permuter's random source mutations would even explore
the right space, and the kickoff scoped this wave to a quick lever
check, not a permuter investment).

## Porting

`func_ov010_021b2924` / `func_ov015_021b2924` ported to USA and JPN via
`tools/port_to_region.py` (both land at `0x021b2824` in both regions).
All 4 ports resolved at MEDIUM confidence — the one callee this
function's dossier depends on (`func_0207ec28`) is itself a leaf `.s`
function with no relocations to cross-check, so the porter's D2 v2
auto-promotion (LOW→MEDIUM via 5-neighbor address-shift consensus) is
as good as it gets. Accepted with `--confidence-floor MEDIUM` and let
the region `ninja sha1` gate be the actual arbiter (consistent with
brief 527's precedent for the same symptom).

**Pre-existing delinks.txt gap, not introduced by this brief.** USA and
JPN's `symbols.txt` both already listed `func_ov010/015_021b2824`
(and, for ov010 only, `func_ov010_021b2a08`) as known function
boundaries, but neither region's `delinks.txt` had ever claimed an
explicit entry for `0x021b2824` — the byte range was presumably still
served by whatever implicit/default source `dsd`'s build falls back to
for un-delinked symbol-table entries. Inserted a new `<file>.c:` block
per region (not a `.s`→`.c` line swap, since there was no line to
swap) at exactly the address/size the porter printed; confirmed safe
by the region `ninja sha1` passing byte-identical afterward.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

All three additionally confirmed via a fresh `objdump -h` `.text`-size
check on every new/ported object before each region's full rebuild
(never relied on containment_check.py alone, per its documented
truncation blind spot).
