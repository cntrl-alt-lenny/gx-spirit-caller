typedef unsigned int u32;
struct State { char pad[0x270]; u32 flags; unsigned low:13; unsigned stage:8; unsigned high:11; u32 f278,f27c,f280,f284; int timer; };
struct Main { char pad[0x2b0]; unsigned low:13; unsigned stage:8; unsigned high:11; };
extern struct State data_ov011_021d403c;
extern struct Main data_ov011_021d4000;
extern short data_020bef80[];
extern int func_ov011_021cf060(void),func_ov011_021cf2dc(void),func_ov000_021af378(void),func_ov011_021cfb70(void),func_0202c0c0(int);
extern void func_ov011_021cf048(void),func_ov011_021cc7f8(void),func_ov011_021cdb94(void),func_ov011_021c9d80(void),func_ov011_021c9d60(void),func_ov011_021cd638(void),func_ov011_021ca600(void),func_ov011_021ca67c(void),func_ov011_021cb218(void);
extern void func_ov000_021ab564(int,int),func_ov000_021ab520(int,int),func_ov000_021ab5ac(int,int),func_ov000_021ab4ec(int,int),func_ov000_021ab8f8(void),func_ov000_021ace4c(unsigned int),func_ov000_021acef8(int),func_ov000_021add44(int,int);
/* The original supplies only r0 to this three-argument definition. */
extern void func_ov011_021ce324();
void func_ov011_021cfbcc(void) {
 struct State *s = &data_ov011_021d403c;
 int v, x;
 switch (data_ov011_021d4000.stage) {
 case 1:
  if (!func_ov011_021cf060()) return;
  func_ov011_021cf048(); func_ov011_021cc7f8(); func_ov011_021cdb94(); s->stage++; break;
 case 2:
  v=s->timer; func_ov000_021ab564(0,63); func_ov000_021ab520(0,63);
  if (v==0) func_ov011_021c9d80();
  if (v>=256) { x=v-256; if (x>256) x=256; func_ov000_021ab5ac(0, data_020bef80[(((x << 14) / 256) >> 4)*2] << 4 >> 12); }
  s->timer=v+20;
  if (s->timer>512) { s->timer=0; s->stage++; func_ov000_021ab5ac(0,16); func_ov000_021ab8f8(); func_ov011_021ce324(1); func_ov000_021ace4c(1); func_ov000_021acef8(0); } break;
 case 3:
  v=s->timer+8; if(v>255) v=255; s->timer=v; func_ov000_021ab4ec(0,8);
  func_ov000_021ab5ac(0,data_020bef80[(((v << 14)/255+0x4000)>>4)*2] << 4 >> 12);
  if(v==255) { func_ov011_021c9d60(); func_ov011_021cfb70(); s->timer=0; func_ov011_021ca600(); } func_ov011_021cd638(); break;
 case 4:
  v=s->timer; if(v==0) func_ov011_021c9d80(); v+=16; if(v>255) v=255; s->timer=v; func_ov000_021ab4ec(0,1);
  func_ov000_021ab5ac(0,data_020bef80[(((v << 14)/255)>>4)*2] << 4 >> 12);
  if(v==255 && !func_ov000_021af378()) { s->stage++; s->timer=512; func_ov000_021ab5ac(0,16); func_ov000_021ab8f8(); func_ov011_021ce324(0); func_ov000_021ace4c(0); func_ov000_021acef8(0); func_ov011_021c9d60(); } func_ov011_021cd638(); break;
 case 5:
  v=s->timer-20; if(v<0) v=0; s->timer=v; func_ov000_021ab564(0,63); func_ov000_021ab520(0,63);
  if(v>=256) { x=v-256; if(x>256) x=256; func_ov000_021ab5ac(0,data_020bef80[(((x << 14)/256)>>4)*2] << 4 >> 12); }
  if(v<256) { s->timer=0; func_ov000_021ab5ac(0,0); if(func_ov011_021cf2dc()) func_ov000_021add44(func_0202c0c0(0x4b3),0); s->f280 |= 0x200; func_ov011_021cb218(); s->flags |= 0x10000; func_ov011_021cfb70(); func_ov011_021ca67c(); } break;
 }
}

