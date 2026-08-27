typedef struct {
    unsigned short field0;
    unsigned short bit0 : 1;
    unsigned short pad2rest : 15;
    unsigned short pad4_0 : 6;
    unsigned short val4 : 9;
    unsigned short pad4_15 : 1;
    unsigned short field6;
    unsigned short field8;
} T02237e94;

extern unsigned char data_ov002_022cf08c[];

extern int func_ov002_021c3a80(int a, int b);
extern int func_ov002_021ff2cc(void *p, int q);
extern int func_ov002_021ca310(int a, int b);
extern void func_ov002_021d597c(int a, int b, int c, int d);
extern void func_ov002_0227acc8(int a, void *arr, int c, unsigned int d);

int func_ov002_02237da4(T02237e94 *p, int q) {
    int idx;

    idx = func_ov002_021c3a80(p->bit0, p->field0);
    if (idx < 0) {
        return 0;
    }

    if (func_ov002_021ff2cc(p, q) == 0) {
        return 0;
    }

    if (func_ov002_021ca310(p->bit0, p->field0) == 0) {
        return 0;
    }

    func_ov002_021d597c(p->val4, p->field0, 1, p->field8);

    {
        unsigned short field2raw = *(unsigned short *)((unsigned char *)p + 2);
        int side = (int)((unsigned int)(field2raw << 31) >> 31);
        unsigned char *arr = data_ov002_022cf08c + (side & 1) * 0x868 + 0x120 + idx * 4;
        func_ov002_0227acc8(side, arr, 1, (unsigned int)p->field0 << 16);
    }

    return 0;
}
