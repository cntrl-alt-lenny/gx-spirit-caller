/* CAMPAIGN-PREP candidate for func_020097f0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D branch-table: ldrh-clamp, even-round divmod, fall-through addls pc jump-table
 *   risk:       struct-guessed + truncated: asm ends mid-body at `cmp r0,#0x7`; the epilogue and remaining bit-ORs (reading data_02104f3c[0x938]) are absent, so a full byte-match is impossible from this input. The fall-through case ordering and `sel & ~1` rounding are inferred.
 *   confidence: low
 */
/* WARNING: source asm is TRUNCATED at `cmp r0,#0x7` (no epilogue / tail).
   Only the reconstructable prefix is modeled; the full body is incomplete. */
extern short data_0210593c[];
extern unsigned int data_02104f3c[];
extern void func_0201a3ec(void);
extern void func_0201a498(void);

int func_020097f0(void)
{
    int mask;
    int i;
    int sel;

    mask = 0;
    for (i = 0; i < 4; i++)
        mask |= 1 << i;

    sel = data_0210593c[0x62 / 2];
    if (sel > 0x1c)
        sel = 0x1c;
    if (sel % 2 != 0)
        sel -= 1;

    switch (sel) {
    case 0x1c: mask |= 0x2000000;
    case 0x1a: mask |= 0x1000000;
    case 0x18: mask |= 0x800000;
    case 0x16: mask |= 0x400000;
    case 0x14: mask |= 0x200000;
    case 0x12: mask |= 0x80000;
    case 0x10: mask |= 0x20000;
    case 0x0e: mask |= 0x4000;
    case 0x0c: mask |= 0x1000;
    case 0x0a: mask |= 0x400;
    case 0x08: mask |= 0x200;
    case 0x06: mask |= 0x100;
    case 0x04: mask |= 0x40;
    case 0x02: mask |= 0x10;
    default: break;
    }

    /* body continues: reads data_02104f3c[0x938/4], cmp #7, ... (asm truncated) */
    return mask;
}
