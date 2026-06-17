/* func_0204f9b0: if func_0204987c() is null return 0, else return its f14 byte
 * (re-calls the accessor). SP3 tier (1.2/sp3). */
extern unsigned char *func_0204987c(void);
int func_0204f9b0(void){
    if (!func_0204987c()) return 0;
    return func_0204987c()[14];
}
