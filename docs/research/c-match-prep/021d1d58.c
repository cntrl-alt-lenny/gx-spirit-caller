/* CAMPAIGN-PREP candidate for func_021d1d58 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N members for each lsl;lsr field; emit strh stores in asm order
 *   risk:       ASM IS TRUNCATED mid-body (no tail/epilogue/literal pool); field widths and the _LIT1 stride literal are struct-guessed. NOT byte-matchable as given — needs the full disasm. struct-guessed.
 *   confidence: low
 */
/* func_ov002_021d1d58: ov002 dense bitfield serializer into a 4-byte stack
 * record (sp[0],sp[2]) then 0202e2c8 + 0229ade0.
 * !!! BATCH ASM IS TRUNCATED !!! The JSON cuts off mid-body right after the
 * second `strh r2,[sp]` (no epilogue, no literal pool, the 0229ade0 post and
 * return are ABSENT). This TU is a SCAFFOLD of the visible prefix ONLY; the
 * field widths/offsets below are reverse-engineered from the bic/orr masks
 * and the tail must be filled from the full disasm before a byte match is
 * possible. _LIT1 is used as a MULTIPLIER value (stride) not a base, so its
 * literal is also unresolved. cls D: bitfield store-order. */
#include "ov002_core.h"

extern char data_ov002_022cf168[];   /* _LIT1: used as a *stride value* (mul), literal unresolved */
extern int  data_ov002_022cf180[];   /* _LIT2: indexed [(player&1)*stride] count table          */
extern int  func_0202e2c8(void);

/* 4-byte packed record laid into the stack halfwords sp[0..3]. Field map
 * inferred from masks: sp[2] bit0 = player&1 (mask 0x1); bits1..5 (0x3e) a
 * 5-bit field set to 0x1c>>1; bits6..13 (0x3fc0) an 8-bit field from
 * ((cnt-1)<<24>>18); bit15 cleared then bit14 (0x4000) set. sp[0] bit0 =
 * player&1; bits1..5 from 0202e2c8?0xc:0xd; bits6..13 cleared. */
struct Rec021d1d58 {
    unsigned short b0  : 1;   /* sp[2].0 = player&1 */
    unsigned short f1  : 5;   /* sp[2].1..5 (0x3e)  */
    unsigned short f6  : 8;   /* sp[2].6..13 (0x3fc0) */
    unsigned short b14 : 1;   /* sp[2].14 (0x4000)  */
    unsigned short b15 : 1;   /* sp[2].15 cleared   */
};

int func_ov002_021d1d58(void) {
    int player;
    int cnt;
    int n818;
    player = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    if (*(int *)(data_ov002_022ce950 + 0x810) != 0)
        return player;
    cnt = data_ov002_022cf180[(player & 1) * ((int)(unsigned int)(unsigned long)data_ov002_022cf168)];
    if (cnt == 0) {
        /* TRUNCATED: the cnt==0 (.L_1b4) arm is entirely absent from the batch. */
        return player;
    }
    /* --- visible prefix of the cnt!=0 serializer (SCAFFOLD, fields above) --- */
    func_ov002_021c93f0((void *)0, 0xe, 0 /* uses cnt-1 */);
    func_ov002_021b91c4((int *)data_ov002_022cf16c, (const int *)0);
    n818 = *(int *)(data_ov002_022ce950 + 0x818);
    func_0202e2c8();
    /* TRUNCATED past `strh r2,[sp]`: the 0229ade0 post + epilogue are ABSENT. */
    return player;
}
