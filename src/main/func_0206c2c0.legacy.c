/* func_0206c2c0: return func_0206e468(a0->f3 << 2) + func_0206e468(a0->f0 u16).
 * Legacy 1.2/sp2p3. */
extern int func_0206e468(int);
int func_0206c2c0(unsigned char *a0){
    int x = func_0206e468(a0[3] << 2);
    int y = func_0206e468(*(unsigned short *)a0);
    return x + y;
}
