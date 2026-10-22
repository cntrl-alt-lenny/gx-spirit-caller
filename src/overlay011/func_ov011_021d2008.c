typedef unsigned int u32;
typedef struct {
    void *data;
    u32 position;
    u32 count;
    u32 flags : 16;
    u32 width : 16;
    u32 height : 16;
    u32 reserved : 16;
} state_t;
extern void Task_InvokeLocked(void *p);
/* The assembly consumes a byte count in r0; the C wrapper types it as a pointer. */
extern void *Task_PostLocked(int size, int align, int flags);
/* Fill32 is an assembly definition consuming r0, r1 and r2. */
extern void Fill32(u32 value, void *dest, u32 size);
void func_ov011_021d2008(state_t *p, u32 width, u32 height) {
    u32 count;
    if (p->data) { Task_InvokeLocked(p->data); p->data = 0; }
    if (p->data) { Task_InvokeLocked(p->data); p->data = 0; }
    count = width * height;
    p->data = Task_PostLocked(count * 4, 4, 0);
    p->count = count;
    p->position = 0;
    if (p->data) { Fill32(0, p->data, p->count * 4); p->position = 0; }
    if (p->data) { Fill32(0, p->data, p->count * 4); p->position = 0; }
    p->flags = 0;
    p->width = width;
    p->height = height;
}
