typedef unsigned long long u64;
struct Table { int a[12]; };
struct Rng { u64 state; u64 mult; u64 add; };
extern struct Table data_020b5ab8;
extern struct Rng data_02102c64;
extern const char data_020c5ca8[];
extern const char data_020c5cc8[];
extern int OS_SPrintf(char *, const char *, ...);

void func_0201a9d0(int id, char *out) {
    struct Table table = data_020b5ab8;
    if (id == 14) {
        data_02102c64.state = data_02102c64.mult * data_02102c64.state + data_02102c64.add;
        OS_SPrintf(out, data_020c5ca8, table.a[id - 10], (unsigned int)(((u64)(unsigned int)(data_02102c64.state >> 32) * 3) >> 32) + 1);
    } else {
        OS_SPrintf(out, data_020c5cc8, table.a[id - 10]);
    }
}
