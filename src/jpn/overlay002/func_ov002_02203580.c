/* func_ov002_02203580: C-39f bit0-indexed 0x868-table -> v >= 3. */
typedef unsigned short u16;
struct S02203670 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf09c[];
int func_ov002_02203580(struct S02203670 *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf09c + (self->bit0 & 1) * 0x868);
    return v >= 3;
}
