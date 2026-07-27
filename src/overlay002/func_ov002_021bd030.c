extern int func_ov002_021bb068(int x);
extern int func_ov002_021bbeac(int self);
extern int func_ov002_021bcfe4(int self, int val);
extern int data_ov002_022bdfd8[];

int func_ov002_021bd030(int self) {
    int v;
    int *table;
    int i;
    if (func_ov002_021bb068(0x16df) != 0) {
        if (func_ov002_021bbeac(self) >= 5) {
            return -1;
        }
    }
    table = data_ov002_022bdfd8;
    for (i = 0; i < 5; i++) {
        v = table[i];
        if (func_ov002_021bcfe4(self, v + 5) != 0) {
            return v + 5;
        }
    }
    return -1;
}
