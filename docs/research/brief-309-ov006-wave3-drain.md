[//]: # (markdownlint-disable MD013 MD041)

# Brief 309 — co-drain wave 3: ov006 per-state method families

**Brief:** 309 (scaffolder, second draining stream). Continues the ov006
co-drain (briefs 304/307) on the same collision-free footing — own
`src/overlay006/`, own `config/eur/arm9/overlays/ov006/delinks.txt`, own header —
while the decomper is on a fresh overlay (ov007+). Per-pick gate = **EUR objdiff
`fuzzy_match_percent == 100`** (direct-mwcc, re-confirmed in the authoritative
`report.json`); the brain runs the 3-region SHA1 gate on merge.

## Headline

**27 shipped (all `.c`), all EUR objdiff 100%** (byte-identical vs the delinked
gap `.o`, bl/pool reloc modulo), all wired into `delinks.txt`, compiled + linked
in-tree (`ninja rom` OK). Wave 3 drains the SAME 8-state machine **much deeper**:
where waves 1/2 banked its dispatch / enter / toggle / probe methods, wave 3
banks the **per-state "full init" (0x220), "enter" (0x44/0x80), "step" (0x70 /
short), "finalize" (0x40), and "audio init" (0xa4/0xc4)** methods plus the
main-engine BGn toggle and two more dispatch variants. **Eight clone families,
zero match escapes** — every pick hit 100% on the first compile.

| family | n | size | shape | clone axis |
|---|---|---|---|---|
| **full init** | 7 | 0x220 | bind 4 VRAM banks, reset+configure 2D engines per arg, blank main / display-mode sub, arm IRQs, `state[2]=arg` | trailing struct word ONLY |
| **enter** (0x80) | 3 | 0x80 | full-init(1) + seed subobj `(mode K,0)` + 6 fixed calls, `state[0]=4` | (init, struct, K) |
| **enter** (0x44) | 2 | 0x44 | full-init(arg) + 2 subsystem calls, `state[0]=4` | (init, calls, struct) |
| **step** | 2+1 | 0x70/0x28 | 7 (or 1) fixed per-subobject updates + family-D enter, `state[0]=1` | (enter, struct) |
| **finalize** | 2 | 0x40 | teardown helper + 4 fixed calls, `state[0]=5` | (helper, struct) |
| **audio init** | 3+2 | 0xa4/0xc4 | open bank, program channel into mixer, bind wave archive, `status=2` | (bank, helper, status) + branch |
| **main toggle** | 3 | 0x58 | main-engine DISPCNT BGn set/clear (leaf) | toggled bit {0x2,0xc} |
| **dispatch** | 2 | 0x5c | family-A core + no-cb tail `func_020071a4(4,1,data)` | (state,table,data,ret) |

## Pre-flight (subtract the already-matched set)

Branched from current `main` (`71acc9f` = the wave-2 merge `571f9ce` + a README
badge chore). `build/` is gitignored, so the local gap disassembly was stale
(pre-wave-2); **regenerated it with `dsd dis`** against the merged delinks.txt so
the 26 wave-2 functions (and wave-1's 12) are carved out and absent from the gap
worklist. Confirmed: the post-merge gap set is **249 ov006 funcs / 226 distinct
signatures**, none of them a wave-1/2 address. The wave-3 worklist was taken from
that live gap set only — no shipped function re-attempted.

> **Gotcha (tooling):** `dsd dis` does **not** delete stale gap files when the
> gap set shrinks — it overwrites the low-numbered `_dsd_gap@ov006_N.s` and
> leaves the high-numbered ones. Always `rm` the gap files before a re-`dis` or
> the cluster/subtraction counts are inflated (here: 2 already-shipped seeds
> reappeared from a stale file until the dir was cleaned; the true post-wave gap
> count is **249 → 222, a clean −27**).

## Discovery method (mechanized from brief 307)

`build/wave3/cluster.py` parses every `_dsd_gap@ov006_*.s` into an opcode
signature (mnemonics only; operands/branch-targets dropped; size =
`(#instr + #poolwords) * 4`) and groups by signature. The 249→226 split surfaced
the families above directly; each was then confirmed a *true* clone by a
side-by-side dump (`build/wave3/dump.py --sidebyside A B`) showing differences
confined to pool words ± one or two immediates. Every family's member size lands
exactly on the next already-matched function — structural confirmation of the
per-state layout (`[full-init 0x220][family-D enter]…` per state).

## Per-pick verify loop

Add the `.text` block to `delinks.txt` → `dsd delink` (carves the original `.o`)
→ compile the `.c` direct-mwcc with the `build.ninja` ov006 cflags → `objdiff-cli
diff -1 <delinked.o> -2 <mine.o> <sym> --format json` → read `match_percent`
(`build/wave3/verify.py`). objdiff-cli v2.7.1 treats bl/pool relocs as matching
natively, so the raw `.o` diff equals the authoritative resolved diff — no
per-iteration reconfigure/report needed. Final gate re-run over all 27 in
`report.json` (`fuzzy_match_percent`, after `dsd objdiff` + the three
post-processors): **27/27 = 100.0**.

## Banked family recipes (the new ones)

### Full-init (7 members, the headline) — clone-by-one-word

```c
int f(int a) {
    func_02094504(0xc0, 0x7000000, 0x400);  /* + 3 more bank binds */
    func_0200592c(); func_0208d1e4(0x1ff);
    func_02094504(0, 0x6800000, 0xa4000); func_0208cc90();
    if (a != 0) { /* engine config A: 0208da2c(0x60),0208d4f0(3),… */ }
    else        { /* engine config B: 0208da2c(1),0208d8c0(2),…   */ }
    *(volatile unsigned short *)0x04000304 |= 0x8000;
    *(volatile unsigned long  *)0x04000000 &= ~0x1f00;
    func_0208c940();
    *(volatile unsigned long *)0x04001000 &= ~0x1f00;
    *(volatile unsigned long *)0x04001000 |=  0x10000;
    data_02103da0[0] = 1; data_020c3e48[0] = 0;
    func_02021064(); func_02021190(0, 1); func_02021190(1, a == 0);
    func_020211b4(3, 8); func_020211b4(5, 0xa8);
    if (a != 0) { func_0200ad0c(8); func_0200f854(3,0x10,0x18000,0,0x3000); }
    func_020057c8(0x14, 1);
    state[2] = a; return 1;        /* state = the per-member struct */
}
```

- **0x220 / 128 instr each, yet a perfect clone:** the 7 members differ ONLY in
  the trailing per-state struct pointer. Matched one (021b2400), the other six
  were a byte-substitution of that word.
- mwcc reproduced every scheduling concern with **no coaxing**: the const-reuse
  `mov r2,r0` / `mov r2,r1` (3rd arg = a copy of an already-loaded 1/0), the
  branchless `a == 0` bool (`cmp;moveq #1;movne #0`), the hoisted dual address
  loads of the two MMIO RMWs, and the 5-arg stack call (`str ip,[sp]`).
- Members↔struct: 021b2400·021cf140 021b2fb0·0224f1b0 021b359c·0224f1fc
  021b3b40·0224f248 021b43d8·0224f290 021b4ad8·0224f2e8 021b50b0·0224f330.

### Audio init (0xa4 plain / 0xc4 channel-gated)

```c
extern struct { int w0; unsigned chan : 3; } data_02104f4c;  /* word[1] & 7 */
int f(void) {
    func_0202adf8(bank);
    func_0202ae1c(data_02104f4c.chan);
    func_0202c070(data_02104f4c.chan);
    /* 0xc4 only:  if (data_02104f4c.chan == 0) func_020018d4(0xa0);
                   else                         func_02001b18(0xa2);   */
    /* 0xa4 only:  func_020018d4(0xa0);                                 */
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c.chan);
    func_ov006_021b5c2c(data_ov006_0224f448);    /* per-member helper */
    func_020373cc(0x24, 1, 0, -1);
    status[0] = 2; return 1;
}
```

- **The channel is a 3-bit bitfield of word[1] of the global mode object
  `data_02104f4c`.** Read it through an `unsigned chan : 3` bitfield so mwcc
  emits the `ldr; lsl #29; lsr #29` extraction the orig uses — a plain `& 7`
  would emit `and r0,#7` and miss. The three reads stay un-CSE'd (the calls are
  barriers), matching the orig's re-read each time.
- **`func_020373cc(0x24, 1, 0, -1)`:** mwcc materialises the `-1` as
  `sub r3, r2, #1` (reusing the `0` already in r2) — emerges naturally from the
  literal `-1` arg; no trick needed.
- **0xc4 branch layout:** write the channel test as `== 0` so the `==0` path
  (`func_020018d4`) is the fall-through and the `!=0` path is the out-of-line
  `bne` target — matches the orig (an `if (chan != 0) A else B` inverts it).

### The smaller families

- **enter (0x44/0x80):** straight call chains that begin with the state's
  full-init (`f(arg)`) and end `state[0]=4`. The 0x80 variant seeds the first
  subobject via `func_ov006_021b9ef8(0225c4dc, K, 0)` with a per-member mode K
  (2/3/5).
- **step (0x70 / 0x28):** 7 (resp. 1) fixed per-subobject updates then the
  state's family-D enter, then `state[0]=1; return 1` — the `mov #1` is reused
  as both the store value and the return.
- **finalize (0x40):** `helper(data448, state[3])` + 4 fixed shutdown calls +
  `state[0]=5`.
- **main toggle (0x58):** the MAIN-engine (0x04000000) twin of wave-2 family E,
  same dup-RMW-per-branch leaf, bits {0x2, 0xc}.
- **dispatch (0x5c):** family-A core with a working no-cb tail
  `func_020071a4(4,1,data)`; the tail's return constant varies per member
  (021b22c8 → 1, 021b343c → 0).

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff (direct-mwcc, per-pick) | **27/27 byte-identical** (bl/pool reloc modulo) |
| EUR objdiff (authoritative `report.json`, `fuzzy_match_percent`) | **27/27 = 100.0** |
| in-tree build + link (`ninja rom`) | compiled (27 `.o`) + linked, ROM written |
| ov006 `delinks.txt` | 27 `complete .text` blocks (no overlap; each end = next matched func start) |
| gap subtraction (`dsd dis`, cleaned) | **249 → 222 (−27)** — every pick carved out |
| `check_match_invariants.py` | **0 errors** (placeholder-name warns only, as briefs 304/307) |
| 3-region `ninja sha1` | **deferred to the brain on merge** (per brief) |

## ov006 movement

- **+27 matched `.c`** (all `fuzzy=100`); matched `.text` bytes added **6052
  (~5.9 KB)** — the 0x220 family alone is 7·0x220 = 3808 bytes.
- gap set **249 → 222** distinct ov006 functions remaining.

## Recommendation for the brain

1. **The 8-state machine is now drained broad AND deep.** Waves 1–3 have banked
   its dispatch / enter / step / finalize / toggle / probe / full-init / audio
   methods across all 8 states. The per-state regularity makes each new method
   shape a one-recipe, clone-by-struct batch — this is why wave 3 hit 27 with
   zero escapes.
2. **Renames still deferred (placeholder names kept), matching 304/307.** A
   future rename pass over the now byte-proven vocabulary (full-init / enter /
   step / finalize / toggle / audio-init per state) would clear the invariants
   warns; low-risk now that all 8 structs are proven.
3. **Run the 3-region SHA1 on merge** — per-pick gate here is EUR objdiff only.
4. **Wave 4 worklist (residual gap set, higher per-function effort):** the
   clean clone vein is now exhausted; what remains is shape-heavier —
   0xc8 stack-buffer trio (021c12fc/021c13c4/021c148c), the wrap-normalizer
   pair (0x88: 021c4028/021c63cc), stack-buffer pair (0x98: 021c16d8/021c5d00),
   magic-division pair (0xa8: 021c46c0/021c6798), and ~210 residual singletons
   (incl. magic-division and pointer-of-pointer shapes). `build/wave3/cluster.py`
   + `dump.py` find them mechanically; budget more per-pick iteration than wave 3.

## Cross-references

- `docs/research/brief-307-ov006-wave2-drain.md` — wave 2; families D/E/F + the
  first two dispatch variants and the discovery method this wave mechanized.
- `docs/research/brief-304-ov006-wave1-drain.md` — wave 1; the dispatch /
  5-iter / guarded-call families and gotcha 5.
- `src/overlay006/ov006_core.h` — §VERIFIED extended with the wave-3 families.
