/* func_ov002_02295940: C-39f self-consumed — if table[1-bit0] <= 0x4b0
 * return 1; else helper(bit0) > 2. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021bbf50(int bit0);
int func_ov002_02295940(struct S *self) {
    int v = *(int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868);
    if (v <= 0x4b0) return 1;
    return func_ov002_021bbf50(self->bit0) > 2;
}
