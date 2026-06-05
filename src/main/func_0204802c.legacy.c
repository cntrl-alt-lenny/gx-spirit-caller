/* func_0204802c: g = *global; if g, clear g->f4 and g->f30 (re-reading g).
 * Legacy mwcc 1.2/sp2p3 predicates the stores; 2.0 branches (early bxeq). */
extern char *data_0219dc78;
void func_0204802c(void){
    if (data_0219dc78){
        *(int *)(data_0219dc78 + 4) = 0;
        *(int *)(data_0219dc78 + 0x30) = 0;
    }
}
