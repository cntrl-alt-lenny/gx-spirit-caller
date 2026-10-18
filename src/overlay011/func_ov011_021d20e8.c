typedef unsigned int u32;
typedef struct { u32 value : 4; u32 rest : 28; } entry_t;
typedef struct {
    entry_t *data;
    u32 pad[2];
    u32 flags : 16;
    u32 width : 16;
} state_t;

u32 func_ov011_021d20e8(state_t *p, u32 x, u32 y) {
    return (p->flags >> p->data[x + p->width * y].value) & 1;
}
