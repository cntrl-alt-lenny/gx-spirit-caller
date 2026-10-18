typedef struct {
    short pad0;
    short key;
    int pad1[2];
    short *lists[3];
} Entry;

typedef struct {
    char pad[0xd5c];
    int keys[2];
    int sel[2];
} Obj;

extern Entry data_ov002_022cce28[];

int func_ov002_022b9544(Obj *o, int idx, int val) {
    short *list = 0;
    int i = 0;
    Entry *e = data_ov002_022cce28;
    int key = o->keys[idx];

    do {
        if (e->key == key) {
            list = e->lists[o->sel[idx]];
            break;
        }
        i++;
        e++;
    } while (i < 18);
    if (list == 0)
        return 0;
    for (i = 0;; i++) {
        int v = list[i];
        if (v < 0)
            return 0;
        if (val == v)
            return 1;
    }
}
