typedef struct { char p[0x10]; unsigned int f10; char q[0x3c - 0x14]; unsigned int f3c; } G;
extern G data_02191f40;
extern char data_02193320[];
extern char data_02193380[];
extern void func_0201ff98(void);
extern int func_0209f404(void *, void *, unsigned short, void *, unsigned short, int);
extern void func_0201f19c(void);
int func_0201ff2c(void) {
    if (func_0209f404(func_0201ff98, data_02193380, data_02191f40.f10, data_02193320, data_02191f40.f3c, 1) == 2) return 1;
    func_0201f19c();
    return 0;
}
