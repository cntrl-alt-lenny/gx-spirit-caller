#include <nitro/types.h>
typedef struct { char pad[0xb88]; int mode; } GameState;
extern GameState data_021040ac;
extern s8 data_ov002_022ccb38[], data_ov002_022ccb3c[], data_ov002_022ccb44[], data_ov002_022ccb64[], data_ov002_022ccb6c[];
extern s32 OS_SPrintf(s8 *buffer, const s8 *format, ...);
extern void *func_02006c0c(const char *name, int heap, int flag);
extern void *func_0201d738(void *self);
extern void func_02094550(int *src, int *dst, unsigned int count);
extern void Task_Invoke(void *p);
void func_ov002_022b35d8(void *self, int kind) {
    s8 name[32];
    s8 *part = 0;
    void *task;
    int y;
    int x;
    char *src;
    if (data_021040ac.mode == 3) {
        switch (kind) {
        case 1: part = data_ov002_022ccb38; break;
        case 2: case 3: part = data_ov002_022ccb3c; break;
        }
        OS_SPrintf(name, data_ov002_022ccb44, part);
    } else {
        switch (kind) {
        case 1: part = data_ov002_022ccb38; break;
        case 2: part = data_ov002_022ccb3c; break;
        case 3: part = data_ov002_022ccb64; break;
        }
        OS_SPrintf(name, data_ov002_022ccb6c, part);
    }
    task = func_02006c0c((char *)name, 4, 0);
    src = func_0201d738(task);
    for (y = 0; y < 12; y++) {
        for (x = 0; x < 7; x++) {
            func_02094550((int *)(src + (x * 12 + y) * 128), (int *)(0x6400000 + (y * 7 + x) * 128) + 0x11e0, 128);
        }
    }
    Task_Invoke(task);
}




