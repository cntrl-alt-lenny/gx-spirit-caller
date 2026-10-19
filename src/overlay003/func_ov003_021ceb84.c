extern void *func_02005dac(int select, int slot);
/* The assembly copy routine uses three argument registers despite its void placeholder definition. */
extern void func_020944a4();
typedef struct { unsigned int attr; unsigned short tile; } Packet;
void func_ov003_021ceb84(int unused, int screen, int kind, int palette, int x) {
    Packet packet;
    int i;
    int position = x;
    int y = kind * 0x18 + 0x94;
    int select = screen ? 1 : 2;
    int tile = kind ? 0x10 : 8;

    for (i = 0; i < 4; i++) {
        packet.attr = (y & 0xff) | 0x4000 | (int)0x80000000 | (((unsigned int)(position + 0x14) << 23) >> 7);
        packet.tile = tile | 0x400 | (palette << 12);
        func_020944a4(&packet, func_02005dac(select, 0), 6);
        position += 0x20;
        tile += 2;
    }
}



