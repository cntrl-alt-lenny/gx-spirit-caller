struct Ov002State {
    char pad[0xcec];
    unsigned int f0cec;
    char pad2[8];
    unsigned int f0cf8;
};

struct Ov002Arg {
    unsigned short f0;
    unsigned short bit : 1;
    unsigned short rest : 15;
};

extern struct Ov002State data_ov002_022d016c;
extern int func_ov002_021bae7c(unsigned int a, int b, int c);

int func_ov002_02287240(struct Ov002Arg *p)
{
    if (func_ov002_021bae7c(p->bit, 0x1539, -1) != 0) {
        if (data_ov002_022d016c.f0cec != p->bit) {
            if (data_ov002_022d016c.f0cf8 == 5) {
                return 1;
            }
        }
        if (data_ov002_022d016c.f0cec == p->bit) {
            if (data_ov002_022d016c.f0cf8 <= 1) {
                return 1;
            }
        }
    }
    return 0;
}
