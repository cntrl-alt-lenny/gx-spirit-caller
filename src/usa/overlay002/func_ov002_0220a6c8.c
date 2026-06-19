/* func_ov002_0220a6c8: family 3 sibling. */
extern int func_ov002_021ff230(int self, int arg);
extern int func_ov002_021ff264(int self, int arg);

int func_ov002_0220a6c8(int self, int arg) {
    if (func_ov002_021ff230(self, arg) == 0) return 0;
    return func_ov002_021ff264(self, arg) != 0;
}
