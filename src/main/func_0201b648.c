typedef struct {
    char pad0[8];
    unsigned int a : 8;
    unsigned int b : 1;
    unsigned int rest : 23;
    char pad1[0x18 - 0xc];
} Rec;

struct Low8 { unsigned int b : 8; };

extern char *GetSystemWork(void);
extern void func_0201b60c(int v);

void func_0201b648(void) {
    char *w = GetSystemWork();
    int i;
    Rec *p = (Rec *)w;

    for (i = 0; i < 0x56; i++, p++) {
        p->a = 0;
        p->b = 0;
    }
    ((struct Low8 *)(w + 0x8f8))->b = 0;
    func_0201b60c(0);
}
