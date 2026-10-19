typedef struct {
    char pad[0x5a0];
    unsigned short entries[10];
    int count;
    int active;
    int selected;
    int timer;
} State;
extern void *func_ov002_021afb90(int i);
extern int func_ov002_021c9650(int a, int b, int c);
extern void func_ov002_022a7e00(State *s, int a, int b, int c, int flag);
void func_ov002_022a7f54(State *s, int a, int b, int c, int flag) {
    int value;
    int i;
    unsigned short temp;
    if (flag) {
        s->selected = c + 1;
        s->count--;
        s->timer = 32;
        if (s->count == 0) s->active = 0;
        *(unsigned int *)func_ov002_021afb90(c) |= 0x4000;
        return;
    }
    value = func_ov002_021c9650(a, b, c);
    s->selected = -1;
    func_ov002_022a7e00(s, a, b, c, flag);
    for (i = 0; i < s->count; i++) {
        if (value == s->entries[i]) {
            s->count--;
            s->active--;
            s->timer = 32;
            temp = s->entries[i];
            s->entries[i] = s->entries[s->count];
            s->entries[s->count] = temp;
            return;
        }
    }
}
