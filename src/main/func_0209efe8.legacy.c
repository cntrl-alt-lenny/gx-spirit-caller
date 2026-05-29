/* func_0209efe8: StyleA dd30-family -> db88(1,2) guard; de5c(2,a0); dd30(2,0). */
extern int func_0209db88(int a, int b);
extern int func_0209dc30(int a0);
extern void func_0209de5c(int code, int x);
extern int func_0209dd30(int code, int z);
int func_0209efe8(int a0) {
    int r = func_0209db88(1, 2);
    if (r != 0) return r;
    func_0209de5c(2, a0);
    r = func_0209dd30(2, 0);
    return r == 0 ? 2 : r;
}
