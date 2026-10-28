extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202224c(int idx);
extern int func_0202b74c(int key);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern int func_ov009_021aa4a8(int *o, unsigned int mode);
extern int func_ov009_021ad1bc(int dummy, int a);
extern int func_ov009_021ad204(int a, int b);
extern char data_021040ac[];
extern unsigned int data_02104f4c[];
extern unsigned short data_0210594c[];
extern int data_ov009_021adbcc[];
extern int data_ov009_021adc00[];
int func_ov009_021acff8(int *o) {
    unsigned int digits = o[6];
    int value = 0;
    int factor = 1;
    int i;
    o[8] = -1;
    o[12] = 0;
    for (i = 0; i < 8; i++) {
        int digit = digits & 15;
        if (digit == 15) {
            func_02037208(0x43, -1, 0, 1);
            return 0;
        }
        value += digit * factor;
        factor *= 10;
        digits >>= 4;
    }
    func_02037208(0x3a, -1, 0, 1);
    if (value == 0x02a45120 && data_02104f4c[0x24a] >= 45) {
        func_02022234(0, func_0202224c(0) | 1);
        *(int *)(data_021040ac + 0x24) = 1;
        return 1;
    }
    o[8] = func_0202b74c(value);
    o[0] = 0;
    if (o[8] > 0 && func_ov009_021ad1bc((int)o, o[8]) != 0) {
        o[0] = func_ov009_021ad204((int)o, o[8]);
        if (((data_02104f4c[0x299] & 0x1f00000) >> 20) == 13) {
            int reduction = 0;
            switch (data_0210594c[0x70]) {
            case 0: reduction = 4; break;
            case 1: reduction = 9; break;
            case 2: reduction = 15; break;
            }
            o[0] = o[0] * (100 - reduction) / 100;
        }
    }
    o[10] = 1;
    func_ov009_021aa4a8(data_ov009_021adbcc, 2);
    data_ov009_021adc00[0] = 1;
    data_ov009_021adc00[1] = 0;
    func_02037208(0x98, -1, 0, 1);
    return 0;
}
