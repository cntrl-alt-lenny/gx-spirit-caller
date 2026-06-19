/* func_ov000_021aa8ec: set the active object's (x,y,z), snapshot it, compute a
 * derived value, and kick the refresh chain. */
extern void func_ov000_021aa978(int a0, int a1, int a2);
extern int  func_0208bedc(void *a, void *b);
extern void func_ov000_021aa7f4(void);
extern void func_ov000_021aa700(int a);
extern void func_ov000_021aa4d8(void *obj);
extern char data_ov000_021c7300[];
void func_ov000_021aa8ec(int a0, int a1, int a2) {
    int *obj = *(int **)data_ov000_021c7300;
    obj[12] = a0;
    obj[13] = a1;
    obj[14] = a2;
    func_ov000_021aa978(a0, a1, a2);
    *(short *)((char *)obj + 318) = 0;
    obj[72] = func_0208bedc(obj + 12, obj + 9);
    func_ov000_021aa7f4();
    func_ov000_021aa700(1);
    func_ov000_021aa4d8(obj);
}
