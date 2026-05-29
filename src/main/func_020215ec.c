/* func_020215ec: C23-noMMIO -> p=base+idx*0x618; p->f8|=a0; return p->f4!=0. */
extern char data_02194340[];
extern char data_02194374[];
int func_020215ec(int a0) {
    char *p = data_02194374 + *(int *)(data_02194340 + 4) * 0x618;
    *(int *)(p + 8) |= a0;
    return *(int *)(p + 4) != 0;
}
