typedef struct { int found, column, row; } Hit;
extern unsigned short data_02104bac[];
extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_02006164(void);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov006_021c8fa0(int *obj);
extern int func_ov006_021c91e0(int *obj);
extern void func_ov006_021c9bc8(int *base, int x, int y, Hit *out);
extern int func_ov006_021c9d00(int *obj, int column, int row);
typedef enum { FALSE, TRUE } Bool;
static inline Bool is_active(int *obj) { return obj[0] != 0; }
int func_ov006_021c7584(int *obj) {
    int keys = data_02104bac[0x2a];
    int repeat = data_02104bac[0x2b];
    Hit hit;
    int x, y;
    int active;
    active = is_active(obj);
    if (active == 0) return 1;
    if (func_02006194() || func_0200617c()) {
        func_02006110(&x, &y);
        func_ov006_021c9bc8(obj, x, y, &hit);
        if (func_02006164()) {
            obj[69] = hit.found;
            obj[70] = hit.column;
            obj[71] = hit.row;
        } else if (func_0200617c()) {
            int same = 0;
            int pair = 0;
            if (hit.found == obj[69] && hit.column == obj[70]) pair = 1;
            if (pair && hit.row == obj[71]) same = 1;
            if (same) {
                int selection, valid;
                if (hit.found == 1) {
                    selection = func_ov006_021c9d00(obj, obj[32], obj[33]);
                    valid = selection >= 0;
                } else {
                    selection = -1;
                    valid = 1;
                }
                func_02037208(valid ? (selection >= 0 ? 0x3a : 0x91) : 0x43, -1, 0, 1);
                if (valid) {
                    obj[27] = selection;
                    switch (obj[29]) {
                    case 7: obj[28] = obj[33] == 1 ? 1 : obj[33] == 2 ? 2 : 0; break;
                    case 8: obj[28] = obj[33] == 1 ? 3 : 0; break;
                    }
                    return 1;
                }
            }
        }
        if (hit.found == 1) {
            obj[32] = hit.column;
            obj[33] = hit.row;
        }
        if (obj[32] != obj[40] || obj[33] != obj[41]) obj[42] = 1;
    } else if (keys & 1) {
        int selection = func_ov006_021c9d00(obj, obj[32], obj[33]);
        if (selection >= 0) {
            func_02037208(0x3a, -1, 0, 1);
            obj[27] = selection;
            switch (obj[29]) {
            case 7: obj[28] = obj[33] == 1 ? 1 : obj[33] == 2 ? 2 : 0; break;
            case 8: obj[28] = obj[33] == 1 ? 3 : 0; break;
            }
            return 1;
        } else func_02037208(0x43, -1, 0, 1);
    } else if (keys & 2) {
        func_02037208(0x91, -1, 0, 1);
        obj[27] = -1;
        return 1;
    } else if (repeat & 0xf0) {
        if (repeat & 0x40) {
            if (--obj[33] < 0) obj[33] = obj[31] - 1;
        } else if (repeat & 0x80) {
            if (++obj[33] >= obj[31]) obj[33] = 0;
        } else if (repeat & 0x20) {
            if (--obj[32] < 0) obj[32] = obj[30] - 1;
        } else if (repeat & 0x10) {
            if (++obj[32] >= obj[30]) obj[32] = 0;
        }
        if (obj[32] != obj[40] || obj[33] != obj[41]) {
            func_02037208(0x38, -1, 0, 1);
            obj[42] = 1;
        }
    }
    if (obj[42]) {
        func_ov006_021c91e0(obj);
        obj[40] = obj[32];
        obj[41] = obj[33];
        obj[42] = 0;
    }
    func_ov006_021c8fa0(obj);
    return 0;
}





