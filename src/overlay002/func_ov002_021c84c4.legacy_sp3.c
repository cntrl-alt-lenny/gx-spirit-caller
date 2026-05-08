/* func_ov002_021c84c4: twin of `_021c848c` — same callee, reads
 * buf[+0x20]. sp3.
 */

extern void func_ov002_021c46a8(int a, int b, int *out);

int func_ov002_021c84c4(int a, int b) {
    int buf[11];
    func_ov002_021c46a8(a, b, buf);
    return buf[8];
}
