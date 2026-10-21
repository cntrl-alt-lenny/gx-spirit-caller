typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *file; int f4, f8, fc; short f10, f12; unsigned short f14; char tail[0x12]; } Config;
typedef struct { const char *name; int offset; } Entry;
extern Entry data_ov002_022ca790[];
extern char data_021040ac[], data_ov002_022cca7c[];
extern void *func_02006c0c(const char *, int, int);
extern void Task_Invoke(void *p);
extern int func_0201d47c(Obj *o);
extern void *func_0201d738(void *self);
extern int func_0201e5b8(Config *);
extern int func_02034784(void);
extern void func_0208fd90(void *, int, unsigned int);
void func_ov002_022b31a4(char *self) {
    Config cfg;
    int count = 11;
    int i;
    void *file;
    int index;
    int enabled;
    if (func_02034784() != 2) count--;
    for (i = 0; i < count; i++) {
        file = func_02006c0c(data_ov002_022ca790[i].name, 4, 0);
        func_0201d47c((Obj *)&cfg);
        cfg.f14 = (cfg.f14 & ~0xf) | 4;
        cfg.fc = data_ov002_022ca790[i].offset;
        cfg.file = file;
        cfg.f10 = -(i > 0);
        func_0201e5b8(&cfg);
        Task_Invoke(file);
    }
    enabled = 1;
    if (*(int *)(data_021040ac + 0xb88) != 1 && *(int *)(data_021040ac + 0xb88) != 2) enabled = 0;
    if (enabled) {
        file = func_02006c0c(data_ov002_022cca7c, 4, 0);
        if (*(int *)(data_021040ac + 0xb88) == 2) index = 3;
        else index = *(int *)(data_021040ac + 0xb90);
        func_0208fd90((char *)func_0201d738(file) + index * 0x100, 0x3380, 0x100);
        Task_Invoke(file);
    }
}

