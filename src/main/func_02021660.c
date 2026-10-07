typedef struct {
    int key;
    int val;
    int pad;
} Ent;

typedef struct {
    char pad0[0x14];
    int n;
    Ent ents[1];
} Obj;

int func_02021660(Obj *o, int key, int idx) {
    int i;
    int j = 0;
    i = j;
    while (i < o->n) {
        Ent *e = &o->ents[i];
        if (e->key == key) {
            if (j == idx) return e->val;
            j++;
        }
        i++;
    }
    return 0;
}
