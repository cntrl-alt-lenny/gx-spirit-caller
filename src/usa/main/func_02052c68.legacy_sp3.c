extern int func_02053614(void *p);
extern int func_02053690(void *p);
extern long long func_020536b4(void *p);
extern int func_020536ac(void *p);
extern long long func_02053698(void *p);

int func_02052c68(void *a, void *b) {
    int ta = func_02053614(a);
    int tb = func_02053614(b);
    if (ta != tb) {
        return 0;
    }
    if (ta == 3) {
        return func_02053690(a) == func_02053690(b);
    } else if (ta == 1) {
        long long v1 = func_020536b4(a);
        long long v2 = func_020536b4(b);
        return (v1 == v2) && (func_020536ac(a) == func_020536ac(b));
    } else if (ta == 2) {
        long long v1 = func_02053698(a);
        long long v2 = func_02053698(b);
        return v1 == v2;
    }
    return 0;
}
