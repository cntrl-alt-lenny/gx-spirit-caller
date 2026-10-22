typedef struct { int a, b, count; unsigned int enabled:1; unsigned int rest:31; } Record;
typedef struct { short row[5][4]; } Table;
typedef struct { int mode, a, b, c, d; char pad[0x20]; short row[5][4]; } State;
extern State data_ov000_021b1d4c;
extern const Table data_ov006_021cb7b8;
/* Original caller passes a pointer although the C callee takes no arguments. */
extern int func_ov005_021aa4b0();
int func_ov006_021c426c(char *self) {
    Record *rec = (Record *)(self + 0x9c) + *(int *)(self + 0x64);

    int i;
    if (rec->enabled) {
        State *state = &data_ov000_021b1d4c;
        Table table = data_ov006_021cb7b8;

        func_ov005_021aa4b0(&data_ov000_021b1d4c);
        data_ov000_021b1d4c.mode = 0;
        for (i = 0; i < 5; i++) {
            state->row[i][0] = table.row[i][0];
            state->row[i][1] = table.row[i][1];
            state->row[i][2] = table.row[i][2];
            state->row[i][3] = table.row[i][3];
        }
        state->a = rec->b;
        state->b = rec->count - 6;
        state->c = 6;
        state->d = rec->a;
    }
    return 1;
}

