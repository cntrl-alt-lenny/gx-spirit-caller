/* func_02092c8c: read from NDS IPC region — `*(0x27ffdc4 + idx*4)`. */

unsigned int func_02092c8c(unsigned int idx) {
    return *(volatile unsigned int *)(0x027ffdc4 + idx * 4);
}
