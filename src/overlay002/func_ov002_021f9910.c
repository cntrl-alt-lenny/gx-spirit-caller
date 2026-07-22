typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short field1_5 : 5;
    unsigned short pad6 : 10;
    char pad2[4];
    unsigned short field8;
} S021f9910;

extern void func_ov002_021deb28(int, int);
extern unsigned short func_ov002_021b9bd4(int, int);

int func_ov002_021f9910(S021f9910 *p) {
    func_ov002_021deb28(p->bit0, p->field1_5);
    p->field8 = func_ov002_021b9bd4(p->bit0, p->field1_5);
    return 1;
}
