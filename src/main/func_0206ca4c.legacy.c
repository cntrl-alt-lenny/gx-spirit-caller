typedef unsigned short u16;
typedef struct Packet { struct Packet *next; u16 size; u16 tag; unsigned int value; } Packet;
typedef struct Container { void *head; void *f04; } Container;
typedef struct State { char pad[0x100]; Packet *volatile tail; Packet *head; u16 used; u16 limit; Container queue; } State;
typedef struct Arg { char pad0[0xa]; u16 port; char pad1[0xc]; u16 tag; u16 nextTag; unsigned int value; unsigned int nextValue; char pad2[0x40]; State *state; char pad3[0xc]; u16 active; } Arg;
typedef struct Allocator { char pad[0x18]; Packet *(*alloc)(unsigned int); } Allocator;
extern Allocator *data_0219ecd8;
extern unsigned int data_0219ed40[2];
extern int OS_DisableIrq(void);
extern asm void OS_RestoreIrq(int);
extern void func_02091a0c(Container *c);
extern void func_02094688(const void *src, void *dst, unsigned int size);
int func_0206ca4c(void *src, unsigned int size, Arg *arg) {
    State *state = arg->state;
    Packet *packet;
    int irq = OS_DisableIrq();
    if (state->limit >= state->used + size) {
        packet = data_0219ecd8->alloc(size + 0xc);
        if (packet != 0) {
            state->used += size;
            packet->next = 0;
            packet->size = size;
            packet->tag = arg->tag;
            packet->value = arg->value;
            func_02094688(src, packet + 1, size);
            if (state->tail != 0) state->tail->next = packet;
            state->tail = packet;
            if (state->head == 0) state->head = packet;
        } else {
            data_0219ed40[0]++;
        }
    } else {
        data_0219ed40[1]++;
    }
    if (arg->active == 0) arg->active = arg->port;
    arg->tag = arg->nextTag;
    arg->value = arg->nextValue;
    func_02091a0c(&state->queue);
    OS_RestoreIrq(irq);
    return 1;
}

