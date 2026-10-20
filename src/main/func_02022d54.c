typedef struct { char pad[0xc]; int a; short b; } Sub;
typedef struct { int type; char pad[0x20]; int a,b; Sub *sub; int c,d; int tail; } Entry;
typedef struct { int type, id, mode; } Query;
typedef struct { char pad[0x74]; short end, start; } Queue;
extern Queue data_0219a834;
extern char data_02197434[];
int func_02022d54(Query *q) {
    char *base = data_02197434;
    int i;
    Entry *e;
    int kind;
    int end;
    int found;
    if (data_0219a834.start != data_0219a834.end) {
    i = ((Queue *)(base + 0x3400))->start;
    end = ((Queue *)(base + 0x3400))->end;
    if (i != end) {
    kind = q->type;
    do {
        e = &((Entry *)(base + 0x12b4))[i];
        found = 0;
        switch (kind) {
        case 0:
            if (e->d == q->id) found = 1;
            break;
        }
        if (found) {
            switch (e->type) {
            case 0:
                switch (q->mode) {
                case 0: e->a=-1; e->b=-1; e->c=0; e->d=0; break;
                case 1: e->a=-1; break;
                case 2: e->b=-1; break;
                case 3: e->c=0; e->d=0; break;
                }
                break;
            case 1: case 2:
                switch (q->mode) {
                case 0: e->sub->a=-1; e->sub->b=-1; e->c=0; e->d=0; break;
                case 1: e->sub->a=-1; break;
                case 2: e->sub->b=-1; break;
                case 3: e->c=0; e->d=0; break;
                }
                break;
            }
            return 1;
        }
        i++;
        if (i >= 0x90) i=0;
    } while (i != end);
    }
    }
    return 0;
}





