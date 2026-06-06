/* func_0206bfdc: out-param query func_020924c0(&tbl, &out, a0); return out on
 * success else 0. Legacy 1.2/sp2p3. */
extern char data_0219ed20[];
extern int func_020924c0(void *, int *, int);
int func_0206bfdc(int a0){
    int local;
    if (func_020924c0(data_0219ed20, &local, a0)) return local;
    return 0;
}
