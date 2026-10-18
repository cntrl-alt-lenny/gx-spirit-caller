typedef unsigned long long u64;
typedef struct {
    unsigned char lo : 4;
    unsigned char hi : 4;
    char pad[3];
    int payload[8];
} Entry;
typedef struct {
    char pad0[0x300];
    Entry entries[0x44];
    char padc90[0x20];
    u64 tick;
    char padcb8[0x57];
    unsigned char index;
    unsigned char count;
    signed char slot;
    char padd12[3];
    unsigned char page;
} Game;
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64, u64);
extern int func_0203e540(Game *, int);
extern signed char func_0203eaa8(int k);
extern void func_0203e3d4(int a0, int a1, int a2, int a3);
extern char data_020bee6c[];
int func_0203e610(Game *g) {
    if (func_020b3808((func_020930b0() - g->tick) << 6, 0x82ea) >= 150 || g->entries[g->index].lo == 1) {
        g->entries[g->index].lo = 0;
        g->index++;
        if (g->count <= g->index) {
            g->page++;
            g->index = 0;
            g->slot = func_0203eaa8(g->page);
        }
        if (g->slot < 0) {
            g->page = 0;
            return func_0203e540(g, 5);
        }
        g->tick = func_020930b0();
        func_0203e3d4((int)(data_020bee6c + 0x10), (int)&g->entries[g->index].payload, g->slot, 0x300000);
    }
    return 5;
}

