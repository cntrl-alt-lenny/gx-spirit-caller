typedef struct obj_020319a0 obj_020319a0_t;

typedef int (*handler_020319a0_t)(obj_020319a0_t *o, int id, int a, int b, int arg);

typedef struct {
    int                 id;
    handler_020319a0_t  fn;
    int                 arg;
} entry_020319a0_t;

struct obj_020319a0 {
    char              _pad[0x24];
    entry_020319a0_t *table;
};

extern void func_02031d0c(obj_020319a0_t *o);
extern void func_02031a70(obj_020319a0_t *o, int id, int a, int b);

void func_020319a0(obj_020319a0_t *o, int id, int a, int b) {
    int flags;
    entry_020319a0_t *e;

    e = o->table;
    flags = 0;

    if (e != 0 && e->fn != 0) {
        do {
            if ((id != (int)0xffff0000 && e->id == -1) || e->id == id) {
                flags |= e->fn(o, id, a, b, e->arg);
                if (flags & 2) {
                    break;
                }
            }
            e++;
        } while (e->fn != 0);
    }
    if (flags & 4) {
        return;
    }
    if (id == (int)0xffff0000) {
        func_02031d0c(o);
    } else {
        func_02031a70(o, id, a, b);
    }
}
