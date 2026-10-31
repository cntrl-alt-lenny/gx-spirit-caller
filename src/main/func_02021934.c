typedef struct Camera Camera;
typedef struct Obj Obj;
typedef struct Obj02025880 Obj02025880;
extern void func_0208e890(void);
extern int func_0202455c(void);
extern int func_02023a68(Camera *p);
extern int func_020242d4(Obj *o);
extern int func_02025678(Obj02025880 *o);
extern int func_02027738(void *o);
extern int func_02029204(Obj *o);
extern int func_0202a718(Obj *o);
extern int func_02028754(void);
extern int func_02021c28(void);
typedef struct { unsigned kind; void *value; unsigned arg; } Entry;
typedef struct {
    unsigned disabled:1;
    unsigned rest:31;
    int active;
    char pad[12];
    int count;
    Entry entries[128];
} Record;
typedef struct { int unknown; int index; char pad[0x2c]; Record records[8]; } State;
int func_02021934(State *s) {
    Record *r;
    int i;
    Entry *e;
    func_0208e890();
    func_0202455c();
    for (s->index = 0; s->index < 8; s->index++) {
        r = &s->records[s->index];
        if (r->active != 0 && !r->disabled) {
            i = 0;
            if (r->count > 0) {
                e = r->entries;
                do {
                switch (e->kind) {
                case 1: func_02023a68(e->value); break;
                case 2: func_020242d4(e->value); break;
                case 3: func_02025678(e->value); break;
                case 4: func_02027738(e->value); break;
                case 5: func_02029204(e->value); break;
                case 6: func_0202a718(e->value); break;
                }
                    i++;
                    e++;
                } while (i < r->count);
            }
        }
    }
    func_02028754();
    func_02021c28();
    return 1;
}


