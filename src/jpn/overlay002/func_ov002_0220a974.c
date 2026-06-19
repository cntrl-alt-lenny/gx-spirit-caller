/* func_ov002_0220a974: C-39f — pre() guard, then table[bit0]!=0 ? 2 :
 * (table[1-bit0]!=0 ? 2 : 1). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf098[];
extern int func_ov002_022078f4(struct S *self);
int func_ov002_0220a974(struct S *self) {
    if (func_ov002_022078f4(self) == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf098 + (self->bit0 & 1) * 0x868) != 0) return 2;
    return (*(unsigned int *)(data_ov002_022cf098 + ((1 - self->bit0) & 1) * 0x868) != 0) ? 2 : 1;
}
