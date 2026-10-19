typedef unsigned short u16;
typedef struct State {
    char data[0x800];
    u16 values[4];
    u16 index;
    char pad80a[0xa];
    u16 size;
    char pad816[6];
    u16 status;
} State;
typedef struct Event {
    u16 unknown0;
    u16 type;
    u16 code;
    char pad6[6];
    u16 *data;
    u16 size;
    char pad12[8];
    u16 value;
    State *state;
} Event;
extern int func_0209d724(void);
extern asm void func_020944a4(const void *src, void *dst, int size_bytes);
void func_0209fbe8(Event *event) {
    State *state = event->state;
    if (state == 0) return;
    if (event->type == 0) {
        switch (event->code) {
        case 7: break;
        case 9: break;
        case 21: {
            unsigned int size;
            unsigned int mask;
            u16 *data;
            data = event->data;
            size = event->size;
            mask = *data;
            int bit = func_0209d724();
            if (size != state->size) {
                if (size > 0x200) size = 0x200;
            }
            if (size < 4) return;
            if (!(mask & (1 << bit))) return;
            func_020944a4(data, state->data + (state->index << 9), size);
            state->values[state->index] = event->value >> 1;
            state->index = (state->index + 1) & 3;
            break;
        }
        case 25: break;
        case 26: break;
        }
    } else {
        state->status = 5;
    }
}


