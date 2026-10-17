typedef struct { unsigned char c[0x26]; } B;
extern B data_020b5a66;
extern void *GetSystemWork(void);
extern int func_020097a4(int);
extern void func_02009758(int);
extern int func_0201934c(unsigned char);
extern int func_020195b8(int, int);
void func_0201c5b4(void) {
    B buf;
    unsigned int i;
    GetSystemWork();
    buf = data_020b5a66;
    if (func_020097a4(0x18) != 0) return;
    for (i = 0; i < 0x26; i++) {
        if (func_020195b8(func_0201934c(buf.c[i]), 0) == 0) return;
    }
    func_02009758(0x18);
}
