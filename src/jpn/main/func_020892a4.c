typedef struct { int count; int entry[1]; } RelTable;
typedef struct { char _pad[0x08]; int rel[8]; } Hdr;
typedef struct { char _pad[0x8c]; Hdr *h; } Mgr;

extern Mgr *data_021a5720;

void *func_020892a4(int idx) {
    Mgr *g = data_021a5720;
    int o = g->h->rel[0];
    RelTable *t;
    int v;
    void *result;

    if (o == 0) {
        t = 0;
    } else {
        t = (RelTable *)((char *)g->h + o);
    }
    if (t == 0) return 0;
    if (idx < 0) return 0;
    if ((unsigned int)idx >= (unsigned int)t->count) return 0;
    v = t->entry[idx];

    {
        char *h_reload = (char *)g->h;
        if (v == 0) {
            result = 0;
        } else {
            result = h_reload + v;
        }
    }
    return result;
}
