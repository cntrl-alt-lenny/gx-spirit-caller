typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 w0; u16 bit0:1; u16 index:5; u16 pad1:8; u16 bit14:1; u16 pad15:1; u16 low:6; u16 id:9; u16 rest:1; u16 pad[3]; u16 result; } S021ff3bc;
typedef struct { u32 low:13; u32 flag:1; u32 mid:8; u32 value:8; u32 high:2; u32 pad[4]; } Entry;
typedef struct { char pad[0x30]; Entry entries[1]; } Table;
extern char data_ov002_022cf16c[];
extern struct { char pad[0x5b4]; int step; } data_ov002_022ce288;
extern struct { char pad[0xd44]; int choice; } data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_021ea1b4(S021ff3bc *, int, int);
/* Original caller supplies only two arguments to the four-argument thunk. */
extern int func_ov002_02257878();
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021f4260(int, int);
extern void func_ov002_021ae514(int, int, int, int, int, int);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
int func_ov002_021fb21c(S021ff3bc *self, int arg1) {
    int flags;
    int a,b,c;
    Table *table;
    switch(data_ov002_022ce288.step) {
    case 0:
        flags=0;
        table=(Table *)(data_ov002_022cf16c+(self->bit0 & 1)*0x868);
        if(table->entries[self->index].value*2+table->entries[self->index].flag==self->id) flags|=1;
        if(func_ov002_02257878((int)self,(int)func_ov002_021ea1b4)) flags|=2;
        table=(Table *)(data_ov002_022cf16c+(self->bit0 & 1)*0x868);
        if(table->entries[self->index].value*2+table->entries[self->index].flag==self->id && func_ov002_021ff3bc(self,arg1)) {
            if(func_ov002_021ca3f0(self->bit0,0x19ed)) flags|=4;
        }
        if(data_ov002_022cd744[self->bit0]==1) {
            if(flags & 4) data_ov002_022d016c.choice=2;
            else if(flags & 2) data_ov002_022d016c.choice=1;
            else data_ov002_022d016c.choice=0;
        } else {
            a=func_ov002_021f4260(self->w0,0);
            b=func_ov002_021f4260(self->w0,1);
            c=func_ov002_021f4260(self->w0,2);
            func_ov002_021ae514(0x103,a,b,c,0,flags);
        }
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        self->result=data_ov002_022d016c.choice+1;
        func_ov002_0226b0d0(1-self->bit0,self->w0,data_ov002_022d016c.choice);
        data_ov002_022ce288.step++;
        return 0;
    case 2: return 1;
    }
    return 0;
}

