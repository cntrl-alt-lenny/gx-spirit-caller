/* CAMPAIGN-PREP candidate for func_022006d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: id eq-chain -> sel; eor of two :1 bitfields for parity index; unsigned >= -> movcs/movcc bool
 *   risk:       reshape-able: orig forms 0x12ec as 0x12cc+0x20 (add r1,#0x20) reusing the base reg; two-literal `==` may emit a 2nd ldr literal instead of add-from-base. struct-guessed: cf17c base (no idx stride).
 *   confidence: med
 */
/* func_ov002_022006d0 (ov002, class D) - id-membership sets ip(3/2/1) then table-word>=ip bool.
 * Table cf17c indexed by (bit14 ^ bit0)*0x868 only (no *0x14 stride here). */
extern unsigned char data_ov002_022cf17c[];

typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
} Card;

int func_ov002_022006d0(Card *c) {
    int sel;
    unsigned int w;
    if (c->id0 == 0x12cc) sel = 3;
    else if (c->id0 == 0x12ec) sel = 2;
    else sel = 1;
    w = *(unsigned int *)(data_ov002_022cf17c + ((c->cb14 ^ c->cb0) & 1) * 0x868);
    return w >= (unsigned int)sel;
}
