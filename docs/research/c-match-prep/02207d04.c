/* CAMPAIGN-PREP candidate for func_02207d04 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain; *cd3f4==b0; Slot13.id @+0x120 stride4 13-bit; unsigned >0/bcc loop
 *   risk:       orig walks slots via a separate +=4 induction reg (r6) and reloads the base each iter; slots[i].id may emit add r0,base,i,lsl#2 instead of induction, and bound base may CSE differently. permuter-class (induction/reg-alloc) + struct-guessed (0x120 offset).
 *   confidence: low
 */
/* func_ov002_02207d04: guard chain (field6==0x12; f14!=0;
 * *cd3f4 != b0; 021ff3bc) then slot scan. count0=T178[player];
 * for i<T16c[player].f0xc: id = row.slots[i].id (13-bit @ +0x120, stride4);
 * if 0202e234(id) and 021ca440(b0,id) ret 1. field6 p6 w6; id p0 w13. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 pad1:5; u16 field6:6; u16 rest:4; };
struct S02207d04 { u16 f0; struct F2 f2; unsigned char pad[0x10]; int f14; };
struct Slot13 { unsigned int id:13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int data_ov002_022cd3f4;
extern int func_0202e234(unsigned int id);
extern int func_ov002_021ca440(unsigned int bit, unsigned int id);
extern int func_ov002_021ff3bc(struct S02207d04 *self);
int func_ov002_02207d04(struct S02207d04 *self) {
    int i;
    struct Slot13 *slots;
    if (self->f2.field6 != 0x12) return 0;
    if (self->f14 == 0) return 0;
    if (data_ov002_022cd3f4 == self->f2.bit0) return 0;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) > 0) {
        slots = (struct Slot13 *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0x120);
        for (i = 0; i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0xc); i++) {
            unsigned int id = slots[i].id;
            if (func_0202e234(id) != 0) {
                if (func_ov002_021ca440(self->f2.bit0, id) != 0) return 1;
            }
        }
    }
    return 0;
}
