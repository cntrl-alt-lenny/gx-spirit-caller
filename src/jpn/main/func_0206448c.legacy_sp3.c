/* func_0206448c: for each index from (func_020540cc(obj->f_10) - 1) down
 * to 0, look up a pointer via func_0205405c(obj->f_10, i) and pass its
 * dereferenced value to func_0206471c.
 */
extern int func_020540cc(void *a0);
extern int *func_0205405c(void *a0, int a1);
extern void func_0206471c(int a0);

typedef struct {
    unsigned char pad[0x10];
    void *f_10;
} func_02064500_Obj;

void func_0206448c(func_02064500_Obj *obj) {
    int count = func_020540cc(obj->f_10);
    int i;

    for (i = count - 1; i >= 0; i--) {
        int *p = func_0205405c(obj->f_10, i);
        func_0206471c(*p);
    }
}
