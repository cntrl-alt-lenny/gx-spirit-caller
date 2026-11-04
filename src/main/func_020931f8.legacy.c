typedef void (*IrqCallback)(int);
extern unsigned short data_021a66c0;
extern unsigned int data_021a66c4;
extern unsigned int data_021a66c8[2];
extern void func_02093084(int bit);
extern void func_020907b4(unsigned int mask, IrqCallback callback);
extern unsigned int func_02090624(unsigned int mask);
extern void func_02093160(int);

static inline void setup_timer(volatile unsigned short *control,
                               volatile unsigned short *count) {
    *control = 0;
    *count = 0;
    *control = 0xc1;
}

void func_020931f8(void) {
    unsigned int counter;
    if (data_021a66c0 == 0) {
    data_021a66c0 = 1;
    func_02093084(0);
    counter = (unsigned int)data_021a66c8;
    *(unsigned int *)counter = 0;
    *(unsigned int *)(counter + 4) = 0;
    setup_timer((volatile unsigned short *)0x04000102,
                (volatile unsigned short *)0x04000100);
    func_020907b4(8, func_02093160);
    func_02090624(8);
    data_021a66c4 = 0;
    }
}
