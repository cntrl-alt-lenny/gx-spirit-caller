typedef unsigned short u16;
typedef struct State {
    u16 blocks[4][256];
    u16 values[4];
    u16 index;
    u16 next;
    u16 field80c;
    u16 mask;
    u16 stride;
    u16 field812;
    u16 size;
    u16 field816;
    u16 mode;
    u16 field81a;
    u16 status;
} State;
typedef struct Event Event;
/* The IRQ primitive returns the previous mask in r0 despite its void definition. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern int func_0209d69c(void);
extern void func_0209448c(int unused0, int unused1, int unused2);
extern int func_0209f2a8(int a0, int a1, void *a2, unsigned int a3, unsigned short a4, unsigned short a5, unsigned short a6);
extern void func_0209fe94(Event *event);
void func_0209f970(State *s, int flag) {
    int irq = OS_DisableIrq();
    if (s->blocks[s->index][0] == 0) {
        u16 old;
        int bits = func_0209d69c();
        old = s->index;
        u16 next = (old + 1) & 3;
        u16 clear;
        int result;
        if (s->mode == 1) clear = (next + 1) & 3;
        else clear = next;
        func_0209448c(0, (int)s->blocks[clear], 0x200);
        s->blocks[clear][0] = s->mask & (bits | 1);
        s->index = next;
        s->blocks[old][0] = s->mask;
        if (flag == 1) s->blocks[old][0] &= ~1;
        OS_RestoreIrq(irq);
        result = func_0209f2a8((int)func_0209fe94, (int)s, s->blocks[old], s->size, (u16)(s->mask & bits), s->field816, 1);
        if (result == 7) {
            s->values[old] = 0xffff;
            s->next = (s->next + 1) & 3;
        } else if (result == 0) {
            return;
        } else if (result != 2) {
            s->status = 5;
        }
    } else {
        OS_RestoreIrq(irq);
    }
}


