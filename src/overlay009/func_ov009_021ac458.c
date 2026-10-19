extern void func_02006110(int *out_a, int *out_b);
extern void *func_020061ac(void);

int func_ov009_021ac458(int dummy, unsigned short *rect) {
    int x, y;
    func_02006110(&x, &y);
    if (func_020061ac() != 0 && rect[0] <= x &&
        rect[0] + rect[2] > x && rect[1] <= y &&
        rect[1] + rect[3] > y)
        return 1;
    return 0;
}
