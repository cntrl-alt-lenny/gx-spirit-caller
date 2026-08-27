extern int func_ov002_021baf88(int a);
extern int func_ov002_021bc5ac(int a);
extern int func_ov002_021c37e4(int a, int b);
extern int func_ov002_021bba3c(int a, int b, int c);

int func_ov002_0226e90c(int a, int b) {
    if (func_ov002_021baf88(0x13f2) > 0) {
        return 0;
    }
    if (func_ov002_021bc5ac(a) == 0) {
        goto fail;
    }
    {
        int r = func_ov002_021c37e4(a, b);

        if (r < 5) {
            goto fail;
        }

        {
            int c = (r >= 7) ? 1 : 0;

            c += 1;

            return func_ov002_021bba3c(a, 0x19b2, c) > 0 ? 1 : 0;
        }
    }

fail:
    return 0;
}
