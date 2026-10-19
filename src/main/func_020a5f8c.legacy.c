typedef struct { int field_0; int field_4; } A1_t;
struct s_020a5f10 { int f0; int f4; };
extern void func_020a5e90(void *a0, A1_t *a1);
extern void func_020a5e68(int a0, int *a1);
extern int func_020a5f10(struct s_020a5f10 *self);
extern void func_020a5f44(int *out);
extern unsigned short data_021a9938[];
typedef struct {
 unsigned short id;
 unsigned char pad[3];
 unsigned char flag0:1;
 unsigned char flag1:1;
 unsigned char rest:6;
 unsigned short pad6;
 unsigned int code;
} State;
int func_020a5f8c(void) {
 A1_t irq;
 struct s_020a5f10 saved;
 State *state = (State *)0x027ffc30;
 unsigned char *rom = (unsigned char *)0x08000000;
 int result = 1;
 if (state->id == 0xffff) return 0;
 if (state->flag1 == 1) return 0;
 func_020a5e90((void *)data_021a9938[1], &irq);
 func_020a5f44((int *)&saved);
 if ((rom[0xb2] == 0x96 && state->id != *(unsigned short *)(rom + 0xbe)) ||
     (rom[0xb2] != 0x96 && state->id != *(unsigned short *)0x0801fffe) ||
     (state->code != *(unsigned int *)(rom + 0xac) && state->flag0)) {
  result = 0;
  state->flag1 = 1;
 }
 func_020a5f10(&saved);
 func_020a5e68(data_021a9938[1], (int *)&irq);
 return result;
}


