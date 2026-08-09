/* func_0204ab88: small dispatcher on r4 in [1,4] (0 returns early;
 * out-of-range values fall through with unset a/b, matching the
 * original's uninitialized-register behaviour). Each case sets an
 * (a, b) pair, then func_02050054(a, b + 0xfffec398) is called and the
 * original input value is returned.
 */
extern int func_02050054(int a0, int a1);

int func_0204ab88(int r4) {
    int a, b;

    if (r4 == 0) {
        return 0;
    }

    switch (r4) {
        case 1:
            a = 9;
            b = ~0;
            break;
        case 2:
            a = 9;
            b = ~1;
            break;
        case 3:
            a = 6;
            b = ~9;
            break;
        case 4:
            a = 6;
            b = ~0x13;
            break;
    }

    func_02050054(a, b + 0xfffec398);
    return r4;
}
