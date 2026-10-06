typedef struct {
    int id; /* +0x0 */
} Request;

typedef struct {
    char _pad0[0x18];
    void *entries; /* +0x18 */
} State;

extern State *data_0219dc80;
extern void func_020484c0(void);
extern void func_02055c70(int a, int id, int b, int c, void (*cb)(void), int d);

void func_020492d0(int a, Request *req) {
    if (data_0219dc80->entries == 0) {
        return;
    }
    func_02055c70(a, req->id, 0, 0, func_020484c0, 0);
}
