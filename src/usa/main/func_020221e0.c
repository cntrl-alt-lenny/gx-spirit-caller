/* func_020221e0: u16 store at index — `data[arg] = b; return 1`. */

extern unsigned short data_0219735c[];
int func_020221e0(unsigned int idx, unsigned int v) {
    data_0219735c[idx] = (unsigned short)v;
    return 1;
}
