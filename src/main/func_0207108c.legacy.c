typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Entry {
    u32 active;
    u8 pad04[6];
    u16 id;
} Entry;
typedef struct Node {
    u8 pad00[0x68];
    struct Node *next;
    u8 pad6c[0x38];
    Entry *entry;
} Node;
typedef struct State {
    u8 pad00[8];
    Node *head;
} State;
extern State data_021a63d0;
extern u16 data_0219eed4;
u16 func_0207108c(void)
{
    int found;
    Node *node;
    u16 id;
    Node *head = data_021a63d0.head;
    do {
        data_0219eed4++;
        found = 0;
        if (data_0219eed4 < 0x400 || data_0219eed4 >= 0x1388)
            data_0219eed4 = 0x400;
        node = head;
        if (node) {
            id = data_0219eed4;
            do {
                Entry *entry = node->entry;
                if (entry && entry->active && entry->id == id) {
                    found = 1;
                    break;
                }
                node = node->next;
            } while (node);
        }
    } while (found);
    return data_0219eed4;
}

