extern int data_ov002_022cf17c[];
extern int func_ov002_02291160(void *p, int a);

struct S {
    unsigned short a;
    unsigned short b0 : 1;
    unsigned short b1 : 11;
    unsigned short kind : 2;
    unsigned short b3 : 2;
};

int func_ov002_022946e4(struct S *p, int a) {
    if (p->kind == 0)
        return func_ov002_02291160(p, a);
    return *(unsigned int *)((char *)data_ov002_022cf17c + (p->b0 & 1) * 0x868) < 0x14;
}
