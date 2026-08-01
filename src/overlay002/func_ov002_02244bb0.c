typedef struct {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short _rest2 : 15;
} Ov002Self_02244bb0;

typedef struct {
    char _pad0[0x5b8];
    int f_5b8;
} Ov002Ce288_02244bb0;
extern Ov002Ce288_02244bb0 data_ov002_022ce288;

typedef struct {
    char _pad0[0xd70];
    int f_d70;
    int f_d74;
    int f_d78;
} Ov002D016c_02244bb0;
extern Ov002D016c_02244bb0 data_ov002_022d016c;

extern void func_ov002_021ae400(int player, int b);
extern int func_ov002_02244b08(void);
extern void func_ov002_022593a8(int player, int f0, int (*fn)(void));
extern int func_ov002_022593f4(void);
extern void func_ov002_021d8770(int a, int b);
extern void func_ov002_0223dad0(Ov002Self_02244bb0 *self, unsigned short packed);

int func_ov002_02244bb0(Ov002Self_02244bb0 *self) {
    switch (data_ov002_022ce288.f_5b8) {
    case 0:
        func_ov002_021ae400(self->b0, 0x144);
        /* fall through */
    case 2:
    case 4:
        func_ov002_022593a8(self->b0, self->f_0, func_ov002_02244b08);
        data_ov002_022ce288.f_5b8++;
        return 0;

    case 1:
    case 3:
    case 5:
        if (func_ov002_022593f4()) {
            int a = data_ov002_022d016c.f_d70;
            int b = data_ov002_022d016c.f_d74 + data_ov002_022d016c.f_d78;
            func_ov002_021d8770(a, b);
            func_ov002_0223dad0(self, (unsigned short)((unsigned char)a | ((unsigned char)b << 8)));
            data_ov002_022ce288.f_5b8++;
            return 0;
        } else {
            data_ov002_022ce288.f_5b8--;
            return 0;
        }

    default:
        return 1;
    }
}
