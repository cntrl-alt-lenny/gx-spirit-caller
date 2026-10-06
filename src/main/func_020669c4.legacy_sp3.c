extern void func_02066a88(int a, int b, int l1, unsigned char *s1, int l2, unsigned char *s2, int l3,
                          unsigned char *s3);

void func_020669c4(int a, int b, unsigned char *p, int n) {
    unsigned char l1;
    unsigned char l2;
    unsigned char l3;
    unsigned char *s1 = 0;
    unsigned char *s2 = 0;
    unsigned char *s3 = 0;

    if (n < 3) {
        return;
    }
    l1 = *p++;
    n--;
    if (l1 != 0 && l1 != 0xff) {
        s1 = p;
        p += l1;
        n -= l1;
    }
    if (n < 2) {
        return;
    }
    l2 = *p++;
    n--;
    if (l2 != 0 && l2 != 0xff) {
        s2 = p;
        p += l2;
        n -= l2;
    }
    if (n < 1) {
        return;
    }
    l3 = *p;
    n--;
    if (l3 != 0 && l3 != 0xff) {
        s3 = p + 1;
        n -= l3;
    }
    if (n < 0) {
        return;
    }
    func_02066a88(a, b, l1, s1, l2, s2, l3, s3);
}
