/* func_02011a48: lookup u16 at `data[idx*12]`. */

extern char data_020b51e4[];
unsigned int func_02011a48(int idx) {
    return *(unsigned short *)(data_020b51e4 + idx * 12);
}
