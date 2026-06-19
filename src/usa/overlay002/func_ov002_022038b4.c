/* func_ov002_022038b4: C-39f self-consumed — table[bit0]==0 ? 0 :
 * helper(bit0, 1) != 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf098[];
extern int func_ov002_021ca55c(int bit0, int k);
int func_ov002_022038b4(struct S *self) {
    int v = *(int *)(data_ov002_022cf098 + (self->bit0 & 1) * 0x868);
    if (v == 0) return 0;
    return func_ov002_021ca55c(self->bit0, 1) != 0;
}
