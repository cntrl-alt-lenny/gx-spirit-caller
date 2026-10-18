extern char data_ov011_021d4000[];
struct Selection {
    unsigned int unused : 5;
    unsigned int col : 4;
    unsigned int row : 4;
    unsigned int rest : 19;
};
struct State {
    char pad0[0x214];
    int handle;
    char pad1[0x50];
    struct Selection selection;
};
extern struct State data_ov011_021d403c;
extern int func_ov011_021cd6e0(int row, int col);
/* The existing definition takes void; this caller supplies four registers. */
extern int func_ov006_021b3804();

void func_ov011_021cd700(void) {
    struct State *s = &data_ov011_021d403c;
    if (*(int *)(data_ov011_021d4000 + 0x2a0) == 0) {
        func_ov011_021cd6e0(s->selection.row, s->selection.col);
    } else {
        func_ov006_021b3804(s->handle, 0, 0x1000, 0x80);
    }
}
