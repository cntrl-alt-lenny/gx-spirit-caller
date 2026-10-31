typedef struct { int v[8]; } Wave;
extern const Wave data_ov019_021b5a68;
extern char data_021040ac[];
extern void *func_0201e964(int, void *, int *, int, int, int, int, int, int, int, int, int);
extern int func_ov019_021b4f1c(char *a0);
extern int func_ov019_021b4ed0(int a0, int a1);
int func_ov019_021b4a4c(char *p) {
    int pos[2];
    if (*(int *)(p+0xbc)==0 && *(int *)(p+0xc0)>0) {
        pos[0]=*(int *)(p+0xc4)<<12;
        pos[1]=0x60000;
        func_0201e964(1,*(void **)(*(char **)(p+8)+0x2c),pos,0,0,0,6,3,0x1e00,0x200,0,0);
        func_0201e964(1,*(void **)(*(char **)(p+0xc)+0x2c),pos,0,0,0,5,3,0x1e00,0x200,0,0);
        func_0201e964(1,*(void **)(*(char **)(p+0x10)+0x2c),pos,0,0,0,4,3,0x1e00,0x200,0,0);
        if (func_ov019_021b4ed0((int)p,func_ov019_021b4f1c(p))) {
            Wave wave=data_ov019_021b5a68;
            int offset=0;
            if (func_ov019_021b4f1c(p)==0x4b) offset=0x20;
            pos[0]=(*(int *)(p+0xc4)-0x38)<<12;
            pos[1]=(offset+0x40+wave.v[(*(int *)(data_021040ac+0x38)>>3)&7])<<12;
            func_0201e964(1,*(void **)(*(char **)(p+0x64)+0x2c),pos,0,0,0,7,3,0,0,0,0);
        }
    }
    return 1;
}
