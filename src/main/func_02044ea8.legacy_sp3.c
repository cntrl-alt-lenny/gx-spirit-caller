typedef struct {
    unsigned long long a;
    unsigned long long b;
    int valid;
} Ids;

extern int func_02044eec(Ids *ids);
extern int func_02044528(Ids *ids, void *arg);

int func_02044ea8(void *arg) {
    Ids ids;
    if (func_02044eec(&ids) == 0) {
        return 0;
    }
    return func_02044528(&ids, arg) != 0;
}
