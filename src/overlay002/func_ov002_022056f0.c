/* func_ov002_022056f0: C-39f — pre() guard, then table[bit0]!=0 ? 1 :
 * table[1-bit0]!=0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff320(struct S *self);
int func_ov002_022056f0(struct S *self) {
    if (func_ov002_021ff320(self) == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf17c + (self->bit0 & 1) * 0x868) != 0) return 1;
    return *(unsigned int *)(data_ov002_022cf17c + ((1 - self->bit0) & 1) * 0x868) != 0;
}
