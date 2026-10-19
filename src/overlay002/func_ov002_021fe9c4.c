struct State {
    int first[2];
    int second[2];
    int third[2];
    int flag;
    int field7;
    int field8;
    int field9;
    int field10;
    int field11;
};
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
extern int IsValue12D3Or147E(int a0);
extern void func_ov002_021fdd9c(struct State *state);

int func_ov002_021fe9c4(int player, int id)
{
    struct State state;
    func_ov002_021fdd9c(&state);
    if (IsValue12D3Or147E(id)) return 0;
    if (func_0202b878(id) == 0x17) {
        if (state.first[player] == 2 && id != 0x1302) return 1;
        if (state.first[player] == 1) return 1;
        if (state.field7 && func_0202b8c0(id) == 4) return 1;
    } else {
        if (state.second[player]) return 1;
        if (state.field8 && func_0202b8c0(id) == 4) return 1;
        if (state.field10 && (func_0202b8c0(id) == 3 || func_0202e234(id))) return 1;
        if (state.field9 && func_0202b8c0(id) == 2) return 1;
    }
    return 0;
}
