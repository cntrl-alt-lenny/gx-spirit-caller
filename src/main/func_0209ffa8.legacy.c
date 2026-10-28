typedef unsigned short u16;
typedef struct State { u16 blocks[4][256]; u16 values[4]; u16 index, next, read, mask, stride, field812, size, field816, mode, field81a, status; } State;
typedef struct Event Event;
extern int func_0209db88(int count, ...);
extern int func_0209d724(void);
extern int func_0209d69c(void);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern int func_0209f2a8(int a0, int a1, void *a2, unsigned int a3, unsigned short a4, unsigned short a5, unsigned short a6);
extern void func_0209f970(State *s, int flag);
extern void func_0209fae4(State *s, int index, void *out);
extern void func_0209fe94(Event *event);
int func_0209ffa8(State *s, void *out, void *block) {
    int result = func_0209db88(2, 9, 10);
    int kind, bits, copied, flag;
    u16 slot;
    if (result != 0) return result;
    if (s == 0) return 6;
    if (out == 0) return 6;
    if (block == 0) return 6;
    kind = func_0209d724();
    if (kind == 0) bits = func_0209d69c();
    if (s->status == 5) return 1;
    if (s->status != 1 && s->status != 4) return 3;
    result = 5;
    if (kind == 0) {
        copied = 0;
        flag = 0;
        if (s->status == 4) {
            s->status = 1;
            slot = (s->index + 3) & 3;
            kind = func_0209f2a8((int)func_0209fe94, (int)s, s->blocks[slot], s->size, (u16)(s->mask & bits), s->field816, 1);
            if (kind == 7) {
                s->values[slot] = 0xffff;
                s->next = (s->next + 1) & 3;
            } else if (kind != 0 && kind != 2) {
                s->status = result;
                return 1;
            }
        }
        if (s->read != s->next) {
            s->blocks[s->read][0] |= 1;
            func_020944a4((int)s->blocks[s->read], (int)block, 0x200);
            copied = 1;
            result = 0;
            s->field81a = s->values[s->read];
            s->read = (s->read + 1) & 3;
            if (s->mode == 0 && bits != 0 && s->blocks[s->index][0] == 1) flag = copied;
            else flag = 0;
        }
        func_0209f970(s, 0);
        if (copied != 0) {
            func_0209fae4(s, 0, out);
            if (s->mode == 0) func_0209f970(s, flag);
        }
    } else {
        copied = 0;
        if (s->status == 4) { s->status = 1; copied = 1; }
        else if (s->read != s->index) {
            if (!(s->blocks[s->read][0] & 1)) s->blocks[s->read][0] |= 1;
            else {
                func_020944a4((int)s->blocks[s->read], (int)block, 0x200);
                copied = 1;
                result = 0;
                s->field81a = s->values[s->read];
                s->read = (s->read + 1) & 3;
            }
        }
        if (copied != 0) {
            char *p = (char *)s->blocks[s->next] + 0x20;
            func_020944a4((int)out, (int)p, s->stride);
            kind = func_0209f2a8((int)func_0209fe94, (int)s, p, s->stride, s->mask, s->field816, 1);
            s->next = (s->next + 1) & 3;
            if (kind != 2 && kind != 0) { s->status = 5; result = 1; }
        }
    }
    return result;
}
