/* func_ov002_02259274: arm a type-8 request, or short-circuit (17
 * band-callers). If the done-flag data_ov002_022cd664[arg0] is already 1, call
 * func_ov002_0228f90c; otherwise fill the shared duel-command block
 * data_ov002_022d008c with a type-8 request carrying arg0/arg1/arg2.
 */

struct g016c {
    char _a[3400];
    int f3400;
    int _p1;
    int f3408;
    int f3412;
    int f3416;
    char _p2[16];
    int f3436;
    char _p3[20];
    int f3460;
};

extern struct g016c data_ov002_022d008c;
extern int data_ov002_022cd664[];
extern int func_ov002_0228f90c(void);

void func_ov002_02259274(int arg0, int arg1, int arg2) {
    if (data_ov002_022cd664[arg0] == 1) {
        func_ov002_0228f90c();
    } else {
        data_ov002_022d008c.f3400 = 8;
        data_ov002_022d008c.f3460 = arg2;
        data_ov002_022d008c.f3412 = 0;
        data_ov002_022d008c.f3408 = 0;
        data_ov002_022d008c.f3436 = arg0;
        data_ov002_022d008c.f3416 = arg1;
    }
}
