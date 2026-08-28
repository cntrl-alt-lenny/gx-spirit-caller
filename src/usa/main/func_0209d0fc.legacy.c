typedef unsigned int u32;

struct RingBuf0209 {
    char _pad[0x1c];
    u32 pos;    /* +0x1c */
    u32 src;    /* +0x20 */
    u32 remain; /* +0x24 */
};
extern struct RingBuf0209 data_021a83e0;
extern void func_02094688(void *dst, u32 src, u32 len);

int func_0209d0fc(char *arg0) {
    struct RingBuf0209 *g = &data_021a83e0;
    u32 masked = g->pos & ~0x1FFu;
    if (masked == *(u32 *)(arg0 + 8)) {
        u32 rem = g->pos - masked;
        u32 chunk = 0x200 - rem;
        if (chunk > g->remain) chunk = g->remain;
        func_02094688(arg0 + 0x20 + rem, g->src, chunk);
        g->pos += chunk;
        g->src += chunk;
        g->remain -= chunk;
    }
    return g->remain != 0;
}
