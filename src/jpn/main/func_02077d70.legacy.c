/* func_02077d70: copy b into a+0x10 (8B), compute a cyclic-boundary
 * distance from the just-written field, splice in a constant run,
 * copy b into a (8B), then copy b back into a (16B).
 */

extern void *func_0207835c(const void *src, void *dst, int n);
extern void func_02077de4(void *dst, const void *src, int len);
extern char data_02101e94[];

void func_02077d70(char *a, char *b) {
    unsigned int x;
    int len;

    func_0207835c(b, a + 0x10, 8);

    x = (*(unsigned int *)(a + 0x10) >> 3) & 0x3f;
    if ((int)x < 0x38) {
        len = 0x38 - x;
    } else {
        len = 0x78 - x;
    }
    func_02077de4(a, data_02101e94, len);

    func_02077de4(a, b, 8);
    func_0207835c(b, a, 0x10);
}
