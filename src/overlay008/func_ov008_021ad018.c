typedef struct {
    unsigned short pad[2];
    unsigned short value : 8;
    unsigned short upper : 8;
    unsigned short selected : 8;
    unsigned short flags : 8;
} State;
typedef struct {
    unsigned char pad0[0x55c];
    int right, left;
    unsigned char pad1[0xd0];
    unsigned int bits;
} Context;
typedef struct { unsigned short count; unsigned char pad[50]; } Entry;
extern State data_ov008_021b2dc0;
extern Context data_ov008_021b2780;
extern unsigned short data_ov008_021b2c80[];
extern Entry data_ov008_021b279c[];
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_02006164(void);
extern int func_ov008_021aa578(int a0, int a1, int a2, int a3);
extern void func_ov008_021ac4d0(int count, int direction);
extern void func_ov008_021acd04(int x);
extern void func_ov008_021acdd0(int x);
extern void func_ov008_021aceac(void);
extern void func_ov008_021acfa0(void);
extern int func_020b3870(int a, int b);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov008_021b1ee0(void);
void func_ov008_021ad018(void) {
    int x, y;
    int count, step, end;
    func_02006110(&x, &y);
    if (func_ov008_021aa578(2,164,44,190)) {
        if (func_02006164()) data_ov008_021b2780.left = 1;
        data_ov008_021b2780.bits |= 2;
    } else data_ov008_021b2780.left = 0;
    if (func_ov008_021aa578(227,164,253,190)) {
        if (func_02006164()) data_ov008_021b2780.right = 1;
        data_ov008_021b2780.bits |= 1;
    } else data_ov008_021b2780.right = 0;
    if (data_ov008_021b2c80[45] > 6) {
        if (func_ov008_021aa578(19,126,40,150)) {
            data_ov008_021b2780.bits |= 16;
            if (data_ov008_021b2c80[44] == 0) {
                if (data_ov008_021b2dc0.value != 0) {
                    data_ov008_021b2dc0.value--;
                    func_ov008_021ac4d0(1,0);
                    data_ov008_021b2c80[44] = 8;
                }
            } else data_ov008_021b2c80[44]--;
        }
        if (func_ov008_021aa578(2,65,10,81)) {
            if (data_ov008_021b2c80[44] == 0) {
                if (data_ov008_021b2dc0.value != 0) {
                    data_ov008_021b2dc0.value--;
                    func_ov008_021ac4d0(1,0);
                    data_ov008_021b2c80[44] = 8;
                }
            } else data_ov008_021b2c80[44]--;
        }
        if (func_ov008_021aa578(214,126,235,150)) {
            data_ov008_021b2780.bits |= 32;
            if (data_ov008_021b2c80[44] == 0) {
                if (data_ov008_021b2dc0.value < data_ov008_021b2c80[45] - 6) {
                    data_ov008_021b2dc0.value = (unsigned short)(data_ov008_021b2dc0.value + 1);
                    func_ov008_021ac4d0(1,1);
                    data_ov008_021b2c80[44] = 8;
                }
            } else data_ov008_021b2c80[44]--;
        }
        if (func_ov008_021aa578(246,65,254,81)) {
            if (data_ov008_021b2c80[44] == 0) {
                if (data_ov008_021b2dc0.value < data_ov008_021b2c80[45] - 6) {
                    data_ov008_021b2dc0.value = (unsigned short)(data_ov008_021b2dc0.value + 1);
                    func_ov008_021ac4d0(1,1);
                    data_ov008_021b2c80[44] = 8;
                }
            } else data_ov008_021b2c80[44]--;
        }
        if (func_ov008_021aa578(40,126,214,150)) {
            data_ov008_021b2780.bits |= 256;
            func_ov008_021acd04(x);
            data_ov008_021b2c80[44] = 0;
        }
    }
    count = data_ov008_021b2c80[45];
    if ((unsigned int)count > 6) count = 6;
    step = func_020b3870(240, count * 2);
    end = step + 8;
    end += step * count * 2;
    end -= 16;
    if (func_ov008_021aa578(step - 8,36,end,100)) {
        if (func_02006164()) {
            data_ov008_021b2dc0.selected = (unsigned short)(data_ov008_021b2dc0.value + data_ov008_021b2dc0.upper);
        }
        func_ov008_021acdd0(x);
    } else data_ov008_021b2dc0.selected = 26;
    if (func_ov008_021aa578(46,164,72,190)) {
        data_ov008_021b2780.bits |= 4;
        if (func_02006164()) {
            if (data_ov008_021b279c[data_ov008_021b2dc0.value + data_ov008_021b2dc0.upper].count != 0) {
                func_ov008_021aceac();
                func_02037208(58,-1,0,1);
            } else func_02037208(67,-1,0,1);
        }
    }
    if (func_ov008_021aa578(74,164,100,190)) {
        data_ov008_021b2780.bits |= 8;
        if (func_02006164()) {
            if (data_ov008_021b279c[data_ov008_021b2dc0.value + data_ov008_021b2dc0.upper].count != 0) {
                func_ov008_021acfa0();
                func_02037208(67,-1,0,1);
            }
        }
    }
    if (!func_ov008_021b1ee0()) return;
    if (!func_ov008_021aa578(227,0,256,20)) return;
    data_ov008_021b2780.bits |= 1024;
}
