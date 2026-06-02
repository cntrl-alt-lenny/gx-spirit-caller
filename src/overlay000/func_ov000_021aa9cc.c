/* func_ov000_021aa9cc: set the active object's (x,y,z), snapshot it, compute a
 * derived value, and kick the refresh chain. */
extern void func_ov000_021aaa58(int a0, int a1, int a2);
extern int  func_0208bfc4(void *a, void *b);
extern void func_ov000_021aa8d4(void);
extern void func_ov000_021aa7e0(int a);
extern void func_ov000_021aa5b8(void *obj);
extern char data_ov000_021c73e0[];
void func_ov000_021aa9cc(int a0, int a1, int a2) {
    int *obj = *(int **)data_ov000_021c73e0;
    obj[12] = a0;
    obj[13] = a1;
    obj[14] = a2;
    func_ov000_021aaa58(a0, a1, a2);
    *(short *)((char *)obj + 318) = 0;
    obj[72] = func_0208bfc4(obj + 12, obj + 9);
    func_ov000_021aa8d4();
    func_ov000_021aa7e0(1);
    func_ov000_021aa5b8(obj);
}
