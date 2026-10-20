typedef struct {
    unsigned short id;
    unsigned short side : 1;
    unsigned short rest : 15;
    unsigned short unk4;
    unsigned short low : 8;
    unsigned short count : 8;
    unsigned short bits;
} Entry;
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern struct { char pad[0xd74]; int a; int b; } data_ov002_022d016c;
extern int data_ov002_022be120[];
extern int func_0202b100(int a0);
extern void func_ov002_0229ce5c(void *buf, int fmtId, int val);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_022593f4(void);
extern void func_ov002_021ded30(unsigned short *p, int arg1);
int func_ov002_021fa310(Entry *p) {
    char buf[256];
    switch (data_ov002_022ce288.state) {
    case 0:
        p->count = 0;
        p->bits = 0;
        data_ov002_022ce288.state++;
    case 1:
        func_ov002_0229ce5c(buf, 0x143, func_0202b100(data_ov002_022be120[p->count]));
        func_ov002_021ae400(p->side, (int)buf);
        func_ov002_0225935c(p->side, p->id, (int)func_ov002_022575c8);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if (func_ov002_022593f4()) {
            p->bits |= 1 << (data_ov002_022d016c.a + data_ov002_022d016c.b);
            p->count++;
            if (p->count < 3) {
                data_ov002_022ce288.state--;
                return 0;
            } else {
                data_ov002_022ce288.state++;
                return 0;
            }
        }
        data_ov002_022ce288.state = 0;
        return 0;
    case 3:
        func_ov002_021ded30((unsigned short *)p, p->bits << (p->side * 16));
        data_ov002_022ce288.state++;
        return 0;
    default:
        return 1;
    }
}
