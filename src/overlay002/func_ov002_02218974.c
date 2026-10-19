struct Input {
    unsigned short value;
    unsigned short side : 1;
    unsigned short field : 5;
    unsigned short rest : 10;
    unsigned short pad : 2;
    unsigned short blocked : 1;
    unsigned short rest2 : 13;
};
extern unsigned char data_ov002_022ce288[];
extern int data_ov002_022cd744[];
extern unsigned char data_ov002_022d016c[];
extern unsigned char data_ov002_022d0e6c[];
struct Entry { unsigned int value; unsigned char pad[0x864]; };
extern struct Entry data_ov002_022cf178[];
extern int func_ov002_021ae664(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021e104c(int a, int b, int unused, int d);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern void func_ov002_0226b22c(int a, int b, int c, int d);
int func_ov002_02218974(struct Input *p) {
    if (p->blocked) return 0;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (data_ov002_022cd744[p->side] == 1)
            *(unsigned int *)(data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        else
            func_ov002_021ae664(0x38);
        return 0x7f;
    case 0x7f:
        func_ov002_0226b22c(p->side, p->field, 1, *(int *)(data_ov002_022d016c + 0xd44));
        return 0x7e;
    case 0x7e:
        if (*(unsigned short *)(data_ov002_022d0e6c + 0xb2)) {
            unsigned int side = p->side;
            unsigned int value = data_ov002_022cf178[side & 1].value;
            if (value < 5)
                func_ov002_021e104c(side, 5 - value, (int)data_ov002_022cf178, side & 1);
        } else {
            func_ov002_021e276c((void *)p->side, p->value, 0x21, 0);
        }
        return 0xa;
    default: return 0;
    }
}
