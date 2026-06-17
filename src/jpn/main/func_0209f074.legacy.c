/* func_0209f074: StyleA dd30-family -> db88(1,1) guard; de5c(4,a0); dd30(4,0). */
extern int func_0209da94(int a, int b);
extern int func_0209db3c(int a0);
extern void func_0209dd68(int code, int x);
extern int func_0209dc3c(int code, int z);
int func_0209f074(int a0) {
    int r = func_0209da94(1, 1);
    if (r != 0) return r;
    func_0209dd68(4, a0);
    r = func_0209dc3c(4, 0);
    return r == 0 ? 2 : r;
}
