extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070f78(int a0, int a1, int a2);
extern void func_02070f24(void);
extern int func_0206fa48(int mode);
extern int func_0206f688(int a, int b);
extern int data_0219eeec;
extern unsigned int data_0219ef18;
extern unsigned int data_0219ef04;

int func_0206f4fc(unsigned int *out, int mode) {
    int result;
    int i;
    unsigned int value;
    func_02070f44();
    func_02070fe8();
    if (mode == 1)
        func_02070f78(0x44, 0x43, data_0219eeec);
    else
        func_02070f78(0x44, 0x43, -1);
    i = 0;
    do {
        result = func_0206f688(func_0206fa48(mode), i);
        if (result != 0) break;
        i++;
    } while (i < 4);
    func_02070f24();
    if (result == 2) {
        *out = data_0219ef18 >> 1;
        data_0219ef04 = (data_0219ef18 * 3) >> 3;
        return 1;
    }
    *out = data_0219ef04 = value = data_0219ef04 >> 1;
    switch (mode) {
    case 1:
        if (value < 60) {
            *out = 1;
            data_0219ef04 = data_0219ef18 >> 3;
        }
        break;
    case 2:
        if (value < 60) *out = 1;
        break;
    }
    return 0;
}

