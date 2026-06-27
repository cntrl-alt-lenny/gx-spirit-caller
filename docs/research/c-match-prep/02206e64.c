/* CAMPAIGN-PREP candidate for func_02206e64 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind t=bit0 once; index (t&1)*0x868 and ((1-t)&1)*0x868 (explicit &1 -> two and#1, two mul by same 0x868); accumulator-first a+0x7d0<=b => movle/movgt.
 *   risk:       reshape-able: the two redundant 'and #1' on a :1-derived index may be folded away by mwcc. If so, source bit0 via (field<<31)>>31 (int) so the value isn't provably 1-bit.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02206e64 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Leaf dual mul-select globals + add + compare.
 * t = field@+2 bit0(:1), read once. a = *(int*)(cf16c + (t&1)*0x868);
 *   b = *(int*)(cf16c + ((1-t)&1)*0x868); return (a + 0x7d0 <= b) ? 1 : 0.
 * asm has lsl#1f;lsr#1f (the :1 read) THEN and #1 on each index -> keep & 1.
 * Both indices multiply the SAME 0x868 (two mul by one reg). */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];   /* 0x868 parity-stride int table */

struct Ent6e64 { u16 _0; u16 b0 : 1; u16 _r : 15; };

int func_ov002_02206e64(struct Ent6e64 *p) {
    int t = p->b0;
    int a = *(int *)(data_ov002_022cf16c + (t & 1) * 0x868);
    int b = *(int *)(data_ov002_022cf16c + ((1 - t) & 1) * 0x868);
    return (a + 0x7d0) <= b;
}
