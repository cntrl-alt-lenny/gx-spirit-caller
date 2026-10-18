extern char data_ov002_022cbb58[];
extern struct { char *name; int pad; } data_ov002_022ca3d8[];
extern int func_02006c0c(void *, int, int);
extern void func_0201d47c(void *);
extern void func_0201e5b8(void *);
extern void Task_Invoke(int);
extern void OS_SPrintf(char *, const char *, ...);

typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    unsigned short f10;
    unsigned short pad12;
    unsigned short f14;
    unsigned short pad16;
    char gap18[0x10];
} Cfg0229f088;

typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int f14;
    int f18;
    int f1c;
} Obj0229f088;

void func_ov002_0229f088(Obj0229f088 *obj, int a, int b, int idx, int c, int d) {
    char buf[0x20];
    Cfg0229f088 cfg;
    int h;

    obj->f0 = 1;
    obj->f18 = 0;
    obj->f4 = 0;
    obj->f1c = d;
    obj->f18 = 0;
    obj->fc = a;
    obj->f10 = b;
    obj->f8 = idx;
    obj->f14 = c;

    if (idx == 15) {
        return;
    }
    OS_SPrintf(buf, data_ov002_022cbb58, data_ov002_022ca3d8[idx].name);
    func_0201d47c(&cfg);
    h = func_02006c0c(buf, 4, 0);
    cfg.f0 = h;
    cfg.f14 = (cfg.f14 & ~0xf) | (((unsigned short)(idx >= 16 ? 7 : 8)) & 0xf);
    cfg.f8 = -1;
    cfg.fc = c;
    cfg.f10 = cfg.f8;
    func_0201e5b8(&cfg);
    Task_Invoke(cfg.f0);
}
