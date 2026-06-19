/* func_ov002_0228aac8: C-39f stride-reuse (brief 262). Bound 0x9c4 =
 * 0x868+0x15c. self stays in r0 (field->ip). */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf08c[];
extern int func_ov002_0228a894(struct S *self, int arg1);
extern int func_ov002_0228780c(struct S *self);
int func_ov002_0228aac8(struct S *self, int arg1) {
    int v = *(int *)(data_ov002_022cf08c + (self->bit0 & 1) * 0x868);
    if (v > 0x9c4) return 0;
    if (arg1 != 0) return func_ov002_0228a894(self, arg1);
    return func_ov002_0228780c(self);
}
