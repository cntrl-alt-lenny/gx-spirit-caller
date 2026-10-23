extern int func_0203db24(void);
extern int func_0203db70(void);
extern void func_02043250(void);
extern void func_020432d0(void);

int func_0203dc10(unsigned char *p) {
    int r;
    if (*p <= 10) {
        r = func_0203db70();
        if (r == 1) {
            *p = 0;
            return 1;
        }
        if (r == -1) {
            *p = 18;
            return 1;
        }
    } else if (*p == 14) {
        func_02043250();
        func_020432d0();
        *p = 12;
    } else if (*p < 18) {
        if (func_0203db24() == 1) {
            *p = 10;
        }
    }
    return 0;
}
