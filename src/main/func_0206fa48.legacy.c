extern unsigned char data_0219f262[];
extern unsigned int data_0219ef00;
extern unsigned int data_0219eeec;
extern unsigned char *func_0206fc6c(unsigned char *buf, int type, unsigned int *out);
extern int func_0206fc2c(int a0, unsigned a1, int a2, unsigned a3);
extern unsigned int func_02070430(int a, int b);

unsigned int func_0206fa48(int arg) {
    unsigned char *buf = data_0219f262;
    unsigned int len;
    unsigned char *p = func_0206fc6c(buf, 3, &len);
    if (arg == 0) {
        p[0] = 0x32;
        p[1] = 4;
        p[2] = (unsigned short)(data_0219ef00 >> 16) >> 8;
        p[3] = data_0219ef00 >> 16;
        p[4] = (unsigned short)data_0219ef00 >> 8;
        p[5] = data_0219ef00;
        p[6] = 0x36;
        p[7] = 4;
        p[8] = (unsigned short)(data_0219eeec >> 16) >> 8;
        p[9] = data_0219eeec >> 16;
        p[10] = (unsigned short)data_0219eeec >> 8;
        p[11] = data_0219eeec;
        p += 12;
    }
    *p = 0xff;
    func_02070430((int)buf, func_0206fc2c(0, 0x12c, (int)(p + 1), (unsigned)((p + 1) - buf)) - (int)buf);
    return len;
}
