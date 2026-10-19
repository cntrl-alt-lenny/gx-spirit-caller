typedef struct { char pad[0x64]; unsigned int flag; } ctx_020919d8_t;
typedef struct { ctx_020919d8_t *ctx; int active; unsigned char state; } Conn;
typedef struct Node { char pad[0x68]; struct Node *next; char pad6c[0x38]; Conn *conn; } Node;
typedef struct { char pad[8]; Node *head; } List;
typedef struct { char pad[4]; unsigned short active; char pad6[0x2e]; void *arg; } Entry;
extern int data_0219ef1c, data_0219eed8, data_0219eee8, data_0219eeec, data_0219eef8;
extern struct { int a, b; } data_0219ef34;
extern char data_0219ef90[];
extern List data_021a63d0;
extern Entry data_0219f538[8];
extern void (*data_0219ef0c)(void *);
extern int func_020745e0(void);
extern void func_020919d8(ctx_020919d8_t *ctx);
extern int func_020945f4(void *p, int a, int b);
void func_02074498(int arg) {
    int was_active = data_0219ef1c != 0;
    Node *node;
    int i;
    Entry *entry;
    data_0219eed8 = arg;
    data_0219ef1c = 0;
    data_0219eee8 = 0;
    data_0219eef8 = 0;
    data_0219ef34.a = 0;
    data_0219ef34.b = 0;
    data_0219eeec = 0;
    if (!was_active) return;
    func_020945f4(data_0219ef90, 0, 0x60);
    for (node = data_021a63d0.head; node; node = node->next) {
        Conn *conn = node->conn;
        if (conn && conn->ctx) {
            if (conn->state != 10 && conn->state != 11) conn->state = 0;
            if (conn->active) {
                conn->active = 0;
                func_020919d8(conn->ctx);
            }
        }
    }
    for (entry = data_0219f538, i = 0; i < 8; i++, entry++) {
        if (entry->active) {
            data_0219ef0c(entry->arg);
            entry->active = 0;
        }
    }
    func_020745e0();
}




