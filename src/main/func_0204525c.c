/* func_0204525c: guarded dual-store. If the gate global != 9, latch the two
 * args into the (dac0,dac4) pair. Sibling of func_0204529c (the zero-store). */
extern int data_0219dac0;
extern int data_0219dac4;

void func_0204525c(int a0, int a1) {
    if (data_0219dac0 != 9) {
        data_0219dac0 = a0;
        data_0219dac4 = a1;
    }
}
