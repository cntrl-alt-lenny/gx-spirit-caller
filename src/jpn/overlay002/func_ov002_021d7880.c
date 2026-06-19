/* func_ov002_021d7880: for arg1 >= 0, post via 021d730c with the 021c93f0
 * lookup, passing (arg2 != 0) as a flag. */
extern int func_ov002_021c9310(void *arg0, int kind, int arg1);
extern void func_ov002_021d721c(void *arg0, int b, int c, int d, int e, int f);

void func_ov002_021d7880(void *arg0, int arg1, int arg2) {
    if (arg1 < 0)
        return;
    func_ov002_021d721c(arg0, func_ov002_021c9310(arg0, 0xB, arg1),
                        (arg2 != 0) ? 1 : 0, 0xE, 1, 0);
}
