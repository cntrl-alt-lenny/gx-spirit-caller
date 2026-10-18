extern const signed char data_ov011_021d35ac[][2];
extern const unsigned short data_ov011_021d3374[][57];
extern const unsigned short data_ov011_021d3376[][57];
void func_ov011_021d18b4(int n, int *x, int *y) {
    int a, b;
    const signed char *p;
    int vx, vy;
    n--;
    p = data_ov011_021d35ac[n];
    a = p[0] - 1;
    b = p[1] - 1;
    vx = data_ov011_021d3374[a][b * 2];
    vy = data_ov011_021d3376[a][b * 2];
    *x = vx << 12;
    *y = vy << 12;
}
