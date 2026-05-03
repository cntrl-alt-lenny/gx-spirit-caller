/* func_020119dc: lookup `*(int *)(data + idx*12)`. */

extern char data_020b52d0[];
int func_020119dc(int idx) {
    return *(int *)(data_020b52d0 + idx * 12);
}
