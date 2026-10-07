typedef struct {
    int val;
    int id;
    int f8;
    int fc;
} Slot_0200c23c;

typedef struct {
    char pad[0x1e4];
    Slot_0200c23c slots[8];
} Table_0200c23c;

int func_0200c23c(Table_0200c23c *t, int key, int val) {
    int i;

    for (i = 0; i < 8; i++) {
        if (t->slots[i].id < 0 || key == t->slots[i].id) {
            break;
        }
    }
    if (i == 8) {
        return 0;
    }
    t->slots[i].val = val;
    t->slots[i].id = key;
    return 1;
}
