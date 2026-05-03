/* func_02092c78: read from NDS IPC region — `*(0x27ffda0 + idx*4)`. */

unsigned int func_02092c78(unsigned int idx) {
    return *(volatile unsigned int *)(0x027ffda0 + idx * 4);
}
