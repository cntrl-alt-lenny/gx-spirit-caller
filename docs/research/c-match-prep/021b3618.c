/* CAMPAIGN-PREP candidate for func_021b3618 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: :13 bitfield guard, nested loop sink, (u8) byte-pack return
 *   risk:       orig holds player(r5)/idx(r4) across the call and keeps inner-zero in r6; if mwcc re-derives j=0 or shuffles i/j regs, 1-2 mov diverge (permuter-class).
 *   confidence: med
 */
/* func_ov002_021b3618: per-player slot guard (cf16c + (p&1)*0x868 + idx*0x14
 * + 0x30; :13 id field) returning 0xffff if id==0, else a nested 2x11 scan
 * calling func_ov002_021b34f4(i,j,player,idx); first nonzero hit returns the
 * byte-pack (u16)((u8)i | ((u8)j<<8)). Sibling of shipped func_ov002_021b34f4.s. */
typedef unsigned char  u8;
typedef unsigned short u16;
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b34f4(int a, int b, int c, int d);

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_021b3618(int player, int idx) {
    struct Ov002Slot *slot =
        (struct Ov002Slot *)((char *)data_ov002_022cf16c
                             + (player & 1) * 0x868 + idx * 0x14 + 0x30);
    int i, j;
    if (slot->id == 0)
        return 0xffff;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 10; j++) {
            if (func_ov002_021b34f4(i, j, player, idx) != 0)
                return (u16)((u8)i | ((u8)j << 8));
        }
    }
    return 0xffff;
}
