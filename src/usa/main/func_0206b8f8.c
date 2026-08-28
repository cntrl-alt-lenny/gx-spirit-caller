typedef unsigned long long u64;

struct DataStruct0206 {
    char _pad[0x498];
    int f_498;
    int f_49c;
};
extern struct DataStruct0206 *data_0219ebf4;

extern u64 func_02068970(int w, int x, int y, int z);
extern u64 func_020b22ac(int a0, int a1, int a2, int a3);
extern int func_020b1b88(int a0, int a1);
extern int func_020b2b74(int a0, int a1);
extern int func_020b2bd0(int a0, int a1);

#define LO(v) ((int)(v))
#define HI(v) ((int)((v) >> 32))

int func_0206b8f8(int *a, int *b) {
    int vb = *b;
    int va = *a;
    u64 r1v = func_02068970(va, data_0219ebf4->f_498, 0, 0);
    u64 r2v = func_02068970(vb, data_0219ebf4->f_498, 0, 0);
    u64 finalv = func_020b22ac(LO(r1v), HI(r1v), LO(r2v), HI(r2v));

    if (data_0219ebf4->f_49c == 0) {
        finalv = func_020b22ac(0, 0, LO(finalv), HI(finalv));
    }

    if (func_020b2b74(func_020b1b88(LO(finalv), HI(finalv)), 0) != 0) {
        return 1;
    }
    return -(func_020b2bd0(func_020b1b88(LO(finalv), HI(finalv)), 0) != 0);
}
