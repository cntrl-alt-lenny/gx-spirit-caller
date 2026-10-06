extern char *Strchr(char *s, int c);
extern void func_02045c7c(int a0, int a1, int a2, int a3);
extern int func_020aaddc(const char *s);

int func_02045c34(int a0, int a1, char *s, int a3) {
    func_02045c7c(a0, a1, (int)Strchr(s, 0), a3);
    return func_020aaddc(s);
}
