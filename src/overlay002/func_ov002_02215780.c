extern char data_ov002_022d016c[];
extern void func_ov002_021e276c(int a, int b, int c, int d);

struct Obj {
    unsigned short f0;
    unsigned short f2;
    unsigned short a : 2;
    unsigned short skip : 1;
    unsigned short b : 13;
    unsigned short f6;
    unsigned short f8;
};

int func_ov002_02215780(struct Obj *p) {
    int v = p->f8 & 1;
    if (p->skip) {
        return 0;
    }
    func_ov002_021e276c(v, p->f0, (unsigned short)(((unsigned char)(*(int *)(data_ov002_022d016c + 0xcec) != v) << 4) | 1), 0);
    return 0;
}
