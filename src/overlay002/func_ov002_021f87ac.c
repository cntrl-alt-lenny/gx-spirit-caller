typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u16 f0; u16 side:1; u16 slot:5; u16 pad:10; u16 p4:6; u16 index:9; u16 top:1; u16 f6; u16 f8; } Self;
typedef struct { char pad[0x5b4]; int state; char pad2[0x1c]; u32 count; char pad3[4]; unsigned char kinds[1]; } State;
typedef struct { u32 id:9; u32 side:1; u32 rest:22; } Entry;
typedef struct { u16 id:13; u16 rest:3; u16 other; } Card;
extern State data_ov002_022ce288;
extern Entry data_ov002_022ce884[];
extern Card data_ov002_022d0250[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern void func_ov002_021e2d94(int,int,int,int);
extern int func_ov002_02257b48(void *,void *);
extern int func_0202de9c(int);
extern int func_ov002_021b9aa8(u32,u32);
extern int func_ov002_0227ddf8(Self *);
extern int func_ov002_021ae4bc(void *,int);
extern void func_ov002_021df62c(int,int,int);
extern int func_ov002_021e278c(int,int);
int func_ov002_021f87ac(Self *self, void *arg) {
    u32 i;
    unsigned char *kind;
    Entry *entry;
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021e2d94(self->side,self->slot,5,0);
        if (func_ov002_02257b48(self,arg)==0) return -1;
        i=0;
        kind=(unsigned char *)&data_ov002_022ce288;
        if(i<data_ov002_022ce288.count) {
            entry=data_ov002_022ce884;
            do {
                if (kind[0x5dc]==25 && entry->side==self->side && func_0202de9c(data_ov002_022d0250[entry->id].id)==0 && func_ov002_021b9aa8(self->side,entry->id)>=0) {
                    self->f8=entry->id;
                    data_ov002_022ce288.state++;
                    return 0;
                }
                i++;
                kind++;
                entry++;
            } while(i<data_ov002_022ce288.count);
        }
        return -1;
    case 1:
        if(data_ov002_022cd744[self->side]==1) {
            *(int *)(data_ov002_022d016c+0xd44)=func_ov002_0227ddf8(self);
        } else {
            func_ov002_021ae4bc((void *)250,self->index);
        }
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if(*(int *)(data_ov002_022d016c+0xd44)==0) return -1;
        func_ov002_021df62c(self->side,self->slot,self->index);
        func_ov002_021e278c(self->side,self->f8);
        data_ov002_022ce288.state++;
        return 0;
    default: return 1;
    }
}

