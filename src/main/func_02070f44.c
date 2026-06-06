/* func_02070f44: q = global->f4->fa4; if non-null, point q->f0 back at f4 and
 * clear f8/f44/f60/f38. (Shares data_021a63d0 with wave-1 func_02070fe8.) */
extern char data_021a63d0[];
void func_02070f44(void){
    char *p = *(char **)(data_021a63d0 + 4);
    char *q = *(char **)(p + 0xa4);
    if (!q) return;
    *(int *)q = (int)p;
    *(char *)(q + 8) = 0;
    *(int *)(q + 0x44) = 0;
    *(int *)(q + 0x60) = 0;
    *(int *)(q + 0x38) = 0;
}
