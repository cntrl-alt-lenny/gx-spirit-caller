/* func_ov002_02202380: C-39f bit0-indexed 0x868-table -> v > 1 ? 2 : 1. */
typedef unsigned short u16;
struct S02202470 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf08c[];
int func_ov002_02202380(struct S02202470 *self) {
    int v = *(int *)(data_ov002_022cf08c + (self->bit0 & 1) * 0x868);
    return v > 1 ? 2 : 1;
}
