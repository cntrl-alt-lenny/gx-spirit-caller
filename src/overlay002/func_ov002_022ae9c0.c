typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short       : 10;
    int pad[6];
    int slots[3];
    int pad2[5];
    int a;
    int pad3;
    int b;
} Obj;

extern char data_ov002_022d1410[];
extern void func_ov002_022a82c4(void *p);

void func_ov002_022ae9c0(Obj *p, unsigned short v)
{
    int i = 0;
    p->f0 = v;
    p->b = 0;
    p->a = 0;
    p->field = 31;
    if (p->f0 != 0) {
        for (; i < 3; i++) {
            p->slots[i] = -1;
        }
    } else {
        for (; i < 3; i++) {
            p->slots[i] = -1;
        }
    }
    func_ov002_022a82c4(data_ov002_022d1410);
}
