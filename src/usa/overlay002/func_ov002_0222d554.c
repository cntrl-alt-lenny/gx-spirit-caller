/* func_ov002_0222d554: if f12_13==2, tail-call func_ov002_02210014(self,
 * arg1) (arg1 passed through unused otherwise). If f4.bit2!=0 return 0. If
 * func_ov002_021bb718(bit0,f0,f1_5)>=2, fire func_ov002_021e0f5c(bit0,3)
 * then func_ov002_021de318(self, func_ov002_0225761c(self)). Always
 * returns 0 past the first two guards. */
typedef unsigned short u16;
struct S0222d644F2 { u16 bit0 : 1; u16 f1_5 : 5; u16 pad6_11 : 6; u16 f12_13 : 2; u16 pad14 : 2; };
struct S0222d644F4 { u16 pad0_1 : 2; u16 bit2 : 1; u16 pad3_15 : 13; };
struct S0222d644 { u16 f0; struct S0222d644F2 f2; struct S0222d644F4 f4; };

extern int func_ov002_02210014(struct S0222d644 *self, int arg1);
extern int func_ov002_021bb718(int player, int arg, int c);
extern int func_ov002_021e0f5c(int a, int b);
extern int func_ov002_0225761c(void *self);
extern int func_ov002_021de318(void *self, int mask);

int func_ov002_0222d554(struct S0222d644 *self, int arg1) {
    if (self->f2.f12_13 == 2)
        return func_ov002_02210014(self, arg1);
    if (self->f4.bit2 != 0)
        return 0;
    if (func_ov002_021bb718(self->f2.bit0, self->f0, self->f2.f1_5) >= 2) {
        func_ov002_021e0f5c(self->f2.bit0, 3);
        func_ov002_021de318(self, func_ov002_0225761c(self));
    }
    return 0;
}
