typedef unsigned int u32;
typedef struct { u32 id:13; u32 flag:1; u32 pad:8; u32 key:8; u32 top:2; } Card;
typedef struct { char pad[0x30]; Card card; u32 other; unsigned short state; char rest[10]; } Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_021b3fd8(int, int, int, int);
extern void func_ov002_021df6d4(int, int);
extern void func_ov002_021d7970(void *, int, int);
extern int func_ov002_021dec2c(int, int, int, unsigned short);
extern void func_ov002_021d5b80(int, int, int, int);
int func_ov002_022645b4(int arg) {
    int i, j, side;
    int offset;
    for (i=0; i<2; i++) {
        side = arg ^ i;
        if (func_ov002_021b3ecc(side, 11, 0x1379)) {
            offset = (side & 1) * 0x868;
            for (j=*(int *)(data_ov002_022cf178 + offset)-1; j>=0; j--) {
                Card *c = (Card *)(data_ov002_022cf16c + offset + 0x120) + j;
                if (func_ov002_021b3fd8(side, 11, 0x1379, c->key*2+c->flag)) {
                    func_ov002_021df6d4(side, 0x1379);
                    func_ov002_021d7970((void *)side, j, 0);
                }
            }
            { Card *c = (Card *)(data_ov002_022cf16c + offset + 0x94);
            char *slot = data_ov002_022cf16c + offset + 0x64;
            for(j=5;j<=10;j++, c=(Card *)((char *)c+20), slot+=20) {

                if(c->id && *(unsigned short *)(slot + 0x38)==0) {
                    if(func_ov002_021b3fd8(side,11,0x1379,c->key*2+c->flag)) {
                        func_ov002_021df6d4(side,0x1379);
                        func_ov002_021dec2c(side,j,0,0x1379);
                    }
                }
            }
            }
            func_ov002_021d5b80(side,11,0x1379,1);
            return 0;
        }
    }
    return 1;
}


