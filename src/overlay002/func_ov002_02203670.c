/* func_ov002_02203670: C-39f bit0-indexed 0x868-table -> v >= 3. */
typedef unsigned short u16;
struct S02203670 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf17c[];
int func_ov002_02203670(struct S02203670 *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf17c + (self->bit0 & 1) * 0x868);
    return v >= 3;
}
