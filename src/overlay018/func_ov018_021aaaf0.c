/* func_ov018_021aaaf0: draw the active gauge row and return its cell count. The
 * row layout flips on the highlight bit (bit 0 of data_ae160+0xfc): highlighted
 * rows force mode 1 with sub-glyph 0x58, otherwise mode tracks whether the
 * counter at st+0x4 equals 1 and the sub-glyph is 0x88. After drawing via
 * func_ov018_021aaa88, mode-1 rows fan out by the kind at st+0 (0xc/0xe ->
 * func_ov018_021aa9b8, 0xf -> func_ov018_021aaa3c) while other rows blit the
 * default palette; kind 0xc additionally blits the alternate palette.
 */

typedef struct {
    unsigned short b0 : 1;
} OamCtl;

extern char data_ov018_021ae160[];
extern char data_ov018_021ad8a8[];
extern int func_ov018_021aaa88(int a0, int *a1, int a2, int a3, int a4);
extern void func_ov018_021aa9b8(int a);
extern void func_ov018_021aaa3c(int a);
extern void func_020944a4(void *dst, int src, int len);

int func_ov018_021aaaf0(int a0, int *a1) {
    char *st = data_ov018_021ad8a8;
    int mode;
    int sub;
    int ret;

    if (!((OamCtl *)(data_ov018_021ae160 + 0xfc))->b0) {
        sub = 0x88;
        mode = (*(int *)(st + 0x4) == 1) ? 1 : 0;
    } else {
        sub = 0x58;
        mode = 1;
    }
    ret = func_ov018_021aaa88(a0, a1, *(int *)(st + mode * 4 + 0x8e0), 0x80, sub);
    if (mode == 1) {
        switch (*(int *)(st + 0x0)) {
        case 0xc:
        case 0xe:
            func_ov018_021aa9b8(0x5000602);
            break;
        case 0xf:
            func_ov018_021aaa3c(0x5000602);
            break;
        }
    } else {
        func_020944a4(st + 0x964, 0x5000600, 0x20);
    }
    if (*(int *)(st + 0x0) == 0xc) {
        func_020944a4(st + 0x964, 0x5000620, 0x20);
    }
    return ret;
}
