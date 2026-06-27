/* CAMPAIGN-PREP candidate for func_022a0f8c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: addls pc jump-table (dense switch); signed (x<<0x11)>>0x1f and (short)(x>>0x10)>>a1 bit-extracts; decl-order
 *   risk:       INPUT ASM TRUNCATED at .L_11c — f_14 sub-switch cases 1 & 2 are missing, so the tail is reconstructed/incomplete and WILL diverge. Also the addls-pc jump table needs cases 4/6/7/10 only (others -> default) to lay the table right. struct-guessed + incomplete-source
 *   confidence: low
 */
/* func_ov002_022a0f8c: status getter. v = a0->f_4; jump-table on v in 0..9:
 *   case4 -> bit = (func_021afb90(a1)->[0] << 0x11) >> 0x1f  (bit14 of word0)
 *   case6 -> (a0->f_8 >> (a1+1)) & 1
 *   case7,10 -> if ((a0->f_c >> (a1+1)) & 1) return 0; else
 *               return ((short)(a0->f_8 >> 0x10) >> a1) & 1
 * default/.L_a0 (v<0 etc): if v>=0 return; if func_021afaf0()<=1 return;
 *   switch(a0->f_14): 0 -> [partial, see note]; 1,2 -> TRUNCATED in source asm.
 * NOTE: input asm truncated at .L_11c (cases 1 & 2 of the f_14 sub-switch are
 * missing); tail reconstructed conservatively. */
extern int  func_ov002_021afaf0(void);
extern int *func_ov002_021afb90(int a);
extern int  func_ov002_022ac028(void);

int func_ov002_022a0f8c(char *a0, int a1) {
    int v = *(int *)(a0 + 0x4);
    switch (v) {
    case 4: {
        int w = *func_ov002_021afb90(a1);
        return (w << 0x11) >> 0x1f;
    }
    case 6:
        return (*(int *)(a0 + 0x8) >> (a1 + 1)) & 1;
    case 7:
    case 10:
        if ((*(int *)(a0 + 0xc) >> (a1 + 1)) & 1) return 0;
        return (((short)(*(int *)(a0 + 0x8) >> 0x10)) >> a1) & 1;
    default:
        break;
    }
    if (v >= 0) return 0;
    if (func_ov002_021afaf0() <= 1) return 0;
    switch (*(int *)(a0 + 0x14)) {
    case 0: {
        int n = -*(int *)(a0 + 0x4);
        if (n < 0x27) {
            return (*(int *)(a0 + 0x4c) == v) ? 1 : 0;
        }
        if (*(int *)(a0 + 0x4c) > 0) return 1;
        if (n == 0x48) return 1;
        return 0;
    }
    /* case 1 (.L_11c) and case 2 (.L_14c): TRUNCATED in input asm */
    default:
        return 0;
    }
}
