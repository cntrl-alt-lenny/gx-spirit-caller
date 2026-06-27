/* CAMPAIGN-PREP candidate for func_0202acec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     explicit per-case inserts; masked-reg first then payload (A|(B<<8)); store-order preserved
 *   risk:       reshape-able: orig keeps reg base in r3 and reloads payload de/e0 from the struct each store; if mwcc binds the second store's reg via r[1]=base+2 differently or reorders the bic/orr operands, halfword stores diverge.
 *   confidence: med
 */
/* func_0202acec (main, class D): 4-way switch on signed-short field 0xdc; each
 * case does TWO MMIO bitfield-insert halfword stores (no sharing). reg pair =
 * 0x04000048/0x0400004a (cases 0/1) or 0x04001048/0x0400104a (cases 2/3).
 * Cases 0/2: low-6 field = de|0x20 ; second reg low-6 = e0|0x20.
 * Cases 1/3: bits[13:8] field = (de<<8)|0x2000 ; second reg low-6 = e0|0x20.
 * struct-guessed: 0xdc sel, 0xde/0xe0 unsigned-short payloads. */
typedef volatile unsigned short vu16;

struct Obj0202acec {
    char _p[0xdc];
    short sel;            /* +0xdc, ldrsh */
    unsigned short de;    /* +0xde, ldrh */
    unsigned short e0;    /* +0xe0, ldrh */
};

int func_0202acec(struct Obj0202acec *p) {
    vu16 *r;

    switch (p->sel) {
    case 0:
        r = (vu16 *)0x04000048;
        r[0] = (r[0] & ~0x3f) | p->de | 0x20;
        r[1] = (r[1] & ~0x3f) | p->e0 | 0x20;
        break;
    case 1:
        r = (vu16 *)0x04000048;
        r[0] = (r[0] & ~0x3f00) | (p->de << 8) | 0x2000;
        r[1] = (r[1] & ~0x3f) | p->e0 | 0x20;
        break;
    case 2:
        r = (vu16 *)0x04001048;
        r[0] = (r[0] & ~0x3f) | p->de | 0x20;
        r[1] = (r[1] & ~0x3f) | p->e0 | 0x20;
        break;
    case 3:
        r = (vu16 *)0x04001048;
        r[0] = (r[0] & ~0x3f00) | (p->de << 8) | 0x2000;
        r[1] = (r[1] & ~0x3f) | p->e0 | 0x20;
        break;
    }
    return 1;
}
