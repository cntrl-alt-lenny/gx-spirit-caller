typedef unsigned short u16;
typedef struct { u16 id,pad; int value; u16 kind,pad2; } Entry;
typedef struct { int a,b,count,start,sel; Entry entries[88]; int mode,drag,last; } List;
typedef struct { char pad[0x48]; int selected; } Selection;
typedef struct { char pad[0xb8]; int changed,unused,id,pos; } Preview;
extern Selection data_021040ac;
extern Preview data_ov019_021b6848;
extern char *GetSystemWork(void);
extern unsigned int func_02019124(void);
extern int func_02037208(int,int,int,int);
int func_ov019_021b3cf0(List *p,int action) {
    switch(action) {
    case 0:
        data_021040ac.selected=0;
        func_02037208(0x42,-1,0,1);
        return 1;
    case 1:
        if(p->entries[p->start+p->sel].value && p->entries[p->start+p->sel].kind) {
            if(func_02019124()==0xff && (((unsigned int)*(int *)(GetSystemWork()+0x900)<<7)>>31)==0) {
                func_02037208(0x43,-1,0,1);
            } else {
                data_021040ac.selected=p->entries[p->start+p->sel].id;
                func_02037208(0x3a,-1,0,1);
                return 1;
            }
        } else {
            func_02037208(0x43,-1,0,1);
        }
        break;
    case 2: { int id=p->entries[p->start+p->sel].id;
        if(id != data_ov019_021b6848.id) {
            data_ov019_021b6848.id=id;
            data_ov019_021b6848.changed=1;
            data_ov019_021b6848.pos=-128;
        }
        break;
    }
    }
    return 0;
}


