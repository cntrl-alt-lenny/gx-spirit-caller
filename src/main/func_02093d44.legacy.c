extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
void func_02093d44(int channel) {
    int saved = OS_DisableIrq();
    unsigned short *control = (unsigned short *)(0x04000000 + (channel * 6 + 5) * 2 + 0xb0);
    *(volatile unsigned short *)control &= ~0x3a00;
    *(volatile unsigned short *)control &= ~0x8000;
    *(volatile unsigned short *)control;
    *(volatile unsigned short *)control;
    if (!channel) {
        unsigned int *base = (unsigned int *)0x040000b0;
        *(volatile unsigned int *)(0x04000000 + channel * 12 + 0xb0) = 0;
        *(volatile unsigned int *)((char *)base + channel * 12 + 4) = 0;
        *(volatile unsigned int *)((char *)base + channel * 12 + 8) = 0x81400001;
    }
    OS_RestoreIrq(saved);
}
