/* func_0207e830: thunk — `p->f_18 = b; tail-call func_0207e840(p, b)`. */

extern int func_0207e840(void *p, int b);

int func_0207e830(void *p, int b) {
    *(int *)((char *)p + 0x18) = b;
    return func_0207e840(p, b);
}
