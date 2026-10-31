typedef struct { int unused; unsigned mode:3; unsigned rest:29; } Global;
typedef struct { short sound, pad, timeout; short rest[7]; } Entry;
extern Global data_02104f4c;
extern unsigned short data_02104bac[];
extern unsigned char data_ov006_021cec04[];
extern void func_02006110(int *, int *);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int, int, int, int);
extern void func_ov006_021cab6c(char *, int, int, int *);
extern void func_ov006_021caa64(char *);
int func_ov006_021c9efc(int *self) {
    unsigned short pressed = data_02104bac[42];
    unsigned short repeat = data_02104bac[43];
    Entry *entry;
    int x, y;
    int hit[2];
    if ((self[0] ? 1 : 0) == 0) return 1;
    self[34] = -1;
    if (data_02104f4c.mode == 0)
        entry = &((Entry *)(data_ov006_021cec04 + 6))[self[19]];
    else
        entry = &((Entry *)(data_ov006_021cec04 + 0x24a))[self[19]];
    if (entry->timeout > 0) {
        if (++self[21] >= entry->timeout) {
            if (entry->sound != 0) func_02037208(0x91, -1, 0, 1);
            self[18] = -1;
            return 1;
        }
    }
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_02006110(&x, &y);
        func_ov006_021cab6c((char *)self, x, y, hit);
        if (func_02006164() != 0) {
            self[32] = hit[0];
            self[33] = hit[1];
        } else if (func_0200617c() != 0) {
            int same = hit[0] == self[32] && hit[1] == self[33];
            if (same != 0) {
                if (hit[0] == 1) {
                    func_02037208(0x3a, -1, 0, 1);
                    self[18] = hit[1];
                    return 1;
                }
            }
        }
        if (hit[0] == 1) {
            self[26] = hit[1];
            self[27] = 0;
            self[34] = hit[1];
        }
        if (!(self[26] == self[28] && self[27] == self[29]))
            func_02037208(0x38, -1, 0, 1);
    } else {
        if (pressed & 1) {
            func_02037208(0x3a, -1, 0, 1);
            self[18] = self[26];
            return 1;
        }
        if (pressed & 2) {
            func_02037208(0x91, -1, 0, 1);
            self[18] = -1;
            return 1;
        }
        if (repeat & 0xf0) {
            if ((repeat & 0x40) && self[25] > 0) {
                if (--self[27] < 0) self[27] = self[25] - 1;
            } else if ((repeat & 0x80) && self[25] > 0) {
                if (++self[27] >= self[25]) self[27] = 0;
            } else if ((repeat & 0x20) && self[24] > 0) {
                if (--self[26] < 0) self[26] = self[24] - 1;
            } else if ((repeat & 0x10) && self[24] > 0) {
                if (++self[26] >= self[24]) self[26] = 0;
            }
            if (!(self[26] == self[28] && self[27] == self[29]))
                func_02037208(0x38, -1, 0, 1);
        }
    }
    self[28] = self[26];
    self[29] = self[27];
    func_ov006_021caa64((char *)self);
    return 0;
}


