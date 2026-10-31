typedef unsigned int u32;
typedef unsigned short u16;
struct E { u32 id:13; u32 side:1; u32 middle:8; u32 index:8; u32 end:2; };
struct S { char pad[0x10]; u32 count1; u32 gap; u32 count2; char pad2[0x244]; struct E first[80]; struct E second[80]; char tail[0x388]; };
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf184[];
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_0202df78(int a,int b);
extern int func_ov002_021ca63c(int a,int b);
extern int func_ov002_021ba6cc(int self,int arg1);
extern int func_ov002_021ba748(int side,int id);
extern void func_ov002_021e1920(int a,int b,int c,int d);
extern void func_ov002_021e1414(int a,int idx,int c);
/* Original leaves the unused argument unset. */
extern void func_ov002_021e2b3c();
/* Original leaves the unused argument unset. */
extern void func_ov002_021e2c5c();
void func_ov002_021e16a4(int player,int id,int all,int flag) {
    struct E *q;
    int sum;
    int count=0;
    u32 offset;
    u32 i,j;
    struct E *p;
    struct S *s;
    if (!func_ov002_021ca63c(player,func_0202e234(id))) {
        func_ov002_021e1920(player,id,all,flag);
        return;
    }
    sum=func_ov002_021ba6cc(player,(u16)id);
    sum+=func_ov002_021ba748(player,id & 0xffff);
    if (sum==0) return;
    func_ov002_021e2b3c();
    offset=(player & 1)*0x868;
    i=count;
    if (i < *(u32 *)(data_ov002_022cf17c+offset)) {
        s=(struct S *)(data_ov002_022cf16c+offset); p=s->first;
        do {
            if (func_0202df78(p->id,id) && (player ^ p->side)==0) {
                if (all==0 && count!=0) break;
                count++;
                func_ov002_021e1414(player,p->side+(p->index<<1),flag);
            }
            i++; p++;
        } while (i<s->count1);
    }
    j=0;
    if (j < *(u32 *)(data_ov002_022cf184+offset)) {
        s=(struct S *)(data_ov002_022cf16c+offset); q=s->second;
        do {
            if (func_0202df78(q->id,id)) {
                if (all==0 && count!=0) break;
                count++;
                func_ov002_021e1414(player,q->side+(q->index<<1),flag);
            }
            j++; q++;
        } while (j<s->count2);
    }
    func_ov002_021e2c5c();
}





