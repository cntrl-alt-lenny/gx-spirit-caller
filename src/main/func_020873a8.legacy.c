/* func_020873a8: test-and-set a bitmask global. Return 0 if any bit already
 * set, else OR it in and return 1. Legacy mwcc 1.2/sp2p3 matches the orig
 * allocator (the 2.0 build is an 8v8 register-choice near-miss). */
extern int data_021a4850;

int func_020873a8(int a0) {
    if (a0 & data_021a4850) return 0;
    data_021a4850 |= a0;
    return 1;
}
