/* func_ov002_0229379c: C-39f self-consumed — if bit17 of table[bit0]
 * set return 0; else helper(bit0) != 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf1a8[];
extern int func_ov002_021c9d34(int bit0);
int func_ov002_0229379c(struct S *self) {
    unsigned int v = *(unsigned int *)(data_ov002_022cf1a8 + (self->bit0 & 1) * 0x868);
    if ((v >> 17) & 1) return 0;
    return func_ov002_021c9d34(self->bit0) != 0;
}
