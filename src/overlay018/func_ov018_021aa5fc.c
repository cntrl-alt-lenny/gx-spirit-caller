typedef struct {
    char pad[0x1c];
    unsigned int a : 8;
    unsigned int b : 8;
} Obj;
typedef struct {
    void *handle;
    char pad04[0x10];
    unsigned short mode : 4;
    unsigned short enabled : 1;
    unsigned short rest14 : 11;
    unsigned short pad16;
    unsigned int low18 : 14;
    unsigned int kind : 3;
    unsigned int rest18 : 15;
} Config;
extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];
extern Config data_ov018_021ae234;
extern char data_021040ac[];
extern int data_ov018_021ad738[][8];
extern void *func_02006c0c(int arc, int mode, int z);
extern void Task_Invoke(void *p);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Config *cfg);
void func_ov018_021aa5fc(int index, int mode, int side, int immediate) {
    char *st = data_ov018_021ad860;
    char *bg = data_ov018_021ad8a8;
    Config *cfg = &data_ov018_021ae234;
    if (*(int *)(st + 0x9d0) != 0) {
        Task_Invoke(*(void **)(bg + 0x988));
        *(void **)(bg + 0x988) = 0;
    }
    *(void **)(bg + 0x988) = func_02006c0c(data_ov018_021ad738[*(int *)(data_021040ac + 0x34)][index], 4, 0);
    func_0201d47c((Obj *)cfg);
    cfg->mode = (unsigned short)mode;
    switch (mode) {
    case 0: case 5: cfg->kind = side == 0 ? 0 : 2; break;
    case 1: case 6: cfg->kind = side == 0 ? 1 : 3; break;
    case 2: case 7: cfg->kind = 2; break;
    case 3: case 8: cfg->kind = 3; break;
    }
    cfg->handle = *(void **)(bg + 0x988);
    cfg->enabled = 1;
    if (immediate == 1 && *(void **)(bg + 0x988) != 0) {
        func_0201e5b8(cfg);
        Task_Invoke(*(void **)(bg + 0x988));
        *(void **)(bg + 0x988) = 0;
        *(unsigned short *)(bg + 0x9b4) &= ~8;
    } else {
        *(unsigned short *)(bg + 0x9b4) |= 8;
    }
}
