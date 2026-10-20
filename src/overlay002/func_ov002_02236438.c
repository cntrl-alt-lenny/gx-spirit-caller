typedef unsigned short u16;
struct node { u16 id; u16 side:1; u16 rest:15; char pad[6]; u16 card; };
struct state { char pad[0x5a8]; int state; };
struct slot { unsigned int id:13; unsigned int rest:19; };
extern struct state data_ov002_022ce288;
struct row { struct slot card; char pad[16]; };
struct player { char pad[0x30]; struct row rows[11]; char tail[0x75c]; };
extern struct player data_ov002_022cf16c[];
extern unsigned short func_0202b9b0(unsigned short key);
extern int func_0202e2c8(int unused0);
extern int func_0202e2f8(int unused0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bbda8(int a, int b);
/* Original call supplies only two arguments to the four-parameter thunk. */
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0220e518(void *self);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223f6c4(struct node *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_02236438(struct node *self) {
    switch (data_ov002_022ce288.state) {
    case 128: {
        int val, hi; unsigned char lo;
        if (func_ov002_0220e518(self) == 0) return 0;
        val = func_ov002_0223de94(self, 0);
        lo = val & 0xff;
        hi = (((u16)val) >> 8) & 0xff;
        self->card = data_ov002_022cf16c[lo & 1].rows[hi].card.id;
        if (func_0202e2c8(self->card) != 0) return 0;
        if (func_0202e2f8(self->card) != 0) return 0;
        return 127;
    }
    case 127: {
        int val = func_ov002_0223f6c4(self);
        if (func_ov002_0225368c(self->side, self->id, val) == 0) {
            func_ov002_021ae400(self->side, 0x15);
            return 120;
        } else {
            func_ov002_021ae400(self->side, 0x33);
            return 126;
        }
    }
    case 126: {
        int val = func_ov002_0223f6c4(self);
        func_ov002_021af9d0(self->side, 6, self->id, val);
        return 125;
    }
    case 125: {
        int *val = func_ov002_021afb74();
        func_ov002_021d8288(self->side, (int)val);
        return 100;
    }
    case 120: {
        int count = func_ov002_021bbda8(self->side, self->card);
        if (count < func_0202b9b0(self->card)) func_ov002_0226b054(1 - self->side);
        return 100;
    }
    case 100:
        func_ov002_021e286c(self->side);
        return 0;
    default: return 0;
    }
}







