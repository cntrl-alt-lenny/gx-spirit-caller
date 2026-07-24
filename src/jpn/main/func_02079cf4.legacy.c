extern int func_02079d38(unsigned short *, int);

int func_02079cf4(unsigned short *arr, int idx) {
    unsigned short val = arr[idx - 1];

    if (val & 0x8000) {
        return -1;
    }
    return (func_02079d38(arr, idx) != 0);
}
