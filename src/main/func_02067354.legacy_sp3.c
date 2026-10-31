typedef struct {
 int sock; char text[0x80]; unsigned char id[0x24];
 int f_a8; int f_ac; int f_b0; int f_b4; int f_b8; int f_bc;
 int f_c0; int f_c4; int f_c8; char addr[8]; char pad_d4[0x30];
 int f_104; unsigned short f_108;
} Conn;
extern Conn *data_021015e0;
extern Conn data_021015e4;
extern void func_02066010(Conn *c, int mode);
extern int func_02054e70(int unused0);
extern void func_0205531c(int);
/* The original supplies only r0 to this four-argument thunk. */
extern int func_020453b4();
void func_02067354(Conn *c) {
 if (c == 0) c = data_021015e0;
 if (c->f_bc != 0) func_02066010(c, 2);
 if (c->sock != -1) {
  if (c->f_c4 != 0) func_02054e70(c->sock);
 }
 c->sock = -1;
 c->f_ac = 0;
 if (c->f_c4 != 0) func_0205531c(c->f_c4);
 if (c != &data_021015e4) func_020453b4((int)c);
}

