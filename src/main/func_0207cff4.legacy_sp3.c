typedef struct { void *head, *tail; unsigned short count, offset; } List;
typedef struct { void *prev, *next; } Link;
void func_0207cff4(List *list, void *node)
{
    unsigned int offset = list->offset;
    Link *link = (Link *)((char *)node + offset);
    if (!link->prev) list->head = link->next;
    else ((Link *)((char *)link->prev + offset))->next = link->next;
    if (!link->next) list->tail = link->prev;
    else ((Link *)((char *)link->next + list->offset))->prev = link->prev;
    link->prev = 0; link->next = 0;
    list->count--;
}
