extern unsigned char data_0219f262[];
extern unsigned int data_0219ef00;
extern unsigned char *func_0206fc6c(unsigned char *buf, int type, int *len);
extern int func_0206fc2c(int a0, unsigned a1, int a2, unsigned a3);
extern void func_02070430(unsigned char *buf, int len);

int func_0206fb64(void) {
    unsigned char *buf = data_0219f262;
    int len;
    unsigned char *p = func_0206fc6c(buf, 1, &len);

    if (data_0219ef00 != 0) {
        p[0] = 0x32;
        p[1] = 4;
        p[2] = (unsigned short)(data_0219ef00 >> 16) >> 8;
        p[3] = data_0219ef00 >> 16;
        p[4] = (unsigned short)data_0219ef00 >> 8;
        p[5] = data_0219ef00;
        p += 6;
    }
    *p = 0xff;
    func_02070430(buf, func_0206fc2c(0, 0x12c, (int)(p + 1), (unsigned)((p + 1) - buf)) - (int)buf);
    return len;
}
