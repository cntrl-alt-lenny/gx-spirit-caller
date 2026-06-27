/* CAMPAIGN-PREP candidate for func_021b3314 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     head=cf1a6[(k&1)*0x868+slot*0x14]; do-while; :4 tag>=0xa; cf16c[(lo&1)*0x868+hi*0x14+0x30] :13 nonzero count++
 *   risk:       reshape-able: asm tests v<<0x13>>0x13 (a :13 field) — `& 0x1fff` should match, but if mwcc keeps the lsl;lsr pair, switch v to a `:13` bitfield struct member instead of the mask.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b3314 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: head = headtab[(k&1)*0x868 + slot*0x14],
 * d0650 node walk, :4 tag>=0xa guard, byte-split key0, index cf16c by
 * (lo&1)*0x868 + hi*0x14, test :13 field (v<<0x13>>0x13 -> low-13-bit nonzero,
 * mask 0x1fff) of [+0x30], count++. Single back-edge do-while; base held.
 */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d0650[];

struct Node3314 { u16 key0; u16 tag : 4; u16 _r : 12; u16 key1; u16 next; };

int func_ov002_021b3314(int k, int slot) {
    u16 id;
    struct Node3314 *p;
    int lo, hi, count = 0;

    id = *(u16 *)(data_ov002_022cf1a6 + (k & 1) * 0x868 + slot * 0x14);
    if (id == 0)
        return 0;
    do {
        p = (struct Node3314 *)(data_ov002_022d0650 + id * 8);
        id = p->next;
        if (p->tag >= 0xa) {
            int v;
            lo = p->key0 & 0xff;
            hi = (p->key0 >> 8) & 0xff;
            v = *(int *)(data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 0x14 + 0x30);
            if ((v & 0x1fff) != 0)
                ++count;
        }
    } while (id != 0);
    return count;
}
