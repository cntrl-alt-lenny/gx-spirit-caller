typedef struct { unsigned short id; unsigned short side:1; } Card;
typedef struct { unsigned int field0:13; unsigned int pad13:1; unsigned int bit14:1; unsigned int pad15:17; } S021b9ba0;
typedef struct { unsigned int id:13; unsigned int rest:19; char pad[16]; } Entry;
typedef struct { char pad[0x30]; Entry slots[5]; char tail[0x7d4]; } Table;
extern Table data_ov002_022cf16c[];
extern int data_ov002_022cdc88[];
extern int func_0202b8f0(int unused0);
/* The original passes the card ID despite the current void definition. */
extern int func_0202b920(int id);
extern int func_ov002_021b9ba0(S021b9ba0 *p);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bc618(int arg0);
/* The original supplies only r0 to this four-parameter forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_0223b468(int key);
extern int func_ov002_0223bcb4(int arg0, int arg1, int *arg2);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
int func_ov002_022919a8(Card *card) {
    int i;
    if (func_ov002_021ca2b8(card->side) == 0) return 0;
    if (func_ov002_021bbf50(1-card->side) != 0) return 0;
    for (i=0; i<=4; i++) {
        if (func_ov002_022575c8((int)card, card->side, i)) {
            if (func_ov002_021b9ba0((S021b9ba0 *)&data_ov002_022cf16c[card->side & 1].slots[i])) {
                Table *base = &data_ov002_022cf16c[card->side & 1];
                unsigned flags = *(unsigned *)(base->slots[i].pad+12);
                if (((flags>>22)&1)+((flags>>23)&1)) {
                    unsigned v = *(unsigned *)&base->slots[i];
                    int id = base->slots[i].id;
                    int pos = ((v<<2)>>24)*2+((v<<18)>>31);
                    int n = func_ov002_0223b468(id);
                    int a = func_0202b8f0(id);
                    if (a >= func_0202b920(id)) {
                        if (func_ov002_021bc618(card->side)+1 >= n) {
                            if (n == func_ov002_0225368c(card->side,card->id,pos)) {
                                if (func_ov002_0223bcb4(id,n,data_ov002_022cdc88)) return 1;
                            }
                        }
                    }
                }
            }
        }
    }
    return 0;
}


