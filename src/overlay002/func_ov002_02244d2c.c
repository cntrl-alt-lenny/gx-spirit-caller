typedef struct {
    unsigned short f_0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} Self;

struct CE288 {
    char pad[0x5b8];
    int f_5b8;
};

extern struct CE288 data_ov002_022ce288;
extern char data_ov002_022d016c[];

extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021d8770(int a, int b);
extern void func_ov002_0223dad0(void *self, unsigned short v);
extern void func_ov002_02244cd8();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);

int func_ov002_02244d2c(Self *self) {
    switch (data_ov002_022ce288.f_5b8) {
    case 0:
        func_ov002_021ae400(self->bit0, 0x145);
        func_ov002_0225935c(self->bit0, self->f_0, (int)func_ov002_02244cd8);
        data_ov002_022ce288.f_5b8 = data_ov002_022ce288.f_5b8 + 1;
        return 0;
    case 1:
        if (func_ov002_022593f4() != 0) {
            int d74 = *(int *)(data_ov002_022d016c + 0xd74);
            int d78 = *(int *)(data_ov002_022d016c + 0xd78);
            unsigned int d70 = *(unsigned int *)(data_ov002_022d016c + 0xd70);
            unsigned int s = d74 + d78;
            func_ov002_021d8770(d70, s);
            func_ov002_0223dad0(self, (unsigned short)((unsigned char)d70 | ((unsigned char)s << 8))
            /* x */);
            data_ov002_022ce288.f_5b8 = data_ov002_022ce288.f_5b8 + 1;
            return 0;
        }
        data_ov002_022ce288.f_5b8 = data_ov002_022ce288.f_5b8 - 1;
        return 0;
    }
    return 1;
}
