extern char *GetSystemWork(void);
extern int func_02019210(int);
extern int func_020191dc(int);
extern int func_0201942c(int);
typedef struct { unsigned low:4; unsigned value:8; unsigned high:20; } Count;
typedef struct { unsigned low:13; unsigned count:8; unsigned high:11; } Flags;
typedef struct { unsigned low:16; unsigned high:16; } Half;
void func_0201ac84(int id) {
    char *sys = GetSystemWork();
    char *entry = sys + (func_02019210(id) - 1) * 24;
    func_020191dc(id);
    ((Count *)(sys + 0x8d0))->value = id;
    ((Count *)(entry + 0x10))->value++;
    if (func_0201942c(id)) {
        ((Half *)(sys + 0x8e4))->low = ((Half *)(sys + 0x8d4))->low;
        ((Flags *)(sys + 0x8e0))->count = 0;
        *(unsigned *)(sys + 0x900) |= 0x100;
    } else {
        unsigned n = ((Flags *)(sys + 0x8e0))->count + 1;
        if (n > 255) ((Flags *)(sys + 0x8e0))->count = 255;
        else ((Flags *)(sys + 0x8e0))->count = n;
    }
    *(unsigned *)(sys + 0x8e0) &= ~1;
}
