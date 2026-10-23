typedef struct { short x, y, dx, dy; } Calibration;
/* The IRQ primitive's assembly returns the previous IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
int func_02099d80(Calibration *p, unsigned short x1, unsigned short y1, unsigned short sx1, unsigned short sy1, unsigned short x2, unsigned short y2, unsigned short sx2, unsigned short sy2) {
    int irq, dx, dy, a, b, nx, ny, denx, deny;
    if (x1 >= 0x1000 || y1 >= 0x1000 || x2 >= 0x1000 || y2 >= 0x1000) return 1;
    if (sx1 >= 0x100 || sx2 >= 0x100 || sy1 >= 0xc0 || sy2 >= 0xc0) return 1;
    if (sx1 == sx2 || sy1 == sy2 || x1 == x2 || y1 == y2) return 1;
    irq = OS_DisableIrq();
    nx = (x1 - x2) << 8;
    denx = sx1 - sx2;
    *(volatile unsigned short *)0x04000280 = 0;
    *(volatile int *)0x04000290 = nx;
    *(volatile unsigned long long *)0x04000298 = (unsigned int)denx;
    ny = y1 - y2;
    deny = sy1 - sy2;
    while (*(volatile unsigned short *)0x04000280 & 0x8000) {}
    dx = *(volatile int *)0x040002a0;
    *(volatile unsigned short *)0x04000280 = 0;
    *(volatile int *)0x04000290 = ny << 8;
    *(volatile unsigned long long *)0x04000298 = (unsigned int)deny;
    if (dx >= 0x8000 || dx < -0x8000) { OS_RestoreIrq(irq); return 1; }
    p->dx = dx;
    a = (((x1 + x2) << 8) - p->dx * (sx1 + sx2)) << 9 >> 16;
    if (a >= 0x8000 || a < -0x8000) { OS_RestoreIrq(irq); return 1; }
    p->x = a;
    while (*(volatile unsigned short *)0x04000280 & 0x8000) {}
    dy = *(volatile int *)0x040002a0;
    OS_RestoreIrq(irq);
    if (dy >= 0x8000 || dy < -0x8000) return 1;
    p->dy = dy;
    b = (short)((((y1 + y2) << 8) - p->dy * (sy1 + sy2)) >> 7);
    if (b >= 0x8000 || b < -0x8000) return 1;
    p->y = b;
    return 0;
}




