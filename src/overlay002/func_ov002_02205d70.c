/* func_ov002_02205d70: gate on func_ov002_021b39c4(b0, bits1_5, 0) == 0xffff,
 * then return func_ov002_021bd030(b0) >= 0. */
struct S02205d70 { char _pad[2]; unsigned short b0 : 1; unsigned short bits1_5 : 5; unsigned short _r : 10; };
extern int func_ov002_021b39c4(int b0, int bits, int c);
extern int func_ov002_021bd030(int b0);

int func_ov002_02205d70(struct S02205d70 *self) {
    if (func_ov002_021b39c4(self->b0, self->bits1_5, 0) != 0xffff) return 0;
    return func_ov002_021bd030(self->b0) >= 0;
}
