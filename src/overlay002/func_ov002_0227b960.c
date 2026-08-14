/* func_ov002_0227b960: try func_ov002_0227b9b8 first; on -1 ("not
 * found"), classify arg1 via func_0202b8f0/func_0202b920 and retry
 * through func_ov002_0227b174, falling back to arg3 if that also
 * misses. */
extern int func_ov002_0227b9b8(int a, int b, int c, int d);
extern int func_0202b8f0(int id);
extern int func_0202b920(int id);
extern int func_ov002_0227b174(int a, int x, int y);

int func_ov002_0227b960(int arg0, int arg1, int arg2, int arg3) {
    int r = func_ov002_0227b9b8(arg0, arg1, arg2, 0);
    if (r != -1) return r;

    {
        int c1 = func_0202b8f0(arg1);
        int c2 = func_0202b920(arg1);
        r = func_ov002_0227b174(arg0, c1, c2);
        if (r != -1) return r;
        return arg3;
    }
}
