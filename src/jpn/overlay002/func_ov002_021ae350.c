/* func_ov002_021ae350: if data_ov002_022cd664[a] is set, no-op. Otherwise
 * resolve src into a local buffer, format it with resource string 0x108 via
 * func_ov002_0229cd4c's "%s" substitution, then post it as event 0x31. */
extern int data_ov002_022cd664[];
extern void func_ov002_0229ce90(char *dst, const char *src);
extern void func_ov002_0229cd4c(char *dst, const char *str1, const char *str2);
extern int func_ov002_0229acd0(int cmd, int a, int b, int c);

void func_ov002_021ae350(int a, const char *src) {
    char bufB[0x100];
    char bufA[0x100];
    if (data_ov002_022cd664[a] != 0) return;
    func_ov002_0229ce90(bufA, src);
    func_ov002_0229cd4c(bufB, (const char *)0x108, bufA);
    func_ov002_0229acd0(0x31, 0, (int)bufB, 0);
}
