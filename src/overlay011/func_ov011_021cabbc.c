extern int func_020139b4(void);
extern int func_0201a3ec(void);
extern int func_0201a498(void);
extern int func_0201b6e4(int);
extern int func_ov011_021cd1fc(int);
extern void func_ov000_021af4d8(int, int, int);
extern void func_ov000_021af560(int, int, int);
extern unsigned char data_ov011_021d3060[];
extern unsigned char data_ov011_021d3138[];
extern unsigned char data_ov011_021d3177[];
struct S {
    char pad0[0x268];
    unsigned int a : 5;
    unsigned int nib : 4;
    unsigned int b : 23;
    unsigned int gap;
    unsigned int c : 8;
    unsigned int d : 24;
    char pad1[0xc];
    unsigned int e : 8;
    unsigned int f : 24;
};
extern struct S data_ov011_021d403c;

void func_ov011_021cabbc(int a, int show) {
    struct S *s = &data_ov011_021d403c;
    int v = func_020139b4();
    int c;
    if (a != -1) v = a;
    unsigned int k = s->c;
    if (k != 0) {
        if (show) {
            func_ov000_021af560(1, (data_ov011_021d3060 + (s->nib << 3))[func_ov011_021cd1fc(k)], v);
        } else {
            func_ov000_021af4d8(1, (data_ov011_021d3060 + (s->nib << 3))[func_ov011_021cd1fc(k)], v);
        }
        return;
    }
    c = (data_ov011_021d3177 + (s->nib << 4))[s->e];
    if (c == 0x32) {
        if (func_0201a3ec() != 0 || func_0201b6e4(0x73) != 0) c = 0x41;
        else if (func_0201a498() != 0 || func_0201b6e4(0x74) != 0) c = 0x39;
    }
    if (show) func_ov000_021af560(1, c, v);
    else func_ov000_021af4d8(1, c, v);
}
