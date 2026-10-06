typedef struct {
    int v[18];
} Table;

extern char data_020b5ab8[];
extern int func_0201942c(int id);
extern int func_0202c0c0(int id);

int func_02019494(int id, int alt) {
    Table t = *(Table *)(data_020b5ab8 + 0x30);
    int base;

    if (func_0201942c(id) != 0) {
        return t.v[id - 0x4c];
    }
    base = 0x578;
    if (alt != 0) {
        base += 0x64;
    }
    switch (id) {
    case 0x5e:
        id = 3;
        break;
    case 0x5f:
        id = 0x3a;
        break;
    }
    return func_0202c0c0(base + id);
}
