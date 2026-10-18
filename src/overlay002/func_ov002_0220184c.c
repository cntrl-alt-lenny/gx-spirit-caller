typedef struct {
    unsigned short pad0;
    unsigned short side : 1;
    unsigned short pad1 : 5;
    unsigned short kind : 6;
    unsigned short pad2 : 4;
    unsigned short pad3 : 6;
    unsigned short val : 9;
    unsigned short pad4 : 1;
} Card;

extern int func_ov002_021bb068(int code);
extern int func_ov002_021ff14c(int a, int b, int c, int d, int e);

int func_ov002_0220184c(Card *p) {
    if (func_ov002_021bb068(0x135d) != 0) {
        return 0;
    }
    if (p->kind != 0x23) {
        if (func_ov002_021ff14c(p->side, 2, p->val, 0, 0) == 0) {
            return 0;
        }
    }
    return 1;
}
