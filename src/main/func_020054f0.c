typedef struct {
    int f0;
    int f4;
    int f8;
    char pad[0x28];
} Buf_020054f0;

extern void func_02001d0c(Buf_020054f0 *b, int size, int n);
extern void func_02001d84(Buf_020054f0 *b, int a, int c);
extern void func_02003b14(void);
extern void func_02004ef4(Buf_020054f0 *b, int a1, int a2, int a3, int a4, int a5, void *fn);

int func_020054f0(int a0, int a1, int a2) {
    Buf_020054f0 buf;

    func_02001d0c(&buf, 0x20, 2);
    func_02001d84(&buf, a2, 0);
    func_02004ef4(&buf, a0, 0, 0, 0, a1, func_02003b14);
    return buf.f8;
}
