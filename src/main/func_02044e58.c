typedef struct {
    unsigned long long a;
    unsigned long long b;
    unsigned short info;
    char tail[2];
} Record;

typedef struct {
    unsigned long long a;
    unsigned long long b;
} Ids;

extern void func_02044610(Record *rec);
extern int func_02044528(Ids *ids, void *arg);

int func_02044e58(Ids *ids, void *arg) {
    Record rec;
    func_02044610(&rec);
    ids->a = ids->b;
    ids->b = rec.b;
    return func_02044528(ids, arg) != 0;
}
