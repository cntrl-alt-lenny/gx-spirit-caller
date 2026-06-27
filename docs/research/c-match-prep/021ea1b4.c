/* CAMPAIGN-PREP candidate for func_021ea1b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D bitfield struct (:13 + packed :8/:1 pair), strided index, guard-chain order
 *   risk:       Composite ((fA<<1)|fB) vs h4>>6: mwcc may emit orr not 'add ...lsr#31' and reorder the two extracts. permuter-class.
 *   confidence: low
 */
/* func_ov002_021ea1b4: 0x868-strided validator. Guard idx<5 (else 021b8fcc),
 * f30:13 set, cf1a4 halfword set, 021c1ef0 ok, composite field-pair compare vs
 * self->h4 9-bit field, then 021c2084(...,0). */
struct row { char _pad[0x30]; unsigned int f30 : 13; unsigned int fB : 1; unsigned int _m : 8; unsigned int fA : 8; unsigned int _hi : 2; };
struct self_hdr { char _p2[2]; unsigned short h2; unsigned short h4; };
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021b8fcc(int player, int idx);
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_021c2084(void *self, int player, int idx, int flag);
int func_ov002_021ea1b4(void *self, int player, int idx) {
    struct row *r;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    r = (struct row *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (r->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (((r->fA << 1) | r->fB) == (((struct self_hdr *)self)->h4 >> 6) & 0x1FF)
        return 0;
    return func_ov002_021c2084(self, player, idx, 0) != 0;
}
