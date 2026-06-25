/* CAMPAIGN-PREP candidate for func_0203ba24 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order f_08/0c/10/14 as written; signed short for ldrsh; r4=5th arg
 *   risk:       struct-guessed: the 5th param (owner) arrives at [sp+0x14], implying r0,r1,r2,r3 then one stack slot — param count/types are inferred from regs; confirm a1 (r1) is actually consumed and owner is the 6th arg, else stack offset shifts.
 *   confidence: low
 */
/* func_0203ba24: guarded queue-push with ordered field stores.
 * args r0=flag,r1=?,r2=src2(r6),r3=val(r5); 5th arg [sp+0x14]=owner(r4).
 * If !flag -> return. If signed halfword owner[+0xba] >= 3, bail via
 * func_020919d8(data_0219d088). Else alloc node = func_0203c13c(); if
 * non-null store owner, src2[0], data_0219d070-tagged src2[4]... wait:
 * stores owner@+8, src2[0]@+0xc, src2[4]@+0x10, val@+0x14 in order;
 * bump owner[+0xba]; commit func_0207d12c(node,data_0219d070). Always
 * end with func_020919d8(data_0219d088). */

extern char data_0219d070[];
extern char data_0219d088[];
extern void *func_0203c13c(void);
extern void func_0207d12c(void *node, void *tag);
extern void func_020919d8(void *tag);

typedef struct Owner_0203ba24 {
    char          _pad0[0xba];
    short         f_ba;          /* +0xba, signed */
} Owner_0203ba24;

typedef struct Node_0203ba24 {
    char          _pad0[0x8];
    void         *f_08;          /* +0x08 */
    int           f_0c;          /* +0x0c */
    int           f_10;          /* +0x10 */
    int           f_14;          /* +0x14 */
} Node_0203ba24;

void func_0203ba24(int flag, int a1, int *src2, int val, int a4, Owner_0203ba24 *owner) {
    if (flag == 0) return;
    if (owner->f_ba >= 3) {
        func_020919d8(data_0219d088);
        return;
    }
    {
        Node_0203ba24 *node = (Node_0203ba24 *)func_0203c13c();
        if (node != 0) {
            node->f_08 = owner;
            node->f_0c = src2[0];
            node->f_10 = src2[1];
            node->f_14 = val;
            owner->f_ba++;
            func_0207d12c(node, data_0219d070);
        }
    }
    func_020919d8(data_0219d088);
}
