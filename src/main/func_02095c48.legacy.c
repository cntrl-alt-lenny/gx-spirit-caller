extern void func_02092904(void *ptr, int size);

typedef struct {
    short slots[16];
    int count;
} Entry;

typedef struct {
    int a;
    int b;
    short c;
    short d;
    char pad[0x14];
    Entry ent[16];
    short tail[16];
} Table;

void func_02095c48(Table *t) {
    int i, j;
    t->b = 0;
    t->c = 0;
    t->d = 0;
    t->a = 0;
    for (i = 0; i < 16; i++) {
        t->ent[i].count = 0;
        for (j = 0; j < 16; j++) {
            t->ent[i].slots[j] = -1;
        }
    }
    for (j = 0; j < 16; j++) {
        t->tail[j] = -1;
    }
    func_02092904(t, 0x280);
}
