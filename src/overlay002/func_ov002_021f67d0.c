typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    char pad2[8];
    unsigned short fieldc;
} S021f67d0;

extern int func_ov002_021ff2c8(S021f67d0 *, int);
extern void func_ov002_0226af78(int, int);

int func_ov002_021f67d0(S021f67d0 *p) {
    if (func_ov002_021ff2c8(p, p->bit0) >= 2) {
        func_ov002_0226af78(p->bit0, 2);
        p->fieldc = 1;
    }
    return 1;
}
