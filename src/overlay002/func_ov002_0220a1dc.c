/* func_ov002_0220a1dc: C-39f (1-bit0)-indexed 0x868-table -> v != 0. */
typedef unsigned short u16;
struct S0220a1dc { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf188[];
int func_ov002_0220a1dc(struct S0220a1dc *self) {
    int v = *(int *)(data_ov002_022cf188 + ((1 - self->bit0) & 1) * 0x868);
    return v != 0;
}
