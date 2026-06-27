/* CAMPAIGN-PREP candidate for func_021f33c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield==const; bind po/io across 3 tables; UNSIGNED w so (w>>6) is lsr not asr; io-last operand order
 *   risk:       NONE residual — byte-exact. Two fixes vs first draft: `w` must be unsigned (signed int gave asr#6 vs orig lsr#6) and io-last in cf16c addr. reshape-able (done).
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f33c8 (ov002, class D) — MED tier.
 * VALIDATED byte-exact (mwcc 2.0/sp1p5 -O4,p -interworking vs delinked .o).
 * Leaf (no stmdb). Clone-family with 021f31bc/3318.
 * recipe: arg2 != 0xa guard; THREE tables (cf1a4 u16, cf1ac int, cf16c int@+0x30)
 * all indexed by the SAME held products (arg1&1)*0x868 (r3) and arg2*0x14 (ip)
 * -> bound to po/io. cf1ac bit6 test ((w>>6)&1), cf16c low-13-bit == 0x1a0c.
 * arg0 is unused (never read in asm). Final verdict is an equality bool. */
typedef unsigned short u16;

struct Ov002Self { u16 f0; u16 parity : 1; };
struct Bf13 { unsigned v : 13; };                    /* :13 field -> lsl;lsr (not and) */
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];

int func_ov002_021f33c8(struct Ov002Self *self, int arg1, int arg2) {
    int po, io;
    unsigned w;
    (void)self;
    if (arg2 != 0xa)
        return 0;
    po = (arg1 & 1) * 0x868;
    io = arg2 * 0x14;
    if (*(u16 *)(data_ov002_022cf1a4 + po + io) == 0)
        return 0;
    w = *(unsigned *)(data_ov002_022cf1ac + po + io);
    if ((w >> 6) & 1)
        return 0;
    return ((struct Bf13 *)(data_ov002_022cf16c + po + 0x30 + io))->v == 0x1a0c;
}
