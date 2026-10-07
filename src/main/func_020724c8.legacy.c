typedef struct {
    unsigned short half_0;
    unsigned short half_2;
} A1_02072544_t;

typedef struct {
    unsigned char _pad_00[0x8];
    unsigned char byte8;
    unsigned char _pad_9[1];
    unsigned short half_a;
    unsigned char _pad_c[0xc];
    unsigned short half_18;
    unsigned char _pad_1a[2];
    unsigned int word_1c;
} A2_02072544_t;

typedef struct {
    unsigned char _pad_00[0xc];
    unsigned short half_c;
    unsigned short half_e;
} A0_02072544_t;

extern int func_02072544(A0_02072544_t *a0, A1_02072544_t *a1, A2_02072544_t *a2);
typedef struct node { char pad[0x68]; struct node *next; char pad6c[0x38]; A2_02072544_t *fa4; } node_t;
typedef struct { char pad[8]; node_t *head; } list_t;
extern list_t data_021a63d0;
A2_02072544_t *func_020724c8(A0_02072544_t *a0, A1_02072544_t *a1)
{
    A2_02072544_t *connection;
    node_t *node = data_021a63d0.head;
    while (node != 0) {
        connection = node->fa4;
        if (connection != 0 && *(void **)connection != 0) {
            if (func_02072544(a0, a1, connection) != 0) return connection;
        }
        node = node->next;
    }
    return 0;
}
