typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short field6_6 : 6;
    unsigned short pad12 : 4;
} S021f754c;

extern int func_ov002_021f40f4(S021f754c *);
extern void func_ov002_0226aea8(int, int, int, int);

int func_ov002_021f754c(S021f754c *p) {
    int result;
    if (p->field6_6 != 0x23) {
        result = func_ov002_021f40f4(p);
        if (result > 0) {
            func_ov002_0226aea8(p->bit0, result, 0, 1);
        }
    }
    return 1;
}
