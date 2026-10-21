struct State { char pad[0xcec]; int cec; char p1[0x10]; int d00; char p2[8]; int d0c; char p3[0x10]; int d20; };
struct Global { int a,b; };
struct Player { int result; char pad[0x864]; };
struct Pair { char pad[0x2c]; int first; char pad2[0x864]; int second; };
struct Queue { char pad[0x808]; int count; };
struct Flags { char pad[0x300]; unsigned int ready:1; unsigned int other:31; };
extern struct State data_ov002_022d016c;
extern struct Global data_ov002_022cd73c;
extern int data_ov002_022cd744[];
extern struct Player data_ov002_022cf198[];
extern struct Pair data_ov002_022cf16c;
extern struct Queue data_ov002_022ce950;
extern struct Flags data_ov002_022cd968;
/* Original caller sets no arguments for this four-argument forwarding thunk. */
extern int func_ov002_021ae7a8();
extern int func_ov002_021ae754(void);
extern void func_ov002_021b1458(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
int func_ov002_021b05d0(void) {
    int player = data_ov002_022cd73c.b;
    if (func_ov002_021ae7a8()) return 0;
    switch (data_ov002_022d016c.d20) {
    case 0:
        if (data_ov002_022d016c.d0c != 0 && data_ov002_022cd744[data_ov002_022d016c.cec] == 2) {
            data_ov002_022d016c.d20 = 2;
            return 0;
        }
        if (data_ov002_022cf16c.first == 3 || data_ov002_022cf16c.second == 3)
            func_ov002_021d479c(((data_ov002_022cf198[player & 1].result == 3 ? player : 1-player) ? 0x8000 : 0) | 6,0,0,0);
        if (data_ov002_022cf16c.first == 4 || data_ov002_022cf16c.second == 4)
            func_ov002_021d479c(((data_ov002_022cf198[player & 1].result == 4 ? player : 1-player) ? 0x8000 : 0) | 7,0,0,0);
        if (data_ov002_022cf16c.first == 7 || data_ov002_022cf16c.second == 7)
            func_ov002_021d479c(((data_ov002_022cf198[player & 1].result == 7 ? player : 1-player) ? 0x8000 : 0) | 8,0,0,0);
        func_ov002_021d479c((player ? 0x8000 : 0) | 5, data_ov002_022d016c.d00, data_ov002_022cf16c.first, data_ov002_022cf16c.second);
        data_ov002_022d016c.d20++;
        break;
    case 1:
        if (data_ov002_022ce950.count == 0) {
            if (data_ov002_022d016c.d0c != 0)
                func_ov002_021b1458(2, (unsigned short)data_ov002_022d016c.d00, 0, 0);
            func_ov002_021ae754();
            data_ov002_022d016c.d20++;
        }
        break;
    case 2:
        if (data_ov002_022d016c.d0c == 0 || data_ov002_022cd968.ready) return 1;
        break;
    }
    return 0;
}

