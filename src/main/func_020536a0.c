/* func_020536a0: extract bits [31:11] of `*p` (`(*p >> 11) & 0x1fffff`). */

unsigned int func_020536a0(unsigned int *p) {
    return (*p >> 11) & 0x1fffff;
}
