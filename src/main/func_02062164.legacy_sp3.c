typedef struct {
    char         _0[0xc];
    unsigned int time;
} item_02062164_t;

typedef struct {
    char  _0[0x60];
    void *list;
} obj_02062164_t;

extern int func_02054140(void *p);
extern void *func_020540d0(char *s, int index);
extern int func_02062834(obj_02062164_t *o, item_02062164_t *e);

int func_02062164(obj_02062164_t *o, unsigned int now) {
    item_02062164_t *it;
    int i;
    int n;

    n = func_02054140(o->list);
    for (i = 0; i < n; i++) {
        it = func_020540d0(o->list, i);
        if (now - it->time > 1000) {
            if (func_02062834(o, it) == 0) {
                return 0;
            }
        }
    }
    return 1;
}
