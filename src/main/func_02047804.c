/* func_02047804: g = *global; return (g && g->f4(word) == 5). Word-field sibling
 * of func_02045570; shares the data_0219dc78 pointer-global with func_0204802c. */
extern char *data_0219dc78;
int func_02047804(void){
    char *g = data_0219dc78;
    if (g && *(int *)(g + 4) == 5) return 1;
    return 0;
}
