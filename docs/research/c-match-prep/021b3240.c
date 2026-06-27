/* CAMPAIGN-PREP candidate for func_021b3240 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     head=cf1a6[(k&1)*0x868+slot*0x14]; do-while next-walk; :4 tag 6..0xb; helper then matchlo; :1 bit6+0x40
 *   risk:       permuter-class: 10 callee-saved regs live across the helper call (lo,hi,matchlo,target,base,count) — register colouring/spill order is a coin-flip a C reshape won't pin.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021b3240 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: head = headtab[(k&1)*0x868 + slot*0x14]
 * (separate scaled products, base via addressing — don't bind), d0650 node
 * walk, :4 tag in [6..0xb] guard, byte-split key0, helper call, :1 bit @bit6 of
 * cf16c[..]+0x40, count matches where helper(lo,hi)==target.
 */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];   /* head table, 0x868 parity stride     */
extern char data_ov002_022cf16c[];   /* secondary table, 0x14 records       */
extern char data_ov002_022d0650[];   /* node chain, 8-byte records          */
extern int  func_ov002_021b9ecc(int lo, int hi);

struct Node3240 { u16 key0; u16 tag : 4; u16 _r : 12; u16 key1; u16 next; };

int func_ov002_021b3240(int k, int slot, int target, int matchlo) {
    u16 id;
    struct Node3240 *p;
    int lo, hi, count = 0;
    int rv;

    id = *(u16 *)(data_ov002_022cf1a6 + (k & 1) * 0x868 + slot * 0x14);
    if (id == 0)
        return 0;
    do {
        p = (struct Node3240 *)(data_ov002_022d0650 + id * 8);
        id = p->next;
        if (p->tag >= 6 && p->tag <= 0xb) {
            lo = p->key0 & 0xff;
            hi = (p->key0 >> 8) & 0xff;
            rv = func_ov002_021b9ecc(lo, hi);
            if (matchlo == lo) {
                int v = *(int *)(data_ov002_022cf16c + (lo & 1) * 0x868 + hi * 0x14 + 0x40);
                if (((v >> 6) & 1) && rv == target)
                    ++count;
            }
        }
    } while (id != 0);
    return count;
}
