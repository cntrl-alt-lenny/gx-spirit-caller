typedef struct {
    unsigned short id;
    unsigned short a : 1;
    unsigned short pad0 : 5;
    unsigned short kind : 6;
    unsigned short pad1 : 4;
    unsigned short pad2 : 6;
    unsigned short b : 9;
    unsigned short pad3 : 1;
} S02204550;

extern int func_ov002_021f40f4(S02204550 *);
extern int func_ov002_021ff170(int, int, int, int, int);
extern int func_ov002_022536e8(int, int, int);

int func_ov002_02204550(S02204550 *p)
{
    if (p->kind != 0x23) {
        if (!func_ov002_021ff170(p->a, func_ov002_021f40f4(p), p->b, 0, 1)) {
            return 0;
        }
    }
    return func_ov002_022536e8(p->a, p->id, 0) > 0;
}
