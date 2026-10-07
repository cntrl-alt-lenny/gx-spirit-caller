typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Node { u16 lo; u16 hi; struct Node *next; u32 data[1]; } Node;
typedef struct Tab { int pad[3]; Node *head; } Tab;
typedef struct Obj { Tab *tab; u16 pad; u16 pad2; u16 pad3; u16 unitSize; } Obj;

void *func_020800b8(Obj *o, u32 key)
{
    Node *n;
    Tab *t = o->tab;
    n = t->head;
    while (n != 0) {
        if (n->lo <= key && key <= n->hi) {
            return (char*)n->data + (key - n->lo) * o->unitSize;
        }
        n = n->next;
    }
    return (char*)t + 4;
}
