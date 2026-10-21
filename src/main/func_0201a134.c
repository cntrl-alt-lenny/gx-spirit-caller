extern int func_02019210(int x);
extern void func_02018a84(void *arg0, void *arg1);
typedef struct {
    char pad[0xa74];
    unsigned int flags;
} State;
extern State data_02104f4c;
typedef struct {
    char pad[0x62];
    unsigned short entries[32];
} Table;
extern const Table data_020b59e0;

void func_0201a134(int x) {
    int n = func_02019210(x) - 0x44;
    data_02104f4c.flags |= 1 << n;
    func_02018a84(data_020b59e0.entries[n], 1);
}

