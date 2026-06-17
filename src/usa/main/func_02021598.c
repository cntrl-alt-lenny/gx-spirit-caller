/* func_02021598: C23-noMMIO -> p=base+idx*0x618; p->f8|=a0; return p->f4!=0. */
extern char data_02194260[];
extern char data_02194294[];
int func_02021598(int a0) {
    char *p = data_02194294 + *(int *)(data_02194260 + 4) * 0x618;
    *(int *)(p + 8) |= a0;
    return *(int *)(p + 4) != 0;
}
