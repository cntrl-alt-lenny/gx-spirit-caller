/* func_0206c24c: return func_0206e3f4(a0->f3 << 2) + func_0206e3f4(a0->f0 u16).
 * Legacy 1.2/sp2p3. */
extern int func_0206e3f4(int);
int func_0206c24c(unsigned char *a0){
    int x = func_0206e3f4(a0[3] << 2);
    int y = func_0206e3f4(*(unsigned short *)a0);
    return x + y;
}
