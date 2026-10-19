typedef struct { unsigned int lo, hi; } Divisor;
typedef struct {
    char pad[0x18];
    int x, dx, qx, y, dy, qy;
    unsigned short enabled;
} State;
extern State data_021a8394;
extern int OS_DisableIrq(void);
extern asm void OS_RestoreIrq(int state);

void func_0209a2b0(short *p) {
    int state;
    int dx, dy;
    if (p == 0) {
        data_021a8394.enabled = 0;
        return;
    }
    state = OS_DisableIrq();
    dx = p[2];
    if (dx != 0) {
        *(volatile unsigned short *)0x04000280 = 0;
        *(volatile unsigned int *)0x04000290 = 0x10000000;
        *(volatile unsigned long long *)0x04000298 = (unsigned int)dx;
        data_021a8394.x = p[0];
        data_021a8394.dx = p[2];
        while (*(volatile unsigned short *)0x04000280 & 0x8000) {}
        data_021a8394.qx = *(volatile int *)0x040002a0;
    } else {
        data_021a8394.x = 0;
        data_021a8394.dx = 0;
        data_021a8394.qx = 0;
    }
    dy = p[3];
    if (dy != 0) {
        *(volatile unsigned short *)0x04000280 = 0;
        *(volatile unsigned int *)0x04000290 = 0x10000000;
        *(volatile unsigned long long *)0x04000298 = (unsigned int)dy;
        data_021a8394.y = p[1];
        data_021a8394.dy = p[3];
        while (*(volatile unsigned short *)0x04000280 & 0x8000) {}
        data_021a8394.qy = *(volatile int *)0x040002a0;
    } else {
        data_021a8394.y = 0;
        data_021a8394.dy = 0;
        data_021a8394.qy = 0;
    }
    OS_RestoreIrq(state);
    data_021a8394.enabled = 1;
}



