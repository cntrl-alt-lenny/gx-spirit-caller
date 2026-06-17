/* func_020454c8: g = *global; return (g && g->f4(u16) == 6). */
extern char *data_0219d9f0;
int func_020454c8(void){
    char *g = data_0219d9f0;
    if (g && *(unsigned short *)(g + 4) == 6) return 1;
    return 0;
}
