extern int func_02079e20(unsigned short *, int);

int func_02079ddc(unsigned short *arr, int idx) {
    unsigned short val = arr[idx - 1];

    if (val & 0x8000) {
        return -1;
    }
    return (func_02079e20(arr, idx) != 0);
}
