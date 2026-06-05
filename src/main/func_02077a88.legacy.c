/* func_02077a88: chase global->f4->fa4->f12; if non-null, store a0/a1 at f814/f818.
 * Shares data_021a63d0 with wave-1 func_02070fe8. Legacy 1.2/sp2p3 (predicated
 * stores). */
extern char data_021a63d0[];
void func_02077a88(int a0, int a1){
    char *q = *(char **)(*(char **)(data_021a63d0 + 4) + 0xa4);
    char *r;
    if (!q) return;
    r = *(char **)(q + 12);
    if (r){
        *(int *)(r + 0x814) = a0;
        *(int *)(r + 0x818) = a1;
    }
}
