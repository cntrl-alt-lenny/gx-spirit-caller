/* func_ov002_0225935c: arm a type-8 request, or short-circuit (17
 * band-callers). If the done-flag data_ov002_022cd744[arg0] is already 1, call
 * func_ov002_0228fa1c; otherwise fill the shared duel-command block
 * data_ov002_022d016c with a type-8 request carrying arg0/arg1/arg2.
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

extern struct g016c data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_0228fa1c(void);

void func_ov002_0225935c(int arg0, int arg1, int arg2) {
    if (data_ov002_022cd744[arg0] == 1) {
        func_ov002_0228fa1c();
    } else {
        data_ov002_022d016c.f3400 = 8;
        data_ov002_022d016c.f3460 = arg2;
        data_ov002_022d016c.f3412 = 0;
        data_ov002_022d016c.f3408 = 0;
        data_ov002_022d016c.f3436 = arg0;
        data_ov002_022d016c.f3416 = arg1;
    }
}
