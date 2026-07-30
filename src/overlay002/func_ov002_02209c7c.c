/* func_ov002_02209c7c: optional arg1 vs self->f0 guard, then if f6_11==0x12
 * and (cd3f4[1]==bit0 && cd3f4[2]==0), guard
 * func_ov002_021b359c(cd3f4[1],0x1318)==0 -> 2. Final: self->f2's 2-bit
 * field at bits12-13 ==0. */
typedef unsigned short u16;
struct S02209c7cF2 { u16 bit0 : 1; u16 pad1_5 : 5; u16 f6_11 : 6; u16 f12_13 : 2; u16 pad14 : 2; };
struct S02209c7c { u16 f0; struct S02209c7cF2 f2; };

extern int data_ov002_022cd3f4[];
extern int func_ov002_021b359c(int a, int b);

int func_ov002_02209c7c(struct S02209c7c *self, unsigned short *arg1) {
    if (arg1 != 0) {
        if (*arg1 == self->f0)
            return 0;
    }
    if (self->f2.f6_11 == 0x12) {
        if (data_ov002_022cd3f4[1] == self->f2.bit0 && data_ov002_022cd3f4[2] == 0) {
            if (func_ov002_021b359c(data_ov002_022cd3f4[1], 0x1318) == 0)
                return 2;
        }
    }
    return self->f2.f12_13 == 0;
}
