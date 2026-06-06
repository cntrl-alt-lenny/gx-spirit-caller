/* func_020746ec: func_02000b60(&blk); q = global->f4->fa4; if q, set q->f9 = a0.
 * Legacy 1.2/sp2p3 (predicated store). */
extern char data_021a63d0[];
extern void func_02000b60(void *);
void func_020746ec(int a0){
    char *q;
    func_02000b60((void *)0x02000c04);
    q = *(char **)(*(char **)(data_021a63d0 + 4) + 0xa4);
    if (q) *(char *)(q + 9) = (char)a0;
}
