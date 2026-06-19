/* func_ov010_021b3be4: (re)configure the sub-engine BG layers, step the message
 * window's fade toward 0, push the brightness reg, run the per-mode opener. */
#include "ov010_core.h"
extern void func_0208c858(void);
extern void func_0208c79c(int reg, int val);
extern int func_020b377c(int a, int b);
extern void func_ov010_021b5b3c(void);
extern void func_ov010_021b7c60(void);
int func_ov010_021b3be4(void) {
    char *reg = (char *)0x04000000;
    char *d = data_ov010_021b8c44;
    int ret = 0;
    int v;
    *(int *)reg = (*(int *)reg & ~7936) | 6144;
    *(unsigned short *)(reg + 8) = (*(unsigned short *)(reg + 8) & ~3) | 3;
    *(unsigned short *)(reg + 10) = (*(unsigned short *)(reg + 10) & ~3) | 1;
    *(unsigned short *)(reg + 12) = (*(unsigned short *)(reg + 12) & ~3) | 2;
    *(unsigned short *)(reg + 14) = (*(unsigned short *)(reg + 14) & ~3) | 3;
    func_0208c858();
    v = *(int *)(data_ov010_021b8c08 + 160) - 4096;
    *(int *)(data_ov010_021b8c08 + 160) = v;
    if (v < 0) *(int *)(d + 100) = 0;
    func_0208c79c(0x0400006c, func_020b377c(-(*(int *)(d + 100) << 4), *(int *)(d + 104)));
    if (*(int *)(d + 100) == 0) {
        func_0208c79c(0x0400006c, 0);
        ret = 1;
    }
    switch (*(int *)d) {
    case 1: func_ov010_021b5b3c(); break;
    case 2: func_ov010_021b7c60(); break;
    case 3: break;
    }
    return ret;
}
