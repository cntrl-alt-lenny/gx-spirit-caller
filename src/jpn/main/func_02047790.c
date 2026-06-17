/* func_02047790: g = *global; return (g && g->f4(word) == 5). Word-field sibling
 * of func_020454c8; shares the data_0219db98 pointer-global with func_02047fb8. */
extern char *data_0219db98;
int func_02047790(void){
    char *g = data_0219db98;
    if (g && *(int *)(g + 4) == 5) return 1;
    return 0;
}
