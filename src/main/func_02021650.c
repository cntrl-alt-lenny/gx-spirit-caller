/* func_02021650: `p->f_c = b; p->f_10 = c; return 1;` */
int func_02021650(void *p, int b, int c) {
    *(int *)((char *)p + 0xc) = b;
    *(int *)((char *)p + 0x10) = c;
    return 1;
}
