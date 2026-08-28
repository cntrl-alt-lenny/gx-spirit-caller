/* func_02021174: scan data_02194260's slot array (stride 0x618, max 8) for
 * a free entry (f38 == 0), Fill32 it, stash a0 in it, run guarded one-time
 * init calls gated on base->f08, then byte-scan a0 (a NUL/0xf1-terminated
 * tag stream) for a high-byte==0xf1 tag and stash func_020219e8's result;
 * finally bump base->f08 and return the claimed slot. */
extern void Fill32(int value, void *dest, int size);
extern int  func_02021150(int n);
extern void func_02021ae4(int x);
extern void func_02023220(int x);
extern void func_02023f28(int x);
extern void func_020243dc(int x);
extern void func_02026f84(int x);
extern void func_02028568(int x);
extern int  func_0202a178(int x);
extern int  func_020219e8(void *slot, unsigned int *p);
extern char data_02194260[];

typedef struct {
    char pad00[0x08];
    int  f08;
    char pad0c[0x0c];
    int  f18;
    int  f1c;
    int  f20;
    int  f24;
    int  f28;
    int  f2c;
    int  f30;
    char pad34[0x04];
    int  f38;
} Slot;

void *func_02021174(unsigned int *a0)
{
    char *base = data_02194260;
    char *slot;
    int i = 0;
    char *cur = base;

    for (;;) {
        if (((Slot *)cur)->f38 == 0) {
            break;
        }
        cur = cur + 0x218 + 0x400;
        if (++i >= 8) {
            break;
        }
    }

    slot = base + 0x34 + i * 0x618;
    Fill32(0, slot, 0x618);
    *(unsigned int **)(slot + 0x4) = a0;

    if (((Slot *)base)->f08 == 0) {
        func_02021ae4(((Slot *)base)->f18);
        if (func_02021150(1) == 0) {
            func_02023220(((Slot *)base)->f1c);
            func_02023f28(((Slot *)base)->f20);
            func_020243dc(((Slot *)base)->f24);
        }
        if (func_02021150(2) == 0) {
            func_02026f84(((Slot *)base)->f28);
            func_02028568(((Slot *)base)->f2c);
        }
        func_0202a178(((Slot *)base)->f30);
    }

    for (;;) {
        if ((*a0 >> 24) == 0) {
            return 0;
        }
        if ((*a0 >> 24) == 0xf1) {
            *(int *)(slot + 0x14) = func_020219e8(slot, a0);
            break;
        }
        a0++;
    }

    *(int *)(base + 0x8) += 1;
    return slot;
}
