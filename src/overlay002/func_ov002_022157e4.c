extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_0225764c(int arg0, int j, int i);
extern int func_ov002_021d5a08(int arg0, int j, int i, int f0, int two, int a);
extern void func_ov002_0226b258();

struct Obj {
    unsigned short f0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short rest : 10;
};

int func_ov002_022157e4(struct Obj *p) {
    int i;
    int j;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        func_ov002_0226b258(p->a, p->b);
        return 0x7f;
    case 0x7f:
        for (j = 0; j < 2; j++) {
            for (i = 0; i < 5; i++) {
                if (func_ov002_0225764c((int)p, j, i) != 0) {
                    func_ov002_021d5a08((int)p, j, i, p->f0, 2,
                        (unsigned short)(*(unsigned short *)(data_ov002_022d0e6c + 0xb0) * 100));
                }
            }
        }
        return 0;
    }
    return 0;
}
