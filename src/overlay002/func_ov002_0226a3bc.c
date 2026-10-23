typedef struct { char pad[0xd9c]; int state; } State;
typedef struct { char pad[0xb0]; unsigned short result; } Output;
extern State data_ov002_022d016c;
extern Output data_ov002_022d0e6c;
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d7054(unsigned short arg0, unsigned short arg1);
int func_ov002_0226a3bc(int a, int b) {
    int result;
    int other;
    if (data_ov002_022d016c.state == 0) {
        result = func_ov002_021bc6c4(a);
        other = 1 - a;
        if (func_ov002_021b8fcc(other, b) != 0) {
            if (func_ov002_021bd030(a) < 0) result = -1;
        }
        if (result == -1) {
            func_ov002_021de480(other, b, 1, 0);
        } else {
            func_ov002_021d7054((unsigned char)other | ((unsigned char)b << 8), (unsigned char)a | ((unsigned char)result << 8));
        }
        data_ov002_022d0e6c.result = result;
        data_ov002_022d016c.state++;
        return 0;
    }
    return 1;
}
