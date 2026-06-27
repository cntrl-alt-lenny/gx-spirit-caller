/* CAMPAIGN-PREP candidate for func_021f63e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on ce288+0x5b4 reload, dual mla index, Slot.id13 bitfield
 *   risk:       permuter-class reg-alloc: compiled with BOTH mla fusions + identical op-count, but temporaries land in r1/r2/r3 where orig uses ip(r12)/r3 (base in r2). Pure register rotation — permuter may not fix; .s fallback.
 *   confidence: med
 */
/* func_ov002_021f63e0: tag6 guard then 3-way state machine on ce288+0x5b4. cls D
 * (state switch + mla double-index 0x868/0x14 slot, 13-bit id store).
 *   if (f2.tag6 == 0x23) return 1;
 *   case 0: 021ae400(bit0,0x3a); 0225935c(bit0,f0,&022575c8); state++; return 0;
 *   case 1: if (022593f4()) { slot=cf16c+(d016c.f_d70&1)*0x868+(f_d74+f_d78)*20+0x30;
 *                            self->fa=slot.id13; 021decdc(self); return 1; }
 *           state--; return 0;
 *   default: return 1; */
typedef unsigned short u16;

extern char data_ov002_022ce288[];   /* state @ +0x5b4 */
extern char data_ov002_022cf16c[];   /* row table 0x868/player */
extern char data_ov002_022d016c[];   /* fields @ +0xd70/0xd74/0xd78 */
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_0225935c(int bit0, int f0, void *fn);
extern int  func_ov002_022593f4(void);
extern void func_ov002_021decdc(void *self);
extern int  func_ov002_022575c8(void);   /* passed by address */

struct F021f63e0_F2 {
    u16 bit0 : 1;
    u16 mid5 : 5;
    u16 tag6 : 6;
    u16 top4 : 4;
};
struct F021f63e0 {
    u16 f0;
    struct F021f63e0_F2 f2;
    u16 pad4;
    u16 pad6;
    u16 pad8;
    u16 fa;
};
struct F021f63e0_Slot { unsigned int id : 13; };

int func_ov002_021f63e0(struct F021f63e0 *self) {
    if (self->f2.tag6 == 0x23) return 1;
    switch (*(int *)(data_ov002_022ce288 + 0x5b4)) {
    case 0:
        func_ov002_021ae400(self->f2.bit0, 0x3a);
        func_ov002_0225935c(self->f2.bit0, self->f0, (void *)func_ov002_022575c8);
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            int row = (*(int *)(data_ov002_022d016c + 0xd70) & 1) * 0x868;
            int sub = (*(int *)(data_ov002_022d016c + 0xd74) +
                       *(int *)(data_ov002_022d016c + 0xd78)) * 20;
            struct F021f63e0_Slot *slot =
                (struct F021f63e0_Slot *)(data_ov002_022cf16c + row + sub + 0x30);
            self->fa = slot->id;
            func_ov002_021decdc(self);
            return 1;
        }
        *(int *)(data_ov002_022ce288 + 0x5b4) -= 1;
        return 0;
    default:
        return 1;
    }
}
