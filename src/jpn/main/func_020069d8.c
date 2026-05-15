/* func_020069d8: branch on first field, call func_02098320, then func_02038b44 on second field. */

typedef struct {
    int  v;
    int  w;
} pair_020c3e84_t;

extern pair_020c3e84_t data_020c3da4[];
extern void func_02098320(int x);
extern void func_02038b44(unsigned int x);

void func_020069d8(int i) {
    if (data_020c3da4[i].w == 1) {
        func_02098320(-1);
    } else {
        func_02098320(2);
    }
    func_02038b44(data_020c3da4[i].v);
}
