/* func_ov002_02294d24: C-39f bit0-indexed 0x868-table -> v <= 6. */
typedef unsigned short u16;
struct S02294d24 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf178[];
int func_ov002_02294d24(struct S02294d24 *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
    return v <= 6;
}
