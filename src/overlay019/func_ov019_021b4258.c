typedef struct { short f0, f1, f2, f3; } Row;
typedef struct { Row rows[5]; } Table;
typedef struct { int f0, f4, f8, fc, f10; char pad[0x20]; Row rows[5]; } State;
extern State data_ov000_021b1d4c;
extern const Table data_ov019_021b5a28;
/* The original caller passes state although the callee definition takes void. */
extern int func_ov005_021aa4b0(State *state);
int func_ov019_021b4258(int *arg) {
    State *state = &data_ov000_021b1d4c;
    Table table = data_ov019_021b5a28;
    int i;
    if (arg[2] > 6) {
        func_ov005_021aa4b0(state);
        state->f0 = 0;
        for (i = 0; i < 5; i++) {
            state->rows[i].f0 = table.rows[i].f0;
            state->rows[i].f1 = table.rows[i].f1;
            state->rows[i].f2 = table.rows[i].f2;
            state->rows[i].f3 = table.rows[i].f3;
        }
        state->f4 = arg[3];
        state->f8 = arg[2] - 6;
        state->fc = 6;
        state->f10 = 0;
    }
    return 1;
}



