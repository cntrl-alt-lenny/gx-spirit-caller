/* func_0200af08: nested task-list walk, cells at node+0xc, inner bound 13. */

extern void Task_InvokeLocked(void *p);

typedef struct Node0200af24 {
    char pad[0xc];
    void **cells;
} Node0200af24;

typedef struct Cont0200af24 {
    int count;
    Node0200af24 **list;
} Cont0200af24;

int func_0200af08(Cont0200af24 *c)
{
    int i;
    int j;
    int n;

    if (c != 0) {
        n = c->count;
        for (i = 0; i < n; i++) {
            for (j = 0; j < 13; j++) {
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
