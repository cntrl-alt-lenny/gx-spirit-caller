/* func_ov002_021c848c: twin of `_021c8470` — different callee
 * (`func_ov002_021c46a8`), reads buf[+0x1c]. sp3.
 */

extern void func_ov002_021c46a8(int a, int b, int *out);

int func_ov002_021c848c(int a, int b) {
    int buf[11];
    func_ov002_021c46a8(a, b, buf);
    return buf[7];
}
