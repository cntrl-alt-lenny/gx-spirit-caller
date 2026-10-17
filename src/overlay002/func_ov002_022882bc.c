typedef struct {
    unsigned short pad;
    unsigned short flag : 1;
} S;

typedef struct {
    unsigned int v;
    unsigned char pad[0x864];
} E;

extern unsigned int func_ov002_021c3bdc(unsigned int a);
extern E data_ov002_022cf178[];

int func_ov002_022882bc(S *p)
{
    unsigned int n = func_ov002_021c3bdc(p->flag);
    return data_ov002_022cf178[p->flag & 1].v <= n * 2;
}
