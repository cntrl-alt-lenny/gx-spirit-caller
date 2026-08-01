extern char data_ov002_022cf0cc[];
extern int func_0202e1e0(int id);
extern int func_ov002_022bdce0(int id);

int func_ov002_022b9310(int unused, int id, int arg2, int player, int stackArg) {
    int result;

    if (func_0202e1e0(id) == 0 && player >= 0 && stackArg >= 0) {
        if (!((*(unsigned int *)(data_ov002_022cf0cc + (player & 1) * 0x868 + stackArg * 20) >> 10) & 1)) {
            id = 0x1362;
        }
    }

    result = func_ov002_022bdce0(id);
    if (arg2 == 0)
        return result;
    if (result != 0)
        return result;

    return func_ov002_022bdce0((func_0202e1e0(id) != 0) ? 0xfe0 : 0x1362);
}
