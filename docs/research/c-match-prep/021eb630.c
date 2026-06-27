/* CAMPAIGN-PREP candidate for func_021eb630 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D :13/:1 fields; index product r5=(player&1)*0x868 bound, reused for cf1a4+cf1a2
 *   risk:       r5 holds (player&1)*0x868 and r4 holds idx*20 across cf1a4 AND the final cf1a2 read; if mwcc recomputes the product for the tail read, 1-2 instrs diverge. reshape-able (bind product).
 *   confidence: med
 */
/* func_ov002_021eb630: idx>=5 -> 0; self->h2 low bit == player -> 0; f30:13 set;
 * cf1a4 hw set; 021c1ef0 ok else 0; 021c1e44 != 0 -> 0; finally cf1a2 hw == 0 ? 1 : 0. */
struct row { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };
struct self_hdr { char _p2[2]; unsigned short h2; };
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_021c1e44(void *self, int player, int idx);
int func_ov002_021eb630(void *self, int player, int idx) {
    struct row *r;
    if (idx >= 5)
        return 0;
    if (player == (((struct self_hdr *)self)->h2 & 1))
        return 0;
    r = (struct row *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (r->f30 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 20) == 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    return *(unsigned short *)((char *)data_ov002_022cf1a2 + (player & 1) * 0x868 + idx * 20) == 0;
}
