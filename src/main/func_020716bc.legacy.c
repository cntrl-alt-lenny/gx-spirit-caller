typedef struct { char pad[0x64]; unsigned int flag; } ctx_020919d8_t;
typedef struct Connection Connection;
struct Connection {
    ctx_020919d8_t *thread;
    int state;
    unsigned char type, pad9;
    unsigned short port;
    char padc[8];
    unsigned int address;
    unsigned short peer_port, pad1a;
    unsigned int peer_address;
    char pad20[0x18];
    int (*callback)(void *, unsigned int, Connection *);
    unsigned int capacity;
    void *buffer;
    unsigned int length;
};
typedef struct Node Node;
struct Node { char pad[0x68]; Node *next; char pad6c[0x38]; Connection *connection; };
extern struct { char pad[8]; Node *head; } data_021a63d0;
extern int func_02073f28(void *a0, unsigned int a1, char *a2, unsigned int a3);
/* The IRQ primitive returns the saved mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_020919d8(ctx_020919d8_t *ctx);
extern void func_02094688(const void *src, void *dst, unsigned int length);
static inline unsigned short Swap16(int v) { return (v >> 8) | (v << 8); }
static inline unsigned int Read32(unsigned short *p) { return (Swap16(p[0]) << 16) | Swap16(p[1]); }
void func_020716bc(unsigned short *header, unsigned short *packet, unsigned int size)
{
    Connection *c;
    Node *node;
    int saved;
    if (packet[3] != 0) {
        if (func_02073f28(packet, size, (char *)header, 0x11)) return;
    }
    saved = OS_DisableIrq();
    for (node = data_021a63d0.head; node; node = node->next) {
        c = node->connection;
        if (c && c->thread && c->type == 10 && c->port == Swap16(packet[1]) &&
            (!c->peer_port || c->peer_port == Swap16(packet[0])) &&
            (!c->peer_address || c->peer_address == 0xffffffff || c->peer_address == Read32(header + 6))) {
            c->address = Read32(header + 8);
            if (!c->peer_address) {
                c->peer_address = Read32(header + 6);
                c->peer_port = Swap16(packet[0]);
            }
            if (!c->length) {
                if (size - 8 > c->capacity) c->length = c->capacity;
                else c->length = size - 8;
                func_02094688(packet + 4, c->buffer, c->length);
                if (c->state == 3) {
                    c->state = 0;
                    func_020919d8(c->thread);
                } else if (c->callback) {
                    if (c->callback(c->buffer, c->length, c)) c->length = 0;
                }
            }
            break;
        }
    }
    OS_RestoreIrq(saved);
}


