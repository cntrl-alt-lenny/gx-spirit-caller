/* func_ov002_021d78e0: for arg1 >= 0, post via 021d730c with the 021c93f0
 * lookup (variant of 021d7a1c, flags 1,2). */
extern int func_ov002_021c9310(void *arg0, int kind, int arg1);
extern void func_ov002_021d721c(void *arg0, int b, int c, int d, int e, int f);

void func_ov002_021d78e0(void *arg0, int arg1) {
    if (arg1 < 0)
        return;
    func_ov002_021d721c(arg0, func_ov002_021c9310(arg0, 0xB, arg1), 0, 0xE, 1, 2);
}
