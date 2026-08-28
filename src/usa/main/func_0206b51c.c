/* func_0206b51c: iterate r6's field_0x4 collection, dereferencing each
 * slot's first word into func_0206b648; then flush and finalize. */

extern int func_020540cc(void *a0);
extern void *func_0205405c(void *a0, int a1);
extern void func_0206b648(void *a0, int a1);
extern void func_02053b88(void *a0);
extern void func_0206b574(void *a0);

struct S0206b590_Obj {
    unsigned char _pad_00[0x4];
    void *f_4;   /* +0x4 */
};

void func_0206b51c(struct S0206b590_Obj *r6) {
    int count;
    int i;
    int *item;

    count = func_020540cc(r6->f_4);

    for (i = 0; i < count; i++) {
        item = (int *)func_0205405c(r6->f_4, i);
        func_0206b648(r6, *item);
    }

    func_02053b88(r6->f_4);
    func_0206b574(r6);
}
