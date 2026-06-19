/* func_ov002_022086e4: frameless-leaf C-39 bit-compare -> g.fcec != bit0. */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d008c[];
int func_ov002_022086e4(struct S *s) {
    return *(int *)(data_ov002_022d008c + 0xcec) != s->bit0;
}
