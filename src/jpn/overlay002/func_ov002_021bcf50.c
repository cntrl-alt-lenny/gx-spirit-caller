extern int func_ov002_021baf88(int x);
extern int func_ov002_021bbdcc(int self);
extern int func_ov002_021bcf04(int self, int val);
extern int data_ov002_022bdec8[];

int func_ov002_021bcf50(int self) {
    int v;
    int *table;
    int i;
    if (func_ov002_021baf88(0x16df) != 0) {
        if (func_ov002_021bbdcc(self) >= 5) {
            return -1;
        }
    }
    table = data_ov002_022bdec8;
    for (i = 0; i < 5; i++) {
        v = table[i];
        if (func_ov002_021bcf04(self, v + 5) != 0) {
            return v + 5;
        }
    }
    return -1;
}
