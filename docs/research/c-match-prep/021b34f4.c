/* CAMPAIGN-PREP candidate for func_021b34f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 guard cf16c[..+0x30] early-0; share par/off; head cf1a6; do-while :4 tag>=6; lo==A&&hi==B
 *   risk:       reshape-able: orig computes (k&1)*0x868 and slot*0x14 ONCE and reuses across guard+head. If mwcc recomputes, the `par`/`off` locals (bound here) are the fix; widen to `:13` bitfield if mask diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b34f4 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: :13 guard (cf16c[(k&1)*0x868+slot*0x14+
 * 0x30] low-13 bits, mask 0x1fff) early-return 0; else head from cf1a6 at the
 * SAME (k&1)*0x868 + slot*0x14; d0650 walk, :4 tag>=6, byte-split key0, return 1
 * if lo==A && hi==B. The two parity/slot products are reused by both accesses.
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Node34f4 { u16 key0; u16 tag : 4; u16 _r : 12; u16 key1; u16 next; };

int func_ov002_021b34f4(int k, int slot, int A, int B) {
    u16 id;
    struct Node34f4 *p;
    int par = (k & 1) * 0x868;
    int off = slot * 0x14;
    int v = *(int *)(data_ov002_022cf16c + par + off + 0x30);

    if ((v & 0x1fff) == 0)
        return 0;
    id = *(u16 *)(data_ov002_022cf1a6 + par + off);
    if (id == 0)
        return 0;
    do {
        p = (struct Node34f4 *)(data_ov002_022d0650 + id * 8);
        id = p->next;
        if (p->tag >= 6) {
            int hi = (p->key0 >> 8) & 0xff;
            if ((p->key0 & 0xff) == A && hi == B)
                return 1;
        }
    } while (id != 0);
    return 0;
}
