/* func_0204fa24: if func_020498f0() is null return 0, else return its f14 byte
 * (re-calls the accessor). SP3 tier (1.2/sp3). */
extern unsigned char *func_020498f0(void);
int func_0204fa24(void){
    if (!func_020498f0()) return 0;
    return func_020498f0()[14];
}
