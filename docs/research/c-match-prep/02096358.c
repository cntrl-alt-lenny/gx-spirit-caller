/* CAMPAIGN-PREP candidate for func_02096358 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: stack bitfield struct :5/:1/:26 packed by 3 RMW stores in asm order; SIOCNT(0x04000184) guard
 *   risk:       permuter-class/struct-guessed: orig reads UNINIT stack word then 3 partial RMW stores; mwcc must keep the :5/:1/:26 assign order and schedule the first `str ip` (field0-only) before computing field2. Bitfield container/sign may diverge.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02096358 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: pack a stack word via :5/:1/:26 bitfield assigns (3 RMW stores, asm order); SIOCNT guard.
 *   risk:   permuter/struct-guessed bitfield RMW: uninit read + store order of the 3 field assigns.
 *   confidence: low
 */
/* func_02096358: build a 32-bit SIO command word in a stack bitfield
 * (lo5=a, bit5=c&1, hi26=b), reading the (uninitialised) word for each
 * partial assign. Then gate on SIOCNT@0x04000184: if busy bit 0x4000 set,
 * force start+busy and return -1; under IRQ-lock, if 0x2 set return -2,
 * else write the word to 0x04000188 and return 0. */

extern void OS_DisableIrq(void);
extern void OS_RestoreIrq(void);

typedef struct {
    unsigned int f0  : 5;   /* bits 0..4  = a */
    unsigned int f5  : 1;   /* bit  5     = c */
    unsigned int f6  : 26;  /* bits 6..31 = b */
} Cmd;

int func_02096358(int a, int b, int c) {
    Cmd w;
    volatile unsigned short *cnt = (volatile unsigned short *)0x04000184;
    w.f0 = a;
    w.f5 = c;
    w.f6 = b;
    if (*cnt & 0x4000) {
        *cnt |= 0xc000;
        return -1;
    }
    OS_DisableIrq();
    if (*cnt & 0x2) {
        OS_RestoreIrq();
        return -2;
    }
    *(volatile unsigned int *)0x04000188 = *(unsigned int *)&w;
    OS_RestoreIrq();
    return 0;
}
