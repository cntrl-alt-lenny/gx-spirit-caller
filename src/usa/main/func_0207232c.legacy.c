/* func_0207232c: if !func_02073dc8() return 1, else return func_02073750().
 * Legacy 1.2/sp2p3. */
extern int func_02073dc8(void);
extern int func_02073750(void);
int func_0207232c(void){
    if (!func_02073dc8()) return 1;
    return func_02073750();
}
