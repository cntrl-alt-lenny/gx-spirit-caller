/* func_02074604: func_02000b60(&blk); q = global->f4->fa4; if q, set q->f9 = a0.
 * Legacy 1.2/sp2p3 (predicated store). */
extern char data_021a62f0[];
extern void func_02000b60(void *);
void func_02074604(int a0){
    char *q;
    func_02000b60((void *)0x02000c04);
    q = *(char **)(*(char **)(data_021a62f0 + 4) + 0xa4);
    if (q) *(char *)(q + 9) = (char)a0;
}
