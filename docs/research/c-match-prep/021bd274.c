/* CAMPAIGN-PREP candidate for func_021bd274 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 bitfield (lsl19/lsr19); mla base in one reg; movs-on-extract gates the +0x38 load
 *   risk:       reshape-able: orig strides TWO regs r7(base) and r6(=r7+0x30) by +0x14 each; my single struct+0x14 may collapse to one base. If addressing diverges, split into a base ptr plus a separate field ptr both stepping +0x14.
 *   confidence: med
 */
/* func_ov002_021bd274 (ov002, class D): scan slots i=0..9 of the bank-indexed
 * table (bank = arg0&1, stride 0x868) at data_022cf16c. Per slot read the :13
 * field at +0x30; if set AND the +0x38 halfword nonzero, gate (i<5) via
 * 021b8fcc, then count when 0202b878(field)==0x17. Returns the count. */

extern char data_ov002_022cf16c[];
extern int  func_0202b878(int v);
extern int  func_ov002_021b8fcc(int obj, int i);

struct Ov002Slot {
    char _p30[0x30];
    unsigned int f30 : 13;   /* 0x30 */
    char _p34[0x38 - 0x34];
    unsigned short f38;      /* 0x38 */
};

int func_ov002_021bd274(int obj) {
    struct Ov002Slot *s;
    int i;
    int count;
    int v;

    s = (struct Ov002Slot *)(data_ov002_022cf16c + (obj & 1) * 0x868);
    count = 0;
    i = 0;
    do {
        v = s->f30;
        if (v != 0 && s->f38 != 0) {
            if (i < 5) {
                if (func_ov002_021b8fcc(obj, i) == 0)
                    goto next;
            }
            if (func_0202b878(s->f30) == 0x17)
                count++;
        }
    next:
        i++;
        s = (struct Ov002Slot *)((char *)s + 0x14);
    } while (i < 0xa);
    return count;
}
