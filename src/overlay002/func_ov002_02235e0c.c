typedef unsigned short u16;
typedef unsigned int u32;
struct F2 { u16 player:1; u16 idx:5; u16 kind:6; u16 rest:4; };
struct F4 { u16 pad:6; u16 field:9; u16 top:1; };
struct Node { u16 id; struct F2 f2; struct F4 f4; u16 f6,f8,fa,choice; };
typedef struct { u16 f_0; u16 f_2; } Self02210104;
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct State { char pad[0x5a8]; int phase,count,mask; };
struct Command { char pad[0xd44]; int index; };
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c2f24(int player,int id);
extern int func_ov002_021f4260(int id,int index);
extern void func_ov002_021ae514(int kind,int a,int b,int c,int d,int mask);
extern int func_ov002_0226b0d0(int arg0,int arg1,int arg2);
extern int func_ov002_021d90c0(int flag,int arg1,int arg2);
extern int func_ov002_0222a9d0(struct Node *self);
extern int func_ov002_02210104(Self02210104 *self,int unused1);
int func_ov002_02235e0c(struct Node *self,int unused) {
    if (self->f2.kind == 6) {
        int count=func_ov002_021c2f24(self->f2.player,self->id);
        switch(data_ov002_022ce288.phase) {
        case 128: {
            int player=self->f2.player;
            int off=(player&1)*0x868;
            int idx=self->f2.idx;
            int field=self->f4.field;
            struct Key *key=(struct Key *)(data_ov002_022cf16c+off+0x30+idx*20);
            if (field != key->a*2+key->b) return 0;
            if (*(u16 *)(data_ov002_022cf1a4+off+idx*20)==0) return 0;
            if (count==0) return 0;
            data_ov002_022ce288.count=0;
            data_ov002_022ce288.mask=0;
            return 127;
        }
        case 127:
            if (data_ov002_022cd744[self->f2.player]==1) {
                int i;
                for(i=0;i<3;i++) {
                    if (!(data_ov002_022ce288.mask & (1<<i))) {
                        data_ov002_022d016c.index=i;
                        return 126;
                    }
                }
            } else {
                int a=func_ov002_021f4260(self->id,0);
                int b=func_ov002_021f4260(self->id,1);
                int c=func_ov002_021f4260(self->id,2);
                func_ov002_021ae514(0x103,a,b,c,0,~data_ov002_022ce288.mask);
            }
            return 126;
        case 126:
            self->choice=data_ov002_022d016c.index;
            func_ov002_0226b0d0(1-self->f2.player,self->id,data_ov002_022d016c.index);
            return 125;
        case 125:
            data_ov002_022ce288.mask |= 1<<self->choice;
            if(count>3) count=3;
            data_ov002_022ce288.count++;
            if(data_ov002_022ce288.count<count) return 127;
            func_ov002_021d90c0(self->f2.player,self->f2.idx,data_ov002_022ce288.mask);
            return 0;
        }
    } else if (self->f2.kind==15) {
        return func_ov002_0222a9d0(self);
    } else if (self->f2.kind==22) {
        return func_ov002_02210104((Self02210104 *)self,unused);
    }
    return 0;
}
