struct Self { unsigned short f0; unsigned short player:1; unsigned short idx:5; unsigned short rest:10; };
struct State { int player; int other; int pad[5]; int idx; int otheridx; };
extern struct State data_ov002_022cd3f4;
extern int data_ov002_022cd744[];
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022d016c[];
extern unsigned char data_ov002_022d0e6c[];
extern int func_ov002_021ae664(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
extern void func_ov002_0226b22c(int arg0, int arg1, int arg2, int arg3);
int func_ov002_0222fcb0(int self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (data_ov002_022cd744[((struct Self *)self)->player] == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_021b00d0(2);
        } else {
            func_ov002_021ae664(0x38);
        }
        return 0x7f;
    case 0x7f:
        func_ov002_0226b22c(((struct Self *)self)->player, ((struct Self *)self)->idx, 1, *(int *)(data_ov002_022d016c + 0xd44));
        return 0x7e;
    case 0x7e:
        if (*(unsigned short *)(data_ov002_022d0e6c + 0xb2)) {
            if (data_ov002_022cd3f4.player == ((struct Self *)self)->player && data_ov002_022cd3f4.idx == ((struct Self *)self)->idx) {
                func_ov002_021de4b0(self, data_ov002_022cd3f4.other, data_ov002_022cd3f4.otheridx);
            } else {
                func_ov002_021de4b0(self, data_ov002_022cd3f4.player, data_ov002_022cd3f4.idx);
            }
        }
        return 0;
    }
    return 0;
}
