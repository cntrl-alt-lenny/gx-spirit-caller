/* func_ov002_0220b120: C-39f bit0-indexed 0x868-table -> v == 0. */
typedef unsigned short u16;
struct S0220b120 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf178[];
int func_ov002_0220b120(struct S0220b120 *self) {
    int v = *(int *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
    return v == 0;
}
