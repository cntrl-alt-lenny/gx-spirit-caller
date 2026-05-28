/* func_ov002_02203df4: family 3 sibling. */
extern int func_ov002_021ff400(int self, int arg);
extern int func_ov002_021ff354(int self, int arg);

int func_ov002_02203df4(int self, int arg) {
    if (func_ov002_021ff400(self, arg) == 0) return 0;
    return func_ov002_021ff354(self, arg) != 0;
}
