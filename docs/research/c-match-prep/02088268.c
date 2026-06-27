/* CAMPAIGN-PREP candidate for func_02088268 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind k once (used as table index AND shift base r6); reload count each iter (cmp r5,[+0x48]); v>>8 signed asr; 1<<k in r8 hoisted
 *   risk:       Orig hoists r8=1 outside loop and reloads count [+0x48] every iter (not cached); mwcc -O4 may cache f48 in a reg and rematerialize 1<<k differently. reshape-able (reload via s->f48 in cond keeps the per-iter ldr).
 *   confidence: med
 */
/* func_02088268 (main, class C). loop with table-index, byte mask shifts.
 * r7=arg0 held. [+0x3c]=arg1. n=[+0x48]; if(n<=0) return.
 * r4=data_021a5184 (stride-8 table). for i in 0..n-1:
 *   k = *(u8*)(arg0 + i + 0x4c);
 *   p = [+0x3c] + data_021a5184[k].f4;
 *   v = func_02095d6c(p);
 *   func_02094f14(1<<k, v & 0xff, v >> 8);   (asr, signed)
 *   reload n = [+0x48].
 */

struct T88268 { int f0; int f4; };    /* stride 8 */

struct S88268 {
    char _pad00[0x3c];
    int  f3c;                 /* +0x3c base */
    char _pad40[0x48 - 0x40];
    int  f48;                 /* +0x48 count */
    /* +0x4c.. byte array of table indices */
};

extern struct T88268 data_021a5184[];
extern int  func_02095d6c(int p);
extern void func_02094f14(int a, int b, int c);

void func_02088268(struct S88268 *s, int arg1) {
    int i;
    s->f3c = arg1;
    if (s->f48 <= 0) return;
    for (i = 0; i < s->f48; i++) {
        int k = *((unsigned char *)s + i + 0x4c);
        int v = func_02095d6c(s->f3c + data_021a5184[k].f4);
        func_02094f14(1 << k, v & 0xff, v >> 8);
    }
}
