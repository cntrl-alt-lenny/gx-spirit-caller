/* func_ov002_021c84a8: twin of `_021c8470` — same callee, reads
 * buf[+0x18]. sp3.
 */

extern void func_ov002_021c4c9c(int a, int b, int *out);

int func_ov002_021c84a8(int a, int b) {
    int buf[11];
    func_ov002_021c4c9c(a, b, buf);
    return buf[6];
}
