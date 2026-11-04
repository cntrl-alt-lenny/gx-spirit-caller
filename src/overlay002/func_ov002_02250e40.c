typedef unsigned short u16;
struct Card { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int index:8; unsigned int tail:2; };
struct Player { char pad[0x120]; struct Card cards[80]; char tail[0x608]; };
struct State { char pad[0x494]; int idx; u16 tbl[128]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202f050(int x);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021c38c4(int side, int index);
extern int func_ov002_0224ae3c(int n, int target);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02250e40(int player, int unused, unsigned int arg) {
    int counts[13];
    int target = (u16)(arg >> 16);
    u16 index = arg;
    int off;
    struct Card *entry;
    char *base;
    unsigned int i;
    int j, k, n, c;
    if (target == 0) {
        int offset = player & 1;
        struct Card *entries;
        offset *= 0x868;
        offset += (unsigned int)data_ov002_022cf16c;
        entries = (struct Card *)(offset + 0x120);
        int id = entries[index].id;
        if (func_0202e234(id) == 0) return;
        if (func_0202f050(id) == 0) return;
        target = func_ov002_021c38c4(player, entries[index].index * 2 + entries[index].flag);
        if (target <= 4) return;
        target *= 2;
    }
    for (j=1; j<=12; j++) counts[j]=0;
    off=(player & 1)*0x868;
    i=0;
    if (*(unsigned int *)((char *)data_ov002_022cf180+off)>i) {
        base=data_ov002_022cf16c+off;
        entry=(struct Card *)(base+0x418);
        do {
            int id=entry->id;
            if (func_0202e234(id)!=0 && func_0202f050(id)!=0) counts[func_0202b8a8(id)]++;
            i++;
            entry++;
        } while (i<*(unsigned int *)(base+0x14));
    }
    for (j=12; j>=1; j--) {
        if (counts[j]!=0) {
            n=0;
            for (k=12; k>=1; k--) {
                for (c=(j==k); c<counts[k]; c++) {
                    data_ov002_022ce288.tbl[(data_ov002_022ce288.idx+n)&0x7f]=(u16)k;
                    n++;
                }
            }
            if (func_ov002_0224ae3c(n-1,target-j)==0) counts[j]=0;
        }
    }
    i=0;
    if (*(unsigned int *)((char *)data_ov002_022cf180+off)>i) {
        struct Card *entry;
        char *base;
        base=data_ov002_022cf16c+off;
        entry=(struct Card *)(base+0x418);
        do {
            int id=entry->id;
            if (func_0202e234(id)!=0 && func_0202f050(id)!=0 && counts[func_0202b8a8(id)]!=0)
                func_ov002_02253458(player,14,i);
            i++;
            entry++;
        } while (i<*(unsigned int *)(base+0x14));
    }
}






