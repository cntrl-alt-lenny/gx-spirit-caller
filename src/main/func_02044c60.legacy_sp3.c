typedef struct {
    unsigned long long a;
    unsigned long long b;
    unsigned short info;
    char tail[2];
} Record;

typedef struct {
    unsigned long long a;
    unsigned long long b;
    int valid;
} Ids;

extern void func_02044610(Record *rec);

void func_02044c60(Ids *out) {
    Record rec;
    func_02044610(&rec);
    out->a = rec.a;
    out->b = rec.b;
    if (rec.a == 0) {
        out->valid = 0;
    } else {
        out->valid = 1;
    }
}
