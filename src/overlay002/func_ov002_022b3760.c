/* func_ov002_022b3760: frameless-leaf -> q=p+a1; q[17]=a2-q[9]; consts. */
void func_ov002_022b3760(int *p, int a1, int a2) {
    int *q = p + a1;
    q[17] = a2 - q[9];
    p[22] = 5;
    p[21] = 128;
}
