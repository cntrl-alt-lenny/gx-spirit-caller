/* func_ov002_022054d0: family 3 sibling. */
extern int func_ov002_022016bc(int self, int arg);
extern int func_ov002_021ff46c(int self, int arg);

int func_ov002_022054d0(int self, int arg) {
    if (func_ov002_022016bc(self, arg) == 0) return 0;
    return func_ov002_021ff46c(self, arg) != 0;
}
