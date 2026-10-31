/* The original reads the saved IRQ mask from r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern unsigned int func_020905a8(unsigned int value);
extern unsigned int func_02090624(unsigned int mask);
extern void func_020907b4(unsigned int mask, void (*handler)(void));
extern void func_02096234(void);
extern unsigned short data_021a8284;
extern void (*data_021a8288[])(int, unsigned int, int);
typedef struct { char pad[0x388]; int flags; } Kernel;
void func_020964a0(void) {
    int irq = OS_DisableIrq();
    int i;
    if (data_021a8284 == 0) {
        data_021a8284 = 1;
        int *block = (int *)0x027ffc00;
        block[226] = 0;
        for (i = 0; i < 32; i++) data_021a8288[i] = 0;
        *(volatile unsigned short *)0x04000184 = 0xc408;
        func_020905a8(0x40000);
        func_020907b4(0x40000, func_02096234);
        func_02090624(0x40000);
        for (i = 0; ; i++) {
            int timeout;
            int value = *(volatile unsigned short *)0x04000180 & 15;
            *(volatile unsigned short *)0x04000180 = value << 8;
            if (value == 0 && i > 4) break;
            timeout = 1000;
            while ((*(volatile unsigned short *)0x04000180 & 15) == value) {
                if (timeout <= 0) {
                    i = 0;
                    break;
                }
                timeout--;
            }
        }
    }
    OS_RestoreIrq(irq);
}

