typedef struct { unsigned int magic; unsigned short ver, n; } hdr_0207de6c_t;
typedef struct node node_t;
typedef struct Dev Dev;
struct V810;
extern int func_0207de6c(hdr_0207de6c_t *hdr);
extern void func_02097810(struct V810 *self);
extern int func_020aaddc(const char *s);
extern int func_02097700(node_t *a0, int a1, int a2);
extern int func_020975f0(Dev *dev, int a1, int a2, int a3, int a4, int a5, void *cb_a, void *cb_b);
extern void func_02097668(node_t *n);
typedef struct { unsigned int magic; int size; } Block;
typedef struct { unsigned int magic; unsigned short ver, n; unsigned int size; unsigned short offset, count; } Header;
typedef struct { char pad[0x5c]; Header *file; Block *fat; char *image; } Archive;
int func_0207dd20(Archive *self, const char *name, Header *file)
{
    Block *fat = 0;
    Block *fnt = 0;
    Block *img = 0;
    unsigned int image;
    int i;
    Block *block;
    if (func_0207de6c((hdr_0207de6c_t *)file) == 0) return 0;
    block = (Block *)((char *)file + file->offset);
    for (i = 0; i < file->count; i++) {
        switch (block->magic) {
        case 0x464e5442: fnt = block; break;
        case 0x46415442: fat = block; break;
        case 0x46494d47: img = block; break;
        }
        block = (Block *)((char *)block + block->size);
    }
    func_02097810((struct V810 *)self);
    self->file = file;
    self->fat = fat;
    image = (unsigned int)img + 8;
    self->image = (char *)image;
    if (func_02097700((node_t *)self, (int)name, func_020aaddc(name)) == 0) return 0;
    if (func_020975f0((Dev *)self, image, (unsigned int)fat + 12 - image, fat->size - 12, (unsigned int)fnt + 8 - image, fnt->size - 8, 0, 0) != 0) return 1;
    func_02097668((node_t *)self);
    return 0;
}




