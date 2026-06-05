/* func_0204529c: zero-store sibling of func_0204525c. If the gate global != 9,
 * clear the (dac0,dac4) pair. Legacy mwcc 1.2/sp2p3 predicates the body
 * (movne/strne); the 2.0 build branches (early bxeq) -> near-miss. */
extern int data_0219dac0;
extern int data_0219dac4;

void func_0204529c(void) {
    if (data_0219dac0 != 9) {
        data_0219dac0 = 0;
        data_0219dac4 = 0;
    }
}
