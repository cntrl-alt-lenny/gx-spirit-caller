typedef struct {
    volatile unsigned int f_0;
    volatile unsigned int f_4;
} obj_t;
typedef struct {
    unsigned long long a;
    unsigned long long b;
    int valid;
} Ids;
extern void func_02044c60(Ids *out);
extern unsigned long long func_02053728(obj_t *p);
int func_020531c0(obj_t *p) {
    Ids ids;
    func_02044c60(&ids);
    if (ids.valid) {
        return ids.a == func_02053728(p);
    } else {
        return ids.b == func_02053728(p);
    }
}
