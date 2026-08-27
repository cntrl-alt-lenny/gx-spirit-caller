extern unsigned char data_021a07dc;
extern unsigned char data_021a07e0[];

void func_0207cce8(int a0) {
    unsigned char val;
    if (a0 & 2) {
        val = (unsigned char)(a0 >> 2);
    } else {
        val = (unsigned char)((a0 >> 2) + 0x19);
    }
    int count = data_021a07dc;
    data_021a07e0[count % 16] = val;
    if ((unsigned int)count < 16) {
        data_021a07dc = (unsigned char)(count + 1);
    } else {
        data_021a07dc = (unsigned char)((count + 1) % 16 + 16);
    }
}
