typedef unsigned char u8;
typedef unsigned int u32;
extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070f78(int a0, int a1, int a2);
extern u8 *func_0206fc6c(u8 *buf, int type, u32 *out);
extern int func_0206fc2c(int a0, unsigned a1, int a2, unsigned a3);
extern unsigned int func_02070430(int a, int b);
extern void func_02070f24(void);
extern int data_0219eeec;
extern u8 data_0219f262[];

void func_0206f48c(void) {
    u8 *p;
    int base;
    func_02070f44();
    func_02070fe8();
    func_02070f78(0x44, 0x43, data_0219eeec);
    base = (int)data_0219f262;
    p = func_0206fc6c((u8 *)base, 7, 0);
    *p++ = 0xff;
    p = (u8 *)func_0206fc2c(0, 0x12c, (int)p, (int)p - base);
    func_02070430((int)base, (int)p - base);
    func_02070f24();
}


