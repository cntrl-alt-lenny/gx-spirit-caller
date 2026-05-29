/* func_ov002_022957d0: C-39f self-consumed — if table[1-bit0] <= 0x3e8
 * return 1; else helper(bit0, 0) >= 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0227d660(int bit0, int k);
int func_ov002_022957d0(struct S *self) {
    int v = *(int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868);
    if (v <= 0x3e8) return 1;
    return func_ov002_0227d660(self->bit0, 0) >= 0;
}
