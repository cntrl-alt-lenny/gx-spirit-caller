/* func_0201174c: return 0 if func_02034784() or global->fb88==3, else
 * func_020196d8(). */
extern int func_02034784(void);
extern char data_021040ac[];
extern int func_020196d8(void);
int func_0201174c(void){
    if (func_02034784()) return 0;
    if (*(int *)(data_021040ac + 0xb88) == 3) return 0;
    return func_020196d8();
}
