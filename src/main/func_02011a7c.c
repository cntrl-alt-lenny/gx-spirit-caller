/* func_02011a7c: lookup u16 at `data[idx*12]`. */

extern char data_020b52d8[];
unsigned int func_02011a7c(int idx) {
    return *(unsigned short *)(data_020b52d8 + idx * 12);
}
