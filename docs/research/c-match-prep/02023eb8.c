/* CAMPAIGN-PREP candidate for func_02023eb8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: two :1 bit tests gate DISPCNT 0x1f00 RMW; double volatile read; field|=1 vs field&1 insert
 *   risk:       reshape-able: orig does ldr [r2]; ldr [r2] (two reads) before bic/orr — volatile *disp twice should reproduce. The else-branch (field&1)<<8 is mov r3,lsl31; orr lsr23 = same value but mwcc may pick and #0x100 instead of the lsl/lsr pair. struct-guessed: only +0xce field known; arg is a pointer.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02023eb8 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: two :1 bitfield tests (lsl31/lsr31, lsl30/lsr31) gate a DISPCNT 0x1f00 field RMW; double volatile read; bit-insert.
 * both bits set -> field|=1 ; else -> field = field & 1.
 */
typedef struct { unsigned short h_ce; } S23eb8;   /* +0xce u16 flags */

int func_02023eb8(S23eb8 *p) {
    unsigned short v = p->h_ce;                    /* ldrh [r0,#0xce] */
    volatile unsigned int *disp = (volatile unsigned int *)0x04000000;

    if ((v & 1) && ((v >> 1) & 1)) {               /* lsl31/lsr31 ; lsl30/lsr31 */
        unsigned int field = (*disp & 0x1f00) >> 8;
        *disp = (*disp & ~0x1f00) | ((field | 1) << 8);   /* field |= 1 */
    } else {
        unsigned int field = (*disp & 0x1f00) >> 8;
        *disp = (*disp & ~0x1f00) | ((field & 1) << 8);   /* keep bit0 only */
    }
    return 1;
}
