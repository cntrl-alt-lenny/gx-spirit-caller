/* CAMPAIGN-PREP candidate for func_02295438 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D-bitfield :1/:13; b0 read inline twice (call1 arg + index) to force reload
 *   risk:       orig re-reads p->b0 (ldrh) for the index after call1; if mwcc CSEs the two :1 reads into one reg the index ldrh diverges. reshape-able (inline-read split).
 *   confidence: med
 */
/* func_ov002_02295438: counted loop i=0..4, two calls.
 * Each iter: g = 022575c8(p, p->b0, i). If g != 0: read the :13 field at
 * +0x30 of the bank table (index b0*0x868 + i*0x14) and pass it to 0202e2c8;
 * if that returns 0, return 1. Else continue. After loop return 0.
 * p->b0 is reloaded for the table index after the first call clobbers it. */
extern char data_ov002_022cf16c[];
extern int  func_0202e2c8(int v);
extern int  func_ov002_022575c8(struct Ov002Hdr1 *p, int b0, int i);

struct Ov002Hdr1 { char _p2[2]; unsigned short b0 : 1; };
struct Ov002Bank1 { char _p30[0x30]; unsigned int f30 : 13; };

int func_ov002_02295438(struct Ov002Hdr1 *p) {
    int i;

    for (i = 0; i <= 4; i++) {
        if (func_ov002_022575c8(p, p->b0, i)) {
            if (func_0202e2c8(
                    ((struct Ov002Bank1 *)(data_ov002_022cf16c +
                        p->b0 * 0x868 + i * 0x14))->f30) == 0)
                return 1;
        }
    }
    return 0;
}
