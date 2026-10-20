typedef unsigned short u16;
typedef unsigned int u32;
struct Node0223def4 {
    u16 f0;
    u16 player:1; u16 slot:5; u16 rest2:10;
    u16 rest4:6; u16 value:9; u16 top4:1;
    u16 rest6:8; u16 count:8;
    u16 arr8[5]; u16 f18;
};
struct Key { u32 id:13; u32 b:1; u32 pad:8; u32 a:8; u32 top:2; };
struct State { char pad[0x5a8]; int phase; int count; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021ca698(int arg0,int arg1);
extern int func_ov002_021b947c(int arg);
extern void *func_ov002_021c93f0(int player,int kind,int extra);
extern void func_ov002_021d8128(int arg0,void *arg1,int arg2);
extern int func_ov002_021d59cc(int arg0,int arg1,int arg2,int arg3,u16 arg4);
extern void func_ov002_021e2b3c(int unused0);
/* The original supplies no argument to this helper's unused parameter. */
extern void func_ov002_021e2c5c();
extern int func_ov002_0223def4(struct Node0223def4 *self,int idx);
int func_ov002_0223529c(struct Node0223def4 *self) {
    switch(data_ov002_022ce288.phase) {
    case 128:
        if (!func_ov002_021ca698(self->player,1-self->player)) return 0;
        data_ov002_022ce288.count=0;
        if (self->count) {
            int i;
            func_ov002_021e2b3c(self->count);
            for (i=self->count-1;i>=0;i--) {
                u32 packed=func_ov002_021b947c(func_ov002_0223def4(self,i));
                int kind=(unsigned char)((u16)packed >> 8);
                if (kind==14) {
                    struct Key *key=func_ov002_021c93f0((unsigned char)packed,kind,(u16)(packed>>16));
                    func_ov002_021d8128(key->b,key,self->player != key->b);
                    data_ov002_022ce288.count++;
                }
            }
            func_ov002_021e2c5c();
        }
        return 127;
    case 127:
        {
            int player=self->player;
            int slot=self->slot;
            struct Key *key=(struct Key *)(data_ov002_022cf16c+(player&1)*0x868+0x30+slot*0x14);
            if (self->value != key->a*2+key->b) return 0;
            if (*(u16 *)(data_ov002_022cf1a4+(player&1)*0x868+slot*0x14)==0) return 0;
            func_ov002_021d59cc(player,slot,self->f0,3,(u16)(data_ov002_022ce288.count*300));
            return 0;
        }
    }
    return 0;
}
