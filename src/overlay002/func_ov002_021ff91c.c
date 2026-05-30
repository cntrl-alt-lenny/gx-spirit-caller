/* func_ov002_021ff91c: C-39f bit0-indexed 0x868-table -> v != 0. */
typedef unsigned short u16;
struct S021ff91c { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf184[];
int func_ov002_021ff91c(struct S021ff91c *self) {
    int v = *(int *)(data_ov002_022cf184 + (self->bit0 & 1) * 0x868);
    return v != 0;
}
