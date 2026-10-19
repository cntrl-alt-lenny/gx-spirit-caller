typedef struct {
    unsigned int on : 1;
    unsigned int b1 : 1;
    unsigned int b2 : 1;
    unsigned int b3 : 1;
    unsigned int b4 : 1;
    unsigned int flag : 1;
    unsigned int val : 16;
    unsigned int b22 : 1;
    unsigned int rest : 9;
    struct { short value; short zero; } values[5];
} Entry;
typedef struct {
    char pad[0x88];
    unsigned int *count;
    Entry *entries;
} Obj;
int func_0200f13c(Obj *o, unsigned int mode, unsigned int val, int flag) {
    if (o != 0 && o->count != 0) {
        unsigned int i;
        unsigned int count = *o->count;
        for (i = 0; i < count; i++) {
            Entry *e = &o->entries[i];
            e->on = 1;
            if (flag >= 0) e->flag = flag;
            switch (mode) {
            case 0:
                val = 0;
            case 6: {
                int j;
                for (j = 0; j < 5; j++) {
                    e->values[j].value = val;
                    e->values[j].zero = 0;
                }
                e->val = val;
            }
            case 5:
                e->b1 = 0;
                e->b2 = 0;
                e->b3 = 0;
                e->b4 = 0;
                break;
            case 7:
                e->b22 = 0;
                break;
            case 1:
                e->b1 = 1;
                e->b2 = 0;
                e->b4 = 0;
                break;
            case 2:
                e->b2 = 1;
                e->b1 = 0;
                e->b3 = 0;
                break;
            case 3:
                e->b3 = 1;
                e->b2 = 0;
                break;
            case 4:
                e->b4 = 1;
                e->b1 = 0;
                break;
            }
        }
        return 1;
    }
    return 0;
}

