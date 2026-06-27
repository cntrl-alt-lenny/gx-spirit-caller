/* CAMPAIGN-PREP candidate for func_021ffa80 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     b14^bit0 bind; byte-unpack call result (r&0xff,(r>>8)&0xff); guard chain; (x&1)*0x868 gate
 *   risk:       reshape-able (control-flow): the .L_144/.L_14c join (021bc68c!=0 OR (lo==x && 021bc288!=0) jumps to the SAME 021ca2b8 gate) is awkwardly duplicated; the campaign must merge to a single goto/flag so mwcc emits one tail, else block layout diverges.
 *   confidence: low
 */
/* func_ov002_021ffa80 (ov002, class C) — byte-unpack call result, guard chain, index-scale.
 * x = bits packed from f2: b14 = bit14 ^ bit0 (the eor); r = 021b3618(); if r==0xffff ret 0;
 * lo=r&0xff, hi=(r>>8)&0xff; guard 021bc8c8(x,lo,hi); guard !021bc68c(x);
 * if (lo==x && 021bc288(lo,hi)) ret 1-path; finally cf17c[(x&1)*0x868] nonzero. */
typedef unsigned short u16;

struct F021ffa80_F2 {
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_10: 5;
    u16 b11_13:3;
    u16 b14 : 1;
    u16 b15 : 1;
};
struct F021ffa80_Self {
    u16 f0;
    struct F021ffa80_F2 f2;
};

extern char data_ov002_022cf17c[];
extern int func_ov002_021b3618(void);
extern int func_ov002_021bc288(int lo, int hi);
extern int func_ov002_021bc68c(int x);
extern int func_ov002_021bc8c8(int x, int lo, int hi);
extern int func_ov002_021ca2b8(int x);

int func_ov002_021ffa80(struct F021ffa80_Self *self) {
    int x = self->f2.b14 ^ self->f2.bit0;
    int r;
    int lo, hi;
    r = func_ov002_021b3618();
    if (r == 0xffff) return 0;
    lo = r & 0xff;
    hi = (r >> 8) & 0xff;
    if (func_ov002_021bc8c8(x, lo, hi) == 0) return 0;
    if (func_ov002_021bc68c(x) == 0) {
        if (lo == x && func_ov002_021bc288(lo, hi) == 0) {
            /* fall through to final gate */
        } else if (lo != x) {
            return 0;
        } else {
            return 0;
        }
        if (func_ov002_021ca2b8(x) == 0) return 0;
        return *(int *)(data_ov002_022cf17c + (x & 1) * 0x868) != 0;
    }
    if (func_ov002_021ca2b8(x) == 0) return 0;
    return *(int *)(data_ov002_022cf17c + (x & 1) * 0x868) != 0;
}
