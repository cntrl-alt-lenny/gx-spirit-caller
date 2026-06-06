/* func_02067608: default a0 to *global if null; if a0->fbc, func_02067438(a0);
 * then func_02067560(a0). */
extern char *data_021015e0;
extern void func_02067438(void *);
extern void func_02067560(void *);
void func_02067608(char *a0){
    if (a0 == 0) a0 = data_021015e0;
    if (*(int *)(a0 + 0xbc)) func_02067438(a0);
    func_02067560(a0);
}
