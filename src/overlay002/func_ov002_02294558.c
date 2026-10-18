typedef struct {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short rest : 15;
} S;

extern int func_ov002_02280df4(S *p, int a, int b, int c);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_02291160(S *p, int b);

int func_ov002_02294558(S *p, int b) {
    int idx = func_ov002_02280df4(p, p->b0, -1, 0);
    if (idx >= 0) {
        if (func_ov002_021c8470(p->b0, idx) < 0x514) {
            if (func_ov002_02291160(p, b) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
