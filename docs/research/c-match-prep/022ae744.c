/* CAMPAIGN-PREP candidate for func_022ae744 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cnt declared first (lr), b second (ip); f3c++ left as memory RMW (not cached); && order b<11 then cnt<3 matches cmp/cmplt
 *   risk:       reshape-able: orig allocates locals to lr/ip and saves only {r3,lr} (leaf, low pressure). If mwcc spills to r4+, the stmdb/prologue diverges; keep exactly 2 locals + base.
 *   confidence: med
 */
/* func_ov002_022ae744: scan up to 11 mask bits, recording the indices
 * of set bits into base->slot[0..2] (max 3), counting them in
 * base->f3c. Any unused slots are filled with -1.
 *
 *     mov lr,#0          ; cnt
 *     mov ip,lr          ; b
 *     str lr,[r0,#0x3c]  ; base->f3c = 0
 *     mov r3,#1
 *     b .test
 *   .body:
 *     tst r1,r3,lsl ip; beq .skip
 *     add r2,r0,lr,lsl#2; str ip,[r2,#0x1c]   ; slot[cnt]=b
 *     ldr r2,[r0,#0x3c]; add lr,#1; add r2,#1; str r2,[r0,#0x3c]
 *   .skip: add ip,#1
 *   .test: cmp ip,#0xb; cmplt lr,#3; blt .body
 *     cmp lr,#3; ldmgeia ret
 *     mvn r2,#0
 *   .fill: mov r1,lr,lsl#2; add lr,#1; add r1,r0,r1; str r2,[r1,#0x1c]
 *     cmp lr,#3; blt .fill; ret
 */

struct bitscan {
    int pad00[7];   /* 0x00..0x18 */
    int slot[3];    /* 0x1c..0x24 */
    int pad28[5];   /* 0x28..0x38 */
    int f3c;        /* 0x3c */
};

void func_ov002_022ae744(struct bitscan *base, unsigned int mask) {
    int cnt = 0;
    int b;

    base->f3c = 0;
    for (b = 0; b < 11 && cnt < 3; b++) {
        if (mask & (1 << b)) {
            base->slot[cnt] = b;
            cnt++;
            base->f3c++;
        }
    }
    for (; cnt < 3; cnt++)
        base->slot[cnt] = -1;
}
