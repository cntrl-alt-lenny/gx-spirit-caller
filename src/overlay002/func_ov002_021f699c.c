typedef unsigned short u16;
typedef unsigned int u32;
struct Flags { u16 bit0:1; u16 rest:15; };
struct Self { u16 id; struct Flags flags; u16 pad[2]; u16 count; };
struct F021f4a4c_F2 { u16 bit0:1; u16 fld5:5; u16 rest:10; };
struct F021f4a4c_Self { u16 pad0; struct F021f4a4c_F2 f2; };
struct Ov002Self { u16 f0; u16 b0:1; };
struct State { char pad[0x5b4]; int step; };
struct Request { char pad[0xd44]; u32 count; char pad2[0x28]; int a,b,c; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021f4a4c(struct F021f4a4c_Self *self,int unused1);
extern int func_ov002_021ca698(int arg0,int arg1);
extern int func_ov002_022536e8(void *self,int arg1,int arg2);
extern void func_ov002_021df6d4(int arg0,int arg1);
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_021bbf50(int arg0);
extern void func_ov002_0225935c(int arg0,int arg1,int arg2);
extern int func_ov002_021f6940(struct Ov002Self *self,int player,int idx);
extern int func_ov002_022593f4(void);
extern int func_ov002_021de64c(int a,int b,int c,int unused3);
extern void func_ov002_021af9d0(int player,int phase,int card,int arg);
extern u32 *func_ov002_021b004c(int id);
extern void func_ov002_021d8128(int arg0,void *arg1,int arg2);
int func_ov002_021f699c(struct Self *self,int arg1) {
    int found;
    u32 i;
    found=func_ov002_021b3ecc(self->flags.bit0,11,0x14a0);
    if (data_ov002_022ce288.step==0) {
        func_ov002_021f4a4c((struct F021f4a4c_Self *)self,arg1);
        self->count=0;
        if (!func_ov002_021ca698(self->flags.bit0,self->flags.bit0)) return -1;
        if (!found) {
            if (!func_ov002_022536e8(self->flags.bit0,self->id,0)) return -1;
        }
    }
    if (found) {
        switch(data_ov002_022ce288.step) {
        case 0:
            func_ov002_021df6d4(self->flags.bit0,0x14a0);
            func_ov002_021ae400(self->flags.bit0,0x50);
            data_ov002_022ce288.step++;
            return 0;
        case 1:
            if (!func_ov002_021bbf50(self->flags.bit0)) return 1;
            func_ov002_0225935c(self->flags.bit0,self->id,(int)func_ov002_021f6940);
            data_ov002_022ce288.step++;
            return 0;
        case 2:
            if (func_ov002_022593f4()) {
                func_ov002_021de64c((int)self,data_ov002_022d016c.a,data_ov002_022d016c.b+data_ov002_022d016c.c,0);
                self->count++;
                if (self->count==3) return 1;
                data_ov002_022ce288.step--;
            } else {
                if (self->count!=0) return 1;
            }
            return 0;
        }
    } else {
        switch(data_ov002_022ce288.step) {
        case 0:
            func_ov002_021ae400(self->flags.bit0,0x56);
            data_ov002_022ce288.step++;
            return 0;
        case 1:
            func_ov002_021af9d0(self->flags.bit0,0x2a,self->id,0);
            data_ov002_022ce288.step++;
            return 0;
        case 2:
            for(i=0;i<data_ov002_022d016c.count;i++) {
                u32 *p=func_ov002_021b004c(i+1);
                func_ov002_021d8128(self->flags.bit0,p,0);
            }
            self->count=data_ov002_022d016c.count;
            data_ov002_022ce288.step++;
            return 0;
        }
    }
    return 1;
}
