/* func_ov006_021b7ab0: per-case tile/VRAM pointer dispatch + message post.
 * switch(b) selects a base pointer into a large VRAM-like table (case 0-4;
 * b>4 leaves it unset, matching the original's fallthrough with no case
 * body); a second pointer (tile) is read for a 16-bit value, forwarded to
 * func_ov006_021b8ea8, then func_020a96c4 posts (base, value, 4, callback)
 * choosing the callback by a global flag.
 */
extern void func_ov006_021b80dc(void *self, int b);
extern void func_ov006_021b821c(void *self, int b, int c);
extern void func_ov006_021b8ea8(void *self, int b, void *tile);
extern void func_020a96c4(void *dst, int val, int c, void *fn);
extern void func_ov006_021b930c(void);
extern void func_ov006_021b8f10(void);
extern void func_ov006_021b8444(void *self, int b);

int func_ov006_021b7ab0(char *self, int b) {
    char *tile;
    int val;
    char *p;

    func_ov006_021b80dc(self, b);
    func_ov006_021b821c(self, b, 1);

    switch (b) {
    case 0: p = self + 0x198 + 0x9800; break;
    case 1: p = self + 0x358 + 0xb000; break;
    case 2: p = self + 0x158 + 0xb800; break;
    case 3: p = self + 0x358 + 0xbc00; break;
    case 4: p = self + 0x58 + 0xc400; break;
    }

    tile = self + (b << 1) + 0xc600;
    val = *(unsigned short *)(tile + 0x62);
    func_ov006_021b8ea8(self, b, tile);

    if (*(int *)(self + 0x6000 + 0x29c) != 0) {
        func_020a96c4(p, val, 4, func_ov006_021b930c);
    } else {
        func_020a96c4(p, val, 4, func_ov006_021b8f10);
    }

    func_ov006_021b8444(self, b);
    return 1;
}
