typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    int index;
    u16 first, last, previous, other, pad0c, saved;
    int pad10;
    int active;
} State;
typedef unsigned char Bank[0x540];
extern Bank data_021a08f4[];
extern int data_0210249c;
extern void func_020928cc(void *ptr, u32 size);
extern void func_020940ac(int channel, void *ptr, int value, u32 size);
extern void Fill32(int value, void *ptr, u32 size);
void func_0207ec68(State *s) {
    if (s->active) {
        u32 size;
        u32 ptr;
        int valid = 0;
        if (s->previous <= s->last + 1) {
            if (s->first <= (u32)s->last) valid = 1;
        }
        if (!valid) size = 0;
        else size = (u16)(s->last - s->first + 1) * 8;
        ptr = s->index;
        ptr *= 0x540;
        ptr += (u32)data_021a08f4;
        ptr += 0x100;
        ptr += s->first * 8;
        func_020928cc((void *)ptr, size);
        if (data_0210249c != -1) func_020940ac(data_0210249c, (void *)ptr, 0xc0, size);
        else Fill32(0xc0, (void *)ptr, size);
    } else {
        u32 base = s->index;
        u16 *ptr;
        base *= 0x540;
        base += (u32)data_021a08f4;
        base += 0x100;
        ptr = (u16 *)(base + s->first * 8);
        u16 count = s->last - s->first + 1;
        u16 i;
        for (i = 0; i < count; i++) {
            *ptr = 0xc0;
            ptr += 4;
        }
    }
    s->previous = s->first;
    s->saved = s->other;
}








