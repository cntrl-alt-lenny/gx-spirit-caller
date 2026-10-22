typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Block { u32 start; int size; void *ptr; int state; } Block;
typedef struct Cache { int count; char pad[0x2c]; Block blocks[4]; } Cache;
typedef struct Node { struct Node *next; unsigned int active:1; unsigned int priority:31; int value; void *arg; } Node;
typedef struct Task { Node node; Block *block; Cache *cache; } Task;
typedef struct Result { int dst; int len; int pos; u8 idx; } Result;
typedef struct Cmd { u8 type; u16 slot; u16 item; } Cmd;
typedef struct A0_t A0_t;
/* The global pointer is reloaded across selection updates in the original. */
extern u8 *data_021a98fc;
extern void func_02093bfc(void);
extern void func_020a09c8(int);
extern int func_020a0e9c(A0_t *a0);
extern int func_020a202c(Result *, void *, int, void *);
extern int func_020a2cbc(int a, int b, int c);
extern int func_020a553c(Cache *, int, void *, int);
extern void func_020a56bc(Node *node, int value, void *arg, unsigned int priority);
extern int func_020a584c(int *p);
extern void *func_020a5c80(Cmd *, void *);
int func_020a0bd8(void) {
    Result result;
    Cmd cmd;
    u8 i;
    u8 *base;
    int idx;
    int pos;
    Cache *cache;
    void *end;
    Task *task;
    Block *best;
    Block *blocks;
    int j;
    if (data_021a98fc[0x1524] == 0) return 21;
    for (i = 0; i < 16; i++) {
        base = *(u8 *volatile *)&data_021a98fc;
        base[0x1525] = (base[0x1525] + 1) % 16;
        base = *(u8 *volatile *)&data_021a98fc;
        idx = base[0x1525];
        if ((base + idx * 0x5d4)[0x1d52] && *(u16 *)(base + idx * 0x5d4 + 0x1d4c)) break;
    }
    if (i == 16) return 21;
    func_020a09c8(idx);
    base = *(u8 *volatile *)&data_021a98fc;
    if (!func_020a202c(&result, base + 0x1d2c + base[0x1525] * 0x5d4, *(u16 *)(base + base[0x1525] * 0x5d4 + 0x1d48), base + 0x1788 + base[0x1525] * 0x5d4)) return 21;
    base = *(u8 *volatile *)&data_021a98fc;
    cmd.type = 4;
    cmd.slot = base[0x1525];
    cmd.item = *(u16 *)(base + base[0x1525] * 0x5d4 + 0x1d48);
    end = func_020a5c80(&cmd, base);
    pos = result.pos - *(int *)(data_021a98fc + data_021a98fc[0x1525] * 0x5d4 + result.idx * 4 + 0x1d2c) + (*(int **)(data_021a98fc + data_021a98fc[0x1525] * 0x5d4 + 0x1d58))[result.idx];
    cache = *(Cache **)(data_021a98fc + data_021a98fc[0x1525] * 0x5d4 + 0x1d54);
    if (!func_020a553c(cache, pos, end, result.len)) {
        task = (Task *)(data_021a98fc + 0x7ce0);
        if (!func_020a584c((int *)task)) {
            if (cache->count != 0) cache->count--;
            else {
                blocks = cache->blocks;
                best = 0;
                for (j = 0; j < 4; j++) {
                    if (blocks[j].state == 2) {
                        if (best == 0 || best->start > blocks[j].start) best = &blocks[j];
                    }
                }
                if (!best) func_02093bfc();
                cache->count = 2;
                best->state = 1;
                best->start = pos & ~0x1f;
                task->block = best;
                task->cache = cache;
                func_020a56bc(&task->node, (int)func_020a0e9c, 0, 4);
            }
        }
        return 21;
    }
    base = *(u8 *volatile *)&data_021a98fc;
    return func_020a2cbc(result.len + 6, *(u16 *)(base + base[0x1525] * 0x5d4 + 0x1d4c), (int)base);
}



