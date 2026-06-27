/* CAMPAIGN-PREP candidate for func_0228387c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order p/slot/row; inline i*stride so only product CSEs; :13 bitfield
 *   risk:       reshape-able: orig recomputes mla (p&1)*0x868 base each outer iter and holds 0x868/cf16c/cd538 in r4/r5/r8; if mwcc hoists or reloads differently, base-setup ldr/mla order diverges.
 *   confidence: med
 */
/* func_ov002_0228387c (ov002, class C) — nested loops, mla base stride, single worker call.
 * idx (r0) stored to cd524; for player p=0..1, scan 5 entity slots; for each non-empty
 * (slot.id:13 != 0) call the worker with (p, i, secondRow). */
typedef unsigned int u32;

struct Slot387c { u32 id : 13; char pad[16]; };   /* 0x14 */

extern int  data_ov002_022cd524;
extern char data_ov002_022cd538[];
extern char data_ov002_022cf16c[];
extern void func_ov002_0227b090(int p, int i, void *row);

void func_ov002_0228387c(int idx) {
    int p;
    data_ov002_022cd524 = idx;
    for (p = 0; p < 2; p++) {
        struct Slot387c *slot =
            (struct Slot387c *)(data_ov002_022cf16c + (p & 1) * 0x868 + 0x30);
        char *row = data_ov002_022cd538 + p * 0xdc;
        int i;
        for (i = 0; i < 5; i++) {
            if (slot[i].id != 0)
                func_ov002_0227b090(p, i, row + i * 0x2c);
        }
    }
}
