typedef unsigned short u16;
typedef struct { char pad[0xd8c]; int mode, active; void *side; unsigned int operation; } State;
typedef struct { char pad[0xa0]; u16 a0, a2; } Output;
typedef struct { char pad[0x300]; unsigned int padbits:9; unsigned int ready:1; unsigned int rest:22; } Flags;
typedef struct { char pad[0x808]; int busy; } Busy;
extern State data_ov002_022d016c;
extern Output data_ov002_022d0e6c;
extern Flags data_ov002_022cd968;
extern Busy data_ov002_022ce950;
extern int data_ov002_022cd73c[];
extern char data_ov002_022d0f0c[], data_ov002_022d0f1c[];
extern int func_ov002_0229cd70(int a, int b, int c);
extern void func_ov002_021b1570(int a, int b, void *c, int n);
extern int func_ov002_0226b400(void *side, int count, int flags);
extern int func_ov002_0226b73c(void *side, int flag, int count, int mode);
extern int func_ov002_0226b8f8(int side, int flag, int count);
extern int func_ov002_0226bbb8(int side, int id, int flag);
extern int func_ov002_0226bfa8(int side, int id);
extern int func_ov002_0226cf50(int idx);
extern int func_ov002_0226c368(int a, int b, int c);
extern int func_ov002_0226c988(int a, int b, int c);
extern int func_ov002_0226a3bc(int a, int b);
extern int func_ov002_0226a488(int unused0, int arg1);
extern int func_ov002_0226cd68(int a, int b);
extern int func_ov002_0226ce8c(int idx, int unused, int p);
extern int func_ov002_0226d00c(int a, int b);
/* Original caller passes the side although the constant-return C definition ignores it. */
extern int func_ov002_0226d530(int side);
extern int func_ov002_0226cc0c(int a, int b, int c);
extern int func_ov002_02269ba0(int a, int b, int c);
extern int func_ov002_0226a284(int a, int b, int c);
extern int func_ov002_02262804(int a, int b);
extern int func_ov002_0226a504(void);
extern int func_ov002_0226a730(void);
extern int func_ov002_0226d538(int player, int id, int amount);
int func_ov002_0226a928(void) {
    struct { u16 operation; char payload[16]; } message;
    int result;
    if (data_ov002_022d016c.active == 0) return 0;
    if (data_ov002_022d016c.mode != 0 && (int)data_ov002_022d016c.side == (data_ov002_022cd73c[1] ^ 1)) {
        if (data_ov002_022d016c.mode == 2) {
            message.operation = data_ov002_022d016c.operation;
            func_ov002_0229cd70((int)message.payload, (int)data_ov002_022d0f0c, 16);
            func_ov002_021b1570(30, -1, &message, 18);
            data_ov002_022d016c.mode = 1;
        }
        result = data_ov002_022cd968.ready;
    } else {
        switch (data_ov002_022d016c.operation) {
        case 1: case 2: result = func_ov002_0226b400(data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 3: result = func_ov002_0226b73c(data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2, 1); break;
        case 4: result = func_ov002_0226b73c(data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2, 0); break;
        case 5: result = func_ov002_0226b8f8((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 6: result = func_ov002_0226bbb8((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 7: result = func_ov002_0226bfa8((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0); break;
        case 8: result = func_ov002_0226cf50((int)data_ov002_022d016c.side); break;
        case 9: result = func_ov002_0226c368((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 10: result = func_ov002_0226c988((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 11: result = func_ov002_0226a3bc((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0); break;
        case 12: result = func_ov002_0226a488((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0); break;
        case 13: result = func_ov002_0226cd68((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0); break;
        case 14: result = func_ov002_0226ce8c((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 15: result = func_ov002_0226d00c((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0); break;
        case 16: result = func_ov002_0226d530((int)data_ov002_022d016c.side); break;
        case 17: result = func_ov002_0226cc0c((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 18: result = func_ov002_02269ba0((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 19: result = func_ov002_0226a284((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        case 20: result = func_ov002_02262804((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0); break;
        case 21: result = func_ov002_0226a504(); break;
        case 22: result = func_ov002_0226a730(); break;
        case 23: result = func_ov002_0226d538((int)data_ov002_022d016c.side, data_ov002_022d0e6c.a0, data_ov002_022d0e6c.a2); break;
        default: return 1;
        }
    }
    if (result != 0) {
        if (data_ov002_022ce950.busy != 0) return 1;
        if (data_ov002_022d016c.mode != 0 && (int)data_ov002_022d016c.side == data_ov002_022cd73c[1]) {
            func_ov002_021b1570(31, -1, data_ov002_022d0f1c, 16);
        }
        data_ov002_022d016c.active = 0;
    }
    return 1;
}


