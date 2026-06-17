/* func_020342a0: p = func_02034134(); return p && (p->f440 || p->f444). */
extern int *func_02034134(void);
int func_020342a0(void){
    int *p = func_02034134();
    if (!p) return 0;
    return (p[0x110] != 0 || p[0x111] != 0) ? 1 : 0;
}
