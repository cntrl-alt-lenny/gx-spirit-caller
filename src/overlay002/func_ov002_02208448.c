/* func_ov002_02208448: C-39f bit0-indexed 0x868-table -> v != 0 ? 2 : 0. */
typedef unsigned short u16;
struct S02208448 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf17c[];
int func_ov002_02208448(struct S02208448 *self) {
    int v = *(int *)(data_ov002_022cf17c + (self->bit0 & 1) * 0x868);
    return v != 0 ? 2 : 0;
}
