/* func_02064500: for each index from (func_02054140(obj->f_10) - 1) down
 * to 0, look up a pointer via func_020540d0(obj->f_10, i) and pass its
 * dereferenced value to func_02064790.
 */
extern int func_02054140(void *a0);
extern int *func_020540d0(void *a0, int a1);
extern void func_02064790(int a0);

typedef struct {
    unsigned char pad[0x10];
    void *f_10;
} func_02064500_Obj;

void func_02064500(func_02064500_Obj *obj) {
    int count = func_02054140(obj->f_10);
    int i;

    for (i = count - 1; i >= 0; i--) {
        int *p = func_020540d0(obj->f_10, i);
        func_02064790(*p);
    }
}
