/* CAMPAIGN-PREP candidate for func_02212a54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :13 slot-id bitfield; REQUIRED reshape = bind `int id = afb74()->id;` (decl-order) so id-temp lands in ip and slotval loads first.
 *   risk:       reshape-able (DONE): without the `int id` temp, the id/bit0 extracts swap scratch regs (ip vs r0) and load order -> 5-insn near-miss. Binding closes it; verified byte-exact.
 *   confidence: high
 */
/* func_ov002_02212a54 (ov002, cls D): bit2 guard, state switch
 * (0x7e/0x7f/0x80) keyed on *(int*)(ce288+0x5a8); :13 slot-id feeds calls. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Slot13 { u32 id : 13; };

struct S02212a54 {
    u16 f0;
    u16 b0 : 1;           /* +2 bit0 = player */
    u16    : 15;
    u16 b2_2 : 2;         /* +4 bits0-1 */
    u16 b2  : 1;          /* +4 bit2  */
    u16     : 13;
};

extern char data_ov002_022ce288[];   /* +0x5a8 = state int */
extern char data_ov002_022cf184[];   /* per-player table, 0x868 stride */

extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int bit0, int b, int hw0, int d);
extern struct Ov002Slot13 *func_ov002_021afb74(void);
extern void func_ov002_021e16a4(int bit0, int id, int c, int d);

int func_ov002_02212a54(struct S02212a54 *self) {
    int state;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x80:
        if (*(int *)(data_ov002_022cf184 + (self->b0 & 1) * 0x868) == 0) return 0;
        func_ov002_021ae400(self->b0, 27);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(self->b0, 6, self->f0, 0);
        return 0x7e;
    case 0x7e: {
        int id = func_ov002_021afb74()->id;
        func_ov002_021e16a4(self->b0, id, 0, 0);
        return 0;
    }
    default:
        return 0;
    }
}
