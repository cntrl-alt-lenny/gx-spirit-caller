typedef struct { unsigned short type, val; } evt_c9f0_t;
typedef struct { char pad[0x24]; int f24; } State;
extern State data_021a0890;
extern char data_021a0894[], data_021a089c[];
/* The IRQ assembly returns the prior mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void *func_0207b538(void);
extern void func_020927b8(char *self);
extern void func_02092748(void *self);
extern void func_02091a8c(void *q);
extern void func_0207c9f0(evt_c9f0_t *e);
extern void func_02094688(const void *src, void *dst, unsigned int size);
extern int func_0209f720(void (*cb)(evt_c9f0_t *), const void *address, void *buffer, unsigned int size);

int func_0207ca44(const void *address, const void *src, int size) {
    int irq;
    unsigned char *b;
    irq = OS_DisableIrq();
    if (func_0207b538() == 0) {
        OS_RestoreIrq(irq);
        return -1;
    }
    func_020927b8(data_021a089c);
    b = func_0207b538();
    if (b == 0) {
        func_02092748(data_021a089c);
        OS_RestoreIrq(irq);
        return -1;
    }
    if (*(int *)(b + 0x2260) != 9 || b[0x226b] == 1) {
        func_02092748(data_021a089c);
        OS_RestoreIrq(irq);
        return -4;
    }
    func_02094688(src, b + 0xf00, size);
    switch (func_0209f720(func_0207c9f0, address, b + 0xf00, (unsigned short)size)) {
    case 0: case 1: case 3: case 4: case 5: case 6: case 7: case 8:
    default:
        func_02092748(data_021a089c);
        OS_RestoreIrq(irq);
        return -5;
    case 2: break;
    }
    func_02091a8c(data_021a0894);
    switch (data_021a0890.f24) {
    case 0: break;
    case 1:
    default:
        func_02092748(data_021a089c);
        OS_RestoreIrq(irq);
        return -5;
    }
    func_02092748(data_021a089c);
    OS_RestoreIrq(irq);
    return size;
}
