void func_0209d150(unsigned int cmd, unsigned int arg) {
    while (*(volatile unsigned int *)0x040001a4 & 0x80000000) {
    }
    *(volatile unsigned char *)0x040001a1 = 0xc0;
    *(volatile unsigned char *)0x040001a8 = cmd >> 24;
    *(volatile unsigned char *)0x040001a9 = cmd >> 16;
    *(volatile unsigned char *)0x040001aa = cmd >> 8;
    *(volatile unsigned char *)0x040001ab = cmd;
    *(volatile unsigned char *)0x040001ac = arg >> 24;
    *(volatile unsigned char *)0x040001ad = arg >> 16;
    *(volatile unsigned char *)0x040001ae = arg >> 8;
    *(volatile unsigned char *)0x040001af = arg;
}
