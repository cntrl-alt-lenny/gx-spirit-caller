typedef struct Obj { char pad[8]; int f8; int fc; } Obj;
extern int func_0209268c(Obj *o);
extern void func_02092748(Obj *o);
extern void func_020927b8(char *self);
extern int func_020ace14(void *, int);
extern int func_020a9574(int a, int b, int c);
extern int func_020a8d50(int (*callback)(int,int,int), void *, const char *, char *);
extern char data_02102764[];
extern char data_021a63d0[];
extern Obj data_021aa040;
extern Obj data_021aa064;
extern Obj data_021aa0d0;
int func_020a95e4(const char *fmt, ...) {
    char *ap;
    int result;
    if (func_020ace14(data_02102764, -1) >= 0) return -1;
    if (func_0209268c(&data_021aa0d0) == 0) {
        data_021aa040.fc = *(int *)(*(char **)(data_021a63d0 + 4) + 0x6c);
        data_021aa064.fc = 1;
    } else if (data_021aa040.fc == *(int *)(*(char **)(data_021a63d0 + 4) + 0x6c)) {
        data_021aa064.fc = data_021aa064.fc + 1;
    } else {
        func_020927b8((char *)&data_021aa0d0);
        data_021aa040.fc = *(int *)(*(char **)(data_021a63d0 + 4) + 0x6c);
        data_021aa064.fc = 1;
    }
    ap = (char *)(((unsigned int)&fmt & ~3u) + 4);
    result = func_020a8d50(func_020a9574, data_02102764, fmt, ap);
    if (--data_021aa064.fc == 0) func_02092748(&data_021aa0d0);
    return result;
}

