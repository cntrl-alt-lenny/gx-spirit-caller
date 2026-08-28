/* func_0206e430: twin of func_0206e474 — table symbol data_0219ec68,
 * inverted result polarity (0 on hit vs. 1 on hit-or-skip). */

extern int func_0206e490(int g, int a0);
extern char data_0219ec68[];

int func_0206e430(int param0) {
    if (param0 <= 0) {
        goto ret1;
    }
    if (func_0206e490((int)data_0219ec68, param0) != 0) {
        goto ret0;
    }
ret1:
    return 1;
ret0:
    return 0;
}
