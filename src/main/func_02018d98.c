/* func_02018d98: entry = GetSystemWork() + (func_02019210(a0)-1)*24; return bit1
 * of entry->f16. Stride-24 family (cf. 020191dc). */
extern char *GetSystemWork(void);
extern int func_02019210(int);
int func_02018d98(int a0){
    char *sys = GetSystemWork();
    int k = func_02019210(a0);
    unsigned v = *(unsigned *)(sys + (k - 1) * 24 + 16);
    return (v << 30) >> 31;
}
