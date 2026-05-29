/* func_020a991c: C23-noMMIO glibc LCG -> state*0x41c64e6d+12345; (state>>16)&0x7fff. */
extern char data_02102aa0[];
int func_020a991c(void) {
    unsigned int s = *(unsigned int *)data_02102aa0;
    s = s * 0x41c64e6d + 12345;
    *(unsigned int *)data_02102aa0 = s;
    return (s >> 16) & 0x7fff;
}
