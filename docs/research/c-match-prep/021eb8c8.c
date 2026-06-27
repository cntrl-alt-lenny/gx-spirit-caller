/* CAMPAIGN-PREP candidate for func_021eb8c8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D :13/:1 fields; self->h2 guard emitted before idx guard (self saved first)
 *   risk:       orig builds row via DOUBLE mla (mla r1=(player&1)*0x868+base, mla r0=idx*0x14+r1) then [.,#0x30]; mwcc may split into mul+add. reshape-able (avoid separate +0x30 add).
 *   confidence: med
 */
/* func_ov002_021eb8c8: self->h2 low bit == player -> 0 (checked FIRST); idx<5 ->
 * 021b8fcc gate; f30:13 set (double-mla base); then 021c2084(...,0). */
struct row { char _pad[0x30]; unsigned int f30 : 13; unsigned int _hi : 19; };
struct self_hdr { char _p2[2]; unsigned short h2; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b8fcc(int player, int idx);
extern int func_ov002_021c2084(void *self, int player, int idx, int flag);
int func_ov002_021eb8c8(void *self, int player, int idx) {
    struct row *r;
    if (player == (((struct self_hdr *)self)->h2 & 1))
        return 0;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    r = (struct row *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20);
    if (r->f30 == 0)
        return 0;
    return func_ov002_021c2084(self, player, idx, 0) != 0;
}
