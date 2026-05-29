/* func_02098104: StyleA 97848-family -> set fields; helper(self,7) guard; f12 bits; return 1. */
extern int func_02097848(int *self, int k);
int func_02098104(int *self, int a1, int a2, int a3, int a4) {
    self[2] = a1;
    self[14] = a4;
    self[12] = a2;
    self[13] = a3;
    if (func_02097848(self, 7) == 0) return 0;
    self[3] |= 16;
    self[3] &= ~32;
    return 1;
}
