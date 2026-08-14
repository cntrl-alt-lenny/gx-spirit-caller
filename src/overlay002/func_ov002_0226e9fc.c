extern int func_ov002_021bb068(int a);
extern int func_ov002_021bc68c(int a);
extern int func_ov002_021c38c4(int a, int b);
extern int func_ov002_021bbb1c(int a, int b, int c);

int func_ov002_0226e9fc(int a, int b) {
    if (func_ov002_021bb068(0x13f2) > 0) {
        return 0;
    }
    if (func_ov002_021bc68c(a) == 0) {
        goto fail;
    }
    {
        int r = func_ov002_021c38c4(a, b);

        if (r < 5) {
            goto fail;
        }

        {
            int c = (r >= 7) ? 1 : 0;

            c += 1;

            return func_ov002_021bbb1c(a, 0x19b2, c) > 0 ? 1 : 0;
        }
    }

fail:
    return 0;
}
