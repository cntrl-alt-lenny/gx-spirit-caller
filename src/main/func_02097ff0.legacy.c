/* func_02097ff0: StyleA 97848-family -> helper(self,8) guard; set fields; return 1. */
extern int func_02097848(int *self, int k);
int func_02097ff0(int *self) {
    if (func_02097848(self, 8) == 0) return 0;
    self[2] = 0;
    self[4] = 14;
    self[3] &= ~0x30;
    return 1;
}
