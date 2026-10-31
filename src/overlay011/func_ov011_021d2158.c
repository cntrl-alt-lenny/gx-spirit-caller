typedef unsigned int u32;
typedef struct { u32 value:4; u32 rest:28; } entry_t;
typedef struct {
    entry_t *data;
    int position;
    int count;
    u32 flags:16;
    u32 width:16;
    u32 height:16;
    u32 reserved:16;
} state_t;
extern void Task_InvokeLocked(void *p);
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Fill32(u32 value, void *dest, u32 size);
extern void Copy32(const void *src, void *dest, u32 size);
extern int func_02006c0c(void *name, int align, int flags);
extern int func_0201d6f8(int arg);
void func_ov011_021d2158(state_t *p, void *name) {
    int buffer;
    u32 i;
    unsigned short *src;
    entry_t entry;
    buffer = func_02006c0c(name, 4, 0);
    src = (unsigned short *)func_0201d6f8(buffer);
    for (i = 0; i < p->width * p->height; i++) {
        entry.value = *src & 0x3ff;
        if (p->position >= p->count) {
            entry_t *old;
            int newCount = p->count * 2;
            int size = newCount * 4;
            old = p->data;
            p->data = (entry_t *)Task_PostLocked(size, 4, 0);
            Fill32(0, p->data, size);
            Copy32(old, p->data, p->count * 4);
            Task_InvokeLocked(old);
            p->count = newCount;
        }
        ((u32 *)p->data)[p->position] = *(u32 *)&entry;
        p->position++;
        src++;
    }
    Task_InvokeLocked((void *)buffer);
}


