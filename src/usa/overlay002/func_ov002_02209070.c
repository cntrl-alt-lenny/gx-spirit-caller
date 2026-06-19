/* func_ov002_02209070: C-39f (1-bit0)-indexed 0x868-table -> v != 0. */
typedef unsigned short u16;
struct S02209160 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf0a0[];
int func_ov002_02209070(struct S02209160 *self) {
    int v = *(int *)(data_ov002_022cf0a0 + ((1 - self->bit0) & 1) * 0x868);
    return v != 0;
}
