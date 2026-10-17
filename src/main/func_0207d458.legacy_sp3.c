/* func_0207d458: build a temp record from p - 0x10, add it to the lists at
 * o + 0x24 (func_0207d9f4 on the second list, func_0207d520 on the first). */
typedef struct {
    int w[3];
} Tmp;
extern void func_0207da1c(Tmp *t, int a);
extern void func_0207d9f4(void *list, int a);
extern void func_0207d520(void *list, Tmp *t);

void func_0207d458(char *o, int p) {
    Tmp t;
    char *q = o + 0x24;
    int a = p - 0x10;

    func_0207da1c(&t, a);
    func_0207d9f4(q + 8, a);
    func_0207d520(q, &t);
}
