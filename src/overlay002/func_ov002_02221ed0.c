typedef unsigned short u16;
typedef unsigned char u8;

extern int func_ov002_0223df38(void *p, int a, int b);
extern int func_ov002_0223de94(void *p, int a);
extern int func_ov002_0225764c(void *p, int a, int b);
extern int func_ov002_021de9d4(void *p, int a, int b);
extern int func_ov002_021de910(void *p, int a, int b);

int func_ov002_02221ed0(void *p) {
    int v;
    int a, b;
    if (func_ov002_0223df38(p, 0, 0)) {
        v = func_ov002_0223de94(p, 0);
        a = v & 0xff;
        b = ((u16)v >> 8) & 0xff;
        if (func_ov002_0225764c(p, a, b)) {
            func_ov002_021de9d4(p, a, b);
        }
    }
    if (func_ov002_0223df38(p, 1, 0)) {
        v = func_ov002_0223de94(p, 1);
        a = v & 0xff;
        b = ((u16)v >> 8) & 0xff;
        if (func_ov002_0225764c(p, a, b)) {
            func_ov002_021de910(p, a, b);
        }
    }
    return 0;
}
