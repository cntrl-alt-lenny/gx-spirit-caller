/* func_02022234: u16 store at index — `data[arg] = b; return 1`. */

extern unsigned short data_0219743c[];
int func_02022234(unsigned int idx, unsigned int v) {
    data_0219743c[idx] = (unsigned short)v;
    return 1;
}
