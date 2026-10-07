extern void *func_0207b538(void);
typedef struct Node { int unused; unsigned int id; struct Node *prev, *next; } Node;
typedef struct { unsigned int count; Node *head, *tail; } List;
void func_0207c3b0(Node *item)
{
    char *ctx = func_0207b538();
    List *list = *(List **)(ctx + 0x2270);
    Node *found;
    if (!item || !list || *(unsigned int *)(ctx+0x2274) <= 12) return;
    for (found = list->head; found; found = found->next) {
        if (found == item) {
            if (found->prev) found->prev->next = found->next;
            else list->head = found->next;
            if (found->next) found->next->prev = found->prev;
            else list->tail = found->prev;
            break;
        }
    }
    item->next = 0;
    item->prev = list->tail;
    list->tail = item;
    if (item->prev) item->prev->next = item;
    else list->head = item;
    if (!found) {
        item->id = list->count;
        list->count++;
    }
}
