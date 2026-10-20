typedef unsigned short u16;
typedef struct State {
    u16 data[4][0x100];
    u16 values[4];
    u16 index;
    char pad80a[0xe];
    u16 mode;
    u16 pad81a;
    u16 status;
} State;
typedef struct Event {
    u16 unknown0;
    u16 type;
    u16 code;
    char pad6[6];
    void *data;
    u16 size;
    u16 bit;
    char pad14[8];
    State *state;
} Event;
/* The assembly primitive returns the saved IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_0209fae4(State *, int, void *);
extern void func_0209f970(State *, int);
void func_0209fd28(Event *event) {
    State *state = event->state;
    if (state == 0) return;
    if (event->type == 0) {
        switch (event->code) {
        case 21:
            func_0209fae4(state, event->bit, event->data);
            func_0209f970(state, 0);
            break;
        case 7:
            func_0209f970(state, 0);
            break;
        case 9:
        case 26: {
            u16 bit = event->bit;
            unsigned int mask = 1U << bit;
            int irq = OS_DisableIrq();
            u16 index = state->index;
            mask = ~mask;
            state->data[index][0] &= mask;
            if (state->mode == 1) {
                index = (index + 1) & 3;
                state->data[index][0] &= mask;
            }
            OS_RestoreIrq(irq);
            func_0209f970(state, 0);
            if (state->mode == 1) func_0209f970(state, 0);
            break;
        }
        case 25:
            break;
        }
    } else {
        state->status = 5;
    }
}










