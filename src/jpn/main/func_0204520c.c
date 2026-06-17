/* func_0204520c: guarded dual-store. If the gate global != 9, latch the two
 * args into the (dac0,dac4) pair. Sibling of func_0204524c (the zero-store). */
extern int data_0219d9e0;
extern int data_0219d9e4;

void func_0204520c(int a0, int a1) {
    if (data_0219d9e0 != 9) {
        data_0219d9e0 = a0;
        data_0219d9e4 = a1;
    }
}
