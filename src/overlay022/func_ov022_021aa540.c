extern int data_ov022_021ab9a0[];
extern int func_02006c0c(int, int, int);
extern void func_0201d47c(void *);
extern int func_0201d6d4(int);
extern int func_0201d760(int);
extern void func_0201e5b8(void *);
extern void func_020944a4(int, int, int);
extern void Task_Invoke(int);

typedef struct {
    int f0;
    char gap04[0x10];
    unsigned short f14;
    unsigned short gap16;
    int f18;
    char gap1c[0x0c];
} BgCfg021aa540;

void func_ov022_021aa540(int index, int state, int flag, int enable) {
    BgCfg021aa540 cfg;
    int h = func_02006c0c(data_ov022_021ab9a0[index], 4, 0);

    func_0201d47c(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | ((unsigned short)state & 0xf);

    switch (state) {
    case 0:
    case 5:
        cfg.f18 = (cfg.f18 & ~0x1c000) |
                  (((unsigned)(flag == 0 ? 0 : 2) << 0x1d) >> 0xf);
        break;
    case 1:
    case 6:
        cfg.f18 = (cfg.f18 & ~0x1c000) |
                  (((unsigned)(flag == 0 ? 1 : 3) << 0x1d) >> 0xf);
        break;
    case 2:
    case 7:
        cfg.f18 = (cfg.f18 & ~0x1c000) | 0x8000;
        break;
    case 3:
    case 8:
        cfg.f18 = (cfg.f18 & ~0x1c000) | 0xc000;
        break;
    }

    cfg.f0 = h;
    cfg.f14 = cfg.f14 | 0x10;
    func_0201e5b8(&cfg);

    if (enable != 0) {
        int tmp = func_0201d6d4(h);
        func_020944a4(func_0201d760(h), enable, tmp);
    }

    Task_Invoke(h);
}
