typedef unsigned int u32;
struct State { char pad[0xc]; u32 count; };
extern char data_ov002_022cf16c[];
extern u32 data_ov002_022cf178[];
extern int func_ov002_0223b864(int a, int b, int c);
void *func_ov002_0223ba60(int a)
{
    u32 i;
    u32 offset = (a & 1) * 0x868;
    i = 0;
    if (i < *(u32 *)((char *)data_ov002_022cf178 + offset)) {
        struct State *state = (struct State *)(data_ov002_022cf16c + offset);
        do {
            if (func_ov002_0223b864(a, 11, i))
                return (void *)((u32)data_ov002_022cf16c + offset + 0x120 + i * 4);
            i++;
        } while (i < state->count);
    }
    for (i = 0; (int)i <= 4; i++) {
        if (func_ov002_0223b864(a, i, 0))
            return (void *)((u32)data_ov002_022cf16c + offset + 0x30 + i * 0x14);
    }
    return 0;
}



