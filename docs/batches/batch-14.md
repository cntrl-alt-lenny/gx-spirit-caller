# Batch 14: Worker summary

Re-sweep of the 70 EUR main functions of 256 bytes or less in
0x02070000-0x0207ffff that were still `.s`. I attempted all 70 in address
order (the tool's list, including the "permanent" ones and two 8-12 byte
epilogue fragments). Base commit `51fde3801`; last code commit is the one
before this summary.

## Done

53 functions, 7,176 B, one commit each, 100% by `fastmatch`. Natural-C went
from 464,790 B to 471,966 B: a gain of 7,176 B, equal to the matched sizes.
Most earlier parks used the wrong tier (the original's two-step `pop {lr}; bx
lr` is `.legacy.c`, a one-step `pop {pc}` with `sub sp,#4` is
`.legacy_sp3.c`); the rest were callee arity, statement or declaration order.

| Function | Size | Tier | What the earlier attempt got wrong |
|---|---|---|---|
| 02070278 | 212 | legacy | wrong tier; loop test at bottom (`while (f() && ticks < 0x17)`) |
| 0207039c | 148 | legacy | nested `if (c)` + `return 0` tail, not early return |
| 02070430 | 184 | legacy | wrong tier |
| 0207092c | 84 | legacy | func_02070980 takes (a0, conn); a0 passed through |
| 02070ce0 | 84 | legacy | wrong tier (listed as permanent wall) |
| 0207103c | 80 | legacy | missing return value (new high word) |
| 020720b4 | 144 | legacy | nested `if (c != 0) {..return 1;} return 0` |
| 020726e0 | 252 | legacy | wrong tier; inline Swap16 |
| 02073738 | 256 | legacy | wrong tier; store order; Swap16 on ushort casts |
| 02073a5c | 100 | legacy | func_02073ac0 takes 6 args; handle global re-read at each use |
| 02073ed8 | 80 | legacy | wrong tier |
| 02073f28 | 92 | legacy | separate statements fix add operand order |
| 02073fc8 | 192 | legacy | wrong tier (checksum) |
| 020740c4 | 96 | legacy | func_02074498 takes an argument (0) |
| 02074b38 | 88 | legacy | branch polarity (`n >= avail` first) |
| 02076ad0 | 164 | legacy | func_02076c4c passed 2 values; hi/lo locals; pointer + offset |
| 02076b74 | 216 | legacy | hi/lo locals fix load order |
| 020770bc | 256 | legacy | func_020771bc takes 2 args; switch cases ordered 1,2,0 |
| 02077954 | 132 | legacy | wrong tier |
| 020779d8 | 80 | legacy | wrong tier; `while (n-- != 0)` |
| 02077a28 | 96 | legacy | declaration order |
| 02077b5c | 60 | legacy | wrong tier |
| 02077c08 | 256 | legacy | declaration and init order |
| 02077db0 | 168 | legacy | declaration order |
| 02077ecc | 192 | legacy | `index = 0` before the block call; statement order |
| 0207850c | 192 | legacy | same as 02077ecc |
| 02079b0c | 60 | legacy | wrong tier |
| 02079c74 | 76 | legacy | func_02079cc0 takes 4 args (n as 4th) |
| 0207b0e0 | 92 | legacy | wrong tier |
| 0207b18c | 164 | legacy | declaration order |
| 0207c484 | 104 | legacy | single return of n |
| 0207c4ec | 132 | legacy | single return; `(char *)&n->info + 4` |
| 0207c5b4 | 228 | legacy | `i * sizeof(Entry)` stops strength reduction; for-loop |
| 0207c8d8 | 92 | legacy | wrong tier |
| 0207c990 | 76 | legacy | wrong tier |
| 0207cbe0 | 112 | legacy | statement order |
| 0207cc50 | 88 | legacy | wrong tier |
| 0207d458 | 60 | legacy_sp3 | wrong tier (sp3) |
| 0207d4dc | 68 | legacy_sp3 | callee takes 3 args (r2 live); sp3; `if (bad) return 0;` |
| 0207d520 | 240 | legacy_sp3 | sp3; temp for the end compare |
| 0207d610 | 188 | legacy_sp3 | sp3; inline `~(align - 1)`; decl order |
| 0207da1c | 44 | default | pad is `unsigned short`; header is 0x10 bytes |
| 0207db00 | 68 | legacy_sp3 | same as 0207d4dc |
| 0207db8c | 108 | legacy_sp3 | sp3; `n = top - p` before the flag test |
| 0207dbf8 | 100 | legacy_sp3 | sp3; operand order |
| 0207e0a8 | 124 | legacy_sp3 | unsigned compare; decl order |
| 0207e594 | 164 | legacy_sp3 | wrong tier (sp3) |
| 0207e790 | 72 | legacy | pointer-first add `(char *)h + x` |
| 0207e840 | 96 | legacy | `^` gives eors |
| 0207f510 | 256 | legacy_sp3 | case order 1,2,0; sp3 |
| 0207feec | 152 | legacy_sp3 | `*out = res` struct copy; sp3 |
| 0207ff84 | 116 | legacy_sp3 | declaration order; sp3 |
| 0207fff8 | 192 | legacy_sp3 | func_02080114 takes (c, ch); flag at +8; decl order |

