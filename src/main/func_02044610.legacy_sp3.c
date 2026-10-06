extern char data_0219da7c[];
extern char data_0219da81[];
extern char data_0219da86[];
extern char data_0219da88[];
extern void func_02094688(const void *src, void *dst, int n);

typedef struct {
    unsigned long long a;
    unsigned long long b;
    unsigned short info;
    char tail[2];
} Record;

void func_02044610(Record *rec) {
    func_02094688(data_0219da7c, rec, 6);
    rec->a &= 0x7ffffffffffULL;
    func_02094688(data_0219da81, &rec->b, 6);
    rec->b >>= 3;
    rec->b &= 0x7ffffffffffULL;
    func_02094688(data_0219da86, &rec->info, 2);
    rec->info >>= 6;
    rec->info &= 0x3ff;
    func_02094688(data_0219da88, rec->tail, 2);
}
