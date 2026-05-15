/* func_0207e748: thunk — `p->f_18 = b; tail-call func_0207e758(p, b)`. */

extern int func_0207e758(void *p, int b);

int func_0207e748(void *p, int b) {
    *(int *)((char *)p + 0x18) = b;
    return func_0207e758(p, b);
}
