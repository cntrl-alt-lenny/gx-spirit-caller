typedef struct { unsigned short x, y; unsigned char w, h; } Rect;
extern unsigned short data_02104bac[];
extern Rect data_ov016_021b9000, data_ov016_021b900a, data_ov016_021b9014;
extern char data_ov016_021babec[], data_ov016_021bac64[];
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov016_021b28f4(Rect *rect);
extern int func_ov016_021b32f0(void *arg0, int arg1);
extern int func_ov016_021b35dc(void *arg0);
extern int func_ov016_021b3650(void *arg0);
extern void func_ov016_021b39e4(void *arg0);
extern int func_ov016_021b4204(void *arg0);
extern int func_ov016_021b47c8(void *arg0);
/* This caller passes a state pointer; the current callee C definition takes void. */
extern int func_ov016_021b6324(void *arg0);
extern int func_ov016_021b6688(void *arg0);
int func_ov016_021b3174(void *arg0) {
    char *p = arg0;
    switch (*(int *)(p + 4)) {
    case 0:
        if (data_02104bac[41] != 0) {
            if (data_02104bac[42] & 0xc0) {
                *(int *)(p + 12) = 1 - *(int *)(p + 12);
                func_ov016_021b39e4(p);
                func_02037208(0x38, -1, 0, 1);
            } else if (data_02104bac[42] & 1) {
                return func_ov016_021b32f0(p, *(int *)(p + 12) + 1);
            } else if (data_02104bac[42] & 2) {
                return func_ov016_021b32f0(p, 0);
            }
        } else {
            if (func_ov016_021b28f4(&data_ov016_021b9000))
                return func_ov016_021b32f0(p, 0);
            if (func_ov016_021b28f4(&data_ov016_021b900a))
                return func_ov016_021b32f0(p, 1);
            if (func_ov016_021b28f4(&data_ov016_021b9014))
                return func_ov016_021b32f0(p, 2);
        }
        break;
    case 1:
        if (func_ov016_021b47c8(data_ov016_021babec)) {
            func_ov016_021b4204(data_ov016_021babec);
            func_ov016_021b35dc(p);
            func_ov016_021b3650(p);
            *(int *)(p + 4) = 0;
        }
        break;
    case 2:
        if (func_ov016_021b6688(data_ov016_021bac64)) {
            func_ov016_021b6324(data_ov016_021bac64);
            *(int *)(p + 4) = 0;
            func_ov016_021b35dc(p);
            func_ov016_021b3650(p);
        }
        break;
    }
    return 0;
}

