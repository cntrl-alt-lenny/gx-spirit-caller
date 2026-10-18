typedef struct { char pad[0x64]; unsigned int flag; } ctx_020919d8_t;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern void func_020919d8(ctx_020919d8_t *ctx);
extern void func_02094688(const void *src, void *dst, unsigned int size);
typedef struct {
    ctx_020919d8_t *ctx;
    int state;
    unsigned char kind;
    char pad9;
    unsigned short port;
    char padc[0x10];
    unsigned int address;
    char pad20[0x1c];
    unsigned int capacity;
    void *buffer;
    unsigned int length;
} Connection;
typedef struct Node { char pad[0x68]; struct Node *next; char pad6c[0x38]; Connection *connection; } Node;
extern struct { char pad[8]; Node *head; } data_021a63d0;
typedef struct { char pad[0xc]; unsigned short high, low; } Header;
typedef struct { char pad[4]; unsigned short id, port; char payload[1]; } Packet;
void func_0207280c(Header *header, Packet *packet, unsigned int size)
{
    Connection *connection;
    Node *node;
    int saved = OS_DisableIrq();
    node = data_021a63d0.head;
    while (node != 0) {
        connection = node->connection;
        if (connection != 0 && connection->ctx != 0 && connection->kind == 0xb &&
            (unsigned short)(unsigned int)connection->ctx == packet->id && connection->port == packet->port &&
            connection->length == 0) {
            unsigned short high = header->high;
            unsigned short low = header->low;
            unsigned short a = (high >> 8) | (high << 8);
            unsigned short b = (low >> 8) | (low << 8);
            if (connection->address == (((unsigned int)a << 16) | b)) {
                if (size - 8 > connection->capacity) connection->length = connection->capacity; else connection->length = size - 8;
                func_02094688(packet->payload, connection->buffer, connection->length);
                if (connection->state == 3) {
                    connection->state = 0;
                    func_020919d8(connection->ctx);
                }
                break;
            }
        }
        node = node->next;
    }
    OS_RestoreIrq(saved);
}

