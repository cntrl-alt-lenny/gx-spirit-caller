/* func_ov002_0220753c: C-39f — unless b6_11==0x23, bail if table[bit0]
 * != 0; then tail helper(self, arg1). The arg1 pass-through keeps r1
 * live so the field/index temps land in r2/r3/ip (orig). base 022cf180. */
typedef unsigned short u16;
struct S762 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4; };
extern char data_ov002_022cf0a0[];
extern int func_ov002_021ff310(struct S762 *self, int arg1);
int func_ov002_0220753c(struct S762 *self, int arg1) {
    if (self->b6_11 != 0x23) {
        if (*(int *)(data_ov002_022cf0a0 + (self->bit0 & 1) * 0x868) != 0) return 0;
    }
    return func_ov002_021ff310(self, arg1);
}
