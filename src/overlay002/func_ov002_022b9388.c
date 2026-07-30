/* func_ov002_022b9388: first arg unused. Guard chain deciding whether to
 * override val to 0x1362 based on a cf1ac bit, then two chained calls to
 * func_ov002_022bdd54, with a fallback branch re-testing func_0202e234. */
extern int data_ov002_022cf1ac[];
extern int func_0202e234(int val);
extern int func_ov002_022bdd54(int val);

int func_ov002_022b9388(int unused, int arg1, int arg2, int arg3, int arg4) {
    int val = arg1;
    if (func_0202e234(arg1) == 0) {
        if (arg3 >= 0 && arg4 >= 0) {
            int *p = (int *)((char *)data_ov002_022cf1ac + (arg3 & 1) * 0x868 + arg4 * 20);
            if (((((unsigned)*p) >> 10) & 1) == 0)
                val = 0x1362;
        }
    }
    {
        int result = func_ov002_022bdd54(val);
        if (arg2 == 0)
            return result;
        if (result != 0)
            return result;
    }
    {
        int arg = (func_0202e234(val) != 0) ? 0xfe0 : 0x1362;
        return func_ov002_022bdd54(arg);
    }
}
