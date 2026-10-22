extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_ov008_021ac208(void);
extern void func_ov008_021ac4d0(int count, int direction);
extern void func_ov008_021aceac(void);
extern void func_ov008_021acfa0(void);
extern void func_ov008_021ad018(void);
typedef struct { char pad[4]; unsigned short lo:8; unsigned short hi:8; unsigned short selected:8; unsigned short flags:8; } State;
typedef struct { unsigned short count; char pad[50]; } Entry;
typedef struct { char pad[0x55c]; int cancel; int confirm; } Context;
typedef struct { char pad[0xa60]; unsigned int limit; } Global;
typedef struct { char pad[0x18]; unsigned int total; } Total;
typedef struct { char pad[0x54]; unsigned short pressed; unsigned short repeat; } Input;
typedef struct { char pad[0x5a]; unsigned short count; } List;
extern State data_ov008_021b2dc0;
extern Entry data_ov008_021b279c[];
extern Context data_ov008_021b2780;
extern Global data_02104f4c;
extern Total data_ov008_021b2dc8;
extern Input data_02104bac;
extern List data_ov008_021b2c80;
int func_ov008_021ad570(void) {
    if (func_0200617c() != 0) {
        if (data_ov008_021b2dc0.lo + data_ov008_021b2dc0.hi == data_ov008_021b2dc0.selected) {
            if (data_ov008_021b279c[data_ov008_021b2dc0.selected].count != 0) {
                func_02037208(0x3a, -1, 0, 1); return 1;
            } else { func_02037208(0x43, -1, 0, 1); return 0; }
        } else if (data_ov008_021b2780.cancel != 0) {
            func_02037208(0x42, -1, 0, 1); return 2;
        } else if (data_ov008_021b2780.confirm != 0) {
            if (data_ov008_021b2dc8.total > data_02104f4c.limit) {
                func_02037208(0x43, -1, 0, 1); return 4;
            } else if ((int)data_ov008_021b2dc8.total > 0 && data_ov008_021b2dc8.total <= data_02104f4c.limit) {
                func_02037208(0x3a, -1, 0, 1); return 3;
            }
        }
    } else if (func_02006194() != 0) {
        func_ov008_021ad018();
    } else if (data_02104bac.repeat & 0x10) {
        int max = data_ov008_021b2c80.count > 6 ? 5 : data_ov008_021b2c80.count - 1;
        if (max > data_ov008_021b2dc0.hi) {
            data_ov008_021b2dc0.hi = (unsigned short)(data_ov008_021b2dc0.hi + 1);
            func_02037208(0x38, -1, 0, 1);
        } else if (data_ov008_021b2c80.count - 6 > data_ov008_021b2dc0.lo) {
            data_ov008_021b2dc0.lo = (unsigned short)(data_ov008_021b2dc0.lo + 1);
            func_ov008_021ac4d0(1, 1);
            func_02037208(0x38, -1, 0, 1);
        }
    } else if (data_02104bac.repeat & 0x20) {
        if (data_ov008_021b2dc0.hi != 0) {
            data_ov008_021b2dc0.hi = (unsigned short)(data_ov008_021b2dc0.hi + 0xffff);
            func_02037208(0x38, -1, 0, 1);
        } else if (data_ov008_021b2dc0.lo != 0) {
            data_ov008_021b2dc0.lo = (unsigned short)(data_ov008_021b2dc0.lo + 0xffff);
            func_ov008_021ac4d0(1, 0);
            func_02037208(0x38, -1, 0, 1);
        }
    } else if (data_02104bac.pressed & 1) {
        data_ov008_021b2dc0.selected = (unsigned short)(data_ov008_021b2dc0.lo + data_ov008_021b2dc0.hi);
        if (data_ov008_021b279c[((volatile State *)&data_ov008_021b2dc0)->selected].count != 0) {
            func_02037208(0x3a, -1, 0, 1); return 1;
        } else { func_02037208(0x43, -1, 0, 1); }
    } else if (data_02104bac.pressed & 2) {
        func_02037208(0x42, -1, 0, 1); return 2;
    } else if (data_02104bac.pressed & 0x200) {
        if (data_ov008_021b279c[data_ov008_021b2dc0.lo + data_ov008_021b2dc0.hi].count != 0) {
            func_ov008_021aceac(); func_02037208(0x3a, -1, 0, 1);
        } else { func_02037208(0x43, -1, 0, 1); }
    } else if (data_02104bac.pressed & 0x100) {
        if (data_ov008_021b279c[data_ov008_021b2dc0.lo + data_ov008_021b2dc0.hi].count != 0) func_ov008_021acfa0();
        func_02037208(0x43, -1, 0, 1);
    } else if (data_02104bac.pressed & 0x400) {
        if (data_ov008_021b2dc8.total > data_02104f4c.limit) {
            func_02037208(0x43, -1, 0, 1); return 4;
        } else if ((int)data_ov008_021b2dc8.total > 0 && data_ov008_021b2dc8.total <= data_02104f4c.limit) {
            func_02037208(0x3a, -1, 0, 1); return 3;
        }
    }
    func_ov008_021ac208(); return 0;
}


