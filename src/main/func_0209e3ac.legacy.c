extern void func_02093a20(unsigned char *out);

unsigned short func_0209e3ac(void) {
    unsigned char mac[12];
    unsigned short sum;
    int i;
    func_02093a20(mac);
    for (i = 0, sum = 0; i < 6; i++) {
        sum += mac[i];
    }
    sum += *(int *)0x027ffc3c;
    sum = sum * 7;
    return sum % 20 + 200;
}
