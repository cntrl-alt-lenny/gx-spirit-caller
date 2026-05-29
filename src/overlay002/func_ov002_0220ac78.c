/* func_ov002_0220ac78: C-39f self-preserved — table[bit0]==0 ? 0 :
 * helper1(self,arg,v)==0 ? 0 : helper2(self,arg). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff3bc(struct S *self, int arg, int v);
extern int func_ov002_02207010(struct S *self, int arg);
int func_ov002_0220ac78(struct S *self, int arg) {
    int v = *(int *)(data_ov002_022cf17c + (self->bit0 & 1) * 0x868);
    if (v == 0) return 0;
    if (func_ov002_021ff3bc(self, arg, v) == 0) return 0;
    return func_ov002_02207010(self, arg);
}
