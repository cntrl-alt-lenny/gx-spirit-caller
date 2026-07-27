extern int func_ov002_021de134(void *self, int mask, int kind, int d);

struct Ov002SelfArg {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short : 15;
    unsigned int w1;
    unsigned int w2;
    unsigned int w3;
    unsigned int w4;
    unsigned int w5;
};

int func_ov002_021deb84(int arg0, int arg1) {
    struct Ov002SelfArg s = {0};
    s.b0 = (unsigned short)arg0;
    return func_ov002_021de134(&s, arg1, 14, 0x1000);
}
