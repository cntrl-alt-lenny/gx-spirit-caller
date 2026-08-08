/* func_0206e4a4: twin of func_0206e474 — table symbol data_0219ed48,
 * inverted result polarity (0 on hit vs. 1 on hit-or-skip). */

extern int func_0206e504(int g, int a0);
extern char data_0219ed48[];

int func_0206e4a4(int param0) {
    if (param0 <= 0) {
        goto ret1;
    }
    if (func_0206e504((int)data_0219ed48, param0) != 0) {
        goto ret0;
    }
ret1:
    return 1;
ret0:
    return 0;
}
