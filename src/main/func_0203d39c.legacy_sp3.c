typedef struct { unsigned char flag; unsigned char pad[3]; } status_t;
typedef struct { unsigned short f0, info; unsigned char mac[6]; unsigned short len; char _c[0xb4]; } entry_0203d0e0_t;
typedef struct { char _0[0x470]; entry_0203d0e0_t entries[0xb]; char _cb0[0x62]; unsigned char count; } game_0203d0e0_t;
typedef struct { char _0[0xa]; unsigned short len; unsigned char name[0xb4]; } entry_0203d258_t;
typedef struct { unsigned char f0,kind,_2,len; unsigned char name[0x20]; } item_0203d258_t;
extern unsigned int func_0203c888(void);
extern void *func_0203c900(int sel);
extern int func_0203d0e0(int kind, entry_0203d0e0_t *rec, int flag, game_0203d0e0_t *g);
extern int func_0203d258(entry_0203d258_t *rec,int n,item_0203d258_t *items);
extern int func_0203d1c0(entry_0203d0e0_t *rec,game_0203d0e0_t *g);
extern void func_0203cef8(int index,game_0203d0e0_t *g);
extern void func_0203eb14(unsigned int n);
void func_0203d39c(entry_0203d0e0_t *rec) {
    int result = -1;
    unsigned char flag;
    unsigned char *g;
    g = func_0203c900(0x10);

    ((unsigned char *)func_0203c900(1))[0xb] = 1;
    switch (func_0203c888()) {
    case 3:
        flag = g[0xd11];
        if (rec->len == 0 || ((unsigned char *)rec)[0xc] == 0) {
            func_0203eb14(*(unsigned short *)((unsigned char *)rec+0x36));
        } else if (rec->len == 1 || ((unsigned char *)rec)[0xc] == 0x20) {
            func_0203eb14(*(unsigned short *)((unsigned char *)rec+0x36));
            result = func_0203d258((entry_0203d258_t *)rec,g[0xd10],(item_0203d258_t *)(g+0x300));
        } else {
            result = func_0203d258((entry_0203d258_t *)rec,g[0xd10],(item_0203d258_t *)(g+0x300));
        }
        break;
    case 4:
        flag = ((unsigned short *)(g+0x400+g[0xd0f]*0xc0))[0x53] - 1;
        result = func_0203d1c0(rec,(game_0203d0e0_t *)g);
        if (result >= 0) ((status_t *)(g+0x447))[g[0xd0f]].flag |= 0x80;
        break;
    case 5:
        flag = g[0xd11];
        result = func_0203d258((entry_0203d258_t *)rec,1,&((item_0203d258_t *)(g+0x300))[g[0xd0f]]);
        if (result >= 0) {
            item_0203d258_t *item = &((item_0203d258_t *)(g+0x300))[g[0xd0f]];
            item->f0 = (item->f0 & ~0xf) | 1;
        }
        break;
    default: return;
    }
    if (result >= 0) {
        int index = func_0203d0e0(result,rec,flag,(game_0203d0e0_t *)g);
        func_0203cef8(index,(game_0203d0e0_t *)g);
    }
}



