/* CAMPAIGN-PREP candidate for func_021b33b0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     head=cf1a6[(k&1)*0x868+slot*0x14] (k=arg2,slot=arg3); do-while; :4 tag>=0xa; lo==A&&hi==B ->1
 *   risk:       reshape-able: asm interleaves the byte-split (cmp lo,A ; and hi ; cmpeq hi,B). If mwcc evaluates hi before the lo compare, hoist `hi` decl after the lo test to match the cmp/cmpeq order.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b33b0 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: head = headtab[(k&1)*0x868 + slot*0x14]
 * (k=arg2, slot=arg3), d0650 node walk, :4 tag>=0xa guard, byte-split key0,
 * return 1 if (lo==A && hi==B) via cmp/cmpeq/moveq, else 0. asr#8 then &0xff for
 * the high byte; the cmp r2,r0 lands before the and r2,r3 (store-order of split).
 */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Node33b0 { u16 key0; u16 tag : 4; u16 _r : 12; u16 key1; u16 next; };

int func_ov002_021b33b0(int A, int B, int k, int slot) {
    u16 id;
    struct Node33b0 *p;

    id = *(u16 *)(data_ov002_022cf1a6 + (k & 1) * 0x868 + slot * 0x14);
    if (id == 0)
        return 0;
    do {
        p = (struct Node33b0 *)(data_ov002_022d0650 + id * 8);
        id = p->next;
        if (p->tag >= 0xa) {
            int hi = (p->key0 >> 8) & 0xff;
            if ((p->key0 & 0xff) == A && hi == B)
                return 1;
        }
    } while (id != 0);
    return 0;
}
