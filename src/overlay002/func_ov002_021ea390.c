typedef struct { unsigned short id; unsigned short side:1; unsigned short field:5; unsigned short tag6:6; unsigned short rest:4; unsigned short p:6; unsigned short tag:9; unsigned short p2:1; unsigned short x; unsigned short extra; unsigned short y; unsigned short count; } Card;
struct Slot { unsigned int id:13; unsigned int flag:1; unsigned int pad:8; unsigned int tag:8; unsigned int rest:2; char tail[16]; };
struct Row { char pad[0x30]; struct Slot slots[11]; };
extern char data_ov002_022cf16c[], data_ov002_022cf1a4[];
extern int func_ov002_021bc8c8(int, int, int);
extern int func_ov002_021ba104(int, int, int);
extern int func_ov002_02257878();
extern void func_ov002_021c4c9c(int,int,int *);
extern int func_0202e2f8(int), func_0202e42c(int);
extern unsigned int func_ov002_021b4618(unsigned int);
extern int func_ov002_021c93cc(int,int,int);
typedef int (*Callback)(void *,int,int);
extern int func_ov002_02257888(void *,Callback,int);
extern int func_ov002_021e8dd4(void *,int,int),func_ov002_021e9ac4(void *,int,int),func_ov002_021ed604(void *,int,int),func_ov002_021e99a4(void *,int,int),func_ov002_021eb964(void *,int,int),func_ov002_021f17d4(void *,int,int),func_ov002_021e7748(void *,int,int);
int func_ov002_021ea390(Card *self,int player,int idx) {
 int buf[11]; unsigned short id;
 if (0x23 == self->tag6) return 1;
 if (func_ov002_021bc8c8(self->side,player,idx) != 0) {
 if (self->side == player || *(unsigned short *)(data_ov002_022cf1a4 + (player & 1)*0x868 + idx*20) != 0) {
 func_ov002_021c4c9c(player,idx,buf);
 id = self->id; switch(id) {
 case 0x123b: return buf[5] <= 1000 && buf[2] == 2;
 case 0x14c5: if (buf[1] == 15) return func_ov002_02257888(self,func_ov002_021e8dd4,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8))) > 0; break;
 case 0x14e4: if (buf[1] == 1) { self->extra=buf[5]; return func_ov002_02257888(self,func_ov002_021e9ac4,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8))) > 0; } break;
 case 0x14ee: return func_0202e2f8(((struct Row *)(data_ov002_022cf16c+(player&1)*0x868))->slots[idx].id)==0;
 case 0x169b: if (func_0202e42c(buf[0])) return func_ov002_02257888(self,func_ov002_021ed604,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8))) > 0; break;
 case 0x1702: return buf[1]==10;
 case 0x1708: if (buf[0]==0x1706) return func_ov002_02257888(self,func_ov002_021e99a4,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8))) > 0; if (buf[0]==0x1709) return func_ov002_02257878(self,func_ov002_021eb964)>0; break;
 case 0x1753: if(buf[1]==13) return func_ov002_02257888(self,func_ov002_021eb964,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8))) > 0; break;
 case 0x1790: if (player != self->side) return 0; if (*(unsigned short *)(data_ov002_022cf1a4+(player&1)*0x868+idx*20)==0) return 0; return func_ov002_021ba104(player,idx,id);
 case 0x1835: if (((struct Row *)(data_ov002_022cf16c+(player&1)*0x868))->slots[idx].tag*2+((struct Row *)(data_ov002_022cf16c+(player&1)*0x868))->slots[idx].flag == self->tag) return 0; return buf[1]==4;
 case 0x1855: return buf[4]<=5;
 case 0x188c: return buf[5]>=2000 && buf[2]==2;
 case 0x188d: if((int)func_ov002_021b4618(buf[3])>1) return 1; switch(buf[2]) { case 3: case 4: case 5: case 6: if (self->extra & (1 << buf[2])) return 0; return 1; } break;
 case 0x1928: return func_ov002_021c93cc(player,idx,3);
 case 0x1929: return func_ov002_021c93cc(player,idx,4);
 case 0x192a: return func_ov002_021c93cc(player,idx,6);
 case 0x1941: if (((struct Row *)(data_ov002_022cf16c+(player&1)*0x868))->slots[idx].tag*2+((struct Row *)(data_ov002_022cf16c+(player&1)*0x868))->slots[idx].flag == self->tag) return 0; return buf[1]==10;
 case 0x195c: if(self->count<2) return func_ov002_021ba104(player,idx,0x194f); return func_ov002_021ba104(player,idx,0x1950);
 case 0x1a35: if(buf[1]==16) return func_ov002_02257888(self,func_ov002_021f17d4,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8)))>=2; break;
 case 0x1aa3: return buf[1]==9;
 case 0x1b1e: if(func_ov002_021ba104(player,idx,0x194d)) return func_ov002_02257888(self,func_ov002_021e7748,(unsigned short)((unsigned char)player | ((unsigned char)idx << 8)))>0; break;
 case 0x1b1f: return func_ov002_021ba104(player,idx,0x19a7);
 }
 }
 }
 return 0;
}

