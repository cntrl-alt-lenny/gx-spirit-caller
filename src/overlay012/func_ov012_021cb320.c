extern unsigned func_ov000_021ae4c4(void);
extern void func_ov012_021caea8(int idx, int a1, int a2, int a3, void *a4, int a5);
typedef struct { unsigned char pad[0x19c]; unsigned state:4; unsigned rest:28; } State;
extern State data_ov012_021cc6a0;
typedef struct { unsigned char x, y; } Pair;
typedef struct { unsigned char pad[0x174]; Pair coords[4]; } Positions;
extern Positions data_ov012_021cc6dc;
void func_ov012_021cb320(void) {
    Positions *p = &data_ov012_021cc6dc;
    int i, idx;
    int pos[2];
    if (data_ov012_021cc6a0.state != 6) return;
    if (func_ov000_021ae4c4() != 4 && func_ov000_021ae4c4() != 5 && func_ov000_021ae4c4() != 3) return;
    for (i = 0; i < 4; i++) {
        pos[0] = p->coords[i].x << 12;
        pos[1] = p->coords[i].y << 12;
        switch (i) {
        case 0: idx = 8; break;
        case 1: case 3: idx = 9; break;
        case 2: continue;
        }
        func_ov012_021caea8(idx, -1, 0, 16, pos, 0);
    }
}



