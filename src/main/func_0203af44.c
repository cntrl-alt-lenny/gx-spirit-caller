/* func_0203af44: zero 3 halfword fields at offsets 6, 0x10, 0x1c. */

void func_0203af44(void *p) {
    *(unsigned short *)((char *)p + 0x6)  = 0;
    *(unsigned short *)((char *)p + 0x1c) = 0;
    *(unsigned short *)((char *)p + 0x10) = 0;
}
