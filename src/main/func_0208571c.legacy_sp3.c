struct State { unsigned flags; int pad[11]; int sx, sy; };
extern void (*data_02102360[])(int *, struct State *);
extern void func_02084e0c(int cmd, void *src, int n);
void func_0208571c(struct State *p) {
    int b[19];
    if (p->flags & 8) b[0] = 0x101610;
    else b[0] = 0x101810;
    b[1] = 3;
    b[18] = 2;
    b[4] = b[5] = b[8] = b[9] = b[10] = b[11] = b[12] = b[13] = b[16] = 0;
    b[17] = 0x1000;
    data_02102360[p->flags & 7](&b[2], p);
    if (p->sx != 0x1000) {
        b[2] = (long long)p->sx * b[2] >> 12;
        b[3] = (long long)p->sx * b[3] >> 12;
        b[14] = (long long)p->sx * b[14] >> 12;
    }
    if (p->sy != 0x1000) {
        b[6] = (long long)p->sy * b[6] >> 12;
        b[7] = (long long)p->sy * b[7] >> 12;
        b[15] = (long long)p->sy * b[15] >> 12;
    }
    func_02084e0c(b[0], (int *)&b + 1, 0x12);
}


