/* CAMPAIGN-PREP candidate for func_02023188 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D/C: short idx so idx*0x3c => smlabb; aliased bases bound once; strh-then-reload f74
 *   risk:       smlabb needs idx kept `short` and fused as mla; orig also RELOADS f74 after the >=0x90 store for the loop test. mwcc may use mul+add, drop the reload, or rotate the 3 aliased base regs (r4/r6/r7). struct-guessed offsets + permuter-class fusion
 *   confidence: low
 */
/* func_02023188: while head(0x3476)!=tail(0x3474) walk slots (stride 0x3c,
 * smlabb idx*0x3c+base@0x12b4), teardown f38, bump+wrap a 0x3474 counter. */

extern char data_02197434[];
extern char data_0219a834[];
extern void func_02006e1c(int x);

int func_02023188(void) {
    short idx = *(short *)(data_0219a834 + 0x76);
    if (idx == *(short *)(data_0219a834 + 0x74)) return 1;
    {
        char *cnt  = data_02197434 + 0x74 + 0x3400;   /* 0x3474 */
        char *slotbase = data_02197434 + 0x2b4 + 0x1000; /* 0x12b4 */
        char *blk  = data_02197434 + 0x3400;
        short head;
        do {
            char *sl = slotbase + idx * 0x3c;
            if (*(int *)(sl + 0x38) != 0) {
                func_02006e1c(*(int *)(sl + 0x38));
                *(int *)(sl + 0x38) = 0;
            }
            *(short *)cnt = (short)(*(short *)cnt + 1);
            head = *(short *)(blk + 0x76);
            if (*(short *)(blk + 0x74) >= 0x90) {
                *(short *)(blk + 0x74) = 0;
            }
        } while (head != *(short *)(blk + 0x74));
    }
    return 1;
}
