typedef struct {
    char _pad[6];
    unsigned short field6 : 8;
    unsigned short pad6h : 8;
} S021b8ecc;

extern int func_ov002_0223de94(void *, int);

int func_ov002_021b8ecc(S021b8ecc *p) {
    unsigned short result;
    unsigned char b;

    if (p->field6 == 1) {
        result = (unsigned short)func_ov002_0223de94(p, 0);
        b = (unsigned char)(result >> 8);
        if (b <= 4) {
            return 1;
        }
    }
    return 0;
}
