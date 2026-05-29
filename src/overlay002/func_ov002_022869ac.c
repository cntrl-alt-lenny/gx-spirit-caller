/* func_ov002_022869ac: frameless-leaf C-39 bit-compare -> g != bit0. */
typedef unsigned short u16;
struct S869ac { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022d016c[];
int func_ov002_022869ac(struct S869ac *s) {
    return *(int *)(data_ov002_022d016c + 0xcec) != s->bit0;
}
