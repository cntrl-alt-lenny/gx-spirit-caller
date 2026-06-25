/* CAMPAIGN-PREP candidate for func_021b7694 (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     scan loop; if-hit return i; const-init stores in asm order; limit clamp via if-assign (movgt)
 *   risk:       permuter-class: the y-field write box[1]=0xc+i*0x18 sits inside the loop with i*0x18 carried in r8 (separate counter) and limit recomputed each iter via movgt — mwcc's reg-alloc of r8/r6 and the loop-rotated guard likely differ; calls AABB clone that itself is .s-walled. struct-guessed scratch layout.
 *   confidence: low
 */
/* func_ov016_021b7694 (ov016, class C) — init a 0xc stack Box then scan
 * up to N slots (N = src->_8>6 ? 6 : 6 ... clamp) calling the AABB test
 * 021b287c; return first hit index, else -1. y-field at sp+2 set per-iter
 * to 0xc + i*0x18.
 */
extern int func_ov016_021b287c(void *box);

typedef struct {
    unsigned char _pad0[0x8];
    int count;            /* +0x8 */
} Src;

int func_ov016_021b7694(Src *src) {
    short box[6];         /* 0xc-byte scratch; box[0]=w?, box[1]=y */
    int i;
    int limit;

    box[0] = 6;                       /* strh #6  @sp+0 */
    ((unsigned char *)box)[4] = 0xda; /* strb     @sp+4 */
    ((unsigned char *)box)[5] = 0x10; /* strb     @sp+5 */
    box[3] = 0;                       /* strh #0  @sp+6 */
    box[4] = 0;                       /* strh #0  @sp+8 */

    i = 0;
    while (1) {
        limit = (src->count > 6) ? 6 : 0;
        if (i >= limit) break;
        box[1] = (short)(0xc + i * 0x18);  /* strh r8 @sp+2 */
        if (func_ov016_021b287c(box) != 0) return i;
        i++;
    }
    return -1;
}
