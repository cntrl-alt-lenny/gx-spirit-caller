typedef struct {
    int f0;
    int f4;
    int f8;
    char pad[0x28];
} Buf_02005554;

extern void func_02001d0c(Buf_02005554 *b, int size, int n);
extern void func_02001d98(Buf_02005554 *b, int a);
extern void func_02003b14(void);
extern void func_02004ef4(Buf_02005554 *b, int a1, int a2, int a3, int a4, int a5, void *fn);

int func_02005554(int a0, int a1, int a2) {
    Buf_02005554 buf;

    func_02001d0c(&buf, 0x20, 2);
    func_02001d98(&buf, a2);
    func_02004ef4(&buf, a0, 0, 0, 0, a1, func_02003b14);
    return buf.f8;
}
