typedef unsigned short u16;
typedef struct State {
    char pad[0x800];
    u16 values[4];
    u16 other;
    u16 index;
    char pad80c[0x10];
    u16 status;
} State;
typedef struct Event {
    u16 unknown0;
    u16 type;
    char pad4[6];
    u16 slot;
    char padc[0xe];
    u16 value;
    char pad1c[4];
    State *state;
} Event;
typedef void (*Callback)(Event *);
typedef struct Context {
    char pad[0xcc];
    Callback callbacks[16];
    State *states[16];
} Context;
extern void *func_0209dca8(void);
extern int func_0209d724(void);
extern void func_0209fd28(Event *);
extern void func_0209fbe8(Event *);
void func_0209fe94(Event *event) {
    Context *ctx = func_0209dca8();
    Callback cb = ctx->callbacks[event->slot];
    State *state = ctx->states[event->slot];
    int result;
    if (cb != func_0209fd28 && cb != func_0209fbe8) return;
    if (state == 0) return;
    if (state != event->state) return;
    result = func_0209d724();
    if (event->type == 0) {
        if (result != 0) return;
        state->values[state->index] = event->value >> 1;
        state->index = (state->index + 1) & 3;
    } else if (event->type == 10) {
        if (result != 0) state->index = (state->index + 3) & 3;
        state->status = 4;
    } else {
        state->status = 5;
    }
}
