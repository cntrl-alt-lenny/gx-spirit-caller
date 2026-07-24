typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short field1_5 : 5;
    unsigned short pad6 : 10;
    char pad2[6];
    unsigned short fielda;
} S021f81cc;

extern unsigned short func_ov002_021b9af4(int, int);
extern void func_ov002_021debec(S021f81cc *, int, int);

int func_ov002_021f80dc(S021f81cc *p) {
    p->fielda = func_ov002_021b9af4(p->bit0, p->field1_5);
    func_ov002_021debec(p, p->bit0, p->field1_5);
    return 1;
}
