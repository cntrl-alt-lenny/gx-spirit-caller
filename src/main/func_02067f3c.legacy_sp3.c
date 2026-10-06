typedef struct Node Node;
struct Node {
    char          _pad_00[0x14];
    unsigned char flags;
    char          _15[0x7];
    unsigned int  time;
    Node         *next;
};

typedef struct List List;
struct List {
    Node *head;
    Node *tail;
    int   count;
};

typedef struct obj_02067f3c obj_02067f3c_t;

struct obj_02067f3c {
    char           _0[0x8];
    List           list;
    char           _14[0x18];
    unsigned char  types[0x14];
    int            count;
    void         (*cb)(obj_02067f3c_t *o, int ev, Node *n, int arg);
    int            arg;
};

extern int data_02101928[];
extern int func_0206b44c(signed char *s, int n);
extern void func_02068b54(void *p0, void *p1, void *rec);
extern void func_02068628(Node *rec, signed char *p, int len);
extern unsigned int func_02055330(void);
extern int func_02068380(List *list, Node *key);

void func_02067f3c(obj_02067f3c_t *o, Node *rec, signed char *p, int len) {
    int i;
    int n;

    if (*p != 0) {
        return;
    }
    p += 5;
    len -= 5;
    if (rec->flags & 4) {
        for (i = 0; i < o->count; i++) {
            n = func_0206b44c(p, len);
            if (n < 0) {
                break;
            }
            func_02068b54(rec, (void *)data_02101928[o->types[i]], p);
            p += n;
            len -= n;
        }
        rec->flags |= 0x41;
    } else {
        func_02068628(rec, p, len);
        rec->flags |= 0x43;
    }
    rec->flags &= 0xf3;
    rec->time = func_02055330() - rec->time;
    func_02068380(&o->list, rec);
    o->cb(o, 0, rec, o->arg);
}
