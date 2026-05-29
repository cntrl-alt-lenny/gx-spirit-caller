/* func_ov002_0220acd8: C-39 — two global-word guards, then
 * helper(bit0, bit0, b1_5). */
typedef unsigned short u16;
struct Sacd8 { u16 f0; u16 bit0:1; u16 b1_5:5; u16 rest:10; };
extern char data_ov002_022d016c[];
extern int func_ov002_021bc8c8(int a, int b, int c);
int func_ov002_0220acd8(struct Sacd8 *self) {
    if (*(int *)(data_ov002_022d016c + 0xcec) == self->bit0) return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) != 3) return 0;
    return func_ov002_021bc8c8(self->bit0, self->bit0, self->b1_5);
}
