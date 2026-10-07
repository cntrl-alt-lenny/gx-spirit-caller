typedef struct {
    char pad[0xc];
    unsigned int lo16 : 16;
    unsigned int hi16 : 16;
    char pad2[0x18 - 0x10];
} Rec;

struct W8d4 { unsigned int lo16 : 16; unsigned int hi16 : 16; };
struct W8d0 { unsigned int lo4 : 4; unsigned int rest : 28; };
struct W8d8 { unsigned int b0 : 1; unsigned int rest : 31; };
struct W900 { unsigned int pad : 9; unsigned int f9 : 2; unsigned int b11 : 1; unsigned int rest : 20; };
struct W8f8 { unsigned int pad : 12; unsigned int b12 : 1; unsigned int rest : 19; };

extern char *GetSystemWork(void);
extern void Fill32(int value, void *dst, int size);
extern void func_0201aabc(int id);

void func_02018be8(void) {
    char *w = GetSystemWork();
    unsigned int i;
    Rec *r;

    Fill32(0, w, 0x92c);
    r = (Rec *)w;
    for (i = 0; i < 0x56; i++, r++) {
        r->lo16 = 0xffff;
    }
    *(int *)(w + 0x908) = 0x50000;
    *(int *)(w + 0x90c) = 0x13e000;
    ((struct W8d4 *)(w + 0x8d4))->lo16 = 1;
    ((struct W8d0 *)(w + 0x8d0))->lo4 = 2;
    *(int *)(w + 0x91c) = 1;
    *(int *)(w + 0x920) = 1;
    *(int *)(w + 0x924) = 1;
    *(int *)(w + 0x928) = 0;
    ((struct W8d8 *)(w + 0x8d8))->b0 = 1;
    ((struct W900 *)(w + 0x900))->b11 = 1;
    ((struct W900 *)(w + 0x900))->f9 = 3;
    *(int *)(w + 0x8f4) = 0x177;
    ((struct W8f8 *)(GetSystemWork() + 0x8f8))->b12 = 0;
    func_0201aabc(0x75);
    func_0201aabc(0x76);
    func_0201aabc(0x77);
}
