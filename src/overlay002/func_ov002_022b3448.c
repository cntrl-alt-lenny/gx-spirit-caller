#include <nitro/types.h>
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *file; int f4, f8, fc; short f10, f12; unsigned short f14; char tail[0x12]; } Config;
typedef struct { int v[6]; } Table;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Config *o);
extern void *func_02006c0c(const char *name, int heap, int flag);
extern void *func_0201d738(void *self);
extern void func_02094550(int *src, int *dst, unsigned int count);
extern void Task_Invoke(void *p);
extern s32 OS_SPrintf(s8 *buffer, const s8 *format, ...);
extern Table data_ov002_022ca778, data_ov002_022ca760;
extern int data_ov002_022cd73c[];
extern s8 data_ov002_022ccaf8[], data_ov002_022ccb18[];
void func_ov002_022b3448(char *self, int kind) {
    Table a, b;
    s8 name[32];
    Config cfg;
    int y, x;
    char *src;
    if (*(int *)(self + 4) == 0) return;
    if (*(int *)(self + 12) < 0) return;
    if (kind == 7) return;
    a = data_ov002_022ca778;
    b = data_ov002_022ca760;
    func_0201d47c((Obj *)&cfg);
    OS_SPrintf(name, data_ov002_022ccaf8, a.v[kind], *(int *)(self + 12) == (data_ov002_022cd73c[1] ^ 1));
    cfg.file = func_02006c0c((char *)name, 4, 0);
    cfg.f14 = (cfg.f14 & ~0xf) | 4;
    cfg.fc = 0x2e80;
    cfg.f10 = -1;
    func_0201e5b8(&cfg);
    Task_Invoke(cfg.file);
    OS_SPrintf(name, data_ov002_022ccb18, b.v[kind]);
    cfg.file = func_02006c0c((char *)name, 4, 0);
    src = func_0201d738(cfg.file);
    for (y = 0; y < 5; y++) {
        for (x = 0; x < 2; x++) {
            func_02094550((int *)(src + (x * 5 + y) * 128), (int *)(0x6400000 + (y * 2 + x) * 128) + 0xa60, 128);
        }
    }
    Task_Invoke(cfg.file);
}



