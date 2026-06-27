/* CAMPAIGN-PREP candidate for func_02086464 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack-struct store-order; blx via fnptr-table[flags&7]; smull>>12 reload obj[0x30]
 *   risk:       struct-guessed: s[] index->sp mapping (0x8/0x38/0x3c/0x44/0x48) inferred; orig RELOADS obj[0x30] each of 3 smull (r3=[r4,#0x30] thrice) — if mwcc binds it once, 2 ldr diverge (reshape: separate reads).
 *   confidence: med
 */
/* func_02086464: build 0x50 stack-struct, blx a dispatch fn via data_02102380[flags&7],
 * then conditionally FX12-scale 3 fields by obj[0x30] and 3 by obj[0x34], then func_02084e0c. */
typedef signed int s32;
typedef signed long long s64;
typedef s32 fx32;

extern void (*data_02102380[])(int *, void *);
extern void func_02084e0c(int, int *, int);

void func_02086464(int *o) {
    int s[20];                  /* 0x50 bytes */
    s[0] = (o[0] & 8) ? 0x00101610 : 0x00101810;
    s[17] = 0x1000;             /* sp+0x44 */
    s[1] = 3;
    s[18] = 2;                  /* sp+0x48 */
    s[16] = 0;                  /* sp+0x40 */
    s[13] = 0; s[12] = 0; s[11] = 0; s[10] = 0; s[9] = 0; s[8] = 0;
    s[5] = 0; s[4] = 0;
    data_02102380[o[0] & 7](&s[2], o);   /* blx, dst = sp+0x8 */
    if (o[0x0c] != 0x1000) {             /* obj[0x30] */
        s[2]  = (s32)(((s64)o[0x0c] * s[2])  >> 12);
        s[3]  = (s32)(((s64)o[0x0c] * s[3])  >> 12);
        s[14] = (s32)(((s64)o[0x0c] * s[14]) >> 12);   /* sp+0x38 */
    }
    if (o[0x0d] != 0x1000) {             /* obj[0x34] */
        s[6]  = (s32)(((s64)o[0x0d] * s[6])  >> 12);
        s[7]  = (s32)(((s64)o[0x0d] * s[7])  >> 12);
        s[15] = (s32)(((s64)o[0x0d] * s[15]) >> 12);   /* sp+0x3c */
    }
    func_02084e0c(s[0], &s[1], 0x12);
}
