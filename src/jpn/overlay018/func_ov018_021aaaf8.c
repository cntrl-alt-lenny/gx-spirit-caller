/* func_ov018_021aaaf8: draw the active gauge row (sibling of 021aaaf0, with a
 * per-cell post-pass) and return its cell count. Highlighted rows (bit 0 of
 * data_ae160+0xfc) early-out with 0. Otherwise mode tracks whether the counter
 * at st+0x4 is 0, the row is drawn via func_ov018_021aa9a8 (sub-glyph 0x58),
 * then each drawn cell has its OAM priority nibble cleared (~0xc00) and its
 * palette nibble forced to 1 (~0xf000 | 0x1000). The kind at st+0 then fans out
 * exactly like 021aaaf0 (0xe/0xf -> 021aa9b8/021aaa3c, else default blit; kind
 * 0xc adds the alternate blit).
 */

typedef struct {
    unsigned short b0 : 1;
} OamCtl;

typedef struct {
    int attr;
    unsigned short flags;
    unsigned short pad;
} Cell;

extern char data_ov018_021ae080[];
extern char data_ov018_021ad7c8[];
extern int func_ov018_021aa9a8(int a0, int *a1, int a2, int a3, int a4);
extern void func_ov018_021aa8d8(int a);
extern void func_ov018_021aa95c(int a);
extern void func_020943b0(void *dst, int src, int len);

int func_ov018_021aaaf8(int a0, int *a1) {
    char *st = data_ov018_021ad7c8;
    Cell *cell = (Cell *)*a1;
    int mode;
    int n = 0;
    int i;

    if (!((OamCtl *)(data_ov018_021ae080 + 0xfc))->b0) {
        mode = (*(int *)(st + 0x4) == 0) ? 1 : 0;
        n = func_ov018_021aa9a8(a0, a1, *(int *)(st + mode * 4 + 0x8d8), 0x80, 0x58);
        for (i = 0; i < n; i++) {
            cell->attr &= ~0xc00;
            cell->flags = (cell->flags & ~0xf000) | 0x1000;
            cell++;
        }
        if (mode == 1) {
            switch (*(int *)(st + 0x0)) {
            case 0xe:
                func_ov018_021aa8d8(0x5000622);
                break;
            case 0xf:
                func_ov018_021aa95c(0x5000622);
                break;
            }
        } else {
            func_020943b0(st + 0x964, 0x5000620, 0x20);
        }
        if (*(int *)(st + 0x0) == 0xc) {
            func_020943b0(st + 0x964, 0x5000620, 0x20);
        }
    }
    return n;
}
