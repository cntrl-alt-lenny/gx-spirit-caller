/* func_ov002_021b009c: C23-noMMIO MSVC LCG rand -> state=state*0x343fd+0x269ec3; (state>>16)&0x7fff. */
extern char data_ov002_022d016c[];
int func_ov002_021b009c(void) {
    unsigned int s = *(unsigned int *)(data_ov002_022d016c + 3300);
    s = s * 0x343fd + 0x269ec3;
    *(unsigned int *)(data_ov002_022d016c + 3300) = s;
    return (s >> 16) & 0x7fff;
}
