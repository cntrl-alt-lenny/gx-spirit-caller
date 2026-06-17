/* func_02018d64: entry = GetSystemWork() + (func_020191dc(a0)-1)*24; return bit1
 * of entry->f16. Stride-24 family (cf. 020191dc). */
extern char *GetSystemWork(void);
extern int func_020191dc(int);
int func_02018d64(int a0){
    char *sys = GetSystemWork();
    int k = func_020191dc(a0);
    unsigned v = *(unsigned *)(sys + (k - 1) * 24 + 16);
    return (v << 30) >> 31;
}
