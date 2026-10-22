typedef struct { short x, y, z, w; } Rect;
typedef struct { Rect rows[5]; } Table;
typedef struct { int a, b, c; unsigned int active:1; unsigned int rest:31; } Row;
typedef struct { int state, a, b, c, d; char pad[0x20]; Rect rows[5]; } State;
extern Table data_ov006_021cb820;
extern State data_ov000_021b1d4c;
/* The existing callee definition takes void; this original caller passes the state address. */
extern int func_ov005_021aa4b0(State *state);
int func_ov006_021c6454(char *self) {
    Row *row = (Row *)((self + 0x6c) + *(int *)(self + 0x4c) * 16);
    if (row->active) {
        State *state = &data_ov000_021b1d4c;
        Table table = data_ov006_021cb820;
        int i;
        func_ov005_021aa4b0(state);
        data_ov000_021b1d4c.state = 0;
        for (i = 0; i < 5; i++) {
            state->rows[i].x = table.rows[i].x;
            state->rows[i].y = table.rows[i].y;
            state->rows[i].z = table.rows[i].z;
            state->rows[i].w = table.rows[i].w;
        }
        state->a = row->b;
        state->b = row->c - 6;
        state->c = 6;
        state->d = row->a;
    }
    return 1;
}



