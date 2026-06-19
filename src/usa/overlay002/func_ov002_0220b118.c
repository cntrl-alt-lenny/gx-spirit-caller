/* func_ov002_0220b118: C-39f self-consumed — helper(bit0, table[1-bit0]) != 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf09c[];
extern int func_ov002_021ca1d8(int a, int v);
int func_ov002_0220b118(struct S *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf09c + ((1 - self->bit0) & 1) * 0x868);
    if (v == 0) return 0;
    return func_ov002_021ca1d8(self->bit0, (int)v) != 0;
}
