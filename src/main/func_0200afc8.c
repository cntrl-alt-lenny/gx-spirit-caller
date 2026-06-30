/* func_0200afc8: nested task-list walk, cells at node+0x8, inner bound 5. */

extern void Task_InvokeLocked(void *p);

typedef struct Node0200afc8 {
    char pad[0x8];
    void **cells;
} Node0200afc8;

typedef struct Cont0200afc8 {
    int count;
    Node0200afc8 **list;
} Cont0200afc8;

int func_0200afc8(Cont0200afc8 *c)
{
    int i;
    int j;
    int n;

    if (c != 0) {
        n = c->count;
        for (i = 0; i < n; i++) {
            for (j = 0; j < 5; j++) {
                void *cell = c->list[i]->cells[j];
                if (cell != 0) Task_InvokeLocked(cell);
            }
            if (c->list[i]->cells != 0) Task_InvokeLocked(c->list[i]->cells);
            if (c->list[i] != 0) Task_InvokeLocked(c->list[i]);
        }
        Task_InvokeLocked(c->list);
        Task_InvokeLocked(c);
        return 1;
    }
    return 0;
}
