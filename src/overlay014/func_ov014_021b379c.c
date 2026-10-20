typedef struct {
    char pad[0x54];
    unsigned short low : 8;
    unsigned short high : 8;
    int changed;
} Settings;
extern Settings data_ov014_022350f4;
extern char data_ov014_0223515c[];
extern int func_ov005_021ad018(int a, int b);
extern int func_02037208(int a, int b, int c, int d);
extern void func_ov014_021b3938(void *self, int which);
extern int func_ov014_021b44e8(void *self);

int func_ov014_021b379c(char *self) {
    switch (*(int *)(self + 0x34)) {
    case 0:
        *(int *)(self + 0x2c) = 1;
        func_ov005_021ad018((int)(self + 0xc), 0);
        func_02037208(0x3a, -1, 0, 1);
        return 1;
    case 1: {
        int value = data_ov014_022350f4.low;
        if (*(int *)(self + 0x30)) {
            value++;
            if (value > 10) value = 1;
        } else {
            value--;
            if (value <= 0) value = 10;
        }
        data_ov014_022350f4.low = (unsigned short)value;
        data_ov014_022350f4.changed = 1;
        func_ov014_021b3938(self, 0);
        func_02037208(0x3a, -1, 0, 1);
        break;
    }
    case 2: {
        int value = data_ov014_022350f4.high;
        if (*(int *)(self + 0x30)) {
            value++;
            if (value > 10) value = 1;
        } else {
            value--;
            if (value <= 0) value = 10;
        }
        data_ov014_022350f4.high = (unsigned short)value;
        data_ov014_022350f4.changed = 2;
        func_ov014_021b3938(self, 1);
        func_02037208(0x3a, -1, 0, 1);
        break;
    }
    case 3:
        if (*(signed char *)(self + 0xc)) {
            func_ov014_021b44e8(data_ov014_0223515c);
            *(int *)(self + 4) = 1;
            func_02037208(0x3a, -1, 0, 1);
        }
        break;
    }
    return 0;
}
