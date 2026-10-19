struct self_t { unsigned short id; unsigned short b0:1; unsigned short rest:15; unsigned short f4; unsigned short f6; };
struct Bits { unsigned int val:13; unsigned int rest:19; };
struct Event { unsigned int pad:9; unsigned int player:1; unsigned int idx:4; unsigned int flag:1; unsigned int blocked:1; unsigned int other:1; unsigned int rest:15; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022ce288[];
extern struct Event data_ov002_022ce884[];
extern int func_ov002_021c1ef0(struct self_t *self, int player, int idx);
extern int func_ov002_021f09e8(struct self_t *self, int player, int idx);
typedef int (*Callback02257888)(struct self_t *self, int player, int idx);
extern int func_ov002_02257888(void *self, Callback02257888 fn, int target);
int func_ov002_021f22e8(struct self_t *self, int player, int idx) {
    int off, off2;
    unsigned int i;
    unsigned char *p;
    struct Event *event;
    unsigned int count;
    if (((unsigned int)self->f6 << 16 >> 24) == 0) {
        off = (player & 1) * 0x868;
        off2 = idx * 20;
        if (((struct Bits *)(data_ov002_022cf16c + off + 0x30 + off2))->val == 0) return 0;
        if (idx >= 5) return 0;
        if (*(unsigned short *)(data_ov002_022cf1a4 + off + off2) != 0) return 0;
        if (*(unsigned short *)(data_ov002_022cf1a2 + off + off2) == 0) return 0;
        if (func_ov002_021c1ef0(self, player, idx) == 0) return 0;
        p = (unsigned char *)data_ov002_022ce288;
        i = 0;
        count = *(unsigned int *)(p + 0x5d4);
        if (i < count) {

        event = data_ov002_022ce884;
        do {
            if ((unsigned char)(p[0x5dc] + 0xf8) <= 1) {
                if (player == event->player && idx == event->idx) {
                    if (1 - self->b0 == (player ^ event->other) && event->blocked == 0 && event->flag != 0) {
                        unsigned short packed = (unsigned char)player | ((unsigned char)idx << 8);
                        return func_ov002_02257888(self, func_ov002_021f09e8, packed) > 0;
                    }
                }
            }
            i++; p++; event++;
        } while (i < count);
        }
    } else {
        return func_ov002_021f09e8(self, player, idx);
    }
    return 0;
}






