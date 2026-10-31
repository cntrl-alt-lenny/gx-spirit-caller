typedef unsigned short u16;
typedef struct { char pad[0x3c]; int count; } Count;
typedef struct { char pad[0x9e8]; u16 values[10][4]; u16 indices[10]; void *task; } Overlay;
extern Overlay data_ov020_021ae0a8;
extern void *data_ov020_021ae9b4[];
extern void *data_ov020_021ae9bc[];
extern Count data_021040ac;
extern char data_02104f4c[];
extern char data_02106a4c[];
extern void func_ov020_021ab7dc(void **a, void **b);
extern void func_02009758(int n);
extern void Task_Invoke(void *p);
int func_ov020_021ad910(void) {
    Overlay *base = &data_ov020_021ae0a8;
    int i;
    void **b = data_ov020_021ae9bc;
    void **a = data_ov020_021ae9b4;
    for (i = 0; i < 2; i++) {
        func_ov020_021ab7dc(a, b);
        b++;
        a++;
    }
    data_021040ac.count = 0;
    for (i = 0; i < 10; i++) {
        if (base->values[i][base->indices[i]] <= 1)
            data_021040ac.count++;
    }
    if (data_021040ac.count == 10) {
        char *stats = data_02104f4c;
        func_02009758(16);
        if (*(u16 *)(data_02106a4c + 8) < 0x7fff)
            (*(u16 *)(stats + 0x1b08))++;
        if (*(u16 *)(stats + 0x1b08) >= 10)
            func_02009758(17);
    }
    if (base->task != 0) {
        Task_Invoke(base->task);
        base->task = 0;
    }
    return 1;
}


