/* CAMPAIGN-PREP candidate for func_02049f74 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     a1 held in r6 across all calls; counted scan loop with stride-0xc struct, byte tag at +0
 *   risk:       orig holds the array base in r4 and post-increments r4+=0xc each iter with i in r5; if mwcc indexes data_0219dcb4[i].tag via mul/scaled-load instead of a walking pointer, the loop's ldrb addressing diverges. reshape-able (use a walking `Ent *p` ++).
 *   confidence: med
 */
/* func_02049f74 - main - class D (fixed call sequence + byte-stride scan loop).
 * a0 selects: only a0==0 runs; a0==1/2/default just return. a1 (held in r6)
 * is passed to func_02067328 with a fixed list of ids, then a 0x9a-entry scan
 * over data_0219dcb4 (stride 0xc) re-passes any non-zero leading byte. */

typedef unsigned char u8;

typedef struct {
    u8   tag;        /* +0x00 */
    char _pad[0xb];
} Ent02049f74;       /* sizeof 0xc */

extern Ent02049f74 data_0219dcb4[];
extern void func_02067328(int p, int v);

void func_02049f74(int a0, int a1) {
    int i;
    if (a0 != 0) return;
    func_02067328(a1, 0x8);
    func_02067328(a1, 0xa);
    func_02067328(a1, 0x32);
    func_02067328(a1, 0x33);
    func_02067328(a1, 0x34);
    func_02067328(a1, 0x35);
    func_02067328(a1, 0x36);
    for (i = 0; i < 0x9a; i++) {
        if (data_0219dcb4[i].tag != 0)
            func_02067328(a1, data_0219dcb4[i].tag);
    }
}
