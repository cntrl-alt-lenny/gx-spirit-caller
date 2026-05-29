/* func_ov002_0222a648: C-39f self-consumed — helper(1-bit0, 7 - table[1-bit0]); return 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf178[];
extern void func_ov002_021e104c(int a, int b);
int func_ov002_0222a648(struct S *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf178 + ((1 - self->bit0) & 1) * 0x868);
    func_ov002_021e104c(1 - self->bit0, 7 - (int)v);
    return 0;
}
