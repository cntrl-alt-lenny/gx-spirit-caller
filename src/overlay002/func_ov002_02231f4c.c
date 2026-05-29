/* func_ov002_02231f4c: arg-bit-packing (brief 262, gotcha 16). The u8
 * type forces the redundant `and #0xff` on the provably-small value. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d016c[];
extern void func_ov002_021e276c(int a, int f0, int packed, int z);
int func_ov002_02231f4c(struct S *self) {
    unsigned char t = (*(int *)(data_ov002_022d016c + 0xcec) == self->bit0) + 2;
    func_ov002_021e276c(1 - self->bit0, self->f0, (u16)((t << 4) | 1), 0);
    return 0;
}
