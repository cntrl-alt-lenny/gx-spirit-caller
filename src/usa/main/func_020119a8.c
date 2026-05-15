/* func_020119a8: lookup `*(int *)(data + idx*12)`. */

extern char data_020b51dc[];
int func_020119a8(int idx) {
    return *(int *)(data_020b51dc + idx * 12);
}
