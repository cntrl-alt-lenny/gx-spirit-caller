typedef struct {
    void *f0;
    int f4, f8, fc;
    unsigned short f10, f12;
    unsigned short kind:4, flag:1, rest14:11;
    unsigned short rest16:14, flag16:1, top16:1;
    unsigned int x:7, y:7, format:3, rest18:15;
    unsigned int a:8, b:8, rest1c:16;
    int f20;
    unsigned short c:8, d:8;
    unsigned short e:8, f:8;
} Obj;
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
extern void func_0208c8cc(unsigned int a, unsigned int b, unsigned int c);
extern void Bg_SetScroll(void);
void func_ov011_021cb25c(void) {
    Obj cfg;
    char *s = data_ov011_021d403c;
    if (*(int *)(data_ov011_021d4000 + 0x2d4) != 0) {
        func_0201d47c(&cfg);
        cfg.kind = 3;
        cfg.f0 = *(void **)(s + 0x298);
        cfg.f8 = 0;
        cfg.fc = 0;
        cfg.f10 = 0x200;
        cfg.flag = 1;
        cfg.x = 0;
        cfg.y = 0;
        cfg.format = 3;
        cfg.b = 0x20;
        cfg.a = 0x20;
        if (*(int *)(s + 0x264) == 1) {
            cfg.kind = 0;
            cfg.c = 0;
            cfg.e = 0x40;
            cfg.b = 0x40;
            cfg.a = 0x40;
            cfg.d = 0;
            cfg.f = 0x40;
            cfg.flag16 = 1;
            cfg.flag = 0;
            cfg.f10 = 0;
            cfg.f20 = 0x20;
        }
        func_0201e5b8(&cfg);
        Task_Invoke(cfg.f0);
        *(int *)(s + 0x298) = 0;
        func_0208c8cc(1, *(int *)(s + 0x264) == 1 ? 0 : 3, 0);
    }
    Bg_SetScroll();
}

