/* func_ov002_0220bafc (ov002): branch split on w2's bits[12:13] (f12):
 * if 0, guard a bit17 test on data_ov002_022cf288[b0*0x868] then call
 * func_ov002_021b3ecc(b0,0xb,0x12f3); else guard func_ov002_021b3ecc and
 * data_ov002_022cf17c[b0*0x868]!=0 before tail-calling func_ov002_021ff3bc.
 * C-60 table family.
 */

typedef unsigned short u16;
typedef unsigned int u32;

struct Self0220bafc {
    u16 f0;
    struct { u16 b0 : 1; u16 f1 : 5; u16 kind : 6; u16 f12 : 2; u16 _t : 2; } w2; /* +0x2 */
    unsigned char _pad4[0x10];
    u32 w;                                                                        /* +0x14 */
};

extern unsigned char data_ov002_022cf288[];
extern unsigned char data_ov002_022cf17c[];
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021ff3bc(struct Self0220bafc *self, int arg1);

int func_ov002_0220bafc(struct Self0220bafc *self, int arg1) {
    if (self->w2.f12 != 0) {
        goto split;
    }
    {
        u32 word = *(u32 *)(data_ov002_022cf288 + (self->w2.b0 & 1) * 0x868);
        if (((word >> 17) & 1) != 0) {
            return 0;
        }
        return func_ov002_021b3ecc(self->w2.b0, 0xb, 0x12f3) == 0 ? 1 : 0;
    }
split:
    if (func_ov002_021b3ecc(self->w2.b0, self->w2.f1, self->f0) == 0) {
        return 0;
    }
    if (*(u32 *)(data_ov002_022cf17c + (self->w2.b0 & 1) * 0x868) == 0) {
        return 0;
    }
    return func_ov002_021ff3bc(self, arg1);
}
