/* func_ov002_0228867c: for a=0..4, guard func_ov002_022574e0(self,bit0,a)!=0;
 * on success read the slot id at row+a*20+0x30 (row=cf16c+bit0*0x868) and
 * tail-check func_ov002_02253600(bit0,f0,id)!=0 -> return 1. Else return 0. */
typedef unsigned short u16;
struct S0228878cF2 { u16 bit0 : 1; u16 pad : 15; };
struct S0228878cSelf { u16 f0; struct S0228878cF2 f2; };

extern char data_ov002_022cf08c[];
extern int func_ov002_022574e0(void *self, int bit0, int a);
extern int func_ov002_02253600(int bit0, unsigned short f0, int id);

int func_ov002_0228867c(struct S0228878cSelf *self) {
    int a, byteoff;
    a = 0;
    byteoff = 0;
    for (; a < 5; a++, byteoff += 20) {
        if (func_ov002_022574e0(self, self->f2.bit0, a) != 0) {
            struct Ov002Slot {
                unsigned int id : 13;
            } *slot = (struct Ov002Slot *)(data_ov002_022cf08c + (self->f2.bit0 & 1) * 0x868 + 0x30 + byteoff);
            if (func_ov002_02253600(self->f2.bit0, self->f0, slot->id) != 0)
                return 1;
        }
    }
    return 0;
}
