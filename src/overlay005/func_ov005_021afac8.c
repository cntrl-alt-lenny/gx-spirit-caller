typedef struct { short a, b, c, d; } Entry;
typedef struct { Entry entries[5]; } Table;
typedef struct { int flag, value, count, mode, state; char pad[0x20]; Entry entries[5]; } State;
extern Table data_ov005_021b158c;
extern State data_ov005_021b1d4c;
extern int func_ov005_021aa4b0(void *o);
extern int func_ov005_021aaea8(void *o);
int func_ov005_021afac8(int *p)
{
    State *s = &data_ov005_021b1d4c;
    Table table = data_ov005_021b158c;
    int i;
    if (p[8] > 6) {
        func_ov005_021aa4b0(s);
        s->flag = 0;
        for (i = 0; i < 5; i++) {
            s->entries[i].a = table.entries[i].a;
            s->entries[i].b = table.entries[i].b;
            s->entries[i].c = table.entries[i].c;
            s->entries[i].d = table.entries[i].d;
        }
        s->value = p[9];
        s->count = p[8] - 6;
        s->mode = 6;
        s->state = 0;
        p[11] = func_ov005_021aaea8(s);
    }
    return 1;
}

