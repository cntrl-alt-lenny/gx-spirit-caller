/* func_ov002_02295cd0 (ov002): long guard chain over u16@+2 = {b0:1, m5:5}. */
extern char data_ov002_022cf08c[];
extern int  func_0202b89c(int field0);
extern int  func_ov002_021be3c0(int b0, int m5, int one);
extern int  func_ov002_021c3a04(int b0, int code);
extern int  func_ov002_022579d0(void *p, int v);
extern int  func_ov002_02259e8c(int b0);
extern int  func_ov002_02280870(int b0);

struct Ov002Hdr2 {
    char _p2[2];
    unsigned short b0 : 1;
    unsigned short m5 : 5;
};

int func_ov002_02295cd0(struct Ov002Hdr2 *p) {
    int a;

    if (func_ov002_022579d0(p, 1 - p->b0) == 0)
        return 0;
    if (func_ov002_021c3a04(p->b0, 0x18e8) != 0)
        return 0;
    {
        int b0 = p->b0;
        a = func_0202b89c(*(unsigned short *)p);
        if (*(int *)(data_ov002_022cf08c + ((1 - b0) & 1) * 0x868) <= a) {
            if (func_ov002_02259e8c(b0) != 0)
                return 1;
        }
    }
    if (func_ov002_021be3c0(p->b0, p->m5, 1) == 0)
        return 1;
    return func_ov002_02280870(p->b0) <= 0;
}
