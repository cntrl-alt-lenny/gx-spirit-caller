#include <nitro/types.h>
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *file; int f4, f8, fc; short f10; short f12; unsigned short f14; char tail[0x12]; } Config;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Config *o);
extern int func_02006b10(void *arg);
extern void *func_02006c0c(const char *name, int heap, int flag);
extern void Task_Invoke(void *p);
extern s32 OS_SPrintf(s8 *buffer, const s8 *format, ...);
extern int data_ov002_022cd73c[];
extern char data_021040ac[], data_02104f4c[];
extern s8 *data_ov002_022cc92c[];
extern s8 data_ov002_022cca9c[], data_ov002_022ccabc[], data_ov002_022ccadc[];
void func_ov002_022b32c8(char *self, int side, int kind) {
    s8 name[32];
    Config cfg;
    void *file; int destination; unsigned int flags;
    *(int *)(self + side * 4 + 0x34) = kind;
    if (*(int *)(self + 4) == 0) return;
    if (*(int *)(self + side * 4 + 0x2c) == 0) {
        if (side == (data_ov002_022cd73c[1] ^ 1)) {
            int value = *(int *)(data_021040ac + 0xba8);
            OS_SPrintf(name, data_ov002_022cca9c, (((value & 0x3e0) >> 5) - 1) * 10 + (value & 0x1f), data_ov002_022cc92c[kind]);
        } else {
            unsigned int value = *(unsigned int *)(data_02104f4c + 0xa64);
            OS_SPrintf(name, data_ov002_022cca9c, (((value & 0x3e0) >> 5) - 1) * 10 + (value & 0x1f), data_ov002_022cc92c[kind]);
        }
    } else {
        OS_SPrintf(name, data_ov002_022ccabc, *(int *)(self + side * 4 + 0x2c), data_ov002_022cc92c[kind]);
    }
    if (func_02006b10(name) == 0) OS_SPrintf(name, data_ov002_022ccadc);
    file = func_02006c0c((const char *)name, 4, 0);
    func_0201d47c((Obj *)&cfg);
    cfg.file = file;
    cfg.f14 = (cfg.f14 & ~0xf) | 4;
    cfg.fc = side == data_ov002_022cd73c[1] ? 0x400 : 0x1400;
    cfg.f10 = -1;
    func_0201e5b8(&cfg);
    Task_Invoke(file);
}
















