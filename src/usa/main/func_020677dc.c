extern int data_02101848[];

void func_020677dc(int idx, int val) {
    if (idx < 0x32 || idx > 0xfe) {
        return;
    }
    data_02101848[idx] = val;
}
