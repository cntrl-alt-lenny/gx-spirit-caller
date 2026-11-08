typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; u16 rank, pad6; u16 active, pada; int value; u32 flags; } Card;
typedef struct { char pad[0x30]; Card card; } Row;
typedef struct { char pad[0x30]; Card cards[11]; } Player;
typedef struct { u16 code; u16 type:4; u16 rest:12; u16 value; u16 next; } Effect;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a6[];
extern Effect data_ov002_022d0650[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021c1ad0(int self, int idx);
extern int func_ov002_021c1d4c(int, int);

int func_ov002_021c8e38(int self, int idx, int *out) {
    int rank;
    int result;
    int id;
    int j,i;
    int player;
    Row *attached;
    Card *p;
    Row *q;
    int mask;
    int link;
    int mask1,mask2;
    int off;
    int slot;
    off=(self & 1)*0x868;
    slot=idx*20;
    id=((Player *)(data_ov002_022cf16c+off))->cards[idx].id;
    rank=0;
    mask1=func_ov002_021c1ad0(self,idx);
    mask2=func_ov002_021c1d4c(self,idx);
    if (out) *out=0;
    if (!id) return 0;
    result=func_0202b890(id);
    if (idx>=5) return result;
    if (*(u16 *)(data_ov002_022cf1a4+off+slot)==0) return result;
    if (id==0x19ed) {
        int target=func_ov002_021b3618(self,idx);
        if (target!=0xffff) return func_ov002_021c8e38((unsigned char)target,(unsigned char)((u16)target>>8),0);
    }
    for(i=0;i<2;i++) {
        p=(Card *)(data_ov002_022cf16c+(i&1)*0x868+0x94);
        q=(Row *)(data_ov002_022cf16c+(i&1)*0x868+0x64);
        j=5;
        mask=mask2 & ((self!=i)+1);
        for(;j<10;j++) {
            if (mask<=0 && p->id==0x171f && (q->card.active & ~((q->card.flags>>6)&1) & ~(((q->card.flags>>1)|(q->card.flags>>2))&1)) && q->card.rank>rank) {
                if (q->card.value) { rank=q->card.rank; result=q->card.value; }
            }
            p++;
            q=(Row *)((char *)q+20);
        }
    }
    link=*(u16 *)(data_ov002_022cf1a6+off+slot);
    if(link) {
        Row *own=(Row *)((char *)((unsigned int)data_ov002_022cf16c+off)+slot);
        do {
            Effect *e=&data_ov002_022d0650[link];
            int code=e->code;
            int type=e->type;
            player=(unsigned char)code;
            int index=(unsigned char)(code>>8);
            link=e->next;
            switch(type) {
            case 3:
                switch(code) {
                case 0x183b:
                    if(e->value>=rank) result=own->card.value;
                    break;
                }
                break;
            case 5:
                switch(code) {
                case 0x1602: case 0x1608:
                    if(rank==0) {
                        result=e->value&15;
                        link=data_ov002_022d0650[data_ov002_022d0650[link].next].next;
                    }
                    break;
                case 0x1472:
                    if(rank==0) {
                        switch(id) {
                        case 0x1472: case 0x1809: case 0x1aca: result=5; break;
                        case 0x1636: result=3; break;
                        case 0x172f: result=2; break;
                        }
                    }
                    break;
                }
                break;
            case 10:
                attached=(Row *)(data_ov002_022cf16c+(player&1)*0x868+index*20);
                {
                    int other=attached->card.id;
                    if(other && (attached->card.active & ~((attached->card.flags>>6)&1) & ~(((attached->card.flags>>1)|(attached->card.flags>>2))&1)) && attached->card.rank>rank) {
                        switch(func_0202b878(other)) {
                        case 0x17:
                            if((mask2 & ((self!=player)+1))<=0) break;
                            continue;
                        default:
                            if((mask1 & ((self!=player)+1))>0) continue;
                            break;
                        }
                        if(other==0x145b && attached->card.value) {rank=attached->card.rank;result=attached->card.value;}
                    }
                }
                break;
            }
        } while(link);
    }
    if(out) *out=rank;
    return result;
}


