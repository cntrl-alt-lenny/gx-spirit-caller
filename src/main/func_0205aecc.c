typedef struct {
    char _pad0[0x198];
    int x198;
    char _pad19c[0x2a4];
    int x440;
    char _pad444[0x4];
    int x448;
    char _pad44c[0x4];
    int x450;
    char _pad454[0x4];
    int x458;
} Session;

extern void func_02058070(int a, int b, int c);
extern void func_02058038(void *a0, void *a1, int a2);
extern char data_021009ac[];
extern char data_021009c4[];
extern char data_021007bc[];

int func_0205aecc(Session **pp, void *out) {
    Session *s = *pp;

    if (s->x448 > 0) {
        func_02058070((int)pp, (int)out, (int)data_021009ac);
        func_02058038(pp, out, s->x198);
        func_02058070((int)pp, (int)out, s->x440);
        func_02058070((int)pp, (int)out, (int)data_021007bc);
        s->x448 = 0;
    }
    if (s->x458 > 0) {
        func_02058070((int)pp, (int)out, (int)data_021009c4);
        func_02058038(pp, out, s->x198);
        func_02058070((int)pp, (int)out, s->x450);
        func_02058070((int)pp, (int)out, (int)data_021007bc);
        s->x458 = 0;
    }
    return 0;
}
