/* func_ov002_0228856c: C-39 — global word == 1-bit0 guard, global word
 * < 3 guard, then helper(bit0, 0x17) != 0. */
typedef unsigned short u16;
struct S867c { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d008c[];
extern int func_ov002_021c398c(int bit0, int k);
int func_ov002_0228856c(struct S867c *self) {
    if (*(int *)(data_ov002_022d008c + 0xcec) != 1 - self->bit0) return 0;
    if (*(unsigned int *)(data_ov002_022d008c + 0xcf8) >= 3) return 0;
    return func_ov002_021c398c(self->bit0, 0x17) != 0;
}
