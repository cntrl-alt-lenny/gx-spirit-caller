/* func_02045570: g = *global; return (g && g->f4(u16) == 6). */
extern char *data_0219dad0;
int func_02045570(void){
    char *g = data_0219dad0;
    if (g && *(unsigned short *)(g + 4) == 6) return 1;
    return 0;
}
