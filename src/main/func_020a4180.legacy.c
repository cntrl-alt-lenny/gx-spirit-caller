extern void func_02093a20(unsigned char *out);

unsigned int func_020a4180(void) {
    unsigned char mac[12];
    unsigned int sum;
    int i;
    func_02093a20(mac);
    for (i = 0, sum = 0; i < 6; i++) {
        sum += mac[i];
    }
    return ((sum + *(unsigned int *)0x027ffc3c) * 7) % 20;
}
