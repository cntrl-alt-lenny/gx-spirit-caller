/* CAMPAIGN-PREP candidate for func_02086ad4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order obj writes (hi then lo); strh for 0x20/0x22; blx table; reload obj[0x30]
 *   risk:       struct-guessed + permuter-class: batch asm truncated mid-second-smull; the 3 strne pairs write hi-field-before-lo (0x1c before 0x18) — mwcc must preserve that order; reload-vs-bind of obj[0x30] also.
 *   confidence: low
 */
/* func_02086ad4: like 02086464 — 0x50 stack-struct + flag-gated obj writes (0x18/0x1c,
 * 0x20/0x22 h, 0x24/0x28) + blx dispatch + FX12 scale by obj[0x30]/[0x34]. */
typedef signed int s32;
typedef signed short s16;
typedef signed long long s64;
typedef s32 fx32;

extern void (*data_021023a0[])(int *, void *);
extern void func_02084e0c(int, int *, int);

void func_02086ad4(int *o) {
    int s[20];
    s[0] = (o[0] & 8) ? 0x00101810 : 0x00101a10; /* LIT0/LIT1 placeholders */
    s[1] = 3;
    s[18] = 2;
    s[17] = 0x1000;
    s[16] = 0;
    s[13] = 0; s[12] = 0; s[11] = 0; s[10] = 0; s[9] = 0; s[8] = 0;
    s[5] = 0; s[4] = 0;
    if (o[0] & 1) { o[7] = 0x1000; o[6] = o[7]; }            /* [0x1c]then[0x18] */
    if (o[0] & 2) { ((s16 *)o)[0x11] = 0x1000; ((s16 *)o)[0x10] = 0; } /* h@0x22 then 0x20 */
    if (o[0] & 4) { o[10] = 0; o[9] = o[10]; }               /* [0x28] then [0x24] */
    data_021023a0[o[0] & 7](&s[2], o);
    if (o[0x0c] != 0x1000) {
        s[2]  = (s32)(((s64)o[0x0c] * s[2])  >> 12);
        s[3]  = (s32)(((s64)o[0x0c] * s[3])  >> 12);
        s[14] = (s32)(((s64)o[0x0c] * s[14]) >> 12);
    }
    if (o[0x0d] != 0x1000) {
        s[6]  = (s32)(((s64)o[0x0d] * s[6])  >> 12);
        s[7]  = (s32)(((s64)o[0x0d] * s[7])  >> 12);
        s[15] = (s32)(((s64)o[0x0d] * s[15]) >> 12);
    }
    func_02084e0c(s[0], &s[1], 0x12);
}
