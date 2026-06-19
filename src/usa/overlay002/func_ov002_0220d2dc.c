/* func_ov002_0220d2dc: C-39f — two pre() guards, then table[1-bit0] != 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf098[];
extern int func_ov002_021ff230(struct S *self, int arg);
extern int func_ov002_021ff264(struct S *self, int arg);
int func_ov002_0220d2dc(struct S *self, int arg) {
    if (func_ov002_021ff230(self, arg) == 0) return 0;
    if (func_ov002_021ff264(self, arg) == 0) return 0;
    return *(int *)(data_ov002_022cf098 + ((1 - self->bit0) & 1) * 0x868) != 0;
}
