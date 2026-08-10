/* func_02077e58: copy b into a+0x10 (8B), compute a cyclic-boundary
 * distance from the just-written field, splice in a constant run,
 * copy b into a (8B), then copy b back into a (16B).
 */

extern void *func_02078444(const void *src, void *dst, int n);
extern void func_02077ecc(void *dst, const void *src, int len);
extern char data_02101f74[];

void func_02077e58(char *a, char *b) {
    unsigned int x;
    int len;

    func_02078444(b, a + 0x10, 8);

    x = (*(unsigned int *)(a + 0x10) >> 3) & 0x3f;
    if ((int)x < 0x38) {
        len = 0x38 - x;
    } else {
        len = 0x78 - x;
    }
    func_02077ecc(a, data_02101f74, len);

    func_02077ecc(a, b, 8);
    func_02078444(b, a, 0x10);
}
