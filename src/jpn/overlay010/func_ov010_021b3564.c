/* func_ov010_021b3564: build a sprite-cell record arg0 — bind cell 0207e3bc to
 * it (0207fd60), free its handle (0207fce0), and seed the geometry fields. */
#include "ov010_core.h"
extern int func_0207e2d4(int a, int b);
extern void func_0207fc78(void *a, int b, int c);
extern void func_0207fbf8(void *a, int b);
extern int func_020b377c(int a, int b);
void func_ov010_021b3564(void *arg0, int arg1, int arg2) {
    char *p = arg0;
    func_0207fc78(arg0, func_0207e2d4(arg1, 0), arg2);
    func_0207fbf8(arg0, 4096);
    *(int *)(p + 8) = 1;
    *(int *)(p + 92) = 0;
    *(short *)(p + 108) = 16;
    *(int *)(p + 104) = 1;
    *(short *)(p + 84) = 0;
    *(short *)(p + 86) = 0;
    *(short *)(p + 88) = 256;
    *(short *)(p + 90) = 192;
    *(int *)(p + 96) = 0;
    *(int *)(p + 100) = func_020b377c(192, *(short *)(p + 108)) - 1;
}
