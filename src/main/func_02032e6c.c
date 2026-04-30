/* func_02032e6c: indirect-call dispatcher — invoke `p->f_ec0(arg)`. */

typedef int (*method_t)(int arg);

int func_02032e6c(void *p, int arg) {
    method_t fn = *(method_t *)((char *)p + 0xec0);
    return fn(arg);
}
