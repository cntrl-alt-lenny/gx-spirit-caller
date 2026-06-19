/* func_ov002_02204bc8: C-39f (1-bit0)-indexed 0x868-table -> v != 0. */
typedef unsigned short u16;
struct S02204cb8 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf09c[];
int func_ov002_02204bc8(struct S02204cb8 *self) {
    int v = *(int *)(data_ov002_022cf09c + ((1 - self->bit0) & 1) * 0x868);
    return v != 0;
}
