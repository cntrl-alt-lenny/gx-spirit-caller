typedef struct { short a, b, c, d; } Row;
typedef struct { Row rows[5]; } Table;
typedef struct {
    int state, a, b, count, flag;
    char pad[0x20];
    Row rows[5];
} Data;
extern Data data_ov000_021b1d4c;
extern const Table data_ov017_021b7ed0;
/* The original caller passes this pointer; the callee ignores it. */
extern int func_ov005_021aa4b0(Data *p);
int func_ov017_021b66a8(int *arg) {
    Data *p = &data_ov000_021b1d4c;
    Table t = data_ov017_021b7ed0;
    int i;
    if (arg[5] > 5) {
        func_ov005_021aa4b0(p);
        p->state = 0;
        for (i = 0; i < 5; i++) {
            p->rows[i].a = t.rows[i].a;
            p->rows[i].b = t.rows[i].b;
            p->rows[i].c = t.rows[i].c;
            p->rows[i].d = t.rows[i].d;
        }
        p->a = arg[3];
        p->b = arg[5] - 5;
        p->count = 5;
        p->flag = 0;
    }
    return 1;
}

