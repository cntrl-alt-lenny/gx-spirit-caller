/* CAMPAIGN-PREP candidate for func_02233c50 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     eor parity side; 1-(attr&1) rsb; inline mla base with split 0x18+0x400 adds; key0<<16 arg
 *   risk:       side held in r4 across all calls; if mwcc recomputes the eor instead of keeping r4, an eor reappears per use. reshape-able (bind side to one local, which is done) -> residual is r4 vs scratch coin-flip, permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02233c50 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. attr=u16@+2, key0=u16@+0, b6=u16@+6.
 * side = (attr&1) ^ ((attr>>14)&1).
 * 021e104c(1-(attr&1), 2); then guards 021bc618(side)!=0, 021ca2b8(side)!=0.
 * if ((b6>>8)&0xff)==1: t=0223def4(card,0); j=021b99b4(side,t); if j>=0 {
 *   p = &cf16c[(side&1)*0x868 + 0x18 + 0x400 + j*4]; if 021b9ba0(p)!=0
 *     0227adb8(side, p, 1, key0<<16) }. return 0.
 * 0x18 and 0x400 are TWO separate add-imm (don't fold to 0x418). */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b99b4(int, int);
extern int  func_ov002_021b9ba0(void *);
extern int  func_ov002_021bc618(int);
extern int  func_ov002_021ca2b8(int);
extern int  func_ov002_021e104c(int, int);
extern int  func_ov002_0223def4(void *, int);
extern int  func_ov002_0227adb8(int, void *, int, int);

struct Card3c50 { u16 key0; u16 attr; u16 _u4; u16 b6; };

int func_ov002_02233c50(struct Card3c50 *card) {
    u16 attr = card->attr;
    int side = (attr & 1) ^ ((attr >> 14) & 1);

    func_ov002_021e104c(1 - (attr & 1), 2);
    if (func_ov002_021bc618(side) == 0)
        return 0;
    if (func_ov002_021ca2b8(side) == 0)
        return 0;
    if (((card->b6 >> 8) & 0xff) == 1) {
        int t = func_ov002_0223def4(card, 0);
        int j = func_ov002_021b99b4(side, t);
        if (j >= 0) {
            char *p = data_ov002_022cf16c + (side & 1) * 0x868 + 0x18 + 0x400 + j * 4;
            if (func_ov002_021b9ba0(p) != 0)
                func_ov002_0227adb8(side, p, 1, card->key0 << 16);
        }
    }
    return 0;
}
