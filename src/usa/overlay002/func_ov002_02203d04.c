/* func_ov002_02203d04: family 3 sibling. */
extern int func_ov002_021ff310(int self, int arg);
extern int func_ov002_021ff264(int self, int arg);

int func_ov002_02203d04(int self, int arg) {
    if (func_ov002_021ff310(self, arg) == 0) return 0;
    return func_ov002_021ff264(self, arg) != 0;
}
