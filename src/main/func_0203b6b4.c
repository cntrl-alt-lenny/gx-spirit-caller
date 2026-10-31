typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u32 words[8]; } Block;
typedef struct { u8 pad[0x78]; Block *blocks; u8 pad7c[8]; int *buffer; u8 pad88[0x28]; u16 flags; u8 padb2[6]; u16 channels; u8 padba[5]; u8 active; } Obj;
extern void func_0203af44(void *p);
extern void func_02094550(int *src, int *dst, unsigned int count);
void func_0203b6b4(Obj *self, Block *source) {
    u32 i;
    char *a;
    char *b;
    u32 offset;
    Block *dest;
    if (!(self->flags & 0x10)) return;
    dest = self->blocks;
    if (source != dest + 1) return;
    if (self->active) {
        i = 0;
        a = (char *)source;
        b = (char *)dest;
        offset = 0;
        do {
            if (*(u16 *)(b + 0x12) != *(u16 *)(a + 0x12)) {
                int *p = (int *)((char *)self->buffer + offset);
                func_02094550(p + 0x80, p, 0x200);
            }
            i++;
            a += 12;
            b += 12;
            offset += 0x400;
        } while (i < self->channels);
    }
    *dest = *source;
    func_0203af44(dest);
    ((u8 *)dest)[0x17] = 0xff;
    ((u8 *)dest)[0xb] = 0xff;
    self->flags &= ~0x10;
}

