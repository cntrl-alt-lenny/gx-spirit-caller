extern unsigned int data_021a9840;
extern unsigned char *data_021a98fc;
struct State {
    unsigned char pad[0x1d48];
    unsigned short current;
    unsigned short limit;
    unsigned short enabled;
    unsigned char pad2[4];
    unsigned char active;
};
void func_020a09c8(int index) {
    unsigned int limit;
    unsigned int current;
    struct State *p;
    if (!(data_021a9840 & (1 << index))) return;
    p = (struct State *)(data_021a98fc + index * 0x5d4);
    if (!p->active) return;
    if (!p->enabled) return;
    current = p->current;
    limit = p->limit;
    if (limit <= current) {
        if ((int)current <= (int)(limit + 2)) {
            p->current = current + 1;
            return;
        }
    }
    p->current = limit;
}

