typedef unsigned long long u64;

struct DataStruct0206 {
    char _pad[0x498];
    int f_498;
    int f_49c;
};
extern struct DataStruct0206 *data_0219ecd4;

extern u64 func_020689e4(int w, int x, int y, int z);
extern u64 func_020b23a0(int a0, int a1, int a2, int a3);
extern int func_020b1c7c(int a0, int a1);
extern int func_020b2c68(int a0, int a1);
extern int func_020b2cc4(int a0, int a1);

#define LO(v) ((int)(v))
#define HI(v) ((int)((v) >> 32))

int func_0206b96c(int *a, int *b) {
    int vb = *b;
    int va = *a;
    u64 r1v = func_020689e4(va, data_0219ecd4->f_498, 0, 0);
    u64 r2v = func_020689e4(vb, data_0219ecd4->f_498, 0, 0);
    u64 finalv = func_020b23a0(LO(r1v), HI(r1v), LO(r2v), HI(r2v));

    if (data_0219ecd4->f_49c == 0) {
        finalv = func_020b23a0(0, 0, LO(finalv), HI(finalv));
    }

    if (func_020b2c68(func_020b1c7c(LO(finalv), HI(finalv)), 0) != 0) {
        return 1;
    }
    return -(func_020b2cc4(func_020b1c7c(LO(finalv), HI(finalv)), 0) != 0);
}
