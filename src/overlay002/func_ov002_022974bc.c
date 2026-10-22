struct Card { unsigned int id:13; unsigned int side:1; unsigned int pad:8; unsigned int index:8; unsigned int rest:2; };
extern char data_ov002_022cf16c[], data_ov002_022cf178[];
struct State { char pad[0xd54]; int active; char pad2[0x14]; int player; };
struct Other { char pad[0x1cc]; int value; };
extern struct State data_ov002_022d016c;
extern struct Other data_ov002_022cd524;
extern int func_0202e234(int x);
extern void *func_ov002_021afb90(int i);
extern void *func_ov002_021afbc4(void);
extern int func_ov002_021afbd4(int idx);
extern int func_ov002_021bbd14(int self, int arg2);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bc1d0(int side, int val);
extern int func_ov002_021bcf18(int a, int b, int c, int d);
extern int func_ov002_021c325c(int self);
extern int func_ov002_021c3ae4(int arg0, int arg1);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
extern void func_ov002_02259ee8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_0226f4dc(int a, int b);
extern int func_ov002_0227da08(int arg0, int arg1, int arg2);
extern int func_ov002_022812ac(int arg0, int arg1);
int func_ov002_022974bc(void *self, int flag) {
    int player = (int)self;
    unsigned int i;
    int id, ok;
    int off = (player & 1) * 0x868;
    struct Card *p;
    int opponent;
    char *row;
    i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + off)) {
        opponent = 1-player;
        row = data_ov002_022cf16c + off;
        p = (struct Card *)(row + 0x120);
        do {
            id = p->id;
            if (func_0202e234(id)) {
                ok = 1;
                switch (id) {
                case 0x18b4:
                    ok = func_ov002_022536e8(self, id, 0) >= 4;
                    break;
                case 0x1578:
                    if (*(int *)(data_ov002_022cf16c + (opponent&1)*0x868) <= 1000 || func_ov002_021bcf18(player,0,1,0) > 0 || (func_ov002_022812ac(player,opponent) >= 0xbb8 && func_ov002_021bbf50(player) == 0)) ok = 1; else ok = 0;
                    break;
                case 0x1488: ok = func_ov002_021c325c(opponent) == 0; break;
                case 0x127d: case 0x127e: case 0x127f: case 0x12a5: case 0x154a:
                    if (flag && func_ov002_0227da08(player, p->side + (p->index << 1), 1)) ok = 1;
                    else ok = 0;
                    break;
                case 0x1894: ok = func_ov002_021c3ae4(player,0x17f6) == 0; break;
                case 0x19a5: ok = func_ov002_021bbd14(player,id) == 0; break;
                case 0x1a92: ok = func_ov002_021bbf50(player) > 0; break;
                }
                if (ok && func_ov002_0226f4dc(player, p->side + (p->index << 1))) {
                    data_ov002_022d016c.player = player;
                    func_ov002_02259774(player,11,i,2);
                    data_ov002_022d016c.active = 1;
                    data_ov002_022cd524.value = 0;
                    return 1;
                }
            }
            p++; i++;
        } while(i < *(unsigned int *)(row+0xc));
    }
    if (func_ov002_0225368c(player,0xfffe,12)) {
        int id2;
        int opponent2;
        int j = 0;
        if ((int)func_ov002_021afbc4() > 0) {
        opponent2 = 1-player;
        do {
            id2 = func_ov002_021afbd4(j);
            ok = 1;
            switch(id2) {
            case 0x15b1: ok = func_ov002_021bcf18(opponent2,1,0,1)>0; break;
            case 0x15f9: ok = func_ov002_021bcf18(opponent2,0,1,1)>0; break;
            case 0x15fa: ok = func_ov002_021bc1d0(opponent2,0)>0; break;
            }
            if(ok) {
                struct Card *a = func_ov002_021afb90(j);
                struct Card *b = func_ov002_021afb90(j);
                func_ov002_02259ee8(player,12,id2,a->side + (b->index<<1));
                return 1;
            }
            j++;
        } while (j < (int)func_ov002_021afbc4());
        }
    }
    return 0;
}







