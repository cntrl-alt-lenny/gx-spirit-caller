
extern void Fill32(unsigned int v, void *dst, unsigned int n);
typedef struct 
{
  char _pad0[0x98];
  unsigned int f_98;
} state_021ac85c_t;
void func_ov000_021ac85c(state_021ac85c_t *p)
{
 do { Fill32(0, p, 0xa0); p->f_98 = p->f_98 | 0x4000000; p->f_98 = ((p->f_98 & (~0xf80000)) | 0x880000) | 0x8000000; } while (0);
}
