/* func_ov002_021f9ffc: guard via func_ov002_021ea2a0(a,b,c), then test bit c
 * of a[b+6] and return the inverse as a bool. */
extern int func_ov002_021ea2a0(void *a, int b, int c);

int func_ov002_021f9ffc(void *a, int b, int c) {
    int r;
    if (!func_ov002_021ea2a0(a, b, c)) return 0;
    r = 1;
    if (*(unsigned short *)((char *)a + (b + 2) * 2 + 8) & (1 << c)) r = 0;
    return r;
}
