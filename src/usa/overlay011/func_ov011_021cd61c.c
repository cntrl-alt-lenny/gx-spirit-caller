extern const unsigned char data_ov011_021d30e8[100];

int func_ov011_021cd61c(int row, int col) {
    return *(const int *)(data_ov011_021d30e8 + (row - 1) * 20 + (col - 1) * 4);
}
