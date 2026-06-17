/* func_02067594: default a0 to *global if null; if a0->fbc, func_020673c4(a0);
 * then func_020674ec(a0). */
extern char *data_02101500;
extern void func_020673c4(void *);
extern void func_020674ec(void *);
void func_02067594(char *a0){
    if (a0 == 0) a0 = data_02101500;
    if (*(int *)(a0 + 0xbc)) func_020673c4(a0);
    func_020674ec(a0);
}
