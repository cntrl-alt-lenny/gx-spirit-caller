/* CAMPAIGN-PREP candidate for func_0203194c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: bind global counter once; reproduce 64-bit shift/orr pack via u64.
 *   risk:       mwcc's 64-bit shift+orr register pairing (ip/r2 scheduling around the increment) is a scheduling coin-flip; permuter-class. The mvn/and #0 guard idiom may not reproduce from a plain `&0`.
 *   confidence: low
 */
/* func_0203194c: 64-bit ID/timestamp generator. Increments a u32 counter at
 * data_0219adb8+0x4 (returns the PRE-increment value), and packs a 64-bit
 * result from that counter and the arg r4 (>>4 / <<0x1c). The leading
 *   mvn r0,#0; and r0,r0,#0; and r1,r4,#0; cmp r0,#0; cmpeq r1,#0; beq
 * is mwcc's inline 64-bit (hi||lo)==0 guard on an effectively-zero value =>
 * the call to func_02093bfc is taken when a masked 64-bit field is nonzero.
 * Return r0=lo, r1=hi.
 */

typedef struct { char _pad[0x4]; unsigned int counter; /* +0x4 */ } Mgr_0203194c;
extern Mgr_0203194c data_0219adb8;
extern void func_02093bfc(void);

unsigned long long func_0203194c(unsigned int x) {
    unsigned int c;
    if (((unsigned long long)x & 0) != 0) {
        func_02093bfc();
    }
    c = data_0219adb8.counter;
    data_0219adb8.counter = c + 1;
    return ((unsigned long long)c << 0x1c) | (unsigned long long)(x >> 4);
}
