/* func_0206b590: iterate r6's field_0x4 collection, dereferencing each
 * slot's first word into func_0206b6bc; then flush and finalize. */

extern int func_02054140(void *a0);
extern void *func_020540d0(void *a0, int a1);
extern void func_0206b6bc(void *a0, int a1);
extern void func_02053bfc(void *a0);
extern void func_0206b5e8(void *a0);

struct S0206b590_Obj {
    unsigned char _pad_00[0x4];
    void *f_4;   /* +0x4 */
};

void func_0206b590(struct S0206b590_Obj *r6) {
    int count;
    int i;
    int *item;

    count = func_02054140(r6->f_4);

    for (i = 0; i < count; i++) {
        item = (int *)func_020540d0(r6->f_4, i);
        func_0206b6bc(r6, *item);
    }

    func_02053bfc(r6->f_4);
    func_0206b5e8(r6);
}
