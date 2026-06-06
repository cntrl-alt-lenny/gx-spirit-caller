/* func_020342f0: p = func_02034184(); return p && (p->f440 || p->f444). */
extern int *func_02034184(void);
int func_020342f0(void){
    int *p = func_02034184();
    if (!p) return 0;
    return (p[0x110] != 0 || p[0x111] != 0) ? 1 : 0;
}
