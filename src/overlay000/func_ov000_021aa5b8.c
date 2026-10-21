typedef signed short s16;
typedef unsigned short u16;
typedef long long s64;
extern char data_ov000_021c73e0[];
extern s16 data_020bef80[];
struct Obj {
 char pad[0x24];
 int pos[3];
 int base[3];
 int dir[3];
 char pad2[0xd8];
 int radius;
 char pad3[8];
 s16 x,y,z;
 char pad4[0xe];
 int facing:4;
};
void func_ov000_021aa5b8(struct Obj *obj) {

 struct Obj *active;
 int x,y,z;
 s16 sx,cx,sy,cy,sz,cz;
 int facing = obj->facing;
 if (facing == 4) return;
 active = *(struct Obj **)data_ov000_021c73e0;
 switch (active->facing) { case 1: case 2: case 3:
  x = (s16)(u16)-active->x;
  y = (s16)(u16)-active->y;
  z = active->z;
 break; default: {
  x = active->x; y = active->y; z = active->z; }
 }
 sx = data_020bef80[((u16)x >> 4)*2];
 cx = data_020bef80[((u16)x >> 4)*2+1];
 sy = data_020bef80[((u16)y >> 4)*2];
 cy = data_020bef80[((u16)y >> 4)*2+1];
 sz = data_020bef80[((u16)z >> 4)*2];
 cz = data_020bef80[((u16)z >> 4)*2+1];
 switch(facing) {
 case 0:
  obj->pos[0] = (cx * obj->radius) >> 12;
  obj->pos[1] = (sx * obj->radius) >> 12;
  obj->pos[2] = (cx * obj->radius) >> 12;
  obj->pos[0] = ((obj->pos[0]*sy)>>12) + obj->base[0];
  obj->pos[1] = obj->pos[1] + obj->base[1];
  obj->pos[2] = ((obj->pos[2]*cy)>>12) + obj->base[2];
  break;
 case 1: case 2: case 3:
  obj->base[0] = (cx * obj->radius) >> 12;
  obj->base[1] = (sx * obj->radius) >> 12;
  obj->base[2] = (cx * obj->radius) >> 12;
  obj->base[0] = ((obj->base[0]*sy)>>12) + obj->pos[0];
  obj->base[1] = obj->base[1] + obj->pos[1];
  { int t = obj->base[2]*cy; obj->base[2] = obj->pos[2] - (t>>12); }
  break;
 }
 obj->dir[0] = (int)(((s64)sz*cy + 0x800)>>12);
 obj->dir[1] = cz;
 obj->dir[2] = -(int)(((s64)sz*sy + 0x800)>>12);
}







