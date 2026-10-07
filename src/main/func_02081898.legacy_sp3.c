typedef unsigned short u16;
typedef unsigned int u32;

struct File { char pad[0xc]; u16 blockOff; u16 blockCount; };
struct Body { u32 f0; u32 f4; u32 f8; u32 fc; u32 f10; };
struct Block { u32 tag; u32 size; struct Body body; };

void func_02081898(struct File *f)
{
    struct Block *b;
    int i = 0;
    b = (struct Block *)((char *)f + f->blockOff);
    for (; i < f->blockCount; i++) {
        struct Body *p;
        switch (b->tag) {
        case 0x46494e46:
            p = &b->body;
            p->f8 += (u32)f;
            if (p->fc != 0) {
                p->fc += (u32)f;
            }
            if (p->f10 != 0) {
                p->f10 += (u32)f;
            }
            break;
        case 0x43574448:
            p = &b->body;
            if (p->f4 != 0) {
                p->f4 += (u32)f;
            }
            break;
        case 0x434d4150:
            p = &b->body;
            if (p->f8 != 0) {
                p->f8 += (u32)f;
            }
            break;
        case 0x43474c50:
            break;
        }
        b = (struct Block *)((char *)b + b->size);
    }
}
