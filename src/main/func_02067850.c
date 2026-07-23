extern int data_02101928[];

void func_02067850(int idx, int val) {
    if (idx < 0x32 || idx > 0xfe) {
        return;
    }
    data_02101928[idx] = val;
}
