typedef unsigned char u8;
typedef short s16;
struct Num { u8 flag0; u8 pad1; s16 exp; u8 len; u8 digits[32]; };
extern void func_020b06dc(struct Num *p, const char *s, int exp);
extern void func_020b0558(struct Num *p, const struct Num *a, const struct Num *b);
extern const char data_02102b48[], data_02102b78[], data_02102ba0[], data_02102bb8[];
extern const char data_02102bc8[], data_02102bd0[], data_02102bd8[], data_02102be0[], data_02102be8[];
void func_020b0778(struct Num *p, int n) {
    struct Num b, a;
    switch(n) {
    case -64: func_020b06dc(p,data_02102b48,-20); return;
    case -53: func_020b06dc(p,data_02102b78,-16); return;
    case -32: func_020b06dc(p,data_02102ba0,-10); return;
    case -16: func_020b06dc(p,data_02102bb8,-5); return;
    case -8: func_020b06dc(p,data_02102bc8,-3); return;
    case -7: func_020b06dc(p,data_02102bd0,-3); return;
    case -6: func_020b06dc(p,data_02102bd8,-2); return;
    case -5: func_020b06dc(p,data_02102be0,-2); return;
    case -4: func_020b06dc(p,data_02102be8,-2); return;
    case -3: func_020b06dc(p,data_02102be8+4,-1); return;
    case -2: func_020b06dc(p,data_02102be8+8,-1); return;
    case -1: func_020b06dc(p,data_02102be8+12,-1); return;
    case 0: func_020b06dc(p,data_02102be8+16,0); return;
    case 1: func_020b06dc(p,data_02102be8+20,0); return;
    case 2: func_020b06dc(p,data_02102be8+24,0); return;
    case 3: func_020b06dc(p,data_02102be8+28,0); return;
    case 4: func_020b06dc(p,data_02102be8+32,1); return;
    case 5: func_020b06dc(p,data_02102be8+36,1); return;
    case 6: func_020b06dc(p,data_02102be8+40,1); return;
    case 7: func_020b06dc(p,data_02102be8+44,2); return;
    case 8: func_020b06dc(p,data_02102be8+48,2); return;
    }
    func_020b0778(&b,(n + (int)(((unsigned)n & 0x80000000) >> 31)) >> 1);
    func_020b0558(p,&b,&b);
    if (!(n&1)) return;
    a=*p;
    if(n>0) func_020b06dc(&b,data_02102be8+20,0);
    else func_020b06dc(&b,data_02102be8+12,-1);
    func_020b0558(p,&a,&b);
}



