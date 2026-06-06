/* func_02072414: if !func_02073eb0() return 1, else return func_02073838().
 * Legacy 1.2/sp2p3. */
extern int func_02073eb0(void);
extern int func_02073838(void);
int func_02072414(void){
    if (!func_02073eb0()) return 1;
    return func_02073838();
}
