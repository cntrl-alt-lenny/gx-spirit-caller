extern int func_02053688(void *p);
extern int func_02053704(void *p);
extern long long func_02053728(void *p);
extern int func_02053720(void *p);
extern long long func_0205370c(void *p);

int func_02052cdc(void *a, void *b) {
    int ta = func_02053688(a);
    int tb = func_02053688(b);
    if (ta != tb) {
        return 0;
    }
    if (ta == 3) {
        return func_02053704(a) == func_02053704(b);
    } else if (ta == 1) {
        long long v1 = func_02053728(a);
        long long v2 = func_02053728(b);
        return (v1 == v2) && (func_02053720(a) == func_02053720(b));
    } else if (ta == 2) {
        long long v1 = func_0205370c(a);
        long long v2 = func_0205370c(b);
        return v1 == v2;
    }
    return 0;
}
