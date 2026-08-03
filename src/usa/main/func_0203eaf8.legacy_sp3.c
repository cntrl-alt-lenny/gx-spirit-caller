/* func_0203eaf8: legacy_sp3-tier (1.2/sp3). Cascades through several
 * (b,c)/result checks, tail-calling one of several handlers.
 */
extern int func_0203c8b0(int a);
extern int func_0203c838(void);
extern int func_0207b510(void);
extern int func_0203e90c(int a);
extern int func_0203e410(int a, int b);
extern int func_0203e868(int a);
extern int func_0203e6e0(int a);
extern int func_0203e5c0(int a);

int func_0203eaf8(void) {
    int a = func_0203c8b0(0x10);
    int b = func_0203c838();
    int c = func_0207b510();
    int r;

    if (b == 2 && c == 3) {
        r = func_0203e90c(a);
        goto end;
    }
    if (b == 6) {
        r = func_0203e410(a, b);
        goto end;
    }
    if (c != 3 && c != 6) {
        r = b;
        goto end;
    }
    r = func_0203e410(a, b);
    if (r == 7) {
        goto end;
    }
    if (r == 3) {
        r = func_0203e868(a);
        goto end;
    }
    if (r == 4) {
        r = func_0203e6e0(a);
        goto end;
    }
    if (r == 5) {
        r = func_0203e5c0(a);
    }
end:
    return r;
}
