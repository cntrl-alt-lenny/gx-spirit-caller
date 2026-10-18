struct S022438e0 {
    char pad0[2];
    struct {
        unsigned short b0 : 1;
        unsigned short rest : 15;
    } w2;
    char pad4[8];
    unsigned short wc;
};

struct G288 {
    char pad[0x5b8];
    int state;
};

struct G16c {
    char pad[0xd44];
    int flag;
};

extern struct G288 data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct G16c data_ov002_022d016c;

extern int func_ov002_021ff500(void);
extern void func_ov002_021ae484(int a);
extern int func_ov002_0223fa20(struct S022438e0 *self, int b);

int func_ov002_022438e0(struct S022438e0 *self, int b) {
    if (func_ov002_021ff500() == 0) {
        return 1;
    }
    if (self->wc == 0) {
        switch (data_ov002_022ce288.state) {
        case 0:
            if (data_ov002_022cd744[self->w2.b0] == 1) {
                data_ov002_022d016c.flag = 1;
            } else {
                func_ov002_021ae484(0x2f);
            }
            data_ov002_022ce288.state++;
            return 0;
        case 1:
            if (data_ov002_022d016c.flag == 0) {
                return 1;
            }
            data_ov002_022ce288.state = 0;
            self->wc = 1;
            return 0;
        }
    }
    return func_ov002_0223fa20(self, b);
}
