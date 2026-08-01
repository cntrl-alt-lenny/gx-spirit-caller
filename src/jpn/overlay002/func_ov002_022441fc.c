struct Ov002Key {
    unsigned int id : 13;
    unsigned int b : 1;
    unsigned int _pad1 : 8;
    unsigned int a : 8;
    unsigned int _pad2 : 2;
};

struct Ov0074Self2 {
    unsigned short f_0;
    unsigned short bit0 : 1;
    unsigned short _rest : 15;
};

extern char data_ov002_022ce1a8[];
extern char data_ov002_022cf08c[];

extern struct Ov002Key *func_ov002_021afa94(void);
extern int  func_ov002_021afac0(void);
extern int  func_ov002_021c2d54(unsigned int bit, int code);
extern int  func_ov002_0220af14(void *self, int arg1);
extern void func_ov002_0223dd14(void *self, int arg1, int arg2, int arg3);
extern int  func_ov002_0223f938(void *self, int arg);

int func_ov002_022441fc(struct Ov0074Self2 *self, int arg1) {
    int state = *(int *)(data_ov002_022ce1a8 + 0x5b8);

    switch (state) {
    case 0:
        if (func_ov002_0220af14(self, arg1) == 0) {
            return 1;
        }
        /* fall through */
    case 1:
        return func_ov002_0223f938(self, arg1);
    case 2:
        {
            int bit0 = self->bit0;
            int result = func_ov002_021c2d54(bit0, 0x12e5);
            if (result < 0) {
                goto done;
            }
            {
                int bit0b = self->bit0;
                struct Ov002Key *rec = (struct Ov002Key *)(data_ov002_022cf08c
                    + (bit0b & 1) * 0x868 + 0x18 + 0x400 + result * 4);
                func_ov002_0223dd14(self, bit0b, 0xe, rec->a * 2 + rec->b);
            }
            {
                struct Ov002Key *c1 = func_ov002_021afa94();
                int c2 = func_ov002_021afac0();
                struct Ov002Key *c3 = func_ov002_021afa94();
                struct Ov002Key *c4 = func_ov002_021afa94();
                func_ov002_0223dd14(self, c1->b, c2, c4->a * 2 + c3->b);
            }
        }
        goto done;
    default:
        break;
    }
done:
    return 1;
}
