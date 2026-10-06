typedef struct {
    char           _0[0xa];
    unsigned short len;
    unsigned char  name[0xb4];
} entry_0203d258_t;

typedef struct {
    unsigned char f0;
    unsigned char kind;
    unsigned char _2;
    unsigned char len;
    unsigned char name[0x20];
} item_0203d258_t;

extern int func_0203d2e8(entry_0203d258_t *rec);
extern int func_020ab054(void *a, void *h, unsigned int n);

int func_0203d258(entry_0203d258_t *rec, int n, item_0203d258_t *items) {
    int r;
    int i;
    unsigned int len;
    unsigned char key;
    unsigned char *name;

    if (rec->len == 0x20) {
        r = func_0203d2e8(rec);
        if (r > 0) {
            return r;
        }
    }
    i = 0;
    if (i < n) {
        len = rec->len;
        name = rec->name;
        key = len;
        do {
            if (key == items->len && func_020ab054(name, items->name, len) == 0) {
                return items->kind;
            }
            i++;
            items++;
        } while (i < n);
    }
    return -1;
}
