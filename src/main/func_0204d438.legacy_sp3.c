/* func_0204d438: dispatch on func_020498f0()->f21 — 0 -> func_0204aaf4(a0),
 * else func_0204ab88(a0). SP3 tier (1.2/sp3). */
extern unsigned char *func_020498f0(void);
extern void func_0204aaf4(int);
extern void func_0204ab88(int);
void func_0204d438(int a0){
    if (func_020498f0()[21] == 0) func_0204aaf4(a0);
    else func_0204ab88(a0);
}
