/* func_ov002_021c83ac: twin of `_021c8470` — different callee
 * (`func_ov002_021c45c8`), reads buf[+0x1c]. sp3.
 */

extern void func_ov002_021c45c8(int a, int b, int *out);

int func_ov002_021c83ac(int a, int b) {
    int buf[11];
    func_ov002_021c45c8(a, b, buf);
    return buf[7];
}
