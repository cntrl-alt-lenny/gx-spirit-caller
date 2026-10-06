typedef struct {
    int key;    /* +0x0 */
    int _f4;
    int source; /* +0x8 */
} Request;

typedef struct {
    int _f0;
    int kind;        /* +0x4 */
    char _pad8[0x100];
    char text[0x108]; /* +0x108 */
} Info;

typedef struct {
    char _pad0[0x34];
    void (*on_info)(int index, int kind, char *text, int user); /* +0x34 */
    int info_user;                                              /* +0x38 */
} State;

extern State *data_0219dc80;
extern int func_02049120(int key);
extern void func_020557b8(int a, int source, Info *info);

void func_020491ec(int a, Request *req) {
    Info info;
    int index;
    if (data_0219dc80->on_info == 0) {
        return;
    }
    index = func_02049120(req->key);
    if (index == -1) {
        return;
    }
    func_020557b8(a, req->source, &info);
    data_0219dc80->on_info(index, (unsigned char)info.kind, info.text, data_0219dc80->info_user);
}
