struct F222f348_Self {
    unsigned short f0;
    struct {
        unsigned short bit0 : 1;
        unsigned short rest : 15;
    } f2;
};

struct F222f348_State {
    char pad[0x5a8];
    int state;
    int pad2;
    int flag;
};

struct F222f348_Ent {
    char pad[0x120];
    struct {
        unsigned int a : 13;
        unsigned int bit : 1;
        unsigned int b : 18;
    } f;
};

extern struct F222f348_State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cf178[];

extern void func_ov002_021d71e0(int a, int b, int c);
extern void func_ov002_021e286c(int a);
extern void func_ov002_021e104c(int a, int b);

int func_ov002_0222f348(struct F222f348_Self *self) {
    int p = 1 - self->f2.bit0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.flag = 0;
    case 0x7f: {
        int off = (p & 1) * 0x868;
        if (*(int *)((char *)data_ov002_022cf178 + off) != 0) {
            if (p != ((struct F222f348_Ent *)(data_ov002_022cf16c + off))->f.bit) {
                data_ov002_022ce288.flag = 1;
            }
            func_ov002_021d71e0(p, 0, 1);
            return 0x7f;
        }
        return 0x7e;
    }
    case 0x7e:
        func_ov002_021e286c(p);
        if (data_ov002_022ce288.flag != 0) {
            func_ov002_021e286c(1 - p);
        }
        return 0x7d;
    case 0x7d:
        func_ov002_021e104c(p, 2);
        return 0;
    default:
        return 0;
    }
}
