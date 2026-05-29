/* func_ov002_0220b420: C-39f stride-reuse (brief 262). Bound 0xbb8 =
 * 0x868+0x350 derived from the live stride by mwcc. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_021ff500(struct S *self, int arg1);
int func_ov002_0220b420(struct S *self, int arg1) {
    int v = *(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868);
    if (v > 0xbb8) return 0;
    if (func_ov002_021ca698(self->bit0, self->bit0) == 0) return 0;
    return func_ov002_021ff500(self, arg1);
}
