/* func_02047fb8: g = *global; if g, clear g->f4 and g->f30 (re-reading g).
 * Legacy mwcc 1.2/sp2p3 predicates the stores; 2.0 branches (early bxeq). */
extern char *data_0219db98;
void func_02047fb8(void){
    if (data_0219db98){
        *(int *)(data_0219db98 + 4) = 0;
        *(int *)(data_0219db98 + 0x30) = 0;
    }
}
