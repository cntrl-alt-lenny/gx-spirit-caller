typedef struct { int key, prev, next, used, f10, f14, f18; } Entry;
typedef struct { int f0; int *info; Entry *entries; } State;
typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
typedef struct { char pad[0x28]; void *f_28; void *f_2c; char p30[0xc]; void *f_3c; char p40[0x20]; void *f_60; } state_ov005_021abbfc_t;
typedef struct { char pad[0x18b8]; unsigned int bits[2]; unsigned short gap; unsigned short flags:4; unsigned short rest:12; } Global;
extern char data_ov010_021b9890[];
extern char data_ov010_021b9884[];
extern Global data_02104f4c;
extern void *data_ov010_021b99ec, *data_ov010_021b99f0, *data_ov010_021b99f4, *data_ov010_021b99f8;
/* Original caller supplies four pointer slots; the current callee C uses two. */
extern void func_ov010_021b35a4(void **a, void **b, void **c, void **d);
extern int func_ov005_021ab274(State *o, int idx, Entry **out);
extern int func_ov005_021ab2e0(int *o, int *p);
extern int func_ov005_021ab0fc(void *p);
extern int func_ov005_021ab3b4(void *obj, int idx);
extern int func_ov005_021ab260(void *obj, int idx);
extern unsigned short func_ov005_021ab384(state_hw_t *p, int idx, unsigned int mask);
extern int func_ov005_021ab318(void *obj, int idx);
extern void func_ov005_021abbfc(state_ov005_021abbfc_t *p);
extern void func_ov005_021aaf40(int *o);
extern void Task_InvokeLocked(void *p);
static inline int hasbit(unsigned int *bits, int id) { return (bits[id >> 5] & (1 << (id & 31))) ? 1 : 0; }
int func_ov010_021b8608(void) {
    Entry *cursor[3];
    unsigned short ids[4];
    char *self = data_ov010_021b9890;
    Global *g = &data_02104f4c;
    int n;
    int i, root, j, ok;
    unsigned short id;
    func_ov010_021b35a4(&data_ov010_021b99ec, &data_ov010_021b99f0, &data_ov010_021b99f4, &data_ov010_021b99f8);
    n = 0;
    ids[0] = func_ov005_021ab274(*(State **)(data_ov010_021b9884 + 0x90), n, cursor);
    do {
        n++;
        ids[n] = func_ov005_021ab2e0(*(int **)(self + 0x84), (int *)cursor);
        if (ids[n] == 0) break;
    } while (n < 4);
    g->flags |= -1;
    for (i = 1; i <= func_ov005_021ab0fc(*(void **)(self + 0x84)); i++) {
        func_ov005_021ab3b4(*(void **)(self + 0x84), i);
        id = func_ov005_021ab3b4(*(void **)(data_ov010_021b9884 + 0x90), i);
        ok = 1;
        if (func_ov005_021ab260(*(void **)(self + 0x84), i) > 0) continue;
        if (func_ov005_021ab384(*(state_hw_t **)(self + 0x84), i, 8) != 0) ok = 0;
        if (hasbit(data_02104f4c.bits, id) == 0) ok = 0;
        if (ok) continue;
        root = func_ov005_021ab318(*(void **)(self + 0x84), i);
        while (func_ov005_021ab318(*(void **)(self + 0x84), root) > 0)
            root = func_ov005_021ab318(*(void **)(self + 0x84), root);
        for (j = 0; j < n; j++) {
            if (root == ids[j]) {
                g->flags &= ~(1 << j);
                break;
            }
        }
    }
    func_ov005_021abbfc(*(state_ov005_021abbfc_t **)(self + 0x88));
    func_ov005_021aaf40(*(int **)(self + 0x84));
    Task_InvokeLocked(*(void **)(self + 0x344));
    Task_InvokeLocked(*(void **)(self + 0x354));
    return 1;
}




