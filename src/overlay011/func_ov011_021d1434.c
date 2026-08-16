/* func_ov011_021d1434: build a resource-cfg blob (default: priority
 * nibble = 4, fc/f10 copied from self), format a name string keyed by
 * mode (0: self->f8's 8-bit sub-field at bit 11; 1: literal 1, and
 * force fc/f8 to -1; else: leave cfg alone), load it, and invoke the
 * resulting task. */
extern void func_0201d47c(void *cfg);
extern void func_0201e5b8(void *cfg);
extern int func_02006c0c(void *a, int b, int c);
extern void Task_Invoke(int h);
extern void OS_SPrintf(char *dst, const char *fmt, ...);
extern char data_ov011_021d3fcc[];

typedef struct {
    int f0;
    char gap04[4];
    int f8;
    int fc;
    unsigned short f10;
    char gap12[2];
    unsigned short f14;
    char gap16[2];
    int f18;
    char gap1c[0xc];
} Cfg;

void func_ov011_021d1434(void *selfv, int mode) {
    char *self = (char *)selfv;
    Cfg cfg;
    char buf[0x20];

    func_0201d47c(&cfg);
    cfg.f14 = (cfg.f14 & ~0xf) | 4;
    cfg.fc = *(int *)(self + 0x10);
    cfg.f10 = *(int *)(self + 0x14);
    cfg.f14 = cfg.f14 | 0x10;
    switch (mode) {
    case 0:
        cfg.f14 = cfg.f14 | 0x10;
        OS_SPrintf(buf, data_ov011_021d3fcc,
                   (unsigned)(*(int *)(self + 0x8) << 13) >> 24);
        cfg.f0 = func_02006c0c(buf, 4, 0);
        break;
    case 1:
        cfg.fc = -1;
        cfg.f8 = -1;
        OS_SPrintf(buf, data_ov011_021d3fcc, 1);
        cfg.f0 = func_02006c0c(buf, 4, 0);
        break;
    default:
        break;
    }
    func_0201e5b8(&cfg);
    Task_Invoke(cfg.f0);
}
