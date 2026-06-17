/* func_020a9828: C23-noMMIO glibc LCG -> state*0x41c64e6d+12345; (state>>16)&0x7fff. */
extern char data_021029c0[];
int func_020a9828(void) {
    unsigned int s = *(unsigned int *)data_021029c0;
    s = s * 0x41c64e6d + 12345;
    *(unsigned int *)data_021029c0 = s;
    return (s >> 16) & 0x7fff;
}
