/* CAMPAIGN-PREP candidate for func_0208a000 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: lsl8;lsr8 => unsigned :24 bitfield; flag byte => :1 at +3; out-param guard
 *   risk:       struct-guessed: id as :24 + flag :1 at byte+3 inferred. If mwcc loads the flag byte via ldrb of a separate char vs the bitfield, the byte-test path can differ; :24 should reproduce lsl;lsr.
 *   confidence: med
 */
/* func_0208a000 (main, class D): lookup, then 24-bit-low id via
 * lsl#8;lsr#8 (=> :24 bitfield member). bit2 of arg1 selects branch;
 * within it, flag byte [+3]&1 picks func_02089cd8 vs func_02089df8.
 *   mov r0,lsl#8; mov r0,lsr#8 on ptr[0] => obj->id (unsigned :24).
 *   optional out-param at [sp,#0x10] stored if non-NULL. */
typedef struct {
    unsigned int id : 24;   /* +0x00 low 24 bits */
    unsigned int flag : 1;  /* +0x03 bit0 */
    unsigned int _pad : 7;
} Ent_0208a000;

extern int          func_02089024(unsigned int id);
extern Ent_0208a000 *func_02089260(void *a0);
extern int          func_02089cd8(unsigned int id, int a1, int a2);
extern int          func_02089df8(unsigned int id, int a1, int a2);

int func_0208a000(void *a0, int flags, int a2, int a3, int *out) {
    Ent_0208a000 *e;
    int r;

    e = func_02089260(a0);
    if (e == 0) {
        return 5;
    }

    if (flags & 4) {
        if (e->flag & 1) {
            r = func_02089cd8(e->id, a2, a3);
        } else {
            r = func_02089df8(e->id, a2, a3);
        }
        if (r == 0) {
            return 9;
        }
    } else {
        r = func_02089024(e->id);
    }

    if (out != 0) {
        *out = r;
    }
    return 0;
}
