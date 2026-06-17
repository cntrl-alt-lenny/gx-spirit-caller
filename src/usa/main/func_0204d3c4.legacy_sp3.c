/* func_0204d3c4: dispatch on func_0204987c()->f21 — 0 -> func_0204aa80(a0),
 * else func_0204ab14(a0). SP3 tier (1.2/sp3). */
extern unsigned char *func_0204987c(void);
extern void func_0204aa80(int);
extern void func_0204ab14(int);
void func_0204d3c4(int a0){
    if (func_0204987c()[21] == 0) func_0204aa80(a0);
    else func_0204ab14(a0);
}
