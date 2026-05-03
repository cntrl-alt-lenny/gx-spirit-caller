/* func_02092a48: write to NDS IPC region — `*(0x27ffdc4 + idx*4) = v`. */

void func_02092a48(unsigned int idx, unsigned int v) {
    *(volatile unsigned int *)(0x027ffdc4 + idx * 4) = v;
}
