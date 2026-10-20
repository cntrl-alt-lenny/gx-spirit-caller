typedef struct {
    unsigned int tag;
    unsigned short param;
} DrawCmd;
extern unsigned int data_02104f4c;
extern int func_ov017_021b40d8(int a0, int val, int x, int flags, int count);
extern int func_02005dac(int a, int b);
extern void func_020944a4(int unused0, int unused1, int unused2);

void func_ov017_021b41fc(int a0, int x, int flags)
{
    DrawCmd buf;
    int ret;
    int hours = data_02104f4c / 216000;
    int minutes = data_02104f4c / 3600 % 60;
    if (hours > 9999) {
        hours = 9999;
        minutes = 59;
    }
    func_ov017_021b40d8(a0, minutes, x, flags, 2);
    int coord = x - 24;
    buf.tag = (((unsigned int)coord << 23) >> 7) | (((unsigned int)flags & 0xff) | 0x40000000);
    buf.param = 0x1686;
    ret = func_02005dac(2, 0);
    func_020944a4((int)&buf, ret, 6);
    x = func_ov017_021b40d8(a0, hours, x - 24, flags, 0);
    buf.tag = ((unsigned int)(flags + 1) & 0xff) | 0x40000000 | (((unsigned int)(x - 16) << 23) >> 7);
    buf.param = 0x6687;
    ret = func_02005dac(2, 0);
    func_020944a4((unsigned int)&buf, ret, 6);
}











