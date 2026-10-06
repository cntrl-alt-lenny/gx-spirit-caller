extern void func_02066ae8(int a, int b, int idx, int len, unsigned char *s);

void func_02066a88(int a, int b, int l1, unsigned char *s1, int l2, unsigned char *s2, int l3,
                   unsigned char *s3) {
    func_02066ae8(a, b, 0, l1, s1);
    func_02066ae8(a, b, 1, l2, s2);
    func_02066ae8(a, b, 2, l3, s3);
}
