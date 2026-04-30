/* func_02022260: `*(u16 *)(p + arg*2 + 8) = c; return 1;` */
int func_02022260(void *p, int idx, unsigned int v) {
    ((unsigned short *)((char *)p + idx * 2))[4] = (unsigned short)v;
    return 1;
}
