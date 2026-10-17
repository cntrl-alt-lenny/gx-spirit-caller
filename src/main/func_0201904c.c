typedef struct { unsigned int lo : 16; unsigned int hi : 16; } P;
typedef struct { char pad[0x8d4]; P f; } W;
extern W *GetSystemWork(void);
void func_0201904c(unsigned int n) {
    W *w = GetSystemWork();
    unsigned int s = w->f.lo + n;
    if (s > 0xffff) w->f.lo = 0xffff;
    else w->f.lo = s;
}
