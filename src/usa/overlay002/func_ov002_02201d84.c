/* func_ov002_02201d84: C-39f (1-bit0) 0x868-table, stride-reuse bound 0xbb8. */
typedef unsigned short u16;
struct S201e74 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf08c[];
int func_ov002_02201d84(struct S201e74 *self) {
    int v = *(int *)(data_ov002_022cf08c + ((1 - self->bit0) & 1) * 0x868);
    return v <= 0xbb8;
}
