/* func_ov002_022922c0: C-39f bit0-indexed 0x868-table -> (v >> 25) & 1. */
typedef unsigned short u16;
struct S022923d0 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf1a8[];
int func_ov002_022922c0(struct S022923d0 *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf1a8 + (self->bit0 & 1) * 0x868);
    return (v >> 25) & 1;
}
