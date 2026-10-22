typedef struct {
    unsigned short field0, field2, field4;
    char pad6[0xa2];
    unsigned short field_a8, field_aa;
    int field_ac;
} Obj;
extern Obj data_ov008_021b2de4;
typedef struct { char pad[0x5fc]; void *handles[4]; } Context;
extern Context data_ov008_021b2780;
extern void *func_02005dac(int, int);
extern unsigned int func_02006164(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int, int, int, int);
extern int func_0207fd28(void *, int);
extern void func_020944a4(int, int, int);
extern int func_020b3870(int, int);
extern int func_ov008_021aa578(int, int, int, int);
extern int func_ov008_021aedfc(int);
extern int func_ov008_021aee54(int);
extern void func_ov008_021aeeac(void);
extern void func_ov008_021afa34(int);
extern void func_ov008_021afca4(int, int, int);
void func_ov008_021afec8(void) {
    unsigned int count = data_ov008_021b2de4.field_a8;
    int i;
    int base = 0x15;
    int step;
    struct { unsigned int attr; unsigned short tile, pad; } sprite;
    if (count > 3) count = 3;
    step = func_020b3870(0x8a, count * 2);
    for (i = 0; i < (int)count; i++) {
        int pos = data_ov008_021b2de4.field0 % 5 + i;
        int tile;
        int top;
        int y = base + step;
        if (pos > 4) pos -= 5;
        tile = pos * 12;
        top = y - 0x14;
        sprite.attr = 0x80262000 | (unsigned char)top;
        sprite.tile = (tile + 0x2ab) | 0x400;
        func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 8);
        sprite.tile = (tile + 0x2b3) | 0x400;
        sprite.attr = 0x80266000 | (unsigned char)(y + 0xc);
        func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 8);
        if (func_02006194() && data_ov008_021b2de4.field_aa == 0 && data_ov008_021b2de4.field_ac == 0) {
            if (func_ov008_021aa578(0x26, top, 0x3a, y + 0x14)) {
                int old2 = data_ov008_021b2de4.field2;
                int old4 = data_ov008_021b2de4.field4;
                int a, b, c;
                data_ov008_021b2de4.field2 = i;
                data_ov008_021b2de4.field4 = 0;
                a = func_ov008_021aee54(data_ov008_021b2de4.field0 + data_ov008_021b2de4.field2);
                b = func_ov008_021aedfc(data_ov008_021b2de4.field0 + data_ov008_021b2de4.field2);
                c = func_ov008_021aee54(data_ov008_021b2de4.field0 + data_ov008_021b2de4.field2);
                if ((*(unsigned int *)((char *)&data_ov008_021b2780 + b * 0x34 + c / 32 * 4 + 0x3c) & (1 << (a % 32))) == 0 && data_ov008_021b2de4.field_ac == 0 && func_02006164()) {
                    func_ov008_021aeeac();
                    func_ov008_021afa34(data_ov008_021b2de4.field0 + data_ov008_021b2de4.field2);
                    func_02037208(0x3a, -1, 0, 1);
                } else {
                    if (old2 != data_ov008_021b2de4.field2 || old4 != data_ov008_021b2de4.field4)
                        func_02037208(0x38, -1, 0, 1);
                }
            }
        }
        {
            int a, b, c;
            a = func_ov008_021aee54(data_ov008_021b2de4.field0 + i);
            b = func_ov008_021aedfc(data_ov008_021b2de4.field0 + i);
            c = func_ov008_021aee54(data_ov008_021b2de4.field0 + i);
            if (*(unsigned int *)((char *)&data_ov008_021b2780 + b * 0x34 + c / 32 * 4 + 0x3c) & (1 << (a % 32)))
                func_ov008_021afca4(0x26, top, data_ov008_021b2de4.field0 + i);
        }
        base += step * 2;
    }
    for (i = 0; i < 4; i++) func_0207fd28(data_ov008_021b2780.handles[i], 0x1000);
}



