/* func_ov002_02288428: C-39 — two global-word guards, then
 * helper(bit0) < 0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d016c[];
extern int func_ov002_02280980(int bit0);
int func_ov002_02288428(struct S *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) != self->bit0) return 0;
    if (*(unsigned int *)(data_ov002_022d016c + 0xcf8) > 1) return 0;
    return func_ov002_02280980(self->bit0) < 0;
}
