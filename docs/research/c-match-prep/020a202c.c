/* CAMPAIGN-PREP candidate for func_020a202c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned cmp for cs/hi; s8 search-loop; store-between-loads defeats f_318 CSE; if-assign clamp
 *   risk:       reshape-able→permuter: the two (*data_021a98fc+0x1000)->f_318 loads; the out->f4 store between them should defeat CSE, but if mwcc still hoists, the 2nd ldr vanishes.
 *   confidence: low
 */
/* func_020a202c (main, class C) — descending search over a 3-entry table
 * then fill an output struct with scaled/clamped deltas.
 *   r0 = out, r1 = src, r2 = value, r3 = table base (pre-bias by 0xc inside)
 *
 * asm shape:
 *   - if (value >= src->count) return 0;                      (count @ +0x12, u16)
 *   - i = 2; while (value < src->lim[i]) { i = (s8)(i-1); if (i<0) break; }
 *   - if (i < 0) return 0;
 *   - scale = (*data_021a98fc + 0x1000)->f_318;
 *   - delta = (value - src->lim[i]) * scale;
 *   - e = &((elem*)(r3 + 0xc))[i];           // stride 0x10
 *   - out->f4 = e->f8 - delta;  if (out->f4 > scale) out->f4 = scale;  // reload scale
 *   - out->f8 = delta + src->base[i];        // int[] @ +0, stride 4
 *   - out->f0 = delta + e->f0;
 *   - out->fc = (s8)i;  return 1;
 */

typedef struct { int f0; int f8; } a202c_elem;   /* stride 0x10 */

typedef struct {
    int            base[3]; /* +0x00 int[3], read as ((int*)src)[i]  */
    unsigned short lim[3];  /* +0x0c u16[3], read as ((u16*)(src+0xc))[i] */
    unsigned short count;   /* +0x12 u16 */
} a202c_src;

typedef struct {
    int f0;   /* +0x00 */
    int f4;   /* +0x04 */
    int f8;   /* +0x08 */
    signed char fc; /* +0x0c */
} a202c_out;

typedef struct { char _pad[0x1318]; int f_318; } a202c_region; /* (*ptr+0x1000)+0x318 */
extern a202c_region *data_021a98fc;

int func_020a202c(a202c_out *out, a202c_src *src, int value, char *table)
{
    int i;
    int scale;
    int delta;
    a202c_elem *e;

    if ((unsigned int)value >= (unsigned int)src->count) return 0;

    i = 2;
    while ((unsigned int)value < (unsigned int)src->lim[i]) {
        i = (signed char)(i - 1);
        if (i < 0) break;
    }
    if (i < 0) return 0;

    scale = data_021a98fc->f_318;
    delta = (value - src->lim[i]) * scale;

    e = &((a202c_elem *)(table + 0xc))[i];

    out->f4 = e->f8 - delta;
    /* strhi -> unsigned HI; re-read the global (orig reloads, does not reuse scale) */
    if ((unsigned int)out->f4 > (unsigned int)data_021a98fc->f_318)
        out->f4 = data_021a98fc->f_318;

    out->f8 = delta + src->base[i];
    out->f0 = delta + e->f0;
    out->fc = (signed char)i;
    return 1;
}
