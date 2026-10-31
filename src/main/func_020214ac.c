typedef struct { unsigned kind; void *value; unsigned arg; } Rec;
typedef struct { unsigned a; unsigned *list; unsigned flags; unsigned c,d; int n; Rec entries[128]; } Obj;
typedef struct Obj27144 Obj27144;
typedef struct Obj28804 Obj28804;
extern struct { int a; int index; char pad[0x2c]; Obj objects[1]; } data_02194340;
/* Assembly Fill32 consumes value, destination and byte count. */
extern void Fill32();
extern int func_02021a3c(char *base, unsigned *list);
extern int func_02021cbc(int *p);
extern int func_02023574(int *p);
extern int func_020240a0(int *p);
extern int func_020245e8(void *p);
extern int func_02027144(Obj27144 *p);
extern int func_02028804(Obj28804 *p);
extern int func_0202a2f8(int *p);
int func_020214ac(Obj *obj, unsigned *list) {
    int i;
    Rec *entry;
    unsigned *p;
    char *base = (char *)&data_02194340;
    if (obj == 0) obj = (Obj *)(base + 0x34 + *(int *)(base + 4) * 0x618);
    for (i = 0; i < obj->n; i++) {
        entry = &obj->entries[i];
        switch (entry->kind) {
        case 0: func_02021cbc(entry->value); break;
        case 1: func_02023574(entry->value); break;
        case 2: func_020240a0(entry->value); break;
        case 3: func_020245e8(entry->value); break;
        case 4: func_02027144(entry->value); break;
        case 5: func_02028804(entry->value); break;
        case 6: func_0202a2f8(entry->value); break;
        }
    }
    Fill32(0, obj, 0x618);
    obj->list = list;
    p = obj->list;
    for (; ; p++) {
        unsigned kind = *p >> 24;
        if (kind == 0) return 0;
        if (kind == 0xf1) {
            obj->n = func_02021a3c((char *)obj, p);
            break;
        }
    }
    obj->flags |= 8;
    return 1;
}




