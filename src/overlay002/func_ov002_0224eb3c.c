typedef struct { unsigned int id:13; unsigned int rest:19; } Card;
typedef struct { char pad[0x18]; unsigned int count; } Side;
typedef struct { unsigned int count; char pad[0x864]; } Count;
extern char data_ov002_022cf16c[];
extern Count data_ov002_022cf184[];
extern unsigned int func_0202b890(int id);
extern int func_02030808(int id);
extern int func_02030b84(int a0);
extern int func_ov002_021b9128(int a,int b);
extern int func_ov002_021bc8c8(int self,int player,int slot);
extern int func_ov002_021ca3f0(int arg0,int arg1);
extern int func_ov002_0223b430(int arg0,int arg1,int arg2);
extern int func_ov002_0223b468(int key);
extern int func_ov002_0223b4c4(int key,int idx);
extern void func_ov002_02253458(int player,int kind,int idx);
void func_ov002_0224eb3c(int player,int card) {
    int slots[10];
    int req[3];
    int n=0;
    int a,b;
    int hits;
    Card *p;
    Side *s;
    unsigned int i;
    int id,j,k,c;
    for(a=0;a<2;a++) {
        char *q=data_ov002_022cf16c+(a&1)*0x868;
        for(b=0;b<=4;b++,q+=0x14) {
            if(func_ov002_021bc8c8(player,a,b)!=0) {
                if(a==player || *(unsigned short *)(q+0x38)!=0) {
                    slots[n++]=(unsigned short)((unsigned char)a | ((unsigned char)b<<8));
                }
            }
        }
    }
    i=0;
    if (!(i<data_ov002_022cf184[player&1].count)) return;
    s=(Side *)(data_ov002_022cf16c+(player&1)*0x868);
    p=(Card *)((char *)s+0x3a0);
    do {
        id=p->id;
        if(func_02030808(id)!=0 && func_02030b84(id)!=0 && func_ov002_021b9128(id,func_0202b890(card))!=0 && func_ov002_021ca3f0(player,id)!=0) {
            c=func_ov002_0223b468(id);
            hits=0;
            for(k=0;k<c;k++) req[k]=func_ov002_0223b4c4(id,k);
            for(j=0;j<n;j++) {
                for(k=0;k<c;k++) {
                    if(req[k]!=0 && func_ov002_0223b430(req[k],(unsigned char)slots[j],(unsigned char)((unsigned short)slots[j]>>8))!=0) {
                        req[k]=0;
                        hits++;
                        break;
                    }
                }
            }
            if(hits+1>=c) func_ov002_02253458(player,12,i);
        }
        i++;p++;
    } while(i<s->count);
}





