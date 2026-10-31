typedef unsigned int u32;
/* OS_DisableIrq's assembly returns the prior IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_01ff8664(u32 dmaNo, u32 src, u32 dest, u32 ctrl);
void func_020940ac(u32 dmaNo, u32 src, u32 value, u32 size) {
    u32 *cnt;
    int irq;
    if (size == 0) return;
    cnt = (u32 *)0x040000b0 + (dmaNo * 3 + 2);
    while (*(volatile u32 *)cnt & 0x80000000) {}
    irq = OS_DisableIrq();
    *(volatile u32 *)(0x040000e0 + dmaNo * 4) = value;
    func_01ff8664(dmaNo, 0x040000e0 + dmaNo * 4, src, (size >> 2) | 0x85000000);
    OS_RestoreIrq(irq);
    while (*(volatile u32 *)cnt & 0x80000000) {}
}
