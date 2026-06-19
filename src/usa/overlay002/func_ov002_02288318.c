/* func_ov002_02288318: C-39 — two global-word guards, then
 * helper(bit0) < 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d008c[];
extern int func_ov002_02280870(int bit0);
int func_ov002_02288318(struct S *self) {
    if (*(int *)(data_ov002_022d008c + 0xcec) != self->bit0) return 0;
    if (*(unsigned int *)(data_ov002_022d008c + 0xcf8) > 1) return 0;
    return func_ov002_02280870(self->bit0) < 0;
}
