typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 pad:11; u16 mode:2; u16 flip:1; u16 rest:1; };
struct Row { unsigned int id:13; unsigned int side:1; unsigned int pad:8; unsigned int slot:8; unsigned int rest:2; };
struct Global { char pad[0x5a8]; int state; };
extern struct Global data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a,int b,int c,int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021d7268(int player,int id,int flag);
extern int func_ov002_021d7d0c(struct Self *,int,int *);
extern void func_ov002_021e276c(int self,int a,int b,int c);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
int func_ov002_0221eb58(struct Self *self) {
    int player;
    struct Row *row;
    if (self->mode != 2) {
        player = self->player ^ self->flip;
        func_ov002_021e276c(player,self->id,1,0);
        func_ov002_021ae400(player,0x9c);
        return 0;
    }
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0225368c(self->player,self->id,0) == 0) return 0;
        switch(self->id) {
        case 0x1449: case 0x144c:
            func_ov002_021ae400(self->player,0x4c); break;
        case 0x1452:
            func_ov002_021ae400(self->player,0x4e); break;
        case 0x1457:
            func_ov002_021ae400(self->player,0x4d); break;
        }
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(self->player,6,self->id,0);
        return 0x7e;
    case 0x7e:
        switch(self->id) {
        case 0x1449:
            row = (struct Row *)func_ov002_021afb74();
            func_ov002_021d7268(self->player, ((struct Row *)func_ov002_021afb74())->slot * 2 + row->side,1);
            break;
        case 0x144c: case 0x1452:
            row = (struct Row *)func_ov002_021afb74();
            func_ov002_021d7268(self->player, ((struct Row *)func_ov002_021afb74())->slot * 2 + row->side,0);
            break;
        case 0x1457:
            func_ov002_021d7d0c(self,self->player,func_ov002_021afb74()); break;
        }
        return 0;
    }
    return 0;
}

