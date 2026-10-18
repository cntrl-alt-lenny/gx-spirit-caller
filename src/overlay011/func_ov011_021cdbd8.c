extern void *func_02018bc0(int x);
struct Actor {
    unsigned int pad[2];
    unsigned int kind : 8;
    unsigned int flag : 1;
    unsigned int id : 8;
    unsigned int rest : 15;
};
int func_ov011_021cdbd8(int arg) {
    int kind = arg + 0x10;
    int i;
    struct Actor *actor;
    for (i = 1; i < 0x60; i++) {
        actor = func_02018bc0(i);
        if (kind == actor->kind) {
            if (((struct Actor *)func_02018bc0(i))->flag == 0 && i == actor->id)
                return i;
        }
    }
    return 0;
}
