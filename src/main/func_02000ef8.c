typedef struct {
    char pad[0xb64];
    int state;
    int flag;
} State_02000ef8;

extern State_02000ef8 data_021040ac;
extern char data_02102c60[];
extern int func_02000d4c(void);
extern int func_02000c4c(int idx);
extern void func_02001540(void);
extern void func_020057dc(void *fn);

int func_02000ef8(void) {
    State_02000ef8 *s = &data_021040ac;
    switch (s->state) {
    case 0x16:
    case 0x1c:
    case 0x20:
    case 0x34:
    case 0x36:
        s->state = func_02000d4c();
        *(int *)data_02102c60 = func_02000c4c(s->state);
        func_020057dc(func_02001540);
        s->flag = 0;
        return 1;
    }
    return 0;
}
