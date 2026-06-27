/* CAMPAIGN-PREP candidate for func_02201564 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bind parity/field4 once (held in ip/r3 across load+pack), reuse in key; (A)|(B<<8) shifted-or pack; key&0xffff
 *   risk:       permuter-class: parity(ip) and field4(r3) are caller-scratch reused after the [+0x30] load; if mwcc spills/re-extracts them from the word for the pack, the reg use around bl diverges. struct-guessed: 0x30/stride.
 *   confidence: low
 */
/* func_ov002_02201564 (ov002, class D) - kind gate + nested table walk to slot[+0x30], then packed-key call.
 * orig HOLDS parity(bit9) in ip and field4 in r3 across the [+0x30] load to pack (b9 | field4<<8). Must bind, not re-extract. */
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021bcd80(int self, int key);

typedef struct {
    unsigned short id0;
    unsigned short cb0  : 1;
    unsigned short cf5  : 5;
    unsigned short kind : 6;
    unsigned short cf12 : 2;
    unsigned short cb14 : 1;
    unsigned short cb15 : 1;
    unsigned char pad4[0x10];
    unsigned int w_0_8   : 9;
    unsigned int w_b9    : 1;
    unsigned int w_10_13 : 4;
} Card;

int func_ov002_02201564(Card *a, int b) {
    int parity, field4;
    unsigned int sw;
    int key, ret;
    if (b != 0) return 0;
    if (a->kind != 0x1f && a->kind != 0x20 && a->kind != 0x21) return 0;
    parity = a->w_b9;
    field4 = a->w_10_13;
    sw = *(unsigned int *)(data_ov002_022cf16c + parity * 0x868 + field4 * 0x14 + 0x30);
    if ((sw & 0x1fff) == 0) return 0;
    key = (unsigned short)((parity & 0xff) | ((field4 & 0xff) << 8));
    ret = func_ov002_021bcd80(a->cb0, key);
    return ret != 0 ? 1 : 0;
}