Per-file callee declarations that differ from the callee's definition:
func_02076c4c is called with two values (definition takes one) and
func_02076c5c is declared `int` (definition `unsigned short`) in 02076ad0 and
02076b74; func_0207d914 and func_0207dc5c take a third pass-through argument in
0207d4dc and 0207db00; callees that are still `.s` are declared from the
original's registers. func_02073a5c reads `data_0219ef20` through
`void *volatile`, as the matched func_0207397c already declares it; the
original reloads it at each use. No volatile locals, asm, pins or raw data.
Two lines use an honest oddity: `(unsigned int)count > 1` (0207e0a8) and
`(char *)&n->info + 4` (0207c4ec).

## Checked

| Check | Exit | Output |
|---|---|---|
| `fastmatch.py eur` on the 54 C files before the revert below | 0 | 54 lines `100.0%  OK` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `validate_attempts.py` | 0 | `"rows": 2878`, `"errors": 0` |
| `check_fake_matches.py` | 0 | `OK` |
| `python -m pytest -q tests` | 0 | `1329 passed, 16 skipped, 132 subtests passed` |
| `gate3.py --scope all`, final | 0 | `12860:[eur] SHA1 PASS`, `12902:[usa] SHA1 PASS`, `12944:[jpn] SHA1 PASS`, `12950:check_references: OK`, `12955:check_fake_matches: OK`, `12984:1330 passed, 15 skipped, 132 subtests passed`, `12987:GATE PASS`, `12988:gate3: GATE EXIT 0` |

STALE baseline lines for replaced `.s` files: none in the final gate.
The first gate failed on func_0207845c alone (`check_references: FAIL`; the
original references `data_021020b5`, my C builds `data_021020b4+0x1`), so I
reverted it to `.s` with a parked row and re-gated. The ledger base is a
byte-identical prefix. Some corrective rows exist: func_02077018 had wrong
plain and sp3 scores in the first rows, and func_0207d3ac's tiers were
re-scored with better drafts; the latest row per address is the true one.

## Not checked

Natural-C for USA and JPN beyond the gate; tiers other than the one shipped
for each match; `check_match_invariants.py` (exit 1, 0 errors, 13999 warnings,
as before).

## Failed or blocked

17 parked, `.s` and routing restored, one row per tier. Best score per tier
(plain, legacy, sp3) and the real residue:

| Function | Size | Scores | Residue |
|---|---|---|---|
| 0207084c | 224 | 0.0, 3.6, 3.6 | original hoists constants 0 and 0x18 (spilled); mine propagates them |
| 0207108c | 176 | 2.3, 52.3, 31.8 | constant and loop register letters |
| 02074dcc | 128 | 0.0, 91.4, 69.7 | see below |
| 02074e4c | 12 | 0, 0, 0 | tail epilogue of 02074dcc |
| 02076d14 | 200 | 0.0, 16.0, 16.0 | pointer register `r5` kept; extra `add` for a load |
| 02077018 | 116 | 17.2, 93.5, 17.2 | see below |
| 0207708c | 8 | 0, 0, 0 | tail epilogue of 02077018 |
| 02078e3c | 128 | 0.0, 24.2, 25.0 | zero constant held in `r0`; base pointer register |
| 02078eec | 28 | 0, 0, 0 | 64-bit return built from two words; extra `orr #0` |
| 02078f08 | 72 | 83.3, 83.3, 83.3 | post-index store fusion and `sub` position |
| 0207845c | 60 | 100 (fastmatch) | gate reference mismatch, reverted |
| 0207af28 | 120 | 0.0, 86.7, 16.7 | `r1`/`r2` swap for base and stored constant |
| 0207d3ac | 132 | 42.4, 34.3, 35.3 | best/offset in `r5`/`r6` against `r12`/`lr` |
| 0207d6cc | 192 | 0.0, 74.0, 91.7 | `align-1`/mask in `r12`/`r2` swapped |
| 0207ec28 | 64 | 11.8, 62.5, 62.5 | `r2`/`r3` swap of the two loaded halfwords |
| 0207ef90 | 204 | 2.0, 13.7, 15.7 | bool from an inline range check is not folded in the original |
| 0207f05c | 220 | 0.0, 18.2, 16.4 | same inline bool |

Finding for Brain: func_02074dcc and func_02077018 end in an infinite loop and
mwcc emits the dead epilogue after it; `delinks.txt` split that epilogue into
the separate blocks func_02074e4c (12 B) and func_0207708c (8 B). My C matches
every instruction of the first 128 and 116 bytes (91.4% and 93.5% only because
of the missing tail). They ship if each pair becomes one block (`.text start`
at the first address, `end` at the end of the tail, tail block removed): +140 B
and +124 B. That is outside "path lines only", so I left them parked. Drafts:

```c
/* func_02074dcc: Conn { ctx at 0xc; f18, f1a ushort; f1c, f20 } */
void func_02074dcc(Conn *c) {
    Ctx *x = c->ctx;
    while (1) {
        func_02070ec4(c);
        x->f455 = 0; x->f1d4 = 0; x->f454 = 1;
        func_020785cc((char *)x + 0x2ec);
        func_02077f8c((char *)x + 0x3a4);
        if (func_02074e58(c) == 0) { x->f455 = 8; return; }
        func_02070c84(c);
        c->f18 = c->f1a; c->f1c = c->f20;
    }
}
/* func_02077018 (legacy) */
int func_02077018(const char *a, const char *b) {
    signed char ca, cb; int la, lb;
    while (1) {
        while ((ca = *a++) == (cb = *b++)) { if (ca == 0) return 0; }
        if (cb != '*') return 1;
        a--; la = func_02077094(a); lb = func_02077094(b);
        if (lb > la) return 1;
        a += la - lb;
    }
}
```
