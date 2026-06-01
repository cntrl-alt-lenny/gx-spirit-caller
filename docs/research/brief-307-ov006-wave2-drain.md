[//]: # (markdownlint-disable MD013 MD041)

# Brief 307 — co-drain wave 2: ov006 family cohorts

**Brief:** 307 (scaffolder, second draining stream). Continues brief 304's
ov006 co-drain on the same collision-free footing (own `src/overlay006/`, own
`config/eur/arm9/overlays/ov006/delinks.txt`, own header) while the decomper
runs brief 306 on ov002 GLOBAL_ASM. Per-pick gate = **EUR objdiff 100%** via
direct-mwcc; the brain runs the 3-region SHA1 gate on merge.

## Headline

**26 shipped (all `.c`), all EUR objdiff 100%** (byte-identical vs the delinked
gap `.o`, bl/pool reloc modulo), all wired into `delinks.txt`, compiled +
linked in-tree (`ninja rom` OK). Brief 304 predicted ov006's reachable tier is
clone-dominated — wave 2 confirms it hard: **three 8-member clone families +
two dispatch-family variants**, all the per-state methods of the SAME state
machine whose dispatch "step" methods brief 304 banked.

| family | n | shape | clone axis |
|---|---|---|---|
| **D** display-blank "enter" | 8 | clear both DISPCNT mode fields, update, guarded teardown, `return 1` | per-state struct |
| **E** sub-DISPCNT BGn toggle | 8 | `int f(this,on)` set/clear one mode bit, dup RMW per branch | toggled bit {0x2,0x4,0x8} |
| **F** per-state "enter"+probe | 8 | 2 probes + shared 3-subobject pass + 2 state inits, `status=VAL iff both` | (init_a, init_b, status, VAL) |
| dispatch variants | 2 | brief-304 dispatch core + a working no-callback tail | singleton |

## Pre-flight (per PR #810 brain note)

Pulled latest `delinks.txt`; the 3 functions flagged already-matched on the
brief-304 branch (`021b2b08`/`021b2c9c` notify-on-truthy, `021b56d8`
sequencer) are `complete` on main and absent from the unmatched worklist — not
re-shipped. The wave-2 worklist was taken from the live gap set only.

## Discovery method (reusable for wave 3)

1. `dsd dis --config-path config/eur/arm9/config.yaml --asm-path build/eur/dis`
   — uncarved functions land in `build/eur/dis/_dsd_gap@ov006_*.s`.
2. Parse every gap function into an opcode signature (mnemonics only, branch
   targets normalised), group by signature. **275 unmatched ov006 funcs →
   231 distinct signatures**; the top clusters were three 8-member groups
   (0x48 / 0x5c / 0x78) — the wave-2 batches.
3. Confirm each cluster is a *true* clone family by dumping members and
   diffing: same shape modulo (a) pool words / globals, (b) one or two
   immediates. Size-of-gap-file is **not** a clustering signal (a gap file
   holds several contiguous functions).

## Per-pick verify loop

Compile one `.c` with the build.ninja ov006 cflags → `objdiff-cli diff -1
<mine.o> -2 <delinked.o> <sym> --format json-pretty` → read `match_percent`.
Avoids a full reconfigure/delink/report per iteration. The authoritative gate
(`fuzzy_match_percent == 100` in `build/eur/report.json`, after `dsd objdiff` +
the three post-processors) was re-run at the end over all 26 — all 100%.
Note: a `complete` flag in `delinks.txt` makes the report's `complete_*`
metrics read 100 regardless of the real diff; trust `fuzzy_match_percent`.

## Banked family recipes

### Family D — display-blank "enter" (8 members)

```c
extern void func_020210b8(void);
extern void func_0200ad90(void);
extern int data_ov006_XXX[];                    /* per-state struct */
int f(void) {
    volatile unsigned long *disp = (volatile unsigned long *)0x04000000;
    *disp &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;   /* inline cast! */
    func_020210b8();
    if (data_ov006_XXX[2] != 0) func_0200ad90();
    return 1;
}
```

- **gotcha (new):** the SUB register `0x04001000` MUST be an inline cast, not
  derived from `disp` (`disp + 0x400` / `disp[0x400]`). Deriving it makes mwcc
  compute the sub *address* into r0 and the main *value* into r1; the orig is
  the reverse (value r0, address r1). Inline cast → 100%; derived → 61%.
- Members ↔ struct: 021b2620·021cf140, 021b31d0·0224f1b0, 021b37bc·0224f1fc,
  021b3d60·0224f248, 021b45f8·0224f290, 021b4cf8·0224f2e8, 021b52d0·0224f330,
  021b5924·0224f38c. (Same structs as the dispatch family — these are the
  enter/step pair per state.)

### Family E — sub-DISPCNT BGn toggle (8 members)

```c
int f(void *this, int on) {                     /* tested arg is r1 (2nd) */
    volatile unsigned long *reg = (volatile unsigned long *)0x04001000;
    if (on) {
        unsigned long mode = (*reg & 0x1f00) >> 8;
        unsigned long base =  *reg & ~0x1f00;
        *reg = base | ((mode |  BIT) << 8);
    } else {
        unsigned long mode = (*reg & 0x1f00) >> 8;
        unsigned long base =  *reg & ~0x1f00;
        *reg = base | ((mode & ~BIT) << 8);
    }
    return 1;
}
```

- The RMW is **duplicated per branch** (the orig's `cmp; beq` is at the top).
- **gotcha:** compute `mode` then `base` as separate temps in that order; a
  single fused expression (`((*reg&0x1f00)>>8 | BIT)`) collapses the mode and
  the bit-set into one register and reorders vs the orig (97% not 100%).
- Members by BIT: 0x2 → 021c81c0, 021ca400; 0x4 → 021c821c, 021ca45c,
  021cadc8; 0x8 → 021bee68, 021c4518, 021c6640.

### Family F — per-state "enter" + probe (8 members)

```c
int f(void) {
    int a = func_ov006_021ba0f0(data_ov006_0225c4dc);
    int b = func_ov006_021c15a4(data_ov006_0225cb5c);
    func_ov006_021c6998(data_ov006_0225de70);
    INIT_A();
    func_ov006_021ba1f0(data_ov006_0225c4dc);
    func_ov006_021c1650(data_ov006_0225cb5c);
    func_ov006_021c6a3c(data_ov006_0225de70);
    INIT_B();
    { int ok = a != 0 && b != 0;
      if (ok) STATUS[0] = VAL;
      return ok; }
}
```

- **gotcha:** store `a && b` to a temp (`ok`) so mwcc emits the branchless
  `cmp / cmpne / movne / moveq` bool the orig uses, then tests it for the
  store. The six fixed calls + three data pointers are shared across all 8.
- **VAL varies per member** (the verifier caught this — do not assume 3):
  021b2804(2668,2690,021cf140,**3**), 021b2de0(2668,2690,021cf140,**0xf**),
  021b33c4(3218,3240,0224f1b0,3), 021b39a4(3804,382c,0224f1fc,3),
  021b3f10(3da8,3dd0,0224f248,3), 021b493c(4640,4668,0224f290,**6**),
  021b4ea8(4d40,4d68,0224f2e8,3), 021b559c(5318,5340,0224f330,**6**).
  Each member's end address lands exactly on the next already-matched dispatch
  "step" — structural confirmation of the enter/step pairing.

### Dispatch-family variants (2, extend brief-304 family A)

Same core (`cb = table[state[0]]; if (cb){ if(cb()) state[1]=0; return 0; }`);
the no-callback tail does real work, so the `bl` keeps the branch tree intact
(no gotcha-5 predication of a constant return):

- `021b2e58` — state 0224f1b0 / table 021cbb08; no-cb → `func_020057dc(
  func_0201261c); return 0`.
- `021b4048` — state 0224f290 / table 021cbb50, `state[4]=2` prologue; no-cb →
  `func_020071a4(4, 1, &data_ov006_021cb518); return 1`.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **26/26 byte-identical** (bl/pool reloc modulo) |
| EUR objdiff (authoritative `report.json`, `fuzzy_match_percent`) | **26/26 = 100.0%** |
| in-tree build + link (`ninja rom`) | compiled (26 `.o`) + linked, ROM written |
| ov006 `delinks.txt` | 26 `complete .text` blocks (no overlap; each end = next matched func start) |
| `ruff check tools/ tests/` | clean |
| `python -m unittest discover tests` | 7 fail / 1 err — **pre-existing** (identical with wave-2 stashed; platform + Windows-path + fixture tests, none touch ov006) |
| `check_match_invariants.py` | **0 errors** (placeholder-name warns only, as brief 304) |
| 3-region `ninja sha1` | **deferred to the brain on merge** (per brief) |

## ov006 movement

- matched ov006 `.text` functions **109 → 135** (+26); ratio **~28.4% → ~35.2%**.
- complete_units **+26**, matched_functions **+26** (`hard` tier 1346 → 1372).

## Recommendation for the brain

1. **Same clone-dominated picture, scaled.** Three full 8-member families in
   one wave; the enter/step pairing means ov006's state-machine surface is
   highly regular. Co-drain remains collision-free with the ov002 decomper.
2. **Renames are deferred (placeholder names kept), matching brief 304.** The
   invariants warns are advisory; a future rename pass over the proven
   ov006 state-machine vocabulary (enter/step/toggle per state) would clear
   them and is low-risk now that the structs are byte-proven.
3. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.
4. **Wave 3 worklist (already clustered):** smaller cohorts surfaced by the
   classifier remain — 3× 0x58 (021c1770·021c5d98·021c6fa0), 3× 0x80
   (021b387c·021b3e20·021b4db8), plus 2-member pairs (0x44, 0x40, 0x70, 0x5c)
   and the ~243 residual singletons. The gap-disasm + opcode-signature method
   in this doc finds them mechanically.

## Cross-references

- `docs/research/brief-304-ov006-wave1-drain.md` — wave 1; the dispatch /
  5-iter / guarded-call families and gotcha 5.
- `src/overlay006/ov006_core.h` — §VERIFIED extended with families D/E/F + the
  two dispatch variants this wave.
