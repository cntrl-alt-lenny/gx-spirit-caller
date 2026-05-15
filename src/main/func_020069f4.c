/* func_020069f4: branch on first field, call func_02098414, then func_02038b94 on second field. */

typedef struct {
    int  v;
    int  w;
} pair_020c3e84_t;

extern pair_020c3e84_t data_020c3e84[];
extern void func_02098414(int x);
extern void func_02038b94(unsigned int x);

void func_020069f4(int i) {
    if (data_020c3e84[i].w == 1) {
        func_02098414(-1);
    } else {
        func_02098414(2);
    }
    func_02038b94(data_020c3e84[i].v);
}
