int func_0207e5d4(int *a0) {
    unsigned short flag = *(unsigned short *)((char *)a0 + 0x2);
    if (flag & 1) {
        unsigned short f0 = *(unsigned short *)a0;
        int f4 = *(int *)((char *)a0 + 0x4);
        return f4 + (f0 << 4);
    } else {
        unsigned short f0 = *(unsigned short *)a0;
        int f4 = *(int *)((char *)a0 + 0x4);
        return f4 + (f0 << 3);
    }
}
