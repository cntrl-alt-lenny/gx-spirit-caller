/* func_020191dc: stride-24 sibling of func_02018d98 — return bits 8-11 of
 * entry->f16. */
extern char *GetSystemWork(void);
extern int func_02019210(int);
int func_020191dc(int a0){
    char *sys = GetSystemWork();
    int k = func_02019210(a0);
    unsigned v = *(unsigned *)(sys + (k - 1) * 24 + 16);
    return (v << 20) >> 24;
}
