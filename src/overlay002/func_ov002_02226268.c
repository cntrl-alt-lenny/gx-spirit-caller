typedef unsigned short u16;
typedef unsigned char u8;
struct Input { u16 code; u16 side:1; u16 kind:5; u16 pad:10; u16 skip:6; u16 number:9; u16 rest:1; };
struct Record { unsigned card:13; unsigned bit:1; unsigned pad:8; unsigned value:8; unsigned rest:2; };
struct Row { struct Record rec; char tail[16]; };
struct Entry { u16 id:13; u16 pad:3; u16 other; };
struct State { char pad[0x5a8]; int state; int count; };
struct node; struct Node;
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern struct Entry data_ov002_022d0250[];
extern int data_ov002_022cd73c[];
extern int func_ov002_021b0c04(void *,int);
extern int func_ov002_021bc6c4(int);
extern int func_ov002_021bd030(int);
/* The original supplies only r0 to this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021d59cc(int,int,int,int,u16);
extern int func_ov002_021d5d58(int,int,int,int);
extern int func_ov002_021de480(int,int,int,int);
extern int func_ov002_021ded54(int,int,int,int,int);
extern int func_ov002_021e797c(struct Input *,int,int);
extern u16 func_ov002_0223de94(struct node *,int);
extern int func_ov002_0223df38(struct Node *,int,int *);
extern void func_ov002_0227ac64(int,struct Record *,int,int,unsigned);
int func_ov002_02226268(struct Input *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80: {
        unsigned kind = self->kind; unsigned side = self->side;
        unsigned number = self->number;
        struct Row *row = (struct Row *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
        if (number != row[kind].rec.value * 2 + row[kind].rec.bit) return 0;
        if (kind <= 4) {
            if (func_ov002_0223df38((struct Node *)self,0,0)) {
                int pair = func_ov002_0223de94((struct node *)self,0);
                int low = (u8)pair;
                int high = (u8)((u16)pair >> 8);
                data_ov002_022ce288.count = func_ov002_021bd030(self->side);
                if (func_ov002_021e797c(self,low,high) == 1 && data_ov002_022ce288.count >= 0) {
                    func_ov002_021ded54((int)self,self->side,self->kind,self->side,data_ov002_022ce288.count);
                    func_ov002_021d5d58(self->side,(u16)((u8)self->side | ((u8)data_ov002_022ce288.count << 8)),(u16)((u8)low | ((u8)high << 8)),11);
                    return 0x7f;
                }
            }
        } else {
            data_ov002_022ce288.count = func_ov002_021bc6c4(side);
            if (func_ov002_021ca2b8(self->side)) {
                if (data_ov002_022ce288.count >= 0) {
                    func_ov002_0227ac64(self->side,&((struct Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30))[self->kind].rec,1,0,0);
                } else {
                    func_ov002_021de480(self->side,self->kind,0,0);
                }
                return 0x7f;
            }
        }
        return 0;
    }
    case 0x7f:
        func_ov002_021d59cc(self->side,data_ov002_022ce288.count,0xfb6,2,0);
        if (self->code != data_ov002_022d0250[self->number].id) {
            func_ov002_021de480(self->side,data_ov002_022ce288.count,0,0);
        }
        if (self->side == data_ov002_022cd73c[1]) {
            if (data_ov002_022ce288.count >= 5) func_ov002_021b0c04((void *)0x30,1);
            func_ov002_021b0c04((void *)0x31,1);
        }
        return 0;
    }
    return 0;
}



