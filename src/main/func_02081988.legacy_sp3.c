typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { char _pad00[0xc]; u16 off; u16 count; } Cont0207e7d8;
struct File { u32 tag; u16 endian; u16 version; char pad[4]; u16 blockOff; u16 blockCount; };
struct Body { char pad[6]; signed char old; unsigned char current; };
extern void *func_0207e7d8(Cont0207e7d8 *p, int key);
extern void func_02081898(struct File *f);
extern void func_02093bfc(void);
static inline int signature(struct File *f) { if (f != 0 && f->tag == 0x4e465452) return 1; return 0; }
static inline int version(struct File *f, unsigned int v) { if (f != 0 && f->version >= v) return 1; return 0; }
static inline int checkSignature(struct File *f) { return signature(f) != 0; }
static inline int valid(struct File *f, unsigned int v) { if (f != 0) return signature(f) && version(f, v); return 0; }
int func_02081988(struct File *f, struct Body **out)
{
    int old;
    void *block;
    if (valid(f, 0x100)) old = 0;
    else if (valid(f, 1)) old = 1;
    else func_02093bfc();
    func_02081898(f);
    block = func_0207e7d8((Cont0207e7d8 *)f, 0x46494e46);
    if (block == 0) { *out = 0; return 0; }
    *out = (struct Body *)((char *)block + 8);
    if (old) {
        (*out)->current = (*out)->old;
        (*out)->old = 0;
    }
    return old + 1;
}





