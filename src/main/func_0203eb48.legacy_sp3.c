/* func_0203eb48: legacy_sp3-tier (1.2/sp3). Cascades through several
 * (b,c)/result checks, tail-calling one of several handlers.
 */
extern int func_0203c900(int a);
extern int func_0203c888(void);
extern int func_0207b5f8(void);
extern int func_0203e95c(int a);
extern int func_0203e460(int a, int b);
extern int func_0203e8b8(int a);
extern int func_0203e730(int a);
extern int func_0203e610(int a);

int func_0203eb48(void) {
    int a = func_0203c900(0x10);
    int b = func_0203c888();
    int c = func_0207b5f8();
    int r;

    if (b == 2 && c == 3) {
        r = func_0203e95c(a);
        goto end;
    }
    if (b == 6) {
        r = func_0203e460(a, b);
        goto end;
    }
    if (c != 3 && c != 6) {
        r = b;
        goto end;
    }
    r = func_0203e460(a, b);
    if (r == 7) {
        goto end;
    }
    if (r == 3) {
        r = func_0203e8b8(a);
        goto end;
    }
    if (r == 4) {
        r = func_0203e730(a);
        goto end;
    }
    if (r == 5) {
        r = func_0203e610(a);
    }
end:
    return r;
}
