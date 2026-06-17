/* func_0209efe4: StyleA dd30-family -> db88(1,2) guard; de5c(6,a0); dd30(6,0). */
extern int func_0209da94(int a, int b);
extern int func_0209db3c(int a0);
extern void func_0209dd68(int code, int x);
extern int func_0209dc3c(int code, int z);
int func_0209efe4(int a0) {
    int r = func_0209da94(1, 2);
    if (r != 0) return r;
    func_0209dd68(6, a0);
    r = func_0209dc3c(6, 0);
    return r == 0 ? 2 : r;
}
