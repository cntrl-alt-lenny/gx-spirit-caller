typedef unsigned int u32;
typedef struct { short x, y; } point_t;
typedef struct { point_t pos; int a, b; } node_t;
typedef struct { node_t *data; int count, capacity; } list_t;
typedef struct { u32 value:4; u32 rest:28; } entry_t;
typedef struct { entry_t *data; u32 pad[2]; u32 flags:16; u32 width:16; } state_t;
extern state_t data_ov011_021d480c;
extern u32 func_ov011_021d20e8(state_t *p, u32 x, u32 y);
extern void func_ov011_021d2118(int *obj, u32 *out_high, u32 *out_low);
/* This caller passes a byte count in r0; the callee source types it as void *. */
extern int Task_PostLocked(int size, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
/* These assembly primitives consume r0-r2 despite their void definitions. */
extern void Fill32(u32 value, void *dest, u32 size);
extern void Copy32(const void *src, void *dest, u32 size);
static inline void append(list_t *list, const node_t *node) {
    if (list->count >= list->capacity) {
        int bytes;
        int capacity = list->capacity * 2;
        bytes = capacity * sizeof(node_t);
        node_t *old = list->data;
        list->data = (node_t *)Task_PostLocked(bytes, 4, 0);
        Fill32(0, list->data, bytes);
        Copy32(old, list->data, list->capacity * sizeof(node_t));
        Task_InvokeLocked(old);
        list->capacity = capacity;
    }
    node_t *dest = &list->data[list->count];
    point_t pos = node->pos;
    dest->pos.x = pos.x; dest->pos.y = pos.y;
    dest->a = node->a; dest->b = node->b;
    list->count++;
}
int func_ov011_021d2428(void *unused, point_t *p, list_t *list) {
    u32 width, height;
    state_t *state = &data_ov011_021d480c;
    func_ov011_021d2118((int *)state, &width, &height);
    if (list->data) { Task_InvokeLocked(list->data); list->data = 0; }
    list->data = (node_t *)Task_PostLocked(0x60, 4, 0);
    list->capacity = 8;
    list->count = 0;
    if (list->data) { Fill32(0, list->data, list->capacity * sizeof(node_t)); list->count = 0; }
    if (p->x < (int)width - 1) {
        if (!func_ov011_021d20e8(state, p->x + 1, p->y)) { node_t n; n.pos.x = p->x + 1; n.pos.y = p->y; append(list, &n); }
        if (p->y > 0 && !func_ov011_021d20e8(state, p->x + 1, p->y - 1)) { node_t n; n.pos.x = p->x + 1; n.pos.y = p->y - 1; append(list, &n); }
        if (p->y < (int)height - 1 && !func_ov011_021d20e8(state, p->x + 1, p->y + 1)) { node_t n; n.pos.x = p->x + 1; n.pos.y = p->y + 1; append(list, &n); }
    }
    if (p->x > 0) {
        if (!func_ov011_021d20e8(state, p->x - 1, p->y)) { node_t n; n.pos.x = p->x - 1; n.pos.y = p->y; append(list, &n); }
        if (p->y > 0 && !func_ov011_021d20e8(state, p->x - 1, p->y - 1)) { node_t n; n.pos.x = p->x - 1; n.pos.y = p->y - 1; append(list, &n); }
        if (p->y < (int)height - 1 && !func_ov011_021d20e8(state, p->x - 1, p->y + 1)) { node_t n; n.pos.x = p->x - 1; n.pos.y = p->y + 1; append(list, &n); }
    }
    if (p->y > 0 && !func_ov011_021d20e8(state, p->x, p->y - 1)) { node_t n; n.pos.x = p->x; n.pos.y = p->y - 1; append(list, &n); }
    if (p->y < (int)height - 1 && !func_ov011_021d20e8(state, p->x, p->y + 1)) { node_t n; n.pos.x = p->x; n.pos.y = p->y + 1; append(list, &n); }
    return 1;
}


