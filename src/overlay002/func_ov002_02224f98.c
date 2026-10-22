typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
typedef struct { u16 value; u16 player:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; u16 pad[2]; u16 index; u16 count; } Self;
typedef struct { u16 w0; u16 bit0:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; } S021ff3bc;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct Node;
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern int func_0202e234(int x);
extern int func_0202e2f8(int unused0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
/* The original supplies no argument to this unused-argument function. */
extern void func_ov002_021e2c5c();
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
#define MIN(a,b) ((a)<(b)?(a):(b))
#define MIN2(a,b) ((a)>(b)?(b):(a))
int func_ov002_02224f98(Self *p, int unused) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_021ff3bc((S021ff3bc *)p, unused) == 0) return 0;
        if (func_ov002_0223df38((struct Node *)p, 0, 0) != 0) {
            int a, b;
            int card;
            int n;
            int packed = func_ov002_0223de94((struct node *)p, 0);
            a = (u8)packed;
            b = (u8)((u16)packed >> 8);
            if (func_ov002_0225764c((int)p, a, b) != 0) {
                card = func_ov002_021b9ecc(a,b);
                *(int *)(data_ov002_022ce288 + 0x5ac) = card;
                if (func_0202e2f8(card) != 0) return 0;
                if (func_0202e234(card) == 0) return 0;
                p->count = func_ov002_0225368c(p->player,p->value,card);
                n = p->count;
                if (n == 0) {
                    func_ov002_021ae400(p->player,13);
                    return 0x6e;
                }
                if (n >= func_ov002_021bc618(p->player)) n = func_ov002_021bc618(p->player);
                p->count = n;
                func_ov002_021ae400(p->player,0x11d);
                return 0x7e;
            }
        }
        return 0;
    case 0x7e:
        switch (p->value) {
        case 0x157a:
            func_ov002_021af9d0(p->player,MIN(MIN2(p->count,2),32)+0x27,p->value,*(int *)(data_ov002_022ce288+0x5ac));
            break;
        case 0x1978:
            func_ov002_021af9d0(p->player,MIN(p->count,32)+6,p->value,*(int *)(data_ov002_022ce288+0x5ac));
            break;
        }
        return 0x7d;
    case 0x7d: {
        int n;
        p->index = 0;
        n = *(int *)(data_ov002_022d016c+0xd44);
        p->count = n;
        func_ov002_021e2b3c(n);
        return 0x7c;
    }
    case 0x7c:
        if (p->index < p->count) {
            u32 *entry = func_ov002_021b004c(p->index+1);
            func_ov002_0227adb8(p->player,(int)entry,1,p->value << 16);
            p->index++;
            return 0x7c;
        }
        func_ov002_021e2c5c();
        return 0x64;
    case 0x6e:
        func_ov002_0226b054(1-p->player);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(p->player);
        return 0;
    }
    return 0;
}



