extern char data_02101eb8[];
extern unsigned char data_0219eec0;
extern void func_02094688(void *a, void *b, int n);
extern int func_0207ca44(void *a, void *b, int n);

void func_02073d30(char *a0, int a1, char *a2, int a3) {
    if (a0 + a1 != a2) {
        func_02094688(a2, a0 + a1, a3);
    }
    func_02094688(data_02101eb8, a0 + 6, 6);
    data_0219eec0 = (func_0207ca44(a0, a0 + 6, a1 + a3 - 6) < 0) ? 1 : 0;
}
