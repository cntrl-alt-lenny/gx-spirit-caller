extern const unsigned char data_ov011_021d31d8[100];

int func_ov011_021cd6e0(int row, int col) {
    return *(const int *)(data_ov011_021d31d8 + (row - 1) * 20 + (col - 1) * 4);
}
