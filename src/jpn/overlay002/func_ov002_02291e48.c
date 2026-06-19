/* func_ov002_02291e48: C-39f — if pre(self) and table[bit0] > 5 return
 * 1; else 0 (inverted polarity, shared return 0). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf098[];
extern int func_ov002_02291050(struct S *self);
int func_ov002_02291e48(struct S *self) {
    if (func_ov002_02291050(self) != 0) {
        if (*(unsigned int *)(data_ov002_022cf098 + (self->bit0 & 1) * 0x868) > 5) return 1;
    }
    return 0;
}
