/* CAMPAIGN-PREP candidate for func_020540d0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     double bounds-guard ||; mla base+stride*idx (base loaded first)
 *   risk:       struct-guessed: count@0x00/stride@0x08/base@0x14 inferred (pads 0x04/0x0c/0x10 unknown) — confirm against real struct. mla wants base referenced first; first guard uses movs/bmi for idx<0.
 *   confidence: med
 */
/* func_020540d0 (main, class D) — bounds-checked element address into a strided
 * array. Assert (func_020a6d54, line 0x94) when idx is out of [0, count), then a
 * second identical guard returns 0, else base + stride*idx.
 *   self->count @0x00, self->stride @0x08, self->base @0x14.
 */

extern char data_020ffb04[];
extern char data_020ffb10[];
extern void func_020a6d54(const char *a, const char *b, int c, int line);

typedef struct {
    int  count;     /* 0x00 */
    int  _04;
    int  stride;    /* 0x08 */
    int  _0c;
    int  _10;
    int  base;      /* 0x14 */
} Arr;

void *func_020540d0(Arr *self, int idx) {
    if (idx < 0 || idx >= self->count)
        func_020a6d54(data_020ffb10, data_020ffb04, 0, 0x94);

    if (idx < 0 || idx >= self->count)
        return 0;

    return (void *)(self->base + self->stride * idx);
}
