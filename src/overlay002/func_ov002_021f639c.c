typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short field1_5 : 5;
    unsigned short pad6 : 10;
} S021f639c;

extern void func_ov002_021d59cc(int, int, unsigned short, int, int);
extern int func_ov002_021f49d0(S021f639c *, int);

int func_ov002_021f639c(S021f639c *p, int arg1) {
    func_ov002_021d59cc(p->bit0, p->field1_5, p->w0, 4, 0);
    return func_ov002_021f49d0(p, arg1);
}
