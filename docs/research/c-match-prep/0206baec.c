/* CAMPAIGN-PREP candidate for func_0206baec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: scatter copy in asm order, orr#2 flag store emitted last
 *   risk:       store-order/literal-pool: orig interleaves the 5 ldr/str and reads *ece4 (r3) BEFORE the scatter, orr|2 last. reshape-able: keep flag read early + flag store last, scatter in shown order. struct-guessed (Src field offsets, ef34+4 inferred as the next int).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206baec (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Drop into src/, ninja + objdiff, apply risk note.
 *   recipe: scatter-copy in exact asm store-order; orr#2 flag store LAST
 * func_0206baec: snapshot src (=*pSrc) fields +4..+0x14 into 5 int globals,
 * then set *pFlag |= 2 (the flag store is emitted last).
 */
typedef struct {
    int _pad_00;
    int w04;   /* +0x4 */
    int w08;   /* +0x8 */
    int w0c;   /* +0xc */
    int w10;   /* +0x10 */
    int w14;   /* +0x14 */
} Src;

extern Src *data_0219ecd8;   /* *pSrc */
extern int  data_0219ece4;   /* flag word (|=2) */
extern int  data_0219eee8;
extern int  data_0219eef8;
extern int  data_0219ef1c;
extern int  data_0219ef34;   /* and data_0219ef34+4 written via [r1,#0x4] */

void func_0206baec(void) {
    Src *s = data_0219ecd8;
    int  f = data_0219ece4;
    data_0219ef1c   = s->w04;
    data_0219eee8   = s->w08;
    data_0219eef8   = s->w0c;
    data_0219ef34   = s->w10;
    (&data_0219ef34)[1] = s->w14;
    data_0219ece4   = f | 2;
}
