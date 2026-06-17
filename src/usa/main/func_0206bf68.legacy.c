/* func_0206bf68: out-param query func_020923d8(&tbl, &out, a0); return out on
 * success else 0. Legacy 1.2/sp2p3. */
extern char data_0219ec40[];
extern int func_020923d8(void *, int *, int);
int func_0206bf68(int a0){
    int local;
    if (func_020923d8(data_0219ec40, &local, a0)) return local;
    return 0;
}
