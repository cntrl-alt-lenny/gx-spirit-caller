/* func_ov021_021abb40: C23-noMMIO MSVC LCG on s->f84. */
int func_ov021_021abb40(int *s) {
    unsigned int v = (unsigned int)s[21];
    v = v * 0x343fd + 0x269ec3;
    s[21] = (int)v;
    return (v >> 16) & 0x7fff;
}
