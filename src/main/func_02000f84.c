typedef struct {
    char pad[0xb64];
    int state;
    int f68;
    int f6c;
    int f70;
    int f74;
    int f78;
} State_02000f84;

extern State_02000f84 data_021040ac;
extern char data_02102c60[];
extern int func_02000c4c(int idx);

void func_02000f84(void) {
    data_021040ac.state++;
    *(int *)data_02102c60 = func_02000c4c(data_021040ac.state);
    data_021040ac.f6c = 0;
    data_021040ac.f70 = 0;
    data_021040ac.f74 = 0;
    data_021040ac.f78 = 0;
}
