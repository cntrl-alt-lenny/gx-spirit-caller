/* func_020191a8: stride-24 sibling of func_02018d64 — return bits 8-11 of
 * entry->f16. */
extern char *GetSystemWork(void);
extern int func_020191dc(int);
int func_020191a8(int a0){
    char *sys = GetSystemWork();
    int k = func_020191dc(a0);
    unsigned v = *(unsigned *)(sys + (k - 1) * 24 + 16);
    return (v << 20) >> 24;
}
