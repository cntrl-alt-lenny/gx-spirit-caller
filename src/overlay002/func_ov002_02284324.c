struct Slot13 { unsigned int id:13; char pad[16]; };
struct Entry { char pad[0x28]; int value; };
extern char data_ov002_022cf16c[], data_ov002_022cf1ac[], data_ov002_022cf1a2[], data_ov002_022cf1a4[];
extern char data_ov002_022cd524[], data_ov002_022cd54c[], data_ov002_022cd550[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021bd948(int, int);
extern int func_ov002_021c031c(int arg0, int unused1);
extern int func_ov002_0227b37c(int, int);
extern int func_ov002_02283bc8(int player, int arg1, int arg2);
int func_ov002_02284324(int player, int idx, int target, int flag) {
    int direct = target > 4;
    int opponent = 1-player;
    int life;
    if (!((*(unsigned int *)(data_ov002_022cf1ac + (player&1)*0x868 + idx*0x14) >> 6)&1)) {
        switch (func_ov002_021b9ecc(player,idx)) {
        case 0x1115:
            if (!func_ov002_021c031c(player,idx) || *(int *)(data_ov002_022cd54c+player*0xdc+idx*0x2c) < *(int *)(data_ov002_022cf16c+(opponent&1)*0x868)) {
                if (flag && *(int *)(data_ov002_022cf16c+(player&1)*0x868)>4000) return 0;
            }
            break;
        case 0x128f: case 0x12a0:
            if (flag) {
                int i;
                int value = *(int *)(data_ov002_022cd54c+player*0xdc+idx*0x2c);
                int found=0;
                struct Slot13 *slot=(struct Slot13 *)(data_ov002_022cf16c+(player&1)*0x868+0x30);
                struct Entry *entry=(struct Entry *)(data_ov002_022cd524+player*0xdc);
                for(i=0;i<5;i++,slot++,entry++) {
                    if(slot->id && entry->value < value) found=1;
                }
                if(!found) return 0;
            }
            break;
        case 0x1419: case 0x1566: case 0x15d2: case 0x1912: case 0x1915:
            if(!direct) {
                if(*(unsigned short *)(data_ov002_022cf1a2+(opponent&1)*0x868+target*0x14)) {
                    if(*(int *)(data_ov002_022cd550+opponent*0xdc+target*0x2c)<1900) return 0;
                } else {
                    int v=*(int *)(data_ov002_022cd54c+opponent*0xdc+target*0x2c);
                    if(v>1000 && v<1900) return 0;
                }
            }
            break;
        case 0x13a7:
            if(*(unsigned short *)(data_ov002_022cf1a2+(opponent&1)*0x868+target*0x14)) return 0;
            if(*(int *)(data_ov002_022cf16c+(player&1)*0x868)<=2000) return 0;
            break;
        case 0x14d7:
            if(*(unsigned short *)(data_ov002_022cf1a2+(opponent&1)*0x868+target*0x14)) return 0;
            break;
        case 0x182d:
            if(direct) return 1;
            break;
        case 0x16bf: return 1;
        }
    }
    life=*(int *)(data_ov002_022cf16c+(player&1)*0x868);
    if(life>=300) life=300;
    if(!direct) {
        if(func_ov002_021b9ecc(opponent,target)==0x148a && *(unsigned short *)(data_ov002_022cf1a4+(opponent&1)*0x868+target*0x14)) {
            int i;
            char *row=data_ov002_022cf16c+(opponent&1)*0x868;
            for(i=0;i<=4;i++,row+=0x14) {
                int id=func_ov002_021b9ecc(opponent,i);
                if(id) {
                    if(!*(unsigned short *)(row+0x38) || id!=0x148a) return 0;
                }
            }
        }
        if(func_ov002_021bd948(player,idx) && func_ov002_0227b37c(player,idx)==1) {
            int v=func_ov002_02283bc8(opponent,target,1);
            if(*(int *)(data_ov002_022cd54c+player*0xdc+idx*0x2c)+1000<=v) return 0;
        }
    } else {
        char *row=data_ov002_022cd54c+player*0xdc;
        int off=idx*0x2c;
        if(*(int *)(row+off)>=*(int *)(data_ov002_022cf16c+(opponent&1)*0x868)) return 1;
        switch(func_ov002_021b9ecc(player,idx)) {
        case 0x1419: case 0x14d6: case 0x1566: case 0x15d2: case 0x1912: case 0x1915: case 0x1993: case 0x1a52: case 0x1a61: case 0x1a78:
            break;
        default:
            if(func_ov002_021bd948(player,idx)) {
                if(*(int *)(row+off)<life || *(int *)(row+off)+1000<=func_ov002_02283bc8(opponent,-1,1)) return 0;
            }
            break;
        }
    }
    return 1;
}


